using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Routing;
using SNA;
using SNA.Classes;
using admin.web.common;

using bewell.Classes;
using bewell.common.Infrastructure;
using bewell.Infrastructure;

using log4net.Config;

using meridian.bewell.system;

using Microsoft.Practices.Unity;
using Microsoft.Practices.Unity.Configuration;
using bewell.Models.ModelValidators.Attributes;
using bewell.Models.ModelValidators;
using bewell.Services;
using System;
using System.Web;
using log4net;
using System.Reflection;
using meridian.core;

namespace bewell
{
    public class MvcApplication : HttpApplication
    {
        private static readonly ILog logger = LogManager.GetLogger(MethodInfo.GetCurrentMethod().DeclaringType);

        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("favicon.ico");
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "static", "{*url}", new { controller = "Home", action = "Static" }, new { isStatic = new StaticRouteConstraint() }
            );

            routes.MapRoute(
                "ResortOne", // Route name
                "resort/{id}/{entryName}/{pageUrl}", // URL with parameters
                new { controller = "Resort", action = "Index", id = UrlParameter.Optional, pageUrl = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "HotelOne", // Route name
                "hotel/{id}/{entryName}/{pageUrl}", // URL with parameters
                new { controller = "Hotel", action = "Index", id = UrlParameter.Optional, pageUrl = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "CountrylOne", // Route name
                "country/{id}/{entryName}/{pageUrl}", // URL with parameters
                new { controller = "Country", action = "Index", id = UrlParameter.Optional, pageUrl = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "RegionlOne", // Route name
                "region/{id}/{entryName}/{pageUrl}", // URL with parameters
                new { controller = "Region", action = "Index", id = UrlParameter.Optional, pageUrl = UrlParameter.Optional } // Parameter defaults
            );
            routes.MapRoute(
                "ResortZonelOne", // Route name
                "resortzone/{id}/{entryName}/{pageUrl}", // URL with parameters
                new { controller = "ResortZone", action = "Index", id = UrlParameter.Optional, pageUrl = UrlParameter.Optional } // Parameter defaults
            );
            routes.MapRoute(
                "HealthFactorlOne", // Route name
                "natureheals/healthfactor/{id}/{entryName}/{pageUrl}", // URL with parameters
                new { controller = "NatureHeals", action = "HealthFactor", id = UrlParameter.Optional, pageUrl = UrlParameter.Optional } // Parameter defaults
            );
            routes.MapRoute(
                "TreatmentOptionOne", // Route name
                "natureheals/treatment/{id}/{entryName}/{pageUrl}", // URL with parameters
                new { controller = "NatureHeals", action = "Treatment", id = UrlParameter.Optional, pageUrl = UrlParameter.Optional } // Parameter defaults
            );
            routes.MapRoute(
                "CureProfileOne", // Route name
                "treatments/cureprofile/{id}/{entryName}/{pageUrl}", // URL with parameters
                new { controller = "Treatments", action = "CureProfile", id = UrlParameter.Optional, pageUrl = UrlParameter.Optional } // Parameter defaults
            );
            routes.MapRoute(
                "DeseaseOne", // Route name
                "treatments/desease/{id}/{entryName}/{pageUrl}", // URL with parameters
                new { controller = "Treatments", action = "Desease", id = UrlParameter.Optional, pageUrl = UrlParameter.Optional } // Parameter defaults
            );
            routes.MapRoute(
                "Dictionary", // Route name
                "dictionary/{letter}/{id}/{entryName}", // URL with parameters
                new { controller = "Dictionary", action = "Index", letter = UrlParameter.Optional, id = UrlParameter.Optional, entryName = UrlParameter.Optional } // Parameter defaults
            );
            routes.MapRoute(
                "News", // Route name
                "news/{id}/{entryName}", // URL with parameters
                new { controller = "News", action = "Index", id = UrlParameter.Optional, entryName = UrlParameter.Optional } // Parameter defaults
            );
            routes.MapRoute(
                "NewsOne", // Route name
                "news/one/{id}/{entryName}", // URL with parameters
                new { controller = "News", action = "One", id = UrlParameter.Optional } // Parameter defaults
            );

            /*Роутинг для SNA авторизации*/
            routes.MapRoute(
               "SNAuth", // Route name
               "SNA/SNASignIn/{_serviceName}", // URL with parameters
               new
               {
                   controller = "Security",
                   action = "SNASignIn",
                   _serviceName = UrlParameter.Optional
               } // Parameter defaults
           );
            routes.MapRoute(
               "SNAuthForm", // Route name
               "SNA/SNAGetEmailForm", // URL with parameters
               new
               {
                   controller = "Security",
                   action = "SNAGetEmailForm",
                   _serviceName = UrlParameter.Optional
               } // Parameter defaults
           );

            routes.MapRoute(
                "Sitemap", // Route name
                "sitemap.xml", // URL with parameters
                new { controller = "Home", action = "Sitemap" } // Parameter defaults
            );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );
        }

        protected void Application_Start()
        {
            XmlConfigurator.Configure();
            logger.Debug("Application start initiated");
            Tracer.I.Debug("Meridian tracer initiated");


            AreaRegistration.RegisterAllAreas();

            var connstring = WebConfigurationManager.ConnectionStrings["default"].ConnectionString;
            MeridianMonitor.Default.Init(connstring, WebConfigurationManager.AppSettings["SphinxHost"], int.Parse(WebConfigurationManager.AppSettings["SphinxPort"]));
            Meridian.Default.Init(connstring);

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);

            ViewEngines.Engines.Clear();
            ViewEngines.Engines.Add(new CustomViewEngine());

            ModelMetadataProviders.Current = new CustomMetadataProvider();
            RegisterValidators();
            LoadServiceLocator();
            LoadSNAService();
            logger.Debug("Application start complete");
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            var dumper = new UnhandledExceptionDumper(logger);
            dumper.Dump(Request, Server.GetLastError());
        }

        private static void LoadServiceLocator()
        {
            IUnityContainer container = new UnityContainer();
            container.LoadConfiguration();

            var serviceLocator = new UnityBackedServiceLocator(container);
            ServiceLocator.Initialize(serviceLocator);
        }

        protected void RegisterValidators()
        {
            DataAnnotationsModelValidatorProvider
                .RegisterAdapter(typeof(EqualityAttribute), typeof(EqualityValidator));
            DataAnnotationsModelValidatorProvider
                .RegisterAdapter(typeof(NeedOneAttribute), typeof(NeedOneValidator));
            DataAnnotationsModelValidatorProvider
                .RegisterAdapter(typeof(UniqueEMailAttribute), typeof(UniqueEMailValidator));
            DataAnnotationsModelValidatorProvider
                .RegisterAdapter(typeof(EMailAttribute), typeof(EMailValidator));
            DataAnnotationsModelValidatorProvider
                .RegisterAdapter(typeof(CaptchaAttribute), typeof(CaptchaValidator));
        }

        private static void LoadSNAService()
        {
            SNASecurityService.SetSNAService(SNAServiceName.facebook);
            SNASecurityService.SetSNAService(SNAServiceName.vkontakte);
            SNASecurityService.SetSNAService(SNAServiceName.googleplus);
            SNASecurityService.SetSNAService(SNAServiceName.odnoklassniki);

            SNASecurityService.SNASignInEvent += new SNASignInDelegate(SecurityService.SNASignIn);
            SNASecurityService.RegisterUserEvent += new RegisterUserDelegate(SecurityService.RegisterSNAAccount);
            SNASecurityService.HasEmailInDBEvent += new HasEmailInDBDelegate(SecurityService.HasAccountByEmail);
            SNASecurityService.UpdateSNAuthAccountEvent += new UpdateSNAuthAccountDelegate(SecurityService.UpdateSNAAccount);
            SNASecurityService.GetSNAccountEvent += new GetSNAccountDelegate(SecurityService.GetSNAccount);
        }
    }
}