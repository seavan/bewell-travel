using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.protoStore
{
    public partial class entity_photosStore
    {
        public int GetNextItemOrder(long entityId, string protoName)
        {
            var lastOrderedItem = Meridian.Default.entity_photosStore.All()
                .Where(item => item.entity_id == entityId && item.proto_name == protoName)
                .OrderByDescending(item => item.order_number)
                .FirstOrDefault();

            return lastOrderedItem != null ? lastOrderedItem.order_number + 1 : 1;
        }
    }
}
