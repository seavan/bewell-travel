using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
    public partial class genders_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Название")]
        [Required]
        public string title { get; set; }
    }
}
