namespace meridian.bewell.proto
{
    public partial class entity_fields : IOneToManyAspectProvider, ILookupValue
    {

        public IOneToManyAspect GetOneToManyAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "fieldsets": return new EntityFieldsFieldsetsAspect(this);
            }

            return null;
        }


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