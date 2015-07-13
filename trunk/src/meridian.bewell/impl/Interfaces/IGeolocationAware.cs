using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace meridian.bewell.proto
{
    public interface IGeolocationAware
    {
        IEnumerable<IGeoLocation> GetEntityMap();
    }
}
