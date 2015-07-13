using System;
using System.Linq;
using System.Web.Mvc;
using admin.db;
using bewell.Models.ViewModels;

namespace bewell.Controllers
{
    public class FieldsController : BaseController
    {
        public PartialViewResult HealthFactors(long id)
        {
            var resort = meridian.resortsStore.Get(id);
            return PartialView("HealthFactors", resort.health_factors_items);
        }

        public PartialViewResult Treatments(long id)
        {
            var hotel = meridian.hotelsStore.Get(id);
            return PartialView("Treatments", hotel.treatment_options_items.Where(item => item.parent_id > 0).ToList());
        }

        public PartialViewResult HotelPrice(long id, string protoName)
        {
            int currentMonth = DateTime.Now.Month;

            //ищем цену за текущий месяц. Если не нашли, то пробуем найти за ближайший предыдущий месяц
            var hotel_price = meridian.pricesStore.All()
                .FirstOrDefault(item => item.entity_id == id && item.proto_name == protoName && item.month == currentMonth) ??
                meridian.pricesStore.All()
                .Where(item => item.entity_id == id && item.proto_name == protoName && item.month < currentMonth)
                .OrderByDescending(item => item.month).FirstOrDefault();

            return hotel_price != null 
                ? PartialView("Price", hotel_price) 
                : null;
        }

        public PartialViewResult Comments(long id, string protoName)
        {
            var entity = meridian.GetAs<IDatabaseEntity>(protoName, id);
            var model = meridian.commentsStore.GetEntitiesReview(id, protoName).ToList();

            int tPage = Extensions.Extensions.CalculatePagesCount(model.Count);
            int cPage = GetPage();
            var comments = Extensions.Extensions.TakePage(model, cPage);

            var model2 = new EntityViewModel
                             {
                                 Entity = entity,
                                 EntityReviews = comments,
                                 Page = cPage,
                                 PagesCount = tPage
                             };

            return PartialView(model2);
        }

        public PartialViewResult HotelDetails(long id)
        {
            var hotel = meridian.hotelsStore.Get(id);
            var propertyIds = hotel.properties_items.Select(item => item.id);

            var model = meridian.property_categoriesStore.All()
                .Where(item => item.Properties.Any(p => propertyIds.Contains(p.id))).OrderBy(item => item.order_number)
                .ToDictionary(item => item.title, item => item.Properties.Where(p => propertyIds.Contains(p.id)));
            
            return PartialView(model);
        }

        public PartialViewResult CureProfiles(long id)
        {
            var model = meridian.resortsStore.Get(id);

            return PartialView(model);
        }

        public PartialViewResult Deseases(long id)
        {
            var hotel = meridian.hotelsStore.Get(id);
            var model = hotel.GetOneToManyAspect("deseases").GetSelectedGroupValues();
            return PartialView(model);
        }

        public PartialViewResult HotelTreatments(long id)
        {
            var hotel = meridian.hotelsStore.Get(id);
            var model = hotel.GetOneToManyAspect("treatment_options").GetSelectedGroupValues();
            return PartialView(model);
        }
    }
}
