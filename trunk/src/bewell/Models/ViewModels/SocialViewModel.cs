using System.Web;

namespace bewell.Models.ViewModels
{
    public class SocialViewModel
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public string Image { get; set; }

        public SocialViewModel()
        {
            Image = Extensions.Extensions.ToAbsoluteUrl("/Content/userdata/noimagesmall.jpg");
            Url = Extensions.Extensions.ToAbsoluteUrl(HttpContext.Current.Request.Url.LocalPath);
        }
    }

}