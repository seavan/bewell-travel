using System.Collections.Generic;
using admin.db;

namespace meridian.bewell.proto
{
    public interface IFieldsetAspect
    {
        string FieldName { get; }
        IEnumerable<ICategory> GetCategories();
        void SetValue(long fieldId, string value);
        void RemoveValue(long fieldId);
        IDatabaseEntity GetParent();
    }
}