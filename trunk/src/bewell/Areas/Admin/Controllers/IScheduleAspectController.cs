using System;
using System.Linq;
using System.Web.Mvc;
using admin.db;
using bewell.Controllers;
using meridian.bewell.proto;
using meridian.bewell.system;

namespace bewell.Areas.Admin.Controllers
{
    /// <summary>
    /// aspect for fixed (combo-written) values list
    /// </summary>
    public class IScheduleAspectController : AspectController<IDatabaseEntity>
    {

        public IScheduleAspectController()
        {

        }

        private IScheduleAspect GetProvider(string parentProto, long parentId, string field)
        {
            return Meridian.Default.GetAs<IScheduleAspectProvider>(parentProto, parentId).GetScheduleAspect(field);
        }

        public ActionResult Edit(string parentProto, long parentId, string field)
        {
            var provider = GetProvider(parentProto, parentId, field);
            return View(provider);
        }

        [HttpPost]
        public JsonResult Save(string parentProto, long parentId, string categoriesProto, string field)
        {
            var provider = GetProvider(parentProto, parentId, field);
            var availableValues = provider.GetAvalablePlaces();
            foreach (var a in availableValues)
            {
                var fname = string.Format("{0}.{1}.all", field, a.id);
                if (Request[fname] != null && !String.IsNullOrEmpty(Request[fname].Trim()))
                {
                    var startDate = DateTime.Now;
                    var daysForward = 14;

                    provider.ClearSchedule(a.id);
                    var val = Request[fname];
                    var items = val.Split(',').Select(s => s.Trim());
                    
                    foreach (var item in items)
                    {
                        var parts = item.Split(':');
                        int hour = 0;
                        int minute = 0;
                        if (parts.Length > 1 && int.TryParse(parts[0], out hour) && int.TryParse(parts[1], out minute))
                        {
                            var cDate = new DateTime(startDate.Year, startDate.Month, startDate.Day, hour, minute, 0);

                            for (int i = 0; i < daysForward; ++i)
                            {
                                provider.SetSchedule(a.id, cDate);
                                cDate = cDate.AddDays(1);
                            }

                                
                        }
                    }
                }
//                else
//                    provider.RemoveValue(a.entityId);
            } 
            return Json(new object());
        }
    }
}