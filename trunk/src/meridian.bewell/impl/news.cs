using System;
using bewell.common;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class news : ILookupValueAspectProvider, ISeoMetadata, ISeoMetadataAspectProvider
    {
        public ILookupValueAspect GetLookupValueAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "category_id":
                    return new LookupAspect("category_id", this,
                                            () => Meridian.Default.news_categoriesStore.All());

            }

            return null;
        }

        public string EntityUrl
        {
            get { return string.Format("/news/one/{0}/{1}", id, title.TransliterateAndClear()); }
        }

        public string ListImageUrl
        {
            get
            {
                return string.IsNullOrEmpty(preview)
                    ? Constants.NoNewsImageUrl
                    : Constants.NewsDataFolder + preview;
            }
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
