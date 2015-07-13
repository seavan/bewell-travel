using System;
using System.ComponentModel.DataAnnotations;
using bewell.Models.ModelValidators.Attributes;

namespace bewell.Models.ViewModels.Mail
{
    public class OrderRequestViewModel
    {
        [Required(ErrorMessage = "Обязательное поле")]
        public string LastName { get; set; }
        
        [Required(ErrorMessage = "Обязательное поле")]
        public string FirstName { get; set; }
        
        [Required(ErrorMessage = "*")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd.MM.yyyy}")]
        public DateTime FromDate { get; set; }
        
        [Required(ErrorMessage = "*")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd.MM.yyyy}")]
        public DateTime ToDate { get; set; }
        
        [Required(ErrorMessage = "Обязательное поле")]
        [EMail(ErrorMessage = "Неверный адрес электронной почты")]
        public string Email { get; set; }
        
        [Required(ErrorMessage = "Обязательное поле")]
        public string Phone { get; set; }

        public long Id { get; set; }
        public string ProtoName { get; set; }
        public string Link { get; set; }
        public string EntityTitle { get; set; }
    }
}