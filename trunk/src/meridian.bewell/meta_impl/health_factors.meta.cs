using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
    internal class health_factors_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Наименование фактора")]
        [Required]
        public string title { get; set; }

        [Display(Name = "Родительский фактор")]
        [DataType("Lookup")]
        public long parent_id { get; set; }

        [Display(Name = "Показывать на карте сайта")]
        public bool show_on_sitemap { get; set; }

        [ScaffoldColumn(false)]
        public string health_factors_items { get; set; }

        [Display(Name = "Поля", Order = 20000)]
        [DataType("Fieldset")]
        public string fieldset_dummy { get; set; }

        [Display(Name = "Seo метаданные", Order = 20001)]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }

        [ScaffoldColumn(false)]
        public IEnumerable<health_factors> SubHealthFactors { get; set; }
    }
}
