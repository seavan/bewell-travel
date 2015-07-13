using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class properties : ILookupValue, ILookupValueAspectProvider
    {
        public int GetLookupValueLevel()
        {
            return 0;
        }

        public bool GetLookupValueDisabled()
        {
            return false;
        }

        public ILookupValueAspect GetLookupValueAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "category_id":
                    return new LookupAspect("category_id", this,
                        () => Meridian.Default.property_categoriesStore.All().ToList());
            }

            return null;
        }
    }
}