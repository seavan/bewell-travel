using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Collections.Generic;

namespace meridian.bewell.proto
{
    internal class questions_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [ScaffoldColumn(false)]
        public long account_id { get; set; }

        [Display(Name = "Дата вопроса")]
        public DateTime ask_date { get; set; }

        [Display(Name = "Имя пользователя")]
        public string asking_user_name { get; set; }

        [Display(Name = "Email пользователя")]
        public string asking_user_email { get; set; }

        [Display(Name = "Текст вопроса")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "Текст вопроса не может быть пустым")]
        public string question { get; set; }

        [Display(Name = "Ответить от имени")]
        [DataType("Lookup")]
        [Range(1, int.MaxValue, ErrorMessage = "Укажите учетную запись отвечающего")]
        public long replier_account_id { get; set; }

        [Display(Name = "Текст ответа")]
        [DataType(DataType.MultilineText)]
        public string reply_text { get; set; }
    }
}
