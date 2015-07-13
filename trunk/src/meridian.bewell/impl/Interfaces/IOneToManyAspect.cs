using System.Collections.Generic;
using System.Linq;
using admin.db;

namespace meridian.bewell.proto
{
    public interface IOneToManyAspect
    {
        string FieldName { get; }

        IEnumerable<ILookupValue> GetAvalableValues();

        Dictionary<string, IEnumerable<ILookupValue>> GetAvailableGroupValues();
        Dictionary<string, IEnumerable<ILookupValue>> GetSelectedGroupValues();
        IEnumerable<ILookupValue> GetSelectedValues();

        void SetValue(long valueId);
        void RemoveValue(long valueId);

        IDatabaseEntity GetParent();
    }
}