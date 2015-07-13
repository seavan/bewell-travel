using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class HotelTreatmentsAspect : OneToManyAspect<treatment_options>
    {
        public HotelTreatmentsAspect(hotels parent)
            : base(parent,
                   "treatment_options",
                   () => { return Meridian.Default.treatment_optionsStore.All().OrderBy(s => s.title).ToArray(); },
                   () => { return Meridian.Default.treatment_optionsStore.All().Where(item => item.parent_id == 0 && item.SubTreatmentOptions.Any()).ToDictionary(item => item.title, item => item.SubTreatmentOptions); },
                   () => { return parent.treatment_options_items; },
                   parent.add_treatment_options_item,
                   parent.remove_treatment_options_item
                )
        {
            
        }

    }
}