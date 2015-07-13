using System.IO;

namespace bewell.common.Infrastructure
{
    public class ImageNamingStrategy
    {
        private readonly string imageId;

        public ImageNamingStrategy(string fileName)
        {
            imageId = Path.GetFileNameWithoutExtension(fileName);
        }

        public string GetGuidName()
        {
            return imageId;
        }

        public string GetSmallThumbnailName()
        {
            return string.Format("{0}.small", imageId);
        }

        public string GetMediumThumbnailName()
        {
            return string.Format("{0}.mid", imageId);
        }

        public string GetLargeThumbnailName()
        {
            return string.Format("{0}.large", imageId);
        }
    }
}