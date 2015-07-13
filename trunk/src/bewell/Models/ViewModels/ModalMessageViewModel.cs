using bewell.Classes;

namespace bewell.Models.ViewModels
{
    public class ModalMessageViewModel
    {
        public string Title { get; set; }
        public string Text { get; set; }
        public string Width { get; set; }
        public bool ShowOkButton { get; set; }

        public ModalMessageViewModel()
        {
            Width = PopupMessage.Width;
            ShowOkButton = true;
        }

        public bool IsVisible
        {
            get
            {
                return !string.IsNullOrEmpty(Title) || !string.IsNullOrEmpty(Text);
            }
        }
    }
}
