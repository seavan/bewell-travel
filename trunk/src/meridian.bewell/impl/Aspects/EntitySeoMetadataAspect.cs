using System.Collections.Generic;
using System.Linq;
using admin.db;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class EntitySeoMetadataAspect : ISeoMetadataAspect
    {
        public EntitySeoMetadataAspect(string fieldName, IDatabaseEntity parent)
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

        public IDatabaseEntity GetParent()
        {
            return m_Parent;
        }

        public IEnumerable<seo_metadata> GetAllMetadata()
        {
            return Meridian.Default.seo_metadataStore.All()
                    .Where(item => item.proto_name == m_Parent.ProtoName && item.entity_id == m_Parent.id);
        }

        public IEnumerable<string> GetUrls()
        {
            var entityUrl = ((ISeoMetadata) m_Parent).GetEntityUrl().TrimEnd(new []{'/'});

            var result = new List<string> { entityUrl };

            var fieldsets = Meridian.Default.fieldsetsStore.All()
                            .Where(item => item.proto_name == m_Parent.ProtoName && !string.IsNullOrEmpty(item.url)).OrderBy(item => item.id).ToList();

            result.AddRange(fieldsets.Select(fieldset => string.Format("{0}/{1}", entityUrl,fieldset.url)));

            return result;
        }

        public void AddSeoMetadata(string url, string title, string keywords, string description)
        {
            var metadata = Meridian.Default.seo_metadataStore.All().FirstOrDefault(item
                => item.proto_name == m_Parent.ProtoName && item.entity_id == m_Parent.id
                && item.url == url) ?? new seo_metadata();

            metadata.entity_id = m_Parent.id;
            metadata.proto_name = m_Parent.ProtoName;
            metadata.url = url;
            metadata.title = title;
            metadata.keywords = keywords;
            metadata.description = description;

            Meridian.Default.seo_metadataStore.Persist(metadata);
        }

        public void RemoveSeoMetadata(long entityId)
        {
            Meridian.Default.seo_metadataStore.DeleteById(entityId);
        }

        public long id { get { return m_Parent.id; } }

        public string ProtoName { get { return m_Parent.ProtoName; } }
    }
}
