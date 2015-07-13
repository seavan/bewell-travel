using System.ComponentModel.DataAnnotations;

namespace bewell.Models.ViewModels
{
    public class CallMeViewModel
    {
        [Required(ErrorMessage = "Введите телефон")]
        public string Phone { get; set; }

        public bool Success { get; set; }

        public CallMeViewModel()
        {
            Success = false;
        }
    }
}