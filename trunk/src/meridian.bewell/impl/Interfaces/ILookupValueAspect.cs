using System.Collections.Generic;
using admin.db;

namespace meridian.bewell.proto
{
    public interface ILookupValueAspect
    {
        IEnumerable<ILookupValue> GetValues();
    }

}