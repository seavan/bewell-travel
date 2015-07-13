using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using meridian.bewell.proto;

namespace meridian.bewell.protoStore
{
    public partial class territoriesStore
    {
        public IEnumerable<territories> GetRootTerritories()
        {
            return All().Where(item => item.parent_id == 0);
        }
    }
}
