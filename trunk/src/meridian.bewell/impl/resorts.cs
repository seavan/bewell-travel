using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using bewell.common;
using meridian.bewell.impl.Classes;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    [Bind(Exclude = "cure_profiles,ad_cure_profiles,health_factors")]
    public partial class resorts : BaseEntity, ILookupValueAspectProvider, IOneToManyAspectProvider, IFieldsetAspectProvider, IGeoLocation, ILookupValue, ISeoMetadata, ISeoMetadataAspectProvider, IAttachedPhotoAspectProvider
    {
        public override Uri EntityUri()
        {
            string uri = string.Format("/resort/{0}/{1}/", id, title.TransliterateAndClear());

            return new Uri(uri, UriKind.Relative);
        }

        public string GetListImage()
        {
            var photo = Meridian.Default.entity_photosStore.All()
                        .FirstOrDefault(item => item.proto_name == ProtoName && item.entity_id == id && item.is_main);
            return photo == null ? Constants.NoImageListUrl : photo.ListUrl;
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

        public IOneToManyAspect GetOneToManyAspect(string _fieldName)
        {

            switch (_fieldName)
            {
                case "cure_profiles":
                    return new ResortsMainProfilesAspect(this);
                case "ad_cure_profiles":
                    return new ResortsAdditionalProfilesAspect(this);
                case "health_factors":
                    return new ResortsHealthFactorsAspect(this);
            }
            return null;
        }

        public IFieldsetAspect GetFieldsetAspect(string _fieldName)
        {
            return new EntityFieldsetAspect(_fieldName, this);
        }

        public override string GetTitle()
        {
            return title;
        }

        #region IGeoLocation Implementation
        public string GeoLocationCoordinates { get { return coordinates; } }
        public string GeoLocationTitle { get { return title; } }

        public Uri GetGeoLocationUri()
        {
            return EntityUri();
        }
        public double GetLatitude()
        {
            if (string.IsNullOrEmpty(coordinates)) return 0;

            string[] coords = coordinates.Split(',');
            if (coords.Count() > 1)
            {
                return double.Parse(coords[1].Trim(), CultureInfo.InvariantCulture);
            }
            return 0;

        }
        public double GetLongitude()
        {
            if (string.IsNullOrEmpty(coordinates)) return 0;

            string[] coords = coordinates.Split(',');

            return double.Parse(coords[0].Trim(), CultureInfo.InvariantCulture);
        }

        public IEnumerable<IGeoLocation> GetLinkedEntities()
        {
            return Hotels;
        }
        public bool NoYandexYesGoogle { get { return noyayesgo; } }

        public void DataUpdate(string coords, bool useGoogleMap)
        {
            coordinates = coords;
            noyayesgo = useGoogleMap;

            Meridian.Default.resortsStore.Update(this);
        }
        #endregion

        public int GetLookupValueLevel()
        {
            return 0;
        }

        public bool GetLookupValueDisabled()
        {
            return false;
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

        public IAttachedPhotoAspect GetAttachedPhotoAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "photos_dummy":
                    return new ResortPhotosAspect("photos_dummy", this, Constants.ResortsDataFolder);
            }

            return null;
        }
        
        public string GetEntityUrl()
        {
            return EntityUri().ToString();
        }

        public string fieldset_dummy { get; set; }
        public string photos_dummy { get; set; }
        public string seo_dummy { get; set; }
    }
}
