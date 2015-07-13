using System.Web.Mvc;
using bewell.Controllers;
using meridian.bewell.proto;
using meridian.bewell.system;

namespace bewell.Areas.Admin.Controllers
{
    public class ISeoMetadataAspectController : AspectController<seo_metadata>
    {
        ISeoMetadataAspectProvider GetModel(string protoName, long id)
        {
            return Meridian.Default.GetAs<ISeoMetadataAspectProvider>(protoName, id);
        }

        public ActionResult SeoMetadataEditList(long id, string protoName, string fieldName)
        {
            if (id <= 0)
            {
                return new JsonResult();
            }
            ViewData["fieldName"] = fieldName;
            var model = GetModel(protoName, id).GetSeoMetadataAspect(fieldName).GetAllMetadata();

            return View(model);
        }

        public void AddSeoMetadata(long id, string protoName, string fieldname, string url, string title, string keywords, string description)
        {
            var model = GetModel(protoName, id).GetSeoMetadataAspect(fieldname);
            model.AddSeoMetadata(url, title, keywords, description);
        }
    }
}