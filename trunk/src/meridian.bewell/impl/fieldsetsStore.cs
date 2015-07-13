using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using meridian.bewell.proto;

namespace meridian.bewell.protoStore
{
    public partial class fieldsetsStore
    {
        public IEnumerable<fieldsets> LoadFieldsetsForProto(string protoName)
        {
            return All().Where(item => item.proto_name == protoName);
        }
    }
}
