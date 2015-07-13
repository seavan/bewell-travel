using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using bewell.common;

namespace meridian.bewell.impl.Images
{
    public class NewsImageMarkupProcessorSettings
    {
        public NewsImageMarkupProcessorSettings()
        {
            ImagesVirtualPath = "~" + Constants.NewsDataFolder;
        }

        public ThumbnailGenerator ThumbnailGenerator { get; set; }

        public string ImagesVirtualPath { get; set; }
    }
}