using System;

namespace meridian.bewell.impl.Interfaces
{
    public interface IImageByTheme
    {
        long id { get; }
        string ProtoName { get; }
        string title { get; }
        Uri GetItemThemeUri();
        Uri GetImgItemThemeUri();
        Uri GetImgThumbnailItemThemeUri();
    }
}
