using System;
using System.Web;
using System.Web.Mvc;
using bewell.common.Sphinx;
using System.Collections.Generic;
using CuttingEdge.Conditions;

namespace meridian.bewell.proto
{
    public partial class dictionary : ISeoMetadata, ISeoMetadataAspectProvider, ISphinxExportableEntity
    {
        public string EntityName { get { return word.TransliterateAndClear(); } }
        
        public string GetEntityUrl()
        {
            if (string.IsNullOrEmpty(word))
            {
                return string.Empty;
            }

            string url = new UrlHelper(HttpContext.Current.Request.RequestContext).RouteUrl("Dictionary",
                new
                {
                    letter = word.ToLower()[0], 
                    id, 
                    entryName = EntityName
                });
            return HttpUtility.UrlDecode(url);
        }

        public ISeoMetadataAspect GetSeoMetadataAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "seo_dummy":
                    return new EntitySeoMetadataAspect("seo_dummy", this);
            }

            return null;
        }

        public string seo_dummy { get; set; }

        public ICollection<ISphinxSerializable> ExportToSphinx()
        {
            return new ISphinxSerializable[]
            {
                CreateSphinxDocument()
            };
        }

        private DefaultSphinxDocument CreateSphinxDocument()
        {
            return new DefaultSphinxDocument(new DocumentId(id), word, explanation, GetEntityUrl(), ProtoName);
        }

        public ISphinxDocument GetDocumentById(DocumentId docId)
        {
            Condition.Requires(docId, "id").IsNotNull();
            Condition.Requires(docId.EntityId, "id.EntityId").IsEqualTo(id);

            return CreateSphinxDocument();
        }
    }
}
