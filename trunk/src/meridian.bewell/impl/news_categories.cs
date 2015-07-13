using System;

namespace meridian.bewell.proto
{
    public partial class news_categories : ILookupValue, ISeoMetadata, ISeoMetadataAspectProvider
    {
        public int GetLookupValueLevel()
        {
            return 0;
        }

        public bool GetLookupValueDisabled()
        {
            return false;
        }

        public string EntityUrl
        {
            get { return string.Format("/news/{0}/{1}", id, title.TransliterateAndClear()); }
        }

        public string GetEntityUrl()
        {
            return EntityUrl;
        }

        public ISeoMetadataAspect GetSeoMetadataAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "seo_dummy":
                    return new EntitySeoMetadataAspect("seo_dummy", this);
            }

            return null;
        }

        public string seo_dummy { get; set; }
    }
}
