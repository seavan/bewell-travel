using System.Collections.Generic;

namespace bewell.Models.ViewModels
{
    public class EntityListViewModel
    {
        public List<EntityViewModel> Results { get; set; }
        public int PagesCount { get; set; }
        public int Page { get; set; }
        public int TotalCount { get; set; }
    }
}