using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
    public partial class news_categories_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Название")]
        public string title { get; set; }

        [Display(Name = "Seo метаданные")]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }

        [ScaffoldColumn(false)]
        public IEnumerable<news> News { get; set; }

        [ScaffoldColumn(false)]
        public string EntityUrl { get; set; }
    }
}
