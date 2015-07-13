using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class ResortsMainProfilesAspect : OneToManyAspect<cure_profiles>
    {
        public ResortsMainProfilesAspect(resorts parent)
            : base(parent,
                   "cure_profiles",
                   () => { return Meridian.Default.cure_profilesStore.All().OrderBy(s => s.title).ToArray(); },
                   () => { return parent.cure_profiles_items; },
                   parent.add_cure_profiles_item,
                   parent.remove_cure_profiles_item
                )
        {
            
        }

    }
}