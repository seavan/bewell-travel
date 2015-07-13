using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using CuttingEdge.Conditions;

namespace bewell.common.Sphinx
{
    public sealed class DefaultSphinxDocument : SphinxDocumentAnnounce, ISphinxSerializable
    {
        private DocumentId documentId;
        private string protoName;

        public DefaultSphinxDocument(DocumentId documentId, string title, string body, string url, string protoName) : base(title, body, url)
        {
            Condition.Requires(documentId, "documentId").IsNotNull();

            this.documentId = documentId;
            this.protoName = protoName;
        }

        public static string BuildSchema()
        {
            var sb = new StringBuilder();

            sb.AppendLine("<sphinx:schema>");
            sb.AppendLine("<sphinx:field name=\"title\"/>");
            sb.AppendLine("<sphinx:field name=\"body\"/>");
            sb.AppendLine("<sphinx:attr name=\"objecttype\" type=\"string\"/>");
            sb.AppendLine("<sphinx:attr name=\"entityid\" type=\"int\" bits=\"32\"/>");
            sb.AppendLine("<sphinx:attr name=\"fieldsetid\" type=\"int\" bits=\"32\"/>");
            sb.AppendLine("</sphinx:schema>");

            return sb.ToString();
        }

        public string BuildPipeXml()
        {
            var sb = new StringBuilder();

            sb.AppendLine(string.Format("<sphinx:document id=\"{0}\">", documentId.GetIdentifier()));
            sb.AppendLine(string.Format("<title>{0}</title>", EscapeForSphinx(GetTitle())));
            sb.AppendLine(string.Format("<body>{0}</body>", EscapeForSphinx(GetBody())));
            sb.AppendLine(string.Format("<objecttype>{0}</objecttype>", this.protoName));
            sb.Append(documentId.BuildPipeXml());
            sb.AppendLine(string.Format("</sphinx:document>"));

            return sb.ToString();
        }

        private string EscapeForSphinx(string value)
        {
            //TODO: apply htmlsanitizer
            return Regex.Replace(value, @"[^\w\.,:;\?\!]+", " ");
        }
    }
}
