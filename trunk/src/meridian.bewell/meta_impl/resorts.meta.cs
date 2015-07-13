using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace meridian.bewell.proto
{
    internal class resorts_meta
    {
        [Editable(false)]
        [Display(Name = "ProtoName", Order = 1)]
        public string ProtoName { get; set; }

        [Editable(false)]
        [Display(Name = "id", Order = 2)]
        public long id { get; set; }

        [Display(Name = "Заголовок", Order = 3)]
        [Required]
        public string title { get; set; }

        [Display(Name = "Страна/Территория", Order = 4)]
        [Required]
        [DataType("Lookup")]
        [Range(1, int.MaxValue, ErrorMessage = "Укажите территорию")]
        public long territory_id { get; set; }

        [Display(Name = "Bewell рекомендует (внутренние страницы)", Order = 5)]
        public bool is_recomended { get; set; }

        [Display(Name = "Опубликован", Order = 6)]
        public bool is_published { get; set; }

        [Display(Name = "Основные профили лечения", Order = 7)]
        [DataType("OneToManyEdit")]
        public string cure_profiles { get; set; }

        [Display(Name = "Сопутствующие профили лечения", Order = 8)]
        [DataType("OneToManyEdit")]
        public string ad_cure_profiles { get; set; }

        [Display(Name = "Природные лечебные факторы", Order = 9)]
        [DataType("OneToManyEdit")]
        public string health_factors { get; set; }

        [Display(Name = "Поля", Order = 10)]
        [DataType("Fieldset")]
        [AllowHtml]
        public string fieldset_dummy { get; set; }

        [Display(Name = "Координаты", Order = 11)]
        [DataType("MapCoords")]
        public string coordinates { get; set; }

        [Display(Name = "Галерея", Order = 12)]
        [DataType("GalleryEdit")]
        public string photos_dummy { get; set; }

        [Display(Name = "Seo метаданные", Order = 13)]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }

        [ScriptIgnore]
        [ScaffoldColumn(false)]
        public List<cure_profiles> cure_profiles_items { get; set; }

        [ScriptIgnore]
        [ScaffoldColumn(false)]
        public List<health_factors> health_factors_items { get; set; }

        [ScriptIgnore]
        [ScaffoldColumn(false)]
        public IEnumerable<hotels> Hotels { get; set; }
        
        [ScriptIgnore]
        [ScaffoldColumn(false)]
        public bool noyayesgo { get; set; }

        [ScriptIgnore]
        [ScaffoldColumn(false)]
        public string GeoLocationCoordinates { get; set; }
        [ScriptIgnore]
        [ScaffoldColumn(false)]
        public string GeoLocationTitle { get; set; }

        [ScriptIgnore]
        [ScaffoldColumn(false)]
        public bool NoYandexYesGoogle { get; set; }

        //[ScaffoldColumn(false)]
        //public int GetLookupValueLevel { get; set; }

        //[ScaffoldColumn(false)]
        //public bool GetLookupValueDisabled { get; set; }
       
    }
}
