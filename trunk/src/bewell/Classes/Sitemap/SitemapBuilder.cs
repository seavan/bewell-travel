using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meridian.bewell.impl.Classes;
using meridian.bewell.system;

namespace bewell.Classes.Sitemap
{
    public static class SitemapBuilder
    {
        public static List<SitemapItem> GetSitemap()
        {
            var meridian = Meridian.Default;

            //статика
            var pages = meridian.pagesStore.All();

            List<SitemapItem> result = pages.Select(page => new SitemapItem
            {
                Url = GetUrl(page.GetPageUrl()),
                LastModified = page.publish_date
            }).ToList();

            //сущности, реализующие BaseEntity
            result.AddRange(GetEntitySitemapItems(meridian.hotelsStore.All()));
            result.AddRange(GetEntitySitemapItems(meridian.resortsStore.All()));
            result.AddRange(GetEntitySitemapItems(meridian.countriesStore.All()));
            result.AddRange(GetEntitySitemapItems(meridian.regionsStore.All()));
            result.AddRange(GetEntitySitemapItems(meridian.resort_zonesStore.All()));
            result.AddRange(GetEntitySitemapItems(meridian.cure_profilesStore.All()));
            result.AddRange(GetEntitySitemapItems(meridian.deseasesStore.All()));
            result.AddRange(GetEntitySitemapItems(meridian.treatment_optionsStore.All()));
            result.AddRange(GetEntitySitemapItems(meridian.health_factorsStore.All()));

            //новости
            var news = meridian.newsStore.All();
            result.AddRange(news.Select(item => new SitemapItem
            {
                Url = GetUrl(item.GetEntityUrl())
            }));

            //курортный словарь
            var dictionary = meridian.dictionaryStore.All();
            result.AddRange(dictionary.Select(word => new SitemapItem
            {
                Url = GetUrl(word.GetEntityUrl())
            }));

            //остальные страницы
            var urls = new List<string>
            {
                "/treatments",
                "/natureheals",
                "/home/cureprofiles",
                "/home/resortsearch",
                "/home/hotelsearch",
                "/home/sphinxsearch"
            };

            result.AddRange(GetUrlsSitemapItems(urls));

            return result;
        }

        private static string GetUrl(string url)
        {
            return GetHostUrl(HttpContext.Current.Request.Url) + url;
        }

        private static string GetHostUrl(Uri url)
        {
            return string.Format("{0}://{1}{2}", url.Scheme, url.Host, url.IsDefaultPort ? string.Empty : ":" + url.Port);
        }

        private static IEnumerable<SitemapItem> GetEntitySitemapItems(IEnumerable<BaseEntity> entities)
        {
            var result = new List<SitemapItem>();

            foreach (var entity in entities)
            {
                var links = entity.GetMenuLinks(entity.EntityUri().ToString(), string.Empty);
                result.AddRange(links.Links.Select(link => new SitemapItem
                {
                    Url = GetUrl(link.FullUrl)
                }));
            }

            return result;
        }

        private static IEnumerable<SitemapItem> GetUrlsSitemapItems(IEnumerable<string> urls)
        {
            var result = new List<SitemapItem>();

            result.AddRange(urls.Select(item => new SitemapItem
            {
                Url = GetUrl(item)
            }));

            return result;
        }
    }
}