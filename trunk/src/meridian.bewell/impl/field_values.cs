namespace meridian.bewell.proto
{
    public partial class field_values : ICategoryItemValue
    {
        private entity_fields GetEntityField()
        {
            return this.GetFieldValuesEntity_field();
        }

        public int GetOrder()
        {
            return GetEntityField() != null ? GetEntityField().announce_order : 0;
        }

        public string GetTitle()
        {
            return GetEntityField() != null ? GetEntityField().title : "n/a";
        }

        public string Value()
        {
            return field_value;
        }


        public long GetEntityId()
        {
            return GetEntityField() != null ? GetEntityField().id : 0;
        }
    }
}