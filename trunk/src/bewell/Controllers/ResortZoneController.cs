using System.Web.Mvc;
using bewell.Models.ViewModels;

namespace bewell.Controllers
{
    public class ResortZoneController : BaseController
    {
        public ActionResult Index(long id, string pageUrl = "")
        {
            var resortZone = meridian.resort_zonesStore.Get(id);

            var model = new EntityViewModel
            {
                Title = resortZone.title,
                FieldSet = resortZone.GetFieldset(pageUrl),
                MenuLinks = resortZone.GetMenuLinks(resortZone.EntityUri().ToString(), pageUrl),
                Photos = resortZone.GetPhotos(),
                Entity = resortZone
            };

            return View(model);
        }

    }
}
