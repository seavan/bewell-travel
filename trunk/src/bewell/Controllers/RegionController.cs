using System.Web.Mvc;
using bewell.Models.ViewModels;

namespace bewell.Controllers
{
    public class RegionController : BaseController
    {
        public ActionResult Index(long id, string pageUrl = "")
        {
            var region = meridian.regionsStore.Get(id);

            var model = new EntityViewModel
            {
                Title = region.title,
                FieldSet = region.GetFieldset(pageUrl),
                MenuLinks = region.GetMenuLinks(region.EntityUri().ToString(), pageUrl),
                Photos = region.GetPhotos(),
                Entity = region
            };

            return View(model);
        }
    }
}
