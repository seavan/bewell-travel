using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace bewell.common.Sphinx
{
    public class SphinxDocumentAnnounce : ISphinxDocument
    {
        private string title;
        private string body;
        private string url;

        public SphinxDocumentAnnounce(string title, string body, string url)
        {
            this.title = title;
            this.body = body;
            this.url = url;
        }

        public string GetTitle()
        {
            return this.title;
        }

        public string GetBody()
        {
            return this.body;
        }

        public void SetBody(string body)
        {
            this.body = body;
        }

        public string GetUrl()
        {
            return this.url;
        }
    }
}
