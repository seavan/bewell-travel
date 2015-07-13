using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
    public partial class properties_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Наименование свойства отеля")]
        public string title { get; set; }

        [Display(Name = "Категория свойства")]
        [DataType("Lookup")]
        [Range(1, long.MaxValue, ErrorMessage = "Укажите свойство")]
        public long category_id { get; set; }

        [ScaffoldColumn(false)]
        public long parent_id { get; set; }
    }
}
