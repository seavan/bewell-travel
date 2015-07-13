using System.Web.Mvc;
using bewell.Models.ViewModels;

namespace bewell.Controllers
{
    public class CountryController : BaseController
    {
        public ActionResult Index(long id, string pageUrl = "")
        {
            var country = meridian.countriesStore.Get(id);

            var model = new EntityViewModel
            {
                Title = country.title,
                FieldSet = country.GetFieldset(pageUrl),
                MenuLinks = country.GetMenuLinks(country.EntityUri().ToString(), pageUrl),
                Photos = country.GetPhotos(),
                Entity = country
            };

            return View(model);
        }


    }
}
