using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using meridian.bewell.proto;
using meridian.bewell.system;
using admin.db;
using CuttingEdge.Conditions;
using bewell.common.Sphinx;

namespace meridian.bewell.impl.Classes
{
    public abstract class BaseEntity : ISphinxExportableEntity
    {
        public abstract string GetTitle();
        public abstract Uri EntityUri();

        public long GetId()
        {
            return CastToEntity().id;
        }

        public string GetObjectType()
        {
            return CastToEntity().ProtoName;
        }

        public FieldSetInfo GetFieldset(string url, bool announce = false)
        {
            return GetFieldset(CastToEntity(), url, announce);
        }

        public MenuLinks GetMenuLinks(string url, string currentUrl)
        {
            return GetMenuLinks(CastToEntity(), url, currentUrl);
        }

        public GalleryPhotos GetPhotos()
        {
            return GetPhotos(CastToEntity(), GetTitle());
        }

        public ICollection<ISphinxSerializable> ExportToSphinx()
        {
            var result = new List<ISphinxSerializable>();
            var entity = CastToEntity();
            var fieldsets = Meridian.Default.fieldsetsStore.LoadFieldsetsForProto(entity.ProtoName);
            foreach (var fieldset in fieldsets)
            {
                var info = BuildFieldSetInfo(fieldset, entity);
                var document = BuildSphinxDocument(entity, info);
                if (document != null)
                    result.Add(document);
            }

            return result;
        }

        public ISphinxDocument GetDocumentById(DocumentId id)
        {
            Condition.Requires(id, "id").IsNotNull();
            Condition.Requires(id.EntityId, "id.EntityId").IsEqualTo(GetId());
            Condition.Requires(id.FieldsetId, "id.FieldsetId").IsNotNull("DocumentId must be compound");

            if (Meridian.Default.fieldsetsStore.Exists(id.FieldsetId.Value))
            {
                var entity = CastToEntity();
                var fieldset = Meridian.Default.fieldsetsStore.Get(id.FieldsetId.Value);
                var info = BuildFieldSetInfo(fieldset, entity);
                if (info != null)
                    return BuildSphinxDocument(entity, info);
            }

            return null;
        }

        public void BuildText(StringBuilder builder)
        {
            var fieldsetInfoCollection = new List<FieldSetInfo>();
            var entity = CastToEntity();
            var fieldsets = Meridian.Default.fieldsetsStore.LoadFieldsetsForProto(entity.ProtoName);
            foreach (var fieldset in fieldsets)
            {
                var info = BuildFieldSetInfo(fieldset, entity);
                if (info != null)
                    fieldsetInfoCollection.Add(info);
            }

            builder.Append(GetTitle().Trim());
            if (GetTitle().Length > 0 && GetTitle().Last() != '.')
            {
                builder.Append(". ");
            }

            foreach (var info in fieldsetInfoCollection)
            {
                info.FormatAsText(builder);
            }
        }

        protected static FieldSetInfo GetFieldset(IDatabaseEntity entity, string url, bool announce = false)
        {
            EnsureEntityNotNull(entity);

            var q = Meridian.Default.fieldsetsStore.All().Where(item => item.proto_name == entity.ProtoName);

            if (announce)
            {
                q = q.Where(item => item.show_in_anounce);
            }

            if (url != null)
            {
                url = url.ToLower();
                q = q.Where(item => item.url.ToLower() == url);
            }

            return BuildFieldSetInfo(q.FirstOrDefault(), entity, announce);
        }

        protected static MenuLinks GetMenuLinks(IDatabaseEntity entity, string baseUrl, string currentUrl)
        {
            EnsureEntityNotNull(entity);

            var result = new MenuLinks
            {
                CurrentUrl = currentUrl
            };

            var fieldsets = Meridian.Default.fieldsetsStore.All()
                .Where(item => item.proto_name == entity.ProtoName && !item.show_in_anounce)
                .OrderBy(item => item.order_number);

            foreach (var fieldset in fieldsets)
            {
                var linkInfo = new LinkInfo
                {
                    Title = fieldset.title,
                    FullUrl = baseUrl + fieldset.url,
                    Url = fieldset.url
                };

                var fields = new List<entity_fields>();
                var fieldsOrder = Meridian.Default.fieldset_fields_orderStore.All()
                    .Where(item => item.fieldset_id == fieldset.id).OrderBy(item => item.order_number)
                    .ToList();
                foreach (var fOrder in fieldsOrder)
                {
                    var item = fieldset.fieldsets_items.Find(f => f.id == fOrder.field_id);
                    if (item != null)
                    {
                        fields.Add(item);
                    }
                }

                foreach (var field in fields)
                {
                    var hasValue = Meridian.Default.field_valuesStore.All()
                            .Any(item => item.proto_name == entity.ProtoName && item.field_id == field.id && item.entity_id == entity.id);

                    if (hasValue || !string.IsNullOrEmpty(field.controller) && !string.IsNullOrEmpty(field.action))
                    {
                        result.Links.Add(linkInfo);
                        break;
                    }
                }
            }

            return result;
        }

        protected static GalleryPhotos GetPhotos(IDatabaseEntity entity, string title)
        {
            EnsureEntityNotNull(entity);

            var result = new GalleryPhotos();
            var mainPhoto =
                Meridian.Default.entity_photosStore.All()
                    .FirstOrDefault(item => item.entity_id == entity.id && item.proto_name == entity.ProtoName && item.is_main);

            if (mainPhoto != null)
                result.Photos.Add(mainPhoto);

            var photos = Meridian.Default.entity_photosStore.All()
                    .Where(item => item.entity_id == entity.id && item.proto_name == entity.ProtoName && !item.is_main)
                    .OrderBy(item => item.order_number);

            result.Photos.AddRange(photos);
            result.Title = title;

            return result;
        }

        private static void EnsureEntityNotNull(IDatabaseEntity entity)
        {
            Condition.Requires(entity, "entity").IsNotNull();
        }

        private static FieldSetInfo BuildFieldSetInfo(fieldsets fieldset, IDatabaseEntity entity, bool announce = false)
        {
            if (fieldset == null)
                return null;

            var result = new FieldSetInfo
            {
                Id = fieldset.id,
                Title = fieldset.title,
                Url = fieldset.url,
                ShowGallery = fieldset.show_gallery,
                ShowMap = fieldset.show_map
            };

            var fields = new List<entity_fields>();
            if (announce)
            {
                fields = Meridian.Default.entity_fieldsStore.All()
                    .Where(item => item.fieldsets_items.Any(f => f.id == fieldset.id))
                    .OrderBy(item => item.announce_order).ToList();
            }
            else
            {
                var fieldsOrders = Meridian.Default.fieldset_fields_orderStore.All()
                    .Where(item => item.fieldset_id == fieldset.id)
                    .OrderBy(item => item.order_number).ToList();
                foreach (var fieldOrder in fieldsOrders)
                {
                    var item = fieldset.fieldsets_items.Find(f => f.id == fieldOrder.field_id);
                    if (item != null)
                    {
                        fields.Add(item);
                    }
                }
            }

            foreach (var field in fields)
            {
                var fieldValue = Meridian.Default.field_valuesStore.All()
                        .FirstOrDefault(item =>
                            item.proto_name == entity.ProtoName && item.field_id == field.id && item.entity_id == entity.id);

                if (fieldValue != null || (!string.IsNullOrEmpty(field.controller) && !string.IsNullOrEmpty(field.action)))
                {
                    result.Fields.Add(new FieldInfo
                    {
                        Title = field.title,
                        Value = fieldValue != null ? fieldValue.field_value : string.Empty,
                        Controller = field.controller,
                        Action = field.action
                    });
                }
            }

            return result;
        }

        private IDatabaseEntity CastToEntity()
        {
            return (IDatabaseEntity)this;
        }

        private DefaultSphinxDocument BuildSphinxDocument(IDatabaseEntity entity, FieldSetInfo info)
        {
            if (entity == null || info == null)
                return null;

            var sb = new StringBuilder(1024);
            info.FormatAsText(sb);
            string body = sb.ToString();

            if (string.IsNullOrWhiteSpace(body))
                return null;

            string title = string.Format("{0} / {1}", GetTitle(), info.Title);
            string url = EntityUri() + info.Url;

            return new DefaultSphinxDocument(new DocumentId(entity.id, info.Id), title, body, url, entity.ProtoName);
        }
    }
}
