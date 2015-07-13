using System;
using System.Linq;
using meridian.bewell.impl.Classes;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class treatment_options : BaseEntity, ILookupValueAspectProvider, ILookupValue, IFieldsetAspectProvider, ISeoMetadata, ISeoMetadataAspectProvider
    {
        public override Uri EntityUri()
        {
            string uri = string.Format("/natureheals/treatment/{0}/{1}/", id, title.TransliterateAndClear());

            return new Uri(uri, UriKind.Relative);
        }

        public ILookupValueAspect GetLookupValueAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "parent_id":
                    return new LookupAspect("parent_id", this,
                                            () => Meridian.Default.treatment_optionsStore.All().Where(item => item.parent_id == 0));
            }

            return null;
        }

        public int GetLookupValueLevel()
        {
            return 0;
        }

        public bool GetLookupValueDisabled()
        {
            return false;
        }

        public IFieldsetAspect GetFieldsetAspect(string _fieldName)
        {
            return new EntityFieldsetAspect(_fieldName, this);
        }

        public override string GetTitle()
        {
            return title;
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

        public string GetEntityUrl()
        {
            return EntityUri().ToString();
        }

        public string fieldset_dummy { get; set; }
        public string seo_dummy { get; set; }
    }
}