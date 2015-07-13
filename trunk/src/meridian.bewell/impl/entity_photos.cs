using admin.db;
using bewell.common;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class entity_photos : IAttachedPhoto
    {
        public string PhotoUrl
        {
            get { return GetPhotoUrl("large"); }
        }

        public string PreviewUrl
        {
            get { return GetPhotoUrl("mid"); }
        }

        public string ListUrl
        {
            get { return GetPhotoUrl("small"); }
        }

        private string GetPhotoUrl(string type)
        {
            var folder = string.Empty;
            var size = string.Empty;

            switch (proto_name)
            {
                case "hotels":
                    folder = Constants.HotelsDataFolder;
                    break;
                case "resorts":
                    folder = Constants.ResortsDataFolder;
                    break;
                case "countries":
                    folder = Constants.CountriesDataFolder;
                    break;
                case "regions":
                    folder = Constants.RegionsDataFolder;
                    break;
                case "resort_zones":
                    folder = Constants.ResortZonesDataFolder;
                    break;
            }

            switch (type)
            {
                case "large":
                    size = thumbnail_large;
                    break;
                case "mid":
                    size = thumbnail_mid;
                    break;
                case "small":
                    size = thumbnail_small;
                    break;
            }

            return string.Format("{0}{1}", folder, size);
        }

        public string ThumbUrl
        {
            get { return ListUrl; }
        }

        public string FullUrl
        {
            get { return PhotoUrl; }
        }

        public bool IsMain
        {
            get
            {
                return is_main;
            }
            set
            {
            }
        }

        public IDatabaseEntity AttachedPhotoContainer
        {
            get
            {
                return Meridian.Default.GetAs<IDatabaseEntity>(proto_name, entity_id);
            }
        }
    }
}
