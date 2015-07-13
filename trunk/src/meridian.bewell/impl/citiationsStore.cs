using System;
using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.protoStore
{
    public partial class citationsStore
    {
        public proto.citations GetRandom()
        {
            return Meridian.Default.citationsStore.All().OrderBy(x => Guid.NewGuid()).FirstOrDefault();
        }
    }
}
