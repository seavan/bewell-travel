using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web.Mvc;
using bewell.common;
using bewell.Mappers;
using bewell.Models.ViewModels;
using meridian.bewell.impl.Classes;

namespace bewell.Controllers
{
    public class NewsController : BaseController
    {
        public ActionResult Index(long id = 0, int page = 1, int pageSize = Constants.NewsPageSize)
        {
            var model = new NewsListViewModel();
            string currentUrl = string.Empty;

            if (id > 0)
            {
                var category = meridian.news_categoriesStore.Get(id);
                model = EntityMapper.ToNewsListViewModel(category.News.OrderByDescending(item => item.publish_date).ToList(), page, pageSize);
                currentUrl = category.EntityUrl;
                model.Category = category;
            }
            else
            {
                var news = meridian.newsStore.All().OrderByDescending(item => item.publish_date).ToList();
                model = EntityMapper.ToNewsListViewModel(news, page, pageSize);
            }

            var links = new List<LinkInfo>
            {
                new LinkInfo
                {
                    Title = "Все новости",
                    Url = string.Empty,
                    FullUrl = "/news"
                }
            };

            var categories = meridian.news_categoriesStore.All().Where(item => item.News.Any()).OrderBy(item => item.title);
            
            links.AddRange(categories.Select(category => new LinkInfo
            {
                Title = category.title,
                Url = category.EntityUrl,
                FullUrl = category.EntityUrl
            }));

            ViewBag.Links = new MenuLinks
            {
                CurrentUrl = currentUrl,
                Links = links
            };

            return View(model);
        }

        public ActionResult One(long id)
        {
            var model = meridian.newsStore.Get(id);

            var links = new List<LinkInfo>
            {
                new LinkInfo
                {
                    Title = "Все новости",
                    Url = string.Empty,
                    FullUrl = "/news"
                }
            };

            var categories = meridian.news_categoriesStore.All().Where(item => item.News.Any()).OrderBy(item => item.title);

            links.AddRange(categories.Select(category => new LinkInfo
            {
                Title = category.title,
                Url = category.EntityUrl,
                FullUrl = category.EntityUrl
            }));

            ViewBag.Links = new MenuLinks
            {
                CurrentUrl = model.GetNewsNews_categorie().EntityUrl,
                Links = links
            };

            return View(model);
        }

    }
}
