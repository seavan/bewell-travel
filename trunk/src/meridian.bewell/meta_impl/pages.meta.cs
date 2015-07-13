using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace meridian.bewell.proto
{
    internal class pages_meta
    {
        [Editable(false)]
        [Display(Order = 1)]
        public string ProtoName { get; set; }

        [Editable(false)]
        [Display(Order = 2)]
        public long id { get; set; }

        [Display(Name = "Заголовок страницы", Order = 3)]
        [Required]
        public string title { get; set; }

        [Display(Name = "Родительская страница", Order = 4)]
        [DataType("Lookup")]
        public long parent_id { get; set; }

        [Display(Name = "Адрес страницы", Order = 5)]
        public string alias { get; set; }

        [Display(Name = "Полный адрес страницы", Order = 6)]
        public string PageUrl { get; set; }

        [DataType("TelerikHtml")]
        [Required]
        [Display(Name = "Текст страницы", Order = 7)]
        public string html { get; set; }

        [Display(Name = "Дата публикации", Order = 8)]
        public DateTime publish_date { get; set; }

        [Display(Name = "Seo метаданные", Order = 9)]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }

        [ScaffoldColumn(false)]
        public List<pages> SubPages { get; set; }
    }
}
