namespace bewell.Models.ViewModels
{
    public class InfoBannerViewModel
    {
        public string Message { get; set; }

        public InfoBannerViewModel()
        {
            Message = "Информация на сайте предоставлена только для ознакомления и не может заменить консультации со специалистом.";
        }
    }
}