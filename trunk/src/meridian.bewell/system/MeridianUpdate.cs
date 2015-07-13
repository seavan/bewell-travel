using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace meridian.bewell.system
{
    public class MeridianUpdate
    {
        public long id { get; set; }
        public long proto_id { get; set; }
        public string instance { get; set; }
        public int action { get; set; }
        public string proto { get; set; }
    }
}
