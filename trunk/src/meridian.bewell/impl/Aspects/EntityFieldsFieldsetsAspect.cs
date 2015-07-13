using System.Linq;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class EntityFieldsFieldsetsAspect : OneToManyAspect<fieldsets>
    {
        public EntityFieldsFieldsetsAspect(entity_fields parent)
            : base(parent,
                   "fieldsets",
                   () => { return Meridian.Default.fieldsetsStore.All().OrderBy(s => s.title).ToArray(); },
                   () => { return parent.fieldsets_items; },
                   parent.add_fieldsets_item,
                   parent.remove_fieldsets_item
                )
        {
            
        }

    }
}