using System.Web.Helpers;
using System.Web.Mvc;
using admin.db;
using bewell.Controllers;
using meridian.bewell.proto;
using meridian.bewell.system;
using System.Linq;

namespace bewell.Areas.Admin.Controllers
{
    /// <summary>
    /// aspect for fixed (combo-written) values list
    /// </summary>
    public class IFieldsetAspectController : AspectController<ILookupValue>
    {

        public IFieldsetAspectController()
        {
            
        }

        private IFieldsetAspect GetProvider(string parentProto, long parentId, string field)
        {
            return Meridian.Default.GetAs<IFieldsetAspectProvider>(parentProto, parentId).GetFieldsetAspect(field);
        }
           
        public ActionResult Edit(string parentProto, long parentId, string field)
        {
            var provider = GetProvider(parentProto, parentId, field);
            return View(provider);
        }

        [HttpPost]
        [ValidateInput(false)]
        public JsonResult Save(string parentProto, long parentId, string categoriesProto, string field)
        {
            var provider = GetProvider(parentProto, parentId, field);
            var allValues = provider.GetCategories().SelectMany(s => s.GetAvailableValues());
            foreach (var cat in allValues)
            {
                var fname = string.Format("{0}.value.{1}", field, cat.id);

                if (Request[fname] != null)
                {
                    var val = Request[fname];
                    if (!string.IsNullOrEmpty(val))
                        provider.SetValue(cat.id, val);
                    else
                        provider.RemoveValue(cat.id);
                }                    
            }
            //var parent = GetProvider();
            //parent.Get() 
            return Json(new object());
        }
    }
}