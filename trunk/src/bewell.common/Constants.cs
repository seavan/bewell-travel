using admin.web.common;

namespace bewell.common
{
    public class Constants : CommonConstants
    {
        public const string NoImageUrl = "/content/userdata/noimage.jpg";
        public const string NoNewsImageUrl = "/content/userdata/noimagenews.jpg";
        public const string NoImageListUrl = "/content/userdata/noimagesmall.jpg";
        public const string UserDataFolder = "/content/userdata/";
        public const string TempFolder = UserDataFolder + "temp/";
        public const string HotelsDataFolder = UserDataFolder + "hotels/";
        public const string ResortsDataFolder = UserDataFolder + "resorts/";
        public const string CountriesDataFolder = UserDataFolder + "countries/";
        public const string RegionsDataFolder = UserDataFolder + "regions/";
        public const string ResortZonesDataFolder = UserDataFolder + "resortzones/";
        public const string NewsDataFolder = UserDataFolder + "news/";
        public const string PagesDataFolder = UserDataFolder + "images/";

        public const int PageSize = 2;
        public const int NewsPageSize = 10;
        public static readonly int[] PageSizes = { 1, 2, 5, 10 };
    }
}