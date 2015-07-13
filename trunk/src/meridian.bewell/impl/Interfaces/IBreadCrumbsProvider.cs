using System.Collections.Generic;

namespace meridian.bewell.proto
{
    public interface IBreadCrumbsProvider
    {
        IEnumerable<INavigateableItem> GetBreadCrumbs();
    }
}