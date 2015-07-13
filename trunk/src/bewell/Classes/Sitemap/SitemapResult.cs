using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using System.Xml.Linq;

namespace bewell.Classes.Sitemap
{
    public class SitemapResult : ActionResult
    {
        private readonly IEnumerable<SitemapItem> _items;
        private readonly bool _isSitemapIndex;
        private static readonly XNamespace Ns = @"http://www.sitemaps.org/schemas/sitemap/0.9";

        public SitemapResult(IEnumerable<SitemapItem> items, bool isSitemapIndex = false)
        {
            _items = items;
            _isSitemapIndex = isSitemapIndex;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            string encoding = context.HttpContext.Response.ContentEncoding.WebName;
            var sitemap = new XDocument(new XDeclaration("1.0", encoding, "yes"),
                 new XElement(Ns + (_isSitemapIndex ? "sitemapindex" : "urlset"),
                      from item in _items
                      select CreateSitemapItem(item)
                      )
                 );

            context.HttpContext.Response.ContentType = "text/xml";
            context.HttpContext.Response.Flush();
            context.HttpContext.Response.Write(sitemap.Declaration + sitemap.ToString());
        }

        private XElement CreateSitemapItem(SitemapItem item)
        {
            var itemElement = new XElement(Ns + (_isSitemapIndex ? "sitemap" : "url"), new XElement(Ns + "loc", item.Url.ToLower()));
            itemElement.Add(new XElement(Ns + "lastmod", item.LastModified.ToString("yyyy-MM-dd")));
            
            if (!_isSitemapIndex)
            {
                itemElement.Add(new XElement(Ns + "changefreq", item.Frequency.ToString().ToLower()));
                itemElement.Add(new XElement(Ns + "priority", item.Priority.ToString(CultureInfo.InvariantCulture)));
            }

            return itemElement;
        }
    }
}