using System;
using System.Reflection;
using System.Web.Mvc;
using admin.db;
using bewell.Controllers;
using log4net;
using meridian.bewell.proto;
using meridian.bewell.system;

namespace bewell.Areas.Admin.Controllers
{
    public class IMapAspectController : AspectController<IGeoLocation>
    {
        [HttpPost]
        public JsonResult Save(string parentProto, long parentId, string field)
        {

            if (Request["useGoogleMap"] != null && Request["mapCoords"]!=null)
            {
                try
                {
                    bool uG = bool.Parse(Request["useGoogleMap"]);
                    Meridian.Default.GetAs<IGeoLocation>(parentProto, parentId).DataUpdate(Request["mapCoords"], uG);
                }
                catch (Exception ex)
                {
                    ILog log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
                    log.Error("Ошибка сохранения координат", ex);
                }
                
            }

            return Json(new object());
        }

        
    }
}