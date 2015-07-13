using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using bewell.common;

namespace bewell.Extensions
{
    public static class Extensions
    {
        public static string GetHost(bool _port = false)
        {
            var hname = HttpContext.Current.Request.ServerVariables["HTTP_HOST"];

            var cnt = hname.Count(c => c == '.');

            while (cnt > 1)
            {
                var ii = hname.IndexOf('.');
                hname = hname.Remove(0, ii + 1);
                cnt--;
            }

            var colon = hname.IndexOf(':');
            if (colon != -1)
            {
                hname = hname.Remove(colon, hname.Length - colon);
            }
            var uhname = HttpContext.Current.Request["SERVER_PORT"];
            var port = 80;
            int.TryParse(uhname, out port);
            if ((port != 80) && _port)
            {
                hname += ":" + port;
            }

            return hname;
        }

        public static string ToAbsoluteUrl(string relativeUrl)
        {
            if (string.IsNullOrEmpty(relativeUrl))
                return relativeUrl;

            if (HttpContext.Current == null)
                return relativeUrl;

            if (relativeUrl.StartsWith("/"))
                relativeUrl = relativeUrl.Insert(0, "~");
            if (!relativeUrl.StartsWith("~/"))
                relativeUrl = relativeUrl.Insert(0, "~/");

            var url = HttpContext.Current.Request.Url;
            var port = url.Port != 80 ? (":" + url.Port) : String.Empty;

            return String.Format("{0}://{1}{2}{3}",
                url.Scheme, url.Host, port, VirtualPathUtility.ToAbsolute(relativeUrl));
        }

        public const string RussianCultureName = "ru-RU";

        public static CultureInfo GetRussianCulture()
        {
            return CultureInfo.GetCultureInfo("ru-RU");
        }

        public static string ToListShortDate(this DateTime dt)
        {
            if (dt.Year == DateTime.Now.Year)
                return dt.ToString("dd.MM", GetRussianCulture());

            return dt.ToString("dd.MM.yyyy", GetRussianCulture());
        }

        public static string ToCommentDate(this DateTime dt)
        {
            return dt.ToString("dd MMMM yyyy", GetRussianCulture());
        }


        public static IEnumerable<T> TakePage<T>(IEnumerable<T> collection, int page, int pageSize = Constants.PageSize)
        {
            return collection.Skip((page - 1) * pageSize).Take(pageSize);
        }

        public static int CalculatePagesCount(long recordsCount, int pageSize = Constants.PageSize)
        {
            return (int)(recordsCount / pageSize) + (recordsCount % pageSize > 0 ? 1 : 0);
        }
    }
}