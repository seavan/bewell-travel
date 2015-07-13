using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using bewell.Mappers;
using bewell.Models.ViewModels;
using meridian.bewell.system;

namespace bewell.Classes
{
    public static class LastViewEntities
    {
        private const int EntitiesCount = 4;
        private const string CookiePrefix = "last_";

        public static EntityListViewModel GetLastViewdItems(string protoName)
        {
            var result = new EntityListViewModel();
            HttpCookie cookie = HttpContext.Current.Request.Cookies[CookiePrefix + protoName];
            var ids = new List<long>();

            if (cookie != null)
            {
                ids = cookie.Value.Split(',').Select(item => Convert.ToInt64(item)).ToList();
            }

            switch (protoName)
            {
                case "hotels":
                    var hotels = (from id in ids where Meridian.Default.hotelsStore.Exists(id) select Meridian.Default.hotelsStore.Get(id)).ToList();
                    result = EntityMapper.ToHotelsListViewModel(hotels, 1, EntitiesCount);
                    break;
                case "resorts":
                    var resorts = (from id in ids where Meridian.Default.resortsStore.Exists(id) select Meridian.Default.resortsStore.Get(id)).ToList();
                    result = EntityMapper.ToResortsListViewModel(resorts, 1, EntitiesCount);
                    break;
            }

            return result;
        }

        public static void AddItemToLastViewed(string protoName, long id)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[CookiePrefix + protoName];
            Queue<long> ids;

            if (cookie != null)
            {
                ids = new Queue<long>(cookie.Value.Split(',').Select(item => Convert.ToInt64(item)));
            }
            else
            {
                ids = new Queue<long>();
                cookie = new HttpCookie(CookiePrefix + protoName);
            }

            if (!ids.Contains(id))
            {
                if (ids.Count >= EntitiesCount) ids.Dequeue();
                ids.Enqueue(id);
            }

            cookie.Value = String.Join(",", ids.ToArray());
            cookie.Expires = DateTime.Now.AddDays(365);

            HttpContext.Current.Response.Cookies.Set(cookie);
        }
    }
}