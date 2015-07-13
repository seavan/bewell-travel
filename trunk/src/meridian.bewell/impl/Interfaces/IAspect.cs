using admin.db;

namespace meridian.bewell.proto
{
    public interface IAspect
    {
        string FieldName { get; set; }
        IDatabaseEntity GetParent();
    }
}