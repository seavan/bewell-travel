using System.Linq;
using admin.db;

namespace meridian.bewell.proto
{
    public partial class fieldsets : ILookupValue
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


    public class FieldsetMediator : ICategory
    {
        public FieldsetMediator(IDatabaseEntity parent, fieldsets fieldSet)
        {
            m_Parent = parent;
            m_Fieldsets = fieldSet;
        }

        private IDatabaseEntity m_Parent;
        private fieldsets m_Fieldsets;

        public System.Collections.Generic.IEnumerable<ICategoryItemValue> GetValues()
        {
            return
                m_Fieldsets.fieldsets_items.SelectMany(s => s.FieldValues)
                           .Where(a => a.entity_id == m_Parent.id && a.proto_name == m_Parent.ProtoName)
                           .ToArray();
        }

        public long id
        {
            get { return m_Parent.id; }
        }

        public string title
        {
            get { return m_Fieldsets.title; }
        }

        public int GetLookupValueLevel()
        {
            return 0;
        }

        public bool GetLookupValueDisabled()
        {
            return false;
        }

        public System.Collections.Generic.IEnumerable<ILookupValue> GetAvailableValues()
        {
            return m_Fieldsets.fieldsets_items.Where(item => string.IsNullOrEmpty(item.controller) && string.IsNullOrEmpty(item.action));
        }
    }
}