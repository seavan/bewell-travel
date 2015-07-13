using System.Web;
using bewell.Models.ViewModels;

namespace bewell.Classes
{
    public static class PopupMessage
    {
        public const string MessageKey = "popupMessage";
        public const string Width = "620px";

        public static void AddMessage(string title, string text, string width = Width)
        {
            if (HttpContext.Current.Session[MessageKey] != null)
            {
                HttpContext.Current.Session.Remove(MessageKey);
            }

            var message = new ModalMessageViewModel
            {
                Title = title,
                Text = text,
                Width = width
            };

            HttpContext.Current.Session[MessageKey] = message;
        }

        public static ModalMessageViewModel GetMessage()
        {
            var message = new ModalMessageViewModel();

            if (HttpContext.Current.Session[MessageKey] != null)
            {
                message = HttpContext.Current.Session[MessageKey] as ModalMessageViewModel;
                HttpContext.Current.Session.Remove(MessageKey);
            }

            return message;
        }
    }
}