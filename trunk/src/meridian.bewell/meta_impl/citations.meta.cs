using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
    internal class citations_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Автор")]
        [Required]
        public string author { get; set; }

        [Display(Name = "Текст")]
        [DataType(DataType.MultilineText)]
        [Required]
        public string text { get; set; }

        [Display(Name = "Картинка")]
        public string picture { get; set; }
    }
}
