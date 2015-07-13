using System;
using System.Collections.Generic;
using System.Linq;
using bewell.common;
using meridian.bewell.impl.Classes;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class countries : BaseEntity, ILookupValueAspectProvider, ISeoMetadata, ISeoMetadataAspectProvider
    {
        public override Uri EntityUri()
        {
            string uri = string.Format("/country/{0}/{1}/", id, title.TransliterateAndClear());

            return new Uri(uri, UriKind.Relative);
        }

        public override string GetTitle()
        {
            return title;
        }

        public string GetListImage()
        {
            var photo = Meridian.Default.entity_photosStore.All()
                        .FirstOrDefault(item => item.proto_name == ProtoName && item.entity_id == id);
            return photo == null ? Constants.NoImageUrl : photo.ListUrl;
        }

        public ILookupValueAspect GetLookupValueAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "territory_id":
                    return new LookupAspect("territory_id", this,
                        () =>
                        {
                            var territories = Meridian.Default.territoriesStore.All().Where(item => item.parent_id == 0).ToList();
                            List<territories> result = proto.territories.GetTerritories(territories, 0);

                            return result;
                        });
            }

            return null;
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

        public string seo_dummy { get; set; }
    }
}
