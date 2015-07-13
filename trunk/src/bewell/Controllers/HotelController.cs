using System.Web;
using System.Web.Mvc;
using bewell.Classes;
using bewell.Models.ViewModels;

namespace bewell.Controllers
{
    public class HotelController : BaseController
    {
        private const string HotelNotFoundMessage = "Отель не найден";

        public ActionResult Index(long id, string pageUrl = "")
        {
            if (!meridian.hotelsStore.Exists(id))
                return HttpNotFound(HotelNotFoundMessage);

            var hotel = meridian.hotelsStore.Get(id);
            if (!hotel.is_published)
                return HttpNotFound(HotelNotFoundMessage);

            var model = new EntityViewModel
            {
                Title = hotel.title,
                FieldSet = hotel.GetFieldset(pageUrl),
                MenuLinks = hotel.GetMenuLinks(hotel.EntityUri().ToString(), pageUrl),
                Photos = hotel.GetPhotos(),
                Entity = hotel,
                EntityMap = hotel,
                ListImageUrl = Extensions.Extensions.ToAbsoluteUrl(hotel.GetListImage())
            };

            LastViewEntities.AddItemToLastViewed(hotel.ProtoName, hotel.id);

            return View(model);
        }
    }
}
