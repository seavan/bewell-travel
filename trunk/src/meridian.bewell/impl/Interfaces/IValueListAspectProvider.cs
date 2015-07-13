using System.Collections.Generic;

namespace meridian.bewell.proto
{
    public interface IValueListAspectProvider
    {
        IValueListAspect GetValueListAspect(string _fieldName);
    }
}