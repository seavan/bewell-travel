using System.Collections.Generic;
using admin.db;
using meridian.bewell.impl.Classes;
using meridian.bewell.proto;

namespace bewell.Models.ViewModels
{
    public class EntityViewModel
    {
        public IDatabaseEntity Entity { get; set; }
        public string Title { get; set; }
        public string EntityUrl { get; set; }
        public int Stars { get; set; }
        public int BewellStars { get; set; }
        public FieldSetInfo FieldSet { get; set; }
        public MenuLinks MenuLinks { get; set; }
        public GalleryPhotos Photos { get; set; }
        
        public territories Terriotry { get; set; }
        public string ListImageUrl { get; set; }
        public IGeoLocation EntityMap { get; set; }

        public IEnumerable<comments> EntityReviews { get; set; }

        public int PagesCount { get; set; }
        public int Page { get; set; }

        public EntityViewModel()
        {
            Photos = new GalleryPhotos();
            MenuLinks = new MenuLinks();
        }
    }
}