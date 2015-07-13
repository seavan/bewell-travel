using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class ResortsAdditionalProfilesAspect : OneToManyAspect<cure_profiles>
    {
        public ResortsAdditionalProfilesAspect(resorts parent)
            : base(parent,
                   "ad_cure_profiles",
                   () => Meridian.Default.cure_profilesStore.All().OrderBy(s => s.title).ToArray(),
                   () => parent.ad_cure_profiles_items,
                   parent.add_cure_profiles_ad_item,
                   parent.remove_cure_profiles_ad_item
                )
        {
        }
    }
}