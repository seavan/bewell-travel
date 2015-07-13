using System.Web.Mvc;
using bewell.Models.ViewModels;

namespace bewell.Controllers
{
    public class NatureHealsController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult HealthFactor(long id, string pageUrl = "")
        {
            if (!meridian.health_factorsStore.Exists(id))
                return HttpNotFound();

            var healthFactor = meridian.health_factorsStore.Get(id);

            var model = new EntityViewModel
            {
                Title = healthFactor.title,
                FieldSet = healthFactor.GetFieldset(pageUrl),
                MenuLinks = healthFactor.GetMenuLinks(healthFactor.EntityUri().ToString(), pageUrl),
                Photos = healthFactor.GetPhotos(),
                Entity = healthFactor
            };

            return View(model);
        }

        public ActionResult Treatment(long id, string pageUrl = "")
        {
            if (!meridian.treatment_optionsStore.Exists(id))
                return HttpNotFound();

            var treatment = meridian.treatment_optionsStore.Get(id);

            var model = new EntityViewModel
            {
                Title = treatment.title,
                FieldSet = treatment.GetFieldset(pageUrl),
                MenuLinks = treatment.GetMenuLinks(treatment.EntityUri().ToString(), pageUrl),
                Photos = treatment.GetPhotos(),
                Entity = treatment
            };

            return View(model);
        }
    }
}
