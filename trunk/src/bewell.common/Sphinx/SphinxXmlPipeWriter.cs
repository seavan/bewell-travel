using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using CuttingEdge.Conditions;
using System.Text.RegularExpressions;

namespace bewell.common.Sphinx
{
    public class SphinxXmlPipeWriter : IDisposable
    {
        private Stream pipeStream;

        public SphinxXmlPipeWriter(Stream pipeStream)
        {
            Condition.Requires(pipeStream, "pipeStream").IsNotNull();

            this.pipeStream = pipeStream;
        }

        public void WriteDocuments(IEnumerable<ISphinxSerializable> documents)
        {
            using (TextWriter writer = new StreamWriter(pipeStream, Encoding.UTF8))
            {
                WriteProlog(writer);
                WriteSphinxSchema(writer);
                WriteDocuments(writer, documents);
                WriteEpilog(writer);
            }
        }

        private void WriteDocuments(TextWriter writer, IEnumerable<ISphinxSerializable> documents)
        {
            foreach (var document in documents)
                writer.WriteLine(document.BuildPipeXml());
        }

        private void WriteSphinxSchema(TextWriter writer)
        {
            writer.WriteLine(DefaultSphinxDocument.BuildSchema());
        }

        private void WriteEpilog(TextWriter writer)
        {
            writer.WriteLine("</sphinx:docset>");
        }

        private void WriteProlog(TextWriter writer)
        {
            writer.WriteLine("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
            writer.WriteLine("<sphinx:docset>");
        }

        private string EscapeForSphinx(string value)
        {
            //TODO: apply htmlsanitizer
            return Regex.Replace(value, @"[^\w\.,:;\?\!]+", " ");
        }

        public void Dispose()
        {
            if (pipeStream != null)
                pipeStream.Flush();
        }
    }
}
