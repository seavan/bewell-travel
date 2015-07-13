using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class HotelPropertiesAspect : OneToManyAspect<properties>
    {
        public HotelPropertiesAspect(hotels parent)
            : base(parent,
                   "properties",
                   () => Meridian.Default.propertiesStore.All().OrderBy(s => s.title).ToArray(),
                   () => Meridian.Default.property_categoriesStore.All().Where(item => item.Properties.Any()).ToDictionary(item => item.title, item => item.Properties),
                   () => parent.properties_items,
                   parent.add_properties_item,
                   parent.remove_properties_item
                )
        {
        }
    }
}