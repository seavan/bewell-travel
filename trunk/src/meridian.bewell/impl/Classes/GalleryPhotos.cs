using System.Collections.Generic;
using meridian.bewell.proto;

namespace meridian.bewell.impl.Classes
{
    /// <summary>
    /// класс для вывода галлереи изображений
    /// </summary>
    public class GalleryPhotos
    {
        //Заголовок, который будет отображаться во всплывашке при открытии фотографии галереи
        public string Title { get; set; }
        //Фотографии галереи
        public List<entity_photos> Photos { get; set; }

        public GalleryPhotos()
        {
            Photos = new List<entity_photos>();
        }
    }
}
