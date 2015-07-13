using System.Collections.Generic;
using admin.db;

namespace meridian.bewell.proto
{
    public interface ISeoMetadataAspect
    {
        long id { get; }
        string ProtoName { get; }
        string FieldName { get; }

        IDatabaseEntity GetParent();

        IEnumerable<seo_metadata> GetAllMetadata();

        IEnumerable<string> GetUrls(); 

        void AddSeoMetadata(string url, string title, string keywords, string description);

        void RemoveSeoMetadata(long id);
    }
}
