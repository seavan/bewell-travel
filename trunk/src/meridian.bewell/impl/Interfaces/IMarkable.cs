using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace meridian.bewell.proto
{
    public interface IMarkable
    {
        void SetMark(IMark mark);
        int GetRating();
        int GetCountMarks();

        string ProtoName { get; }
        long id { get; }
    }
}
