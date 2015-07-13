using System.Collections.Generic;

namespace meridian.bewell.impl.Classes
{
    public class MenuLinks
    {
        public string CurrentUrl { get; set; }
        public List<LinkInfo> Links { get; set; }

        public MenuLinks()
        {
            Links = new List<LinkInfo>();
        }
    }
}
