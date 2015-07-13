using System.Collections.Generic;
using meridian.bewell.proto;

namespace bewell.Models.ViewModels
{
    public class NewsListViewModel
    {
        public List<news> News { get; set; }
        public news_categories Category { get; set; }
        public int PagesCount { get; set; }
        public int Page { get; set; }
        public int TotalCount { get; set; }
    }
}