using System.Collections.Generic;
using System.Linq;
using meridian.bewell.system;
using bewell.common.Sphinx;
using CuttingEdge.Conditions;

namespace meridian.bewell.proto
{
	public partial class pages : ILookupValue, ILookupValueAspectProvider, ISeoMetadata, ISeoMetadataAspectProvider, ISphinxExportableEntity
    {
        public int GetLookupValueLevel()
        {
            return 0;
        }

        public bool GetLookupValueDisabled()
        {
            return false;
        }

        public ILookupValueAspect GetLookupValueAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "parent_id":
                    return new LookupAspect("parent_id", this,
                        () =>
                        {
                            var pages = Meridian.Default.pagesStore.All().Where(item => item.parent_id == 0).ToList();
                            IEnumerable<pages> result = GetPages(pages, 0);

                            return result;
                        });
            }

            return null;
        }

        private static IEnumerable<pages> GetPages(IEnumerable<pages> pages, int level)
        {
            var result = new List<pages>();

            var titlePrefix = new string('\xA0', level);

            foreach (var page in pages)
            {
                var listPages = new pages { id = page.id, title = titlePrefix + page.title };

                result.Add(listPages);

                if (page.SubPages.Any())
                {
                    result.AddRange(GetPages(page.SubPages.ToList(), level + 3));
                }
            }

            return result;
        } 

        public string GetPageUrl(bool abs = true, bool full = true)
        {
            long parentId = parent_id;

            var urlPath = new List<string>();

            if (full)
            {
                urlPath.Add(alias);
            }

            while (parentId > 0)
            {
                var page = Meridian.Default.pagesStore.Get(parentId);
                urlPath.Add(page.alias);
                parentId = page.parent_id;
            }

            urlPath.Reverse();

            return string.Format("{0}{1}", abs ? "/" : string.Empty, string.Join("/", urlPath));
        }

        public string PageUrl
        {
            get
            {
                long parentId = parent_id;

                var urlPath = new List<string> { alias };

                while (parentId > 0)
                {
                    var page = Meridian.Default.pagesStore.Get(parentId);
                    urlPath.Add(page.alias);
                    parentId = page.parent_id;
                }

                urlPath.Reverse();

                return string.Format("/{0}", string.Join("/", urlPath));
            }
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

        public string GetEntityUrl()
        {
            return GetPageUrl();
        }

        public ISphinxDocument GetDocumentById(DocumentId id)
        {
            Condition.Requires(id, "id").IsNotNull();
            Condition.Requires(id.EntityId, "id.EntityId").IsEqualTo(this.id);

            return CreateSphinxDocument();
        }

        public ICollection<ISphinxSerializable> ExportToSphinx()
        {
            return new ISphinxSerializable[] 
            { 
                CreateSphinxDocument()
            };
        }

        public string seo_dummy { get; set; }

        private DefaultSphinxDocument CreateSphinxDocument()
        {
            return new DefaultSphinxDocument(new DocumentId(id), title, html, GetEntityUrl(), ProtoName);
        }
    }
}
