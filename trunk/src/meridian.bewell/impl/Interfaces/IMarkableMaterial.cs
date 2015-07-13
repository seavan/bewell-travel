﻿using System;
using System.Linq;
using System.Text;

namespace meridian.bewell.proto
{
    public interface IMarkableMaterial
    {
        DateTime CreateDate { get; }
        int CMark { get; }
        string ProtoName { get; }
        Uri MaterialLink { get; }
        string MaterialTitle { get; }
    }
}
