using System.Collections.Generic;
using System.Linq;
using admin.db;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class EntityFieldsetAspect : IFieldsetAspect
    {
        public EntityFieldsetAspect(string fieldName, IDatabaseEntity parent)
        {
            m_FieldName = fieldName;
            m_Parent = parent;
        }
        public string m_FieldName;
        public IDatabaseEntity m_Parent;

        public string FieldName
        {
            get { return m_FieldName; }
        }

        public IEnumerable<ICategory> GetCategories()
        {
            var fieldSets = Meridian.Default.fieldsetsStore.All().Where(s => s.proto_name == m_Parent.ProtoName && !s.show_in_anounce && s.fieldsets_items.Any(item => string.IsNullOrEmpty(item.controller) && string.IsNullOrEmpty(item.action)));
            return fieldSets.Select(s => new FieldsetMediator(m_Parent, s));
        }

        public void SetValue(long fieldId, string value)
        {
            var entityVal = Meridian.Default.field_valuesStore.All().FirstOrDefault(s 
                => s.proto_name == m_Parent.ProtoName && s.entity_id == m_Parent.id
                && s.field_id == fieldId);

            if (entityVal == null)
            {
                entityVal = new field_values
                    {
                        proto_name = m_Parent.ProtoName,
                        field_id = fieldId,
                        entity_id = m_Parent.id,
                    };

                Meridian.Default.field_valuesStore.Insert(entityVal);
            }

            entityVal.field_value = value;

            Meridian.Default.field_valuesStore.Update(entityVal);
        }

        public void RemoveValue(long fieldId)
        {
            var entityVal = Meridian.Default.field_valuesStore.All().Where(s
    => s.proto_name == m_Parent.ProtoName && s.entity_id == m_Parent.id
    && s.field_id == fieldId).ToArray();

            foreach (var e in entityVal)
            {
                Meridian.Default.field_valuesStore.Delete(e);
            }
        }

        public IDatabaseEntity GetParent()
        {
            return m_Parent;
        }
    }
}
