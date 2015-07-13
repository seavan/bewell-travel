using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HtmlAgilityPack;

namespace meridian.bewell.impl.Images
{
    public interface IMarkupProcessor
    {
        IMarkupProcessor Previous { get; }
        void ProcessMarkup(HtmlDocument document);
    }
}