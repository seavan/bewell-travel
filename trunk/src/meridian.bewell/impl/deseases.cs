using System;
using meridian.bewell.impl.Classes;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class deseases : BaseEntity, ILookupValueAspectProvider, ILookupValue, IFieldsetAspectProvider, ISeoMetadata, ISeoMetadataAspectProvider
    {
        public cure_profiles CureProfile { get { return cure_profiles_deseases_cure_profiles; } }

        public override Uri EntityUri()
        {
            string uri = string.Format("/treatments/desease/{0}/{1}/", id, title.TransliterateAndClear());

            return new Uri(uri, UriKind.Relative);
        }

        public override string GetTitle()
        {
            return title;
        }

        public ILookupValueAspect GetLookupValueAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "profile_id":
                    return new LookupAspect("profile_id", this,
                        () => Meridian.Default.cure_profilesStore.All());
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
