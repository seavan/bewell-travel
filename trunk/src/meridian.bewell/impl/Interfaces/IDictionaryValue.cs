namespace meridian.bewell.proto
{
    public interface IDictionaryValue
    {
        long id { get; }
        IDictionaryCategory Category { get; set; }
        string Value { get; set; }
        long ValueId { get; set; }
    }
}