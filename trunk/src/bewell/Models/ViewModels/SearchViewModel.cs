using System.Collections.Generic;
using System.Web.Mvc;
using meridian.bewell.proto;

namespace bewell.Models.ViewModels
{
    public class SearchViewModel
    {
        public string Title { get; set; }
        public int PriceFrom { get; set; }
        public int PriceTo { get; set; }
        public int? MinPrice { get; set; }
        public int? MaxPrice { get; set; }
        public long CureProfileId { get; set; }
        public long AdditionalCureProfileId { get; set; }
        public long RootTerritoryId { get; set; }
        public long TerritoryId { get; set; }
        public long SubTerritoryId { get; set; }

        public long DeseaseId { get; set; }
        public long AdditionalDeseaseId { get; set; }
        public long ResortId { get; set; }
        public long TreatmentId { get; set; }
        public long HealthFactorId { get; set; }

        public int Stars { get; set; }
        public long HotelClass { get; set; }
        public List<long> Properties { get; set; }
        public List<long> Treatments { get; set; }
        public List<SelectListItem> HotelClasses { get; set; }
        public List<SelectListItem> HotelStars { get; set; }
        public List<property_categories> Categories { get; set; }
        public List<treatment_options> TreatmentOptions { get; set; }
    }
}