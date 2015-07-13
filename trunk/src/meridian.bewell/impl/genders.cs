namespace meridian.bewell.proto
{
    public partial class genders : ILookupValue
    {
        public int GetLookupValueLevel()
        {
            return 0;
        }

        public bool GetLookupValueDisabled()
        {
            return false;
        }
    }
}