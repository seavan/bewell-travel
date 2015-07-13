using System.Collections.Generic;
using meridian.bewell.proto;

namespace bewell.Models.ViewModels
{
    public class SiteMapMenuViewModel
    {
        public List<treatment_options>[] TreatmentOptions { get; set; }
        public List<health_factors>[] HealthFactors { get; set; }
    }
}