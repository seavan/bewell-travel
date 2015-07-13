using bewell.common;
using meridian.bewell.controller;

namespace bewell.Areas.Admin.Controllers
{
    public partial class admin_newsController : meridian_news
    {
        public admin_newsController()
        {
            DefaultUploadVirtualFolder = Constants.NewsDataFolder;
        }
    }
}
