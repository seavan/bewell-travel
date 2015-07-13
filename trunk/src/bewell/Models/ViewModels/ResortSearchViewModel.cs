using System.Collections.Generic;
using meridian.bewell.proto;

namespace bewell.Models.ViewModels
{
    public class ResortSearchViewModel
    {
        public List<cure_profiles> CureProfiles { get; set; }
        public List<territories> Territories { get; set; }
        
        public long CureProfileId { get; set; }
        public long TerritoryId { get; set; }
    }
}