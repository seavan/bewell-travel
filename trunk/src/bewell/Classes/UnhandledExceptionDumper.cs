using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using log4net;
using CuttingEdge.Conditions;
using meridian.bewell.proto;

namespace bewell.Classes
{
    public class UnhandledExceptionDumper
    {
        private ILog log;

        public UnhandledExceptionDumper(ILog log)
        {
            Condition.Requires(log, "log").IsNotNull();

            this.log = log;
        }

        public void Dump(HttpRequest request, Exception exception)
        {
            var principal = GetCurrentPrincipalErrorProne(request);
            string userId = principal != null ? principal.id.ToString() : "None";
            string path = GetCurrentPathErrorProne(request);
            string referrer = GetReferrerErrorProne(request);
            string message = string.Format("Unhandled exception. Path='{0}', Ref='{1}', UserId={2}", path, referrer, userId);

            log.Error(message, exception);
        }

        /// <summary>
        /// Пытаемся получить адрес, на который был запрос. Это возможно далеко не всегда.
        /// </summary>
        private string GetCurrentPathErrorProne(HttpRequest request)
        {
            try
            {
                return request != null ? request.Url.ToString() : string.Empty;
            }
            catch (HttpException)
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Пытаемся получить страницу, с которой пришел пользователь
        /// </summary>
        /// <returns></returns>
        private string GetReferrerErrorProne(HttpRequest request)
        {
            try
            {
                return request != null && request.UrlReferrer != null ? request.UrlReferrer.ToString() : string.Empty;
            }
            catch (HttpException)
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Хотим из последних сил получить текущего пользователя. Если все упало, 
        /// то даже меридиан нам ничего не отдаст, кроме нового исключения
        /// </summary>
        /// <returns>Текущий пользователь или null</returns>
        private accounts GetCurrentPrincipalErrorProne(HttpRequest request)
        {
            try
            {
                // TODO: get current user
                //return request.RequestContext.HttpContext.ZakonPrincipal();
                return null;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}