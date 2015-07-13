using System.IO;
using CuttingEdge.Conditions;
using HtmlAgilityPack;
using meridian.bewell.proto;
using meridian.bewell.system;

namespace meridian.bewell.impl.Images
{
    public class NewsImageMarkupProcessor : AbstractImageMarkupProcessor
    {
        private news news;

        public NewsImageMarkupProcessor(news news)
        {
            Condition.Requires(news, "news").IsNotNull();

            this.news = news;
        }

        public ThumbnailGenerator ThumbnailGenerator { get; set; }

        public override void ProcessMarkup(HtmlDocument document)
        {
            HtmlNodeCollection imageNodes = SelectImageNodes(document);
            if (imageNodes != null)
            {
                foreach (var node in imageNodes)
                {
                    string url = HtmlMarkupHelper.GetAttributeValue(node, "src");

                    if (string.IsNullOrEmpty(url))
                        continue;

                    if (ShouldCreateThumbnail(news, url))
                        CreateThumbnail(news, url);

                    break;
                }
            }
        }

        private static HtmlNodeCollection SelectImageNodes(HtmlDocument document)
        {
            return document.DocumentNode.SelectNodes("//img");
        }

        private void CreateThumbnail(news news, string imageUrl)
        {
            string originalExtension = Path.GetExtension(imageUrl);
            string originalFilename = Path.GetFileNameWithoutExtension(imageUrl);
            string originalFilePath = Path.Combine(ImagesPhysicalPath, Path.GetFileName(imageUrl));

            news.preview = GenerateThumbnail(ThumbnailGenerator, originalFilePath, ImagesPhysicalPath, 
                originalFilename + ".preview");
        }

        private bool ShouldCreateThumbnail(news news, string imageUrl)
        {
            string imageFilename = Path.GetFileNameWithoutExtension(imageUrl);

            return !news.preview.Contains(imageFilename);
        }
    }
}