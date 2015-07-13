using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using bewell.Classes;
using bewell.Classes.Sitemap;
using bewell.common;
using bewell.Mappers;
using bewell.Models;
using bewell.Models.ViewModels;
using bewell.Models.ViewModels.Mail;
using meridian.bewell.proto;
using meridian.bewell.system;
using meridian.core;
using bewell.common.Sphinx;
using Sphinx.Client.Commands.BuildExcerpts;
using Sphinx.Client.Commands.Search;
using Sphinx.Client.Connections;

namespace bewell.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Header()
        {
            return PartialView();
        }
        
        public ActionResult Slider()
        {
            return PartialView();
        }
        
        public ActionResult Footer()
        {
            return PartialView();
        }

        public ActionResult Recomended()
        {
            var model = meridian.hotelsStore.All().Where(item => item.is_recomended_main_page && item.is_published).Take(4).ToList();
            return View(model);
        }

        public ActionResult RecomendedList(string protoName, long id, int count = 4)
        {
            var model = new EntityListViewModel();

            switch (protoName)
            {
                case "health_factors":
                    var resorts = meridian.resortsStore.All()
                            .Where(item => item.health_factors_items.Select(h => h.id).Contains(id) && item.is_recomended && item.is_published)
                            .ToList();
                    model = EntityMapper.ToResortsListViewModel(resorts, 1, count);
                    ViewBag.ShowAll = Url.Action("resortsearch", "home", new {HealthFactorId = id});
                    break;
                case "cure_profiles":
                    resorts = meridian.resortsStore.All()
                            .Where(item => item.cure_profiles_items.Select(h => h.id).Contains(id) && item.is_recomended && item.is_published)
                            .ToList();
                    model = EntityMapper.ToResortsListViewModel(resorts, 1, count);
                    ViewBag.ShowAll = Url.Action("resortsearch", "home", new {CureProfileId = id});
                    break;
                case "deseases":
                    var hotels = meridian.hotelsStore.All()
                            .Where(item => item.deseases_items.Select(h => h.id).Contains(id) && item.is_recomended && item.is_published)
                            .ToList();
                    model = EntityMapper.ToHotelsListViewModel(hotels, 1, count);
                    ViewBag.ShowAll = Url.Action("hotelsearch", "home", new { DeseaseId = id });
                    break;
                case "treatment_options":
                    hotels = meridian.hotelsStore.All()
                            .Where(item => item.treatment_options_items.Select(h => h.id).Contains(id) && item.is_recomended && item.is_published)
                            .ToList();
                    model = EntityMapper.ToHotelsListViewModel(hotels, 1, count);
                    ViewBag.ShowAll = Url.Action("hotelsearch", "home", new { TreatmentId = id });
                    break;
            }

            return View(model);
        }

        public ActionResult LastViewedList(string protoName)
        {
            var model = LastViewEntities.GetLastViewdItems(protoName);
            return View(model);
        }

        public ActionResult Consultant()
        {
            return View();
        }

        public ActionResult SitemapMenu()
        {
            var model = new SiteMapMenuViewModel
            {
                HealthFactors = GetHealthFactorsList(),
                TreatmentOptions = GetTreatmentOptionsList()
            };

            return View(model);
        }

        public ActionResult WhatsNew()
        {
            var model = meridian.newsStore.All()
                    .Where(item => item.is_published)
                    .OrderByDescending(item => item.publish_date)
                    .Take(3).ToList();

            ViewBag.Count = meridian.newsStore.All().Count;

            return View(model);
        }

        public ActionResult Faq()
        {
            var model = meridian.questionsStore.All().Where(item => !string.IsNullOrEmpty(item.reply_text))
                .OrderByDescending(item => item.ask_date).Take(5);
            ViewBag.Count = meridian.questionsStore.All().Count;

            return View(model);
        }

        public ActionResult Quote()
        {
            var citation = meridian.citationsStore.GetRandom();

            QuoteViewModel model = null;
            if (citation != null)
            {
                model = new QuoteViewModel
                {
                    Author = citation.author,
                    ImageName = citation.picture,
                    Text = citation.text,
                };
            }
            return View(model);
        }

        public ActionResult Search(long cureProfileId = 0, long territoryId = 0)
        {
            var model = new ResortSearchViewModel
                {
                    CureProfiles = meridian.cure_profilesStore.All().SortByDefault().ToList(),
                    Territories = meridian.territoriesStore.
                        GetRootTerritories()
                        .Where(item => item.in_search && item.SubTerritories.Any())
                        .SortByDefault()
                        .ToList(),
                    CureProfileId = cureProfileId,
                    TerritoryId = territoryId
                };

            return View(model);
        }

        public ActionResult CureProfiles(SearchViewModel model)
        {
            return View(model);
        }

        public ActionResult ResortSearch(SearchViewModel model)
        {
            if (model.DeseaseId > 0)
            {
                var desease = meridian.deseasesStore.Get(model.DeseaseId);
                
                if (desease.CureProfile != null)
                {
                    model.CureProfileId = desease.CureProfile.id;
                }
            }

            if (model.AdditionalDeseaseId > 0)
            {
                var desease = meridian.deseasesStore.Get(model.AdditionalDeseaseId);

                if (desease.CureProfile != null)
                {
                    model.AdditionalCureProfileId = desease.CureProfile.id;
                }
            }

            if (model.TerritoryId > 0)
            {
                var territory = meridian.territoriesStore.Get(model.TerritoryId);
                model.RootTerritoryId = territory.parent_id;
            }

            return View(model);
        }

        public ActionResult ResortResults(SearchViewModel model, int page = 1, int pageSize = Constants.PageSize)
        {
            var resorts = meridian.resortsStore.All().Where(item => item.is_published).AsQueryable();

            if (model.HealthFactorId > 0)
            {
                resorts = resorts.Where(item => item.health_factors_items.Any(h => h.id == model.HealthFactorId));
            }

            if (model.DeseaseId > 0)
            {
                var hotelIds = meridian.hotelsStore.All()
                        .Where(item => item.deseases_items.Any(d => d.id == model.DeseaseId))
                        .Select(item => item.id);

                resorts = resorts.Where(item => item.Hotels.Any(h => hotelIds.Contains(h.id)));
            }

            if (model.DeseaseId == 0 && model.CureProfileId > 0)
            {
                resorts = resorts.Where(item => item.cure_profiles_items.Any(c => c.id == model.CureProfileId));
            }

            if (model.AdditionalCureProfileId > 0)
            {
                resorts = resorts.Where(item => item.cure_profiles_items.Any(c => c.id == model.AdditionalCureProfileId));
            }

            long territoryId = 0;

            if (model.RootTerritoryId > 0)
            {
                territoryId = model.RootTerritoryId;
            }

            if (model.TerritoryId > 0)
            {
                var territory = meridian.territoriesStore.Get(model.TerritoryId);
                model.RootTerritoryId = territory.parent_id;
                territoryId = model.TerritoryId;
            }

            if (model.SubTerritoryId > 0)
            {
                territoryId = model.SubTerritoryId;
            }

            if (territoryId > 0)
            {
                var territoryIds = GetSubTerritoryIds(territoryId);
                resorts = resorts.Where(item => territoryIds.Contains(item.territory_id));
            }

            if (!string.IsNullOrEmpty(model.Title))
            {
                resorts = resorts.Where(item => item.title.ToLower().Contains(model.Title.ToLower()));
            }

            var results = EntityMapper.ToResortsListViewModel(resorts.ToList(), page, pageSize);
            ViewBag.Results = results;

            if (results.TotalCount == 0 && model.CureProfileId > 0)
            {
                var suggestedResorts = meridian.resortsStore.All().Where(item => item.cure_profiles_items.Any(c => c.id == model.CureProfileId)).Take(8);
                ViewBag.SuggestedResults = EntityMapper.ToResortsListViewModel(suggestedResorts.ToList(), 1, 8);
            }
            else
            {
                ViewBag.SuggestedResults = null;
            }

            return View(model);
        }

        public ActionResult HotelSearch(SearchViewModel model)
        {
            var month = DateTime.Now.Month;
            var prices = meridian.pricesStore.All().Where(item => item.month == month && item.proto_name == "hotels").ToList();
            
            if (prices.Any())
            {
                model.MinPrice = Convert.ToInt32(prices.Min(item => item.price));
                model.MaxPrice = Convert.ToInt32(prices.Max(item => item.price));
            }

            model.HotelClasses =
                meridian.hotel_classesStore.All()
                    .Select(item => new SelectListItem {Text = item.title, Value = item.id.ToString()})
                    .ToList();

            model.HotelClasses.Insert(0, new SelectListItem{Text = "Любой", Value = "0", Selected = true});

            model.HotelStars =
                Enumerable.Range(1, 5).Reverse()
                    .Select(item => new SelectListItem {Text = item.ToString(), Value = item.ToString()})
                    .ToList();

            model.HotelStars.Insert(0, new SelectListItem { Text = "Все", Value = "0", Selected = true });

            model.TreatmentOptions = meridian.treatment_optionsStore.All().Where(item => item.parent_id == 0 && item.SubTreatmentOptions.Any()).ToList();

            model.Categories = meridian.property_categoriesStore.All().Where(item => item.show_in_search).OrderBy(item => item.order_number).ToList();

            return View(model);
        }

        public ActionResult HotelResults(SearchViewModel model, int page = 1, int pageSize = Constants.PageSize)
        {
            var hotels = meridian.hotelsStore.All().Where(item => item.is_published).AsQueryable();

            if (model.DeseaseId > 0)
            {
                hotels = hotels.Where(item => item.deseases_items.Any(d => d.id == model.DeseaseId));
            }

            if (model.TreatmentId > 0)
            {
                var ids = new List<long> {model.TreatmentId};

                var treatment = meridian.treatment_optionsStore.Get(model.TreatmentId);
                
                if (treatment.parent_id == 0)
                {
                    ids.AddRange(treatment.SubTreatmentOptions.Select(item => item.id).ToList());
                }

                hotels = hotels.Where(item => item.treatment_options_items.Select(t => t.id).Intersect(ids).Any());
            }

            long territoryId = 0;

            if (model.RootTerritoryId > 0)
            {
                territoryId = model.RootTerritoryId;
            }

            if (model.TerritoryId > 0)
            {
                var territory = meridian.territoriesStore.Get(model.TerritoryId);
                model.RootTerritoryId = territory.parent_id;
                territoryId = model.TerritoryId;
            }

            if (model.SubTerritoryId > 0)
            {
                territoryId = model.SubTerritoryId;
            }

            if (territoryId > 0)
            {
                var territoryIds = GetSubTerritoryIds(territoryId);
                var resortIds = meridian.resortsStore.All()
                        .Where(item => territoryIds.Contains(item.territory_id))
                        .Select(item => item.id);

                hotels = hotels.Where(item => resortIds.Contains(item.resort_id));
            }

            if (!string.IsNullOrEmpty(model.Title))
            {
                hotels = hotels.Where(item => item.title.ToLower().Contains(model.Title.ToLower()));
            }

            if (model.PriceFrom > 0 && model.PriceTo > 0)
            {
                var month = DateTime.Now.Month;
                var prices = meridian.pricesStore.All().Where(item => item.month == month && item.proto_name == "hotels" && item.price >= model.PriceFrom && item.price <= model.PriceTo).Select(item=> item.entity_id);
                if (hotels.Any(item => prices.Contains(item.id)))
                {
                    hotels = hotels.Where(item => prices.Contains(item.id));
                }
            }

            if (model.Stars > 0)
            {
                hotels = hotels.Where(item => item.stars == model.Stars);
            }

            if (model.HotelClass > 0)
            {
                hotels = hotels.Where(item => item.class_id == model.HotelClass);
            }

            if (model.Properties != null && model.Properties.Any())
            {
                foreach (var propertyId in model.Properties)
                {
                    hotels = hotels.Where(item => item.properties_items.Any(p => p.id == propertyId));
                }
            }

            if (model.Treatments != null && model.Treatments.Any())
            {
                var hotelIds = new List<long>();
                
                foreach (var treatementId in model.Treatments)
                {
                    var ids = meridian.hotelsStore.All()
                            .Where(item => item.treatment_options_items.Any(t => t.id == treatementId))
                            .Select(item => item.id);
                    hotelIds.AddRange(ids);
                }

                hotelIds = hotelIds.Distinct().ToList();
                hotels = hotels.Where(item => hotelIds.Contains(item.id));
            }

            ViewBag.Results = EntityMapper.ToHotelsListViewModel(hotels.ToList(), page, pageSize);

            return View(model);
        }

        public ActionResult Static(string url)
        {
            var page = meridian.pagesStore.GetStaticPageByUrl(url);
            
            if (page != null)
            {
                var result = new StaticPageViewModel
                {
                    Id = page.id, 
                    Title = page.title, 
                    Alias = page.alias, 
                    Content = page.html,
                    ProtoName = page.ProtoName,
                    MenuLinks = page.SubPages
                };

                return View(result);
            }

            return HttpNotFound();
        }

        public ActionResult StaticPagesPath(long id)
        {
            var page = meridian.pagesStore.Get(id);
            var model = new Dictionary<string, string> { { page.title, string.Empty } };

            long parentId = page.parent_id;

            while (parentId > 0)
            {
                page = meridian.pagesStore.Get(page.parent_id);
                model.Add(page.title, page.GetPageUrl());
                parentId = page.parent_id;
            }

            return View(model);
        }

        public ActionResult Map()
        {
            return View();
        }

        public ActionResult Message()
        {
            var model = PopupMessage.GetMessage();

            return PartialView(model);
        }

        [HttpGet]
        public ActionResult SendOrderRequest(EntityViewModel entityViewModel)
        {
            var model = new OrderRequestViewModel
            {
                Id = entityViewModel.Entity.id,
                ProtoName = entityViewModel.Entity.ProtoName,
                FromDate = DateTime.Now.Date,
                ToDate = DateTime.Now.Date
            };
            
            return PartialView(model);
        }

        [HttpPost]
        public void SendOrderRequest(OrderRequestViewModel model)
        {
            switch (model.ProtoName)
            {
                case "hotels":
                    var hotel = meridian.hotelsStore.Get(model.Id);
                    model.EntityTitle = hotel.title;
                    model.Link = Url.RouteUrl("HotelOne", new { hotel.id, entryName = hotel.title.TransliterateAndClear() }, Request.Url.Scheme);
                    break;
                case "resorts":
                    var resort = meridian.resortsStore.Get(model.Id);
                    model.EntityTitle = resort.title;
                    model.Link = Url.RouteUrl("ResortOne", new { resort.id, entryName = resort.title.TransliterateAndClear() }, Request.Url.Scheme);
                    break;
            }

            CreateMailer().SendOrderRequest(model);
        }

        public ActionResult Banner()
        {
            return View();
        }

        public ActionResult SphinxSearch(string q, string type = null)
        {
            // default - all indexes
            string[] indexes = null;
            string title = null;

            switch (type)
            {
                case "natureheals":
                    indexes = new [] {typeof(health_factors).Name, typeof(treatment_options).Name};
                    title = "Поиск по лечебному фактору / методу лечения";
                    break;
                case "treatments":
                    indexes = new [] {typeof(cure_profiles).Name, typeof(deseases).Name};
                    title = "Поиск по профилю лечения / заболеванию";
                    break;
            }

            ViewBag.Title = title ?? "Поиск по сайту";

            var results = GetSphinxSearchResults(q, indexes);

            return View(results);
        }

        public void SphinxHotels()
        {
            OutputSphinx(meridian.hotelsStore.All());
        }

        public void SphinxCountries()
        {
            //TODO: отключаем индексацию стран в сфинксе
            OutputSphinx(CreateEmptyEntityCollection());
        }

        public void SphinxDeseases()
        {
            OutputSphinx(meridian.deseasesStore.All());
        }

        public void SphinxCureProfiles()
        {
            OutputSphinx(meridian.cure_profilesStore.All());
        }

        public void SphinxHealthFactors()
        {
            OutputSphinx(meridian.health_factorsStore.All());
        }

        public void SphinxRegions()
        {
            //TODO: отключаем индексацию регионов в сфинксе
            OutputSphinx(CreateEmptyEntityCollection());
        }

        public void SphinxResortZones()
        {
            //TODO: отключаем индексацию курортных зон в сфинксе
            OutputSphinx(CreateEmptyEntityCollection());
        }

        public void SphinxResorts()
        {
            OutputSphinx(meridian.resortsStore.All());
        }

        public void SphinxTreatmentOptions()
        {
            OutputSphinx(meridian.treatment_optionsStore.All());
        }

        public void SphinxStaticPages()
        {
            OutputSphinx(meridian.pagesStore.All());
        }

        public void SphinxDictionary()
        {
            OutputSphinx(meridian.dictionaryStore.All());
        }

        public SitemapResult Sitemap()
        {
            return new SitemapResult(SitemapBuilder.GetSitemap());
        }

        private IEnumerable<SphinxDocumentAnnounce> GetSphinxSearchResults(string q, string[] indexes = null)
        {
            if (string.IsNullOrEmpty(q))
                return new SphinxDocumentAnnounce[0];

            using (ConnectionBase connection = new PersistentTcpConnection(MeridianMonitor.Default.SphinxHost, MeridianMonitor.Default.SphinxPort))
            {
                q = q.Replace(" -", "¦").Replace("-", " ").Replace("¦", " -").Replace("!", "\\!").Replace("?", "\\?").Replace("@", "\\@");

                if (q.LastIndexOf('-') == (q.Length - 1))
                {
                    q = q.Substring(0, q.LastIndexOf('-') - 1).Trim();
                }

                q = string.Join(" ", q.Split(' ').Select(s => s.Trim()));
                // Create new search query object and pass query text as argument
                SearchQuery searchQuery = new SearchQuery(q);
                // Set match mode to SPH_MATCH_EXTENDED2
                searchQuery.MatchMode = MatchMode.All;

                string[] protos = indexes ?? new string[]
                    {
                        typeof(hotels).Name,
                        //typeof(countries).Name,
                        typeof(deseases).Name,
                        typeof(cure_profiles).Name,
                        typeof(health_factors).Name,
                        //typeof(regions).Name,
                        //typeof(resort_zones).Name,
                        typeof(resorts).Name,
                        typeof(treatment_options).Name,
                        "static_pages",
                        typeof(dictionary).Name
                    };

                var byIndexResults = new Dictionary<string, List<SphinxDocumentAnnounce>>();
                foreach (var protoIndex in protos)
                {
                    searchQuery.Indexes.Add(protoIndex);
                    byIndexResults[protoIndex] = new List<SphinxDocumentAnnounce>();
                }

                searchQuery.Limit = 5000;
                SearchCommand searchCommand = new SearchCommand(connection);
                searchCommand.QueryList.Add(searchQuery);
                searchCommand.Execute();

                var pubResult = new List<SphinxDocumentAnnounce>();
                foreach (SearchQueryResult result in searchCommand.Result.QueryResults)
                {
                    foreach (var match in result.Matches)
                    {
                        var otype = match.AttributesValues["objecttype"].GetValue().ToString().Trim();
                        var entityId = Convert.ToInt64(match.AttributesValues["entityid"].GetValue());
                        var documentId = new DocumentId(entityId);
                        if (match.AttributesValues.Contains("fieldsetid"))
                            documentId = new DocumentId(entityId,
                                Convert.ToInt64(match.AttributesValues["fieldsetid"].GetValue()));

                        if (!Meridian.Default.Exists(otype, entityId))
                            continue;

                        var entity = Meridian.Default.GetAs<ISphinxExportableEntity>(otype, entityId);
                        var document = entity.GetDocumentById(documentId);
                        if (document != null)
                        {
                            var item = new SphinxDocumentAnnounce(document.GetTitle(), document.GetBody(), document.GetUrl());
                            pubResult.Add(item);
                            byIndexResults[otype].Add(item);
                        }
                    }
                }

                var itemsArray = pubResult.ToArray();

                var querySplit = q.Split(' ');
                foreach (var protoIndex in protos)
                {
                    var items = byIndexResults[protoIndex];

                    if (items.Count == 0)
                        continue;

                    BuildExcerptsCommand excerptsCommand = new BuildExcerptsCommand(connection,
                        items.Select(s => s.GetBody()), querySplit, protoIndex);
                    excerptsCommand.Execute();

                    var index = 0;
                    foreach (var result in excerptsCommand.Result.Excerpts)
                    {
                        var item = items[index++];
                        item.SetBody(result);
                    }
                }

                return itemsArray;
            }
        }

        private IList<ISphinxExportableEntity> CreateEmptyEntityCollection()
        {
            return new List<ISphinxExportableEntity>(0);
        }

        private List<long> GetSubTerritoryIds(long id)
        {
            var result = new List<long> { id };
            var ids = meridian.territoriesStore.All().Where(item => item.parent_id == id).Select(item => item.id).ToList();

            if (ids.Count == 0)
            {
                return result;
            }

            foreach (var territoryId in ids)
            {
                result.AddRange(GetSubTerritoryIds(territoryId));
            }

            return result;
        }

        private List<treatment_options>[] GetTreatmentOptionsList(int cols = 5)
        {
            var result = new List<treatment_options>[cols];
            for (var i = 0; i < result.Length; i++)
            {
                result[i] = new List<treatment_options>();
            }

            var index = 0;

            var treatmentOptions = meridian.treatment_optionsStore.All().Where(item => item.parent_id > 0 && item.show_on_sitemap).ToList();

            for (var i = 0; i < treatmentOptions.Count; i++)
            {
                result[index].Add(treatmentOptions[i]);
                index = (i + 1) % cols == 0 ? 0 : index + 1;
            }

            return result;
        }

        private List<health_factors>[] GetHealthFactorsList(int cols = 5)
        {
            var result = new List<health_factors>[cols];
            for (var i = 0; i < result.Length; i++)
            {
                result[i] = new List<health_factors>();
            }

            var index = 0;

            var healthFactors = meridian.health_factorsStore.All().Where(item => item.parent_id > 0 && item.show_on_sitemap).ToList();

            for (var i = 0; i < healthFactors.Count; i++)
            {
                result[index].Add(healthFactors[i]);
                index = (i + 1) % cols == 0 ? 0 : index + 1;
            }

            return result;
        }

        public ActionResult Metadata()
        {
            if (Request.Url != null)
            {
                string url = Request.Url.LocalPath.TrimEnd(new[] { '/' });
                var model = meridian.seo_metadataStore.All().FirstOrDefault(item => item.url == url);
                return View(model);
            }

            return null;
        }

        public ActionResult CallMe()
        {
            return PartialView("Widgets/CallMe", new CallMeViewModel());
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CallMe(CallMeViewModel model)
        {
            if (ModelState.IsValid)
            {
                CreateMailer().SendCallMeRequest(model);

                return PartialView("Widgets/CallMe", new CallMeViewModel { Success = true });
            }

            return PartialView("Widgets/CallMe", model);
        }
    }
}