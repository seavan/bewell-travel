using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class ResortsHealthFactorsAspect : OneToManyAspect<health_factors>
    {
        public ResortsHealthFactorsAspect(resorts parent)
            : base(parent,
                   "health_factors",
                   () => { return Meridian.Default.health_factorsStore.All().OrderBy(s => s.title).ToArray(); },
                   () => { return parent.health_factors_items; },
                   parent.add_health_factors_item,
                   parent.remove_health_factors_item
                )
        {
            
        }

    }
}