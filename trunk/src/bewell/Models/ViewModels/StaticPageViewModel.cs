using System.Collections.Generic;
using meridian.bewell.proto;

namespace bewell.Models.ViewModels
{
    public class StaticPageViewModel
    {
        public string ProtoName { get; set; }
        public long Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Alias { get; set; }
        public string Template { get; set; }
        public IEnumerable<pages> MenuLinks { get; set; }
    }
}