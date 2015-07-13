using System.Collections.Generic;
using admin.db;

namespace meridian.bewell.proto
{
    public interface IPriceTableAspect
    {
        string FieldName { get; }

        IDatabaseEntity GetParent();

        IEnumerable<IPriceTable> GetAllPrices();

        IPriceTable AddPrice(double price, byte month, string comment);
        
        void RemovePrice(long id);
    }
}
