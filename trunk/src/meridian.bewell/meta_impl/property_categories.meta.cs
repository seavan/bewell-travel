using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
    public partial class property_categories_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Наименование категории свойства отеля")]
        public string title { get; set; }

        [Display(Name = "Отображать в расширенном поиске")]
        public bool show_in_search { get; set; }

        [Display(Name = "Порядковый номер")]
        public long order_number { get; set; }

        [ScaffoldColumn(false)]
        public IEnumerable<properties> Properties { get; set; }
    }
}
