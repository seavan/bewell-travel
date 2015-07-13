using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
    internal class territories_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Название территории")]
        [Required]
        public string title { get; set; }

        [Display(Name = "Родительская территория")]
        [DataType("Lookup")]
        public long parent_id { get; set; }

        [Display(Name = "Тип территории")]
        [DataType("Lookup")]
        [Range(1, int.MaxValue, ErrorMessage = "Укажите тип территории")]
        public long category_id { get; set; }

        [Display(Name = "Вложенный тип территории")]
        [DataType("Lookup")]
        public long nested_category_id { get; set; }

        [Display(Name = "Сортировка")]
        public long item_order { get; set; }

        [Display(Name = "Включено в поиск")]
        public bool in_search { get; set; }

        [ScaffoldColumn(false)]
        public string SubTerritories { get; set; }

        [ScaffoldColumn(false)]
        public string Category { get; set; }

        [ScaffoldColumn(false)]
        public IEnumerable<resorts> Resorts { get; set; }

        [Display(Name = "Ключ в верстке карты (map-key)")]
        public string map_key { get; set; }
    }
}
