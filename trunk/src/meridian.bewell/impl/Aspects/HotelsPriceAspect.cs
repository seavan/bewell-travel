using System.Collections.Generic;
using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class HotelsPriceAspect : PriceTableAspect
    {
        private readonly hotels _parent;

        public HotelsPriceAspect(string _fieldName, hotels parent) : base(_fieldName, parent)
        {
            _parent = parent;
        }

        public override IEnumerable<IPriceTable> GetAllPrices()
        {
            return Meridian.Default.pricesStore.All().Where(item =>
                item.entity_id == _parent.id &&
                item.proto_name == _parent.ProtoName)
                .OrderBy(item => item.month)
                .ToList();
        }

        public override IPriceTable AddPrice(double price, byte month, string comment)
        {
            var priceEntry = Meridian.Default.pricesStore.All()
                .FirstOrDefault(item =>
                    item.entity_id == _parent.id && item.proto_name == _parent.ProtoName &&
                    item.month == month) ?? new prices();
            
            priceEntry.entity_id = _parent.id;
            priceEntry.proto_name = _parent.ProtoName;
            priceEntry.month = month;
            priceEntry.price = price;
            priceEntry.comment = comment;

            return Meridian.Default.pricesStore.Persist(priceEntry);
        }

        public override void RemovePrice(long id)
        {
            Meridian.Default.pricesStore.DeleteById(id);
        }
    }
}
