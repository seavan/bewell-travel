using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class questions : ILookupValueAspectProvider
    {
        public ILookupValueAspect GetLookupValueAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "replier_account_id":
                    return new LookupAspect("replier_account_id", this,
                        () => Meridian.Default.accountsStore.All().ToList());
            }

            return null;
        }
    }
}
