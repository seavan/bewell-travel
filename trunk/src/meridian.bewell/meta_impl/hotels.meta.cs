using System.ComponentModel.DataAnnotations;
using System.Web.Script.Serialization;

namespace meridian.bewell.proto
{
    internal class hotels_meta
    {
        [Editable(false)]
        [Display(Order = 1)]
        public string ProtoName { get; set; }

        [Editable(false)]
        [Display(Order = 2)]
        public long id { get; set; }

        [Display(Name = "Название", Order = 3)]
        [Required]
        public string title { get; set; }

        [Display(Name = "Курорт", Order = 4)]
        [Required]
        [DataType("Lookup")]
        [Range(1, int.MaxValue, ErrorMessage = "Укажите курорт")]
        public long resort_id { get; set; }

        [Display(Name = "Количество звезд", Order = 5)]
        [Required]
        public int stars { get; set; }

        [Display(Name = "Класс отеля", Order = 6)]
        [DataType("Lookup")]
        public long class_id { get; set; }

        [Display(Name = "Координаты", Order = 7)]
        [DataType("MapCoords")]
        public string coordinates { get; set; }

        [Display(Name = "Bewell рекомендует (на главной)", Order = 8)]
        public bool is_recomended_main_page { get; set; }

        [Display(Name = "Bewell рекомендует (внутренние страницы)", Order = 9)]
        public bool is_recomended { get; set; }

        [Display(Name = "Опубликован", Order = 10)]
        public bool is_published { get; set; }

        [Display(Name = "Заболевания", Order = 11)]
        [DataType("OneToManyEdit")]
        public string deseases { get; set; }

        [Display(Name = "Методы лечения", Order = 12)]
        [DataType("OneToManyEdit")]
        public string treatment_options { get; set; }

        [Display(Name = "Свойства отеля", Order = 13)]
        [DataType("OneToManyEdit")]
        public string properties { get; set; }

        [Display(Name = "Галерея", Order = 14)]
        [DataType("GalleryEdit")]
        public string photos_dummy { get; set; }

        [Display(Name = "Поля", Order = 15)]
        [DataType("Fieldset")]
        public string fieldset_dummy { get; set; }

        [Display(Name = "Цены", Order = 16)]
        [DataType("PriceEdit")]
        public string price_dummy { get; set; }

        [Display(Name = "Seo метаданные", Order = 17)]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }

        [ScaffoldColumn(false)]
        public string deseases_items { get; set; }

        [ScaffoldColumn(false)]
        public string treatment_options_items { get; set; }

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
    }
}
