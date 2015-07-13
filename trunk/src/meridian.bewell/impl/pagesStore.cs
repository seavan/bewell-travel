using System.Collections.Generic;
using System.Linq;
using meridian.bewell.proto;

namespace meridian.bewell.protoStore
{
    public partial class pagesStore
    {
        public pages GetStaticPageByUrl(string url)
        {
            return All().FirstOrDefault(item => item.GetPageUrl(false) == url);
        }

        public Dictionary<string, pages> GetPagesList()
        {
            var rootPages = All().Where(item => item.parent_id == 0);
            return GetPages(rootPages);
        }

        public Dictionary<string, pages> GetPages(IEnumerable<pages> pages)
        {
            var result = new Dictionary<string, pages>();

            foreach (var page in pages)
            {
                result.Add(page.GetPageUrl(), page);
                
                if (page.SubPages.Any())
                {
                    var sub = GetPages(page.SubPages);

                    foreach (var key in sub.Keys)
                    {
                        result.Add(key, sub[key]);
                    }
                }
            }

            return result;
        }
    }
}
