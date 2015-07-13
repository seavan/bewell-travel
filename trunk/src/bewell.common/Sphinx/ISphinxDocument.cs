using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace bewell.common.Sphinx
{
    public interface ISphinxDocument
    {
        string GetTitle();
        string GetBody();
        string GetUrl();
    }
}
