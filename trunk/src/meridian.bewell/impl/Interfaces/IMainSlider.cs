using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace meridian.bewell.proto
{
    public interface IMainSlider
    {
        string ProtoName { get; }
        string title { get;}
        DateTime publish_date { get;  }
        Uri ItemMainUri { get; }
        Uri GetImgItemMainUri();

    }
}
