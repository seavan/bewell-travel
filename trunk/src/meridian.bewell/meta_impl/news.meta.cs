using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Collections.Generic;

namespace meridian.bewell.proto
{
    internal class news_meta
    {
        [Editable(false)]
        public long id { get; set; }

        [Display(Name = "Категория новости")]
        [DataType("Lookup")]
        [Range(1, int.MaxValue, ErrorMessage = "Укажите категорию новости")]
        public long category_id { get; set; }

        [Display(Name = "Заголовок")]
        [Required]
        public string title { get; set; }

        [DataType("TelerikHtml")]
        [Display(Name = "Анонс")]
        public string announce { get; set; }

        [DataType("TelerikHtml")]
        [Display(Name = "Текст")]
        [Required]
        public string text { get; set; }

        [Display(Name = "Дата публикации")]
        public DateTime publish_date { get; set; }

        [Display(Name = "Опубликовать")]
        public bool is_published { get; set; }

        [Display(Name = "Seo метаданные")]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }

        [ScaffoldColumn(false)]
        public string EntityUrl { get; set; }

        [ScaffoldColumn(false)]
        public string ListImageUrl { get; set; }

        [ScaffoldColumn(false)]
        public string preview { get; set; }
    }
}
