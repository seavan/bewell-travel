using System.Collections.Generic;
using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class territories : ILookupValue, ILookupValueAspectProvider
    {
        public territory_categories Category { get { return category_territories_territory_categories; } }

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
                case "parent_id":
                    return new LookupAspect("parent_id", this,
                        () =>
                        {
                            var territories = Meridian.Default.territoriesStore.All().Where(item => item.parent_id == 0).ToList();
                            List<territories> result = GetTerritories(territories, 0);

                            return result;
                        }); 
                case "category_id":
                    return new LookupAspect("category_id", this,
                        () => Meridian.Default.territory_categoriesStore.All());
                case "nested_category_id":
                    return new LookupAspect("nested_category_id", this,
                        () => Meridian.Default.territory_categoriesStore.All()); 

            }

            return null;
        }

        public static List<territories> GetTerritories(List<territories> territories, int level)
        {
            var result = new List<territories>();

            var titlePrefix = new string('\xA0', level);

            foreach (var territory in territories)
            {
                var listTerritory = new territories {id = territory.id, title = titlePrefix + territory.title};

                result.Add(listTerritory);

                if (territory.SubTerritories.Any())
                {
                    result.AddRange(GetTerritories(territory.SubTerritories.ToList(), level + 3));
                }
            }

            return result;
        }

        public long[] GetTerritoryHierarchy()
        {
            if (parent_id > 0)
            {
                var parent = Meridian.Default.territoriesStore.Get(parent_id);

                if (parent.parent_id > 0)
                {
                    return new[] {parent.parent_id, parent_id, id};
                }

                return new[] {parent_id, id, 0};
            }

            return new[] {id, 0, 0};
        }
    }
}
