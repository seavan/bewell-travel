namespace meridian.bewell.proto
{
    public interface IValueListItem
    {
        long id { get; }
        string Value { get; set; }
        bool IsUsed { get;  }
    }
}