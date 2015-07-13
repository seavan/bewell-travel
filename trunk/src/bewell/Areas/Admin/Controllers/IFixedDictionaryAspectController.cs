using System.Web.Mvc;
using bewell.Controllers;
using meridian.bewell.proto;
using meridian.bewell.system;

namespace bewell.Areas.Admin.Controllers
{
    /// <summary>
    /// aspect for fixed (combo-written) values list
    /// </summary>
    public class IFixedDictionaryAspectController : AspectController<IDictionaryValue>
    {

        public IFixedDictionaryAspectController()
        {
            
        }

        private IDictionaryValuesAspect GetProvider(string parentProto, long parentId, string field)
        {
            return Meridian.Default.GetAs<IDictionaryValuesAspectProvider>(parentProto, parentId).GetDictionaryValuesAspect(field);
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
            var allCats = provider.GetCategories();
            foreach (var cat in allCats)
            {
                if (cat.MultiValue)
                {
                    var availableValues = cat.GetAllValues();

                    foreach (var a in availableValues)
                    {
                        var fname = string.Format("{0}.{1}.value.{2}", field, cat.id, a.ValueId);
                        if (Request[fname] != null)
                        {
                            provider.SetValue(cat.id, a.ValueId);
                        }
                        else
                            provider.RemoveValue(cat.id, a.ValueId);

                    }
                }
                else
                {
                    var fname = string.Format("{0}.{1}.value", field, cat.id);
                    if (Request[fname] != null)
                    {
                        var val = long.Parse(Request[fname]);
                        if (val != 0)
                            provider.SetValue(cat.id, val);
                        else
                            provider.RemoveValue(cat.id);
                    }                    
                }

            }
            //var parent = GetProvider();
            //parent.Get()
            return Json(new object());
        }
    }
}