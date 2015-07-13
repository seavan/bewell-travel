using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Collections.Generic;

namespace meridian.bewell.proto
{
    internal class deseases_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Код")]
        public string icd_code { get; set; }

        [Display(Name = "Наименование заболевания")]
        [Required]
        public string title { get; set; }

        [Display(Name = "Международное название")]
        public string international_title { get; set; }

        [Display(Name = "Профиль заболевания/лечения")]
        [DataType("Lookup")]
        public long profile_id { get; set; }

        [ScaffoldColumn(false)]
        public string CureProfile { get; set; }

        [ScaffoldColumn(false)]
        public List<hotels> deseases_items { get; set; }

        [Display(Name = "Поля")]
        [DataType("Fieldset")]
        public string fieldset_dummy { get; set; }

        [Display(Name = "Seo метаданные")]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }
    }
}
