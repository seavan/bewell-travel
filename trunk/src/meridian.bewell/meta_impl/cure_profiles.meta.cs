using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
    internal class cure_profiles_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Наименование профиля заболевания/лечения")]
        [Required]
        public string title { get; set; }

        [Display(Name = "Пол лечащегося")]
        [Required]
        [DataType("Lookup")]
        [Range(1, int.MaxValue, ErrorMessage = "Укажите пол для профиля лечения")]
        public int gender_id { get; set; }

        [Display(Name = "Стиль CSS")]
        public string css_class { get; set; }

        [Display(Name = "Сортировка")]
        public int item_order { get; set; } 

        [ScaffoldColumn(false)]
        public string Deseases { get; set; }

        [ScaffoldColumn(false)]
        public string cure_profiles_items { get; set; }

        [ScaffoldColumn(false)]
        public genders Gender { get; set; }

        [Display(Name = "Поля")]
        [DataType("Fieldset")]
        public string fieldset_dummy { get; set; }

        [Display(Name = "Seo метаданные")]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }
    }
}
