using admin.db;

namespace meridian.bewell.proto
{
    public interface IPriceTable
    {
        long id { get; }
        double Price { get; }
        string Comment { get; }
        string Month { get; }
        string ProtoName { get; }
        IDatabaseEntity EntityContainer { get; }
    }
}
