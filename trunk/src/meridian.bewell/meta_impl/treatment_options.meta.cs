using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Collections.Generic;

namespace meridian.bewell.proto
{
    internal class treatment_options_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Наименование вида лечения")]
        [Required]
        public string title { get; set; }

        [Display(Name = "Родительский метод лечения")]
        [DataType("Lookup")]
        public long parent_id { get; set; }

        [Display(Name = "Показывать на карте сайта")]
        public bool show_on_sitemap { get; set; }

        [Display(Name = "Поля", Order = 20000)]
        [DataType("Fieldset")]
        public string fieldset_dummy { get; set; }

        [Display(Name = "Seo метаданные", Order = 20001)]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }

        [ScaffoldColumn(false)]
        public string treatment_options_items { get; set; }

        [ScaffoldColumn(false)]
        public IEnumerable<treatment_options> SubTreatmentOptions { get; set; }
    }
}
