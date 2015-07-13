using System;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
    internal class comments_meta
    {
        [Editable(false)]
        [Display(Name = "Идентификатор")]
        public long id { get; set; }

        [ScaffoldColumn(false)]
        public int left_key { get; set; }

        [ScaffoldColumn(false)]
        public int right_key { get; set; }

        [ScaffoldColumn(false)]
        public int level { get; set; }

        [Display(Name = "Признак удаления")]
        public bool delete { get; set; }

        [Editable(false)]
        [Display(Name = "Дата создания")]
        public DateTime create_date { get; set; }

        [Display(Name = "Автор")]
        [DataType("Lookup")]
        public long account_id { get; set; }

        [Display(Name = "Текст")]
        [DataType(DataType.MultilineText)]
        public string text { get; set; }

        [Display(Name = "Идентификатор родительского комментария")]
        public long parent_id { get; set; }

        
        [ScaffoldColumn(false)]
        public long entity_id { get; set; }

        [ScaffoldColumn(false)]
        public string proto_name { get; set; }

        [Display(Name = "Отель/Курорт")]
        [DataType("URL")]
        public string entityUrl { get; set; }

        [ScaffoldColumn(false)]
        public IEnumerable<comments> ChildComments { get; set; }
    }
}
