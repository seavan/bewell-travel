using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class HotelDeseasesAspect : OneToManyAspect<deseases>
    {
        public HotelDeseasesAspect(hotels parent)
            : base(parent,
                   "deseases",
                   () => { return Meridian.Default.deseasesStore.All().OrderBy(s => s.title).ToArray(); },
                   () => { return Meridian.Default.cure_profilesStore.All().Where(item => item.Deseases.Any()).ToDictionary(item =>item.title, item => item.Deseases); },
                   () => { return parent.deseases_items; },
                   parent.add_deseases_item,
                    parent.remove_deseases_item
                )
        {
            
        }

    }
}