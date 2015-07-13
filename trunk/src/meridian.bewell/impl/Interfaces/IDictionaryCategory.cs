using System.Collections.Generic;

namespace meridian.bewell.proto
{
    public interface IDictionaryCategory
    {
        long id { get; }
        string title { get; set; }
        bool MultiValue { get; }
        bool FreeValue { get; }
        IEnumerable<IDictionaryValue> GetAllValues();
    }
}