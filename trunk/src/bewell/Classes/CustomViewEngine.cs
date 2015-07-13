using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bewell.Classes
{
    public class CustomViewEngine : WebFormViewEngine
    {
        public CustomViewEngine()
        {
            var viewLocations = new[] {  
            "~/Views/{1}/{0}.aspx",  
            "~/Views/{1}/{0}.ascx",  
            "~/Views/Shared/{0}.aspx",  
            "~/Views/Shared/{0}.ascx",  
            "~/Areas/Admin/Views/{1}/{0}.ascx",
            "~/Areas/Admin/Views/{1}/{0}.aspx"
            // etc
        };

            this.PartialViewLocationFormats = viewLocations;
            this.ViewLocationFormats = viewLocations;
        }
    }
}