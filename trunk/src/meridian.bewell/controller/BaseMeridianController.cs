using System.Collections.Generic;
using System.Linq;
using admin.db;
using admin.web.common;
using meridian.bewell.proto;
using meridian.bewell.system;

namespace meridian.bewell.controller
{
    public abstract class BaseMeridianController<T> : BaseUniversalController<T> where T : class, IDatabaseEntity, new() 
    {
        private KeyValuePair<string, string>[] urlsDictionary;

        public override void Prepare(T item)
        {
            var urls = GetSeoUrls(item);

            if (urlsDictionary != null)
            {
                for (var i = 0; i < urlsDictionary.Length; i++)
                {
                    urlsDictionary[i] = new KeyValuePair<string, string>(urlsDictionary[i].Key, urls[i]);
                }

                var seo_metadata = Meridian.Default.seo_metadataStore.All()
                        .Where(seo => seo.entity_id == item.id && seo.proto_name == item.ProtoName).ToList();

                foreach (KeyValuePair<string, string> url in urlsDictionary)
                {
                    var metadata = seo_metadata.FirstOrDefault(seo => seo.url == url.Key);

                    if (metadata != null)
                    {
                        metadata.url = url.Value;
                        Meridian.Default.seo_metadataStore.Update(metadata);
                    }
                }
            }
        }

        public override void PrepareOld(T item)
        {
            var urls = GetSeoUrls(item);

            urlsDictionary = new KeyValuePair<string, string>[urls.Count];
            for (var i = 0; i < urlsDictionary.Length; i++)
            {
                urlsDictionary[i] = new KeyValuePair<string, string>(urls[i], string.Empty);
            }
        }

        private IList<string> GetSeoUrls(T item)
        {
            var aspect = ((ISeoMetadataAspectProvider)item).GetSeoMetadataAspect("seo_dummy");

            return aspect.GetUrls().ToList();
        }
    }
}
