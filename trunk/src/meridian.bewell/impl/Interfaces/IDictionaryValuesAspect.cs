using System.Collections.Generic;
using admin.db;

namespace meridian.bewell.proto
{
    public interface IDictionaryValuesAspect
    {
        string FieldName { get;  }

        IDatabaseEntity GetParent();

        IDictionaryCategory[] GetCategories();

        IEnumerable<IDictionaryValue> GetValues();

        void RemoveValue(long catId, long valueId = 0);

        void SetValue(long catId, long valueId);
    }
}