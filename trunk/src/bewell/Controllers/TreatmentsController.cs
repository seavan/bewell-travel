using System.Web.Mvc;
using bewell.Models.ViewModels;

namespace bewell.Controllers
{
    public class TreatmentsController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CureProfile(long id, string pageUrl = "")
        {
            var cureProfile = meridian.cure_profilesStore.Get(id);

            var model = new EntityViewModel
            {
                Title = cureProfile.title,
                FieldSet = cureProfile.GetFieldset(pageUrl),
                MenuLinks = cureProfile.GetMenuLinks(cureProfile.EntityUri().ToString(), pageUrl),
                Photos = cureProfile.GetPhotos(),
                Entity = cureProfile
            };

            return View(model);
        }

        public ActionResult Desease(long id, string pageUrl = "")
        {
            var desease = meridian.deseasesStore.Get(id);

            var model = new EntityViewModel
            {
                Title = desease.title,
                FieldSet = desease.GetFieldset(pageUrl),
                MenuLinks = desease.GetMenuLinks(desease.EntityUri().ToString(), pageUrl),
                Photos = desease.GetPhotos(),
                Entity = desease
            };

            ViewBag.CureProfileId = desease.CureProfile.id;

            return View(model);
        }
    }
}
