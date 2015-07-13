using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using meridian.bewell.proto;
using admin.db;
using meridian.bewell.impl.Images;
using bewell.common.Infrastructure;
using System.Web;

namespace meridian.bewell.protoStore
{
    public partial class newsStore
    {
        void IDataService<news>.Insert(news item)
        {
            Insert(item);

            ProcessImagesAndUpdate(item);
        }

        void IDataService<news>.Update(news item)
        {
            if (item.id <= 0)
                Insert(item);

            ProcessImagesAndUpdate(item);
        }

        private void ProcessImagesAndUpdate(news item)
        {
            var settingds = ServiceLocator.Instance.Locate<NewsImageMarkupProcessorSettings>();
            var processor = new NewsImageMarkupProcessor(item);
            processor.ImagesPhysicalPath = HttpContext.Current.Server.MapPath(settingds.ImagesVirtualPath);
            processor.ThumbnailGenerator = settingds.ThumbnailGenerator;

            HtmlDomTransformer transformer = new HtmlDomTransformer();
            transformer.MarkupProcessorChain = processor;
            transformer.Transform(item.text);

            Update(item);
        }
    }
}
