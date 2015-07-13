using admin.db;

namespace meridian.bewell.proto
{
    public interface IAttachedPhoto
    {
        long id { get; }
        string ThumbUrl { get; }
        string FullUrl { get; }
        bool IsMain { get; set; }
        string ProtoName { get; }
        IDatabaseEntity AttachedPhotoContainer { get; }
    }
}