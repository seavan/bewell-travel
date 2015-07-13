using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using bewell.Controllers;
using meridian.bewell.proto;
using meridian.bewell.system;

namespace bewell.Areas.Admin.Controllers
{
    public class IPriceTableAspectController : AspectController<IPriceTable>
    {
        IPriceTableAspectProvider GetModel(string protoName, long id)
        {
            return Meridian.Default.GetAs<IPriceTableAspectProvider>(protoName, id);
        }

        public ActionResult PriceEditList(long id, string protoName, string fieldName)
        {
            if (id <= 0)
            {
                return new JsonResult();
            }
            ViewData["fieldName"] = fieldName;
            var model = GetModel(protoName, id).GetPriceTableAspect(fieldName).GetAllPrices();

            return View(model);
        }

        public void AddPrice(long id, string protoName, string fieldname, byte month, double? price, string comment)
        {
            var model = GetModel(protoName, id).GetPriceTableAspect(fieldname);
            model.AddPrice(price.HasValue ? price.Value : 0, month, comment);
        }
    }
}