using System.ComponentModel.DataAnnotations;

namespace meridian.bewell.proto
{
	public partial class countries_meta
	{
		public countries_meta()
		{
		}

        [Editable(false)]
		public long id { get; set; }

        [Display(Name = "Название")]
        public string title { get; set; }

        [Display(Name = "Страна/Территория")]
        [DataType("Lookup")]
		public long territory_id { get; set; }

        [Display(Name = "Seo метаданные")]
        [DataType("SeoMetadataEdit")]
        public string seo_dummy { get; set; }

        [ScaffoldColumn(false)]
		public string health_factors { get; set; }
	}
}
