using System.Web;
using System.Web.Mvc;
using bewell.Classes;
using bewell.Models.ViewModels;

namespace bewell.Controllers
{
    public class ResortController : BaseController
    {
        public ActionResult Index(long id, string pageUrl = "")
        {
            var resort = meridian.resortsStore.Get(id);

            if (resort.is_published)
            {
                var model = new EntityViewModel
                {
                    Title = resort.title,
                    FieldSet = resort.GetFieldset(pageUrl),
                    MenuLinks = resort.GetMenuLinks(resort.EntityUri().ToString(), pageUrl),
                    Photos = resort.GetPhotos(),
                    Entity = resort,
                    EntityMap = resort,
                    ListImageUrl = Extensions.Extensions.ToAbsoluteUrl(resort.GetListImage())
                };

                var searchModel = new SearchViewModel
                {
                    ResortId = id,
                    SubTerritoryId = resort.territory_id,
                    RootTerritoryId = resort.GetResortsTerritorie() == null ? 0 : resort.GetResortsTerritorie().parent_id
                };

                long terrId = searchModel.RootTerritoryId;
                long rootId = searchModel.RootTerritoryId;
                long subId = searchModel.SubTerritoryId;

                while (terrId > 0)
                {
                    var terr = meridian.territoriesStore.Get(terrId);
                    if (terr.parent_id > 0)
                    {
                        rootId = terr.parent_id;
                        subId = terr.id;
                    }

                    terrId = terr.parent_id;
                }

                searchModel.RootTerritoryId = rootId;
                searchModel.TerritoryId = subId;

                ViewBag.SearchModel = searchModel;

                LastViewEntities.AddItemToLastViewed(resort.ProtoName, resort.id);

                return View(model);
            }

            throw new HttpException(404, "Отель не найден");
        }
    }
}
