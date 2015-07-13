using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace meridian.bewell.system
{
    public partial class Meridian
    {
        public bool Exists(string protoName, long id)
        {
            if (m_Stores.IndexOfKey(protoName) < 0)
                return false;

            var store = m_Stores[protoName];

            return store.Exists(id);
        }
    }
}
