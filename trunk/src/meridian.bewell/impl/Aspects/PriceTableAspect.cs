using System.Collections.Generic;
using admin.db;

namespace meridian.bewell.proto
{
    public abstract class PriceTableAspect : Aspect, IPriceTableAspect
    {
        public PriceTableAspect(string _fieldName, IDatabaseEntity _parent) : base(_fieldName, _parent)
        {
        }

        public abstract IEnumerable<IPriceTable> GetAllPrices();

        public abstract IPriceTable AddPrice(double price, byte month, string comment);

        public abstract void RemovePrice(long id);
    }
}
