using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using bewell.common;
using meridian.bewell.impl.Classes;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    [Bind(Exclude = "deseases,treatment_options,properties")]
    public partial class hotels : BaseEntity, ILookupValueAspectProvider, 
        IOneToManyAspectProvider, IAttachedPhotoAspectProvider, 
        IFieldsetAspectProvider, IPriceTableAspectProvider, IGeoLocation, ISeoMetadata, ISeoMetadataAspectProvider
    {
        public override Uri EntityUri()
        {
            string uri = string.Format("/hotel/{0}/{1}/", id, title.TransliterateAndClear());

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
                case "resort_id":
                    return new LookupAspect("resort_id", this,
                        () => Meridian.Default.resortsStore.All().ToList());
                case "class_id":
                    return new LookupAspect("class_id", this,
                        () => Meridian.Default.hotel_classesStore.All().ToList());
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
                case "deseases":
                    return new HotelDeseasesAspect(this);
                case "treatment_options":
                    return new HotelTreatmentsAspect(this);
                case "properties":
                    return new HotelPropertiesAspect(this);
            }

            return null;
        }

        public IAttachedPhotoAspect GetAttachedPhotoAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "photos_dummy":
                    return new HotelPhotosAspect("photos_dummy", this, Constants.HotelsDataFolder);
            }

            return null;
        }

        public IFieldsetAspect GetFieldsetAspect(string _fieldName)
        {
            return new EntityFieldsetAspect(_fieldName, this);
        }

        public IPriceTableAspect GetPriceTableAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "price_dummy":
                    return new HotelsPriceAspect("photos_dummy", this);
            }

            return null;
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
                return double.Parse(coords[1].Trim());
            }
            return 0;

        }
        public double GetLongitude()
        {
            if (string.IsNullOrEmpty(coordinates)) return 0;

            string[] coords = coordinates.Split(',');

            return double.Parse(coords[0].Trim());
        }
        
        public IEnumerable<IGeoLocation> GetLinkedEntities()
        {
            return
                Meridian.Default.hotelsStore.All().Where(
                    h => h.id != id && h.resort_id > 0 && h.resort_id == resort_id);
        }

        public bool NoYandexYesGoogle { get { return noyayesgo; } }

        public void DataUpdate(string coords, bool useGoogleMap)
        {
            coordinates = coords;
            noyayesgo = useGoogleMap;

            Meridian.Default.hotelsStore.Update(this);
        }
        #endregion

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

        public string photos_dummy { get; set; }
        public string fieldset_dummy { get; set; }
        public string price_dummy { get; set; }
        public string seo_dummy { get; set; }
    }
}
