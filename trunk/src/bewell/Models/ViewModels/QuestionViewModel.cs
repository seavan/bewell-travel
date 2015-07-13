using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using bewell.Models.ModelValidators.Attributes;
using meridian.bewell.proto;

namespace bewell.Models.ViewModels
{
    public class QuestionViewModel
    {
        public long AccountId { get; set; }
        [Required(ErrorMessage = "Обязательное поле")]
        [DisplayName("Ваше имя")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Обязательное поле")]
        [DisplayName("Ваш email")]
        [EMail(ErrorMessage = "Неверный адрес электронной почты")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Обязательное поле")]
        [DisplayName("Текст вопроса")]
        public string Question { get; set; }
        [Required(ErrorMessage = "Обязательное поле")]
        [DisplayName("Введите текст с картинки:")]
        [Captcha(ErrorMessage = "Неверный текст")]
        public string Captcha { get; set; }

        public long QuestionId { get; set; }

        public IEnumerable<questions> Questions { get; set; }
    }
}