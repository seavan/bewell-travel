using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using admin.db;
using bewell.common;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public class HotelPhotosAspect : AttachedPhotoAspect
    {
        public HotelPhotosAspect(string field, hotels parent, string folder)
            : base(field, parent, folder)
        {
            _parent = parent;
        }

        private readonly hotels _parent;

        public override IEnumerable<IAttachedPhoto> GetAllPhotos()
        {
            return Meridian.Default.entity_photosStore.All().Where(item =>
                                                                   item.entity_id == _parent.id &&
                                                                   item.proto_name == _parent.ProtoName)
                           .OrderBy(item => item.order_number)
                           .ToList();
        }

        public override IAttachedPhoto AddPhoto(string guid, string original, string small, string mid, string large)
        {
            return Meridian.Default.entity_photosStore.Insert(new entity_photos
            {
                entity_id = _parent.id,
                proto_name = _parent.ProtoName,
                guid = guid,
                original = original,
                thumbnail_large = large,
                thumbnail_mid = mid,
                thumbnail_small = small,
                is_main = false,
                order_number = Meridian.Default.entity_photosStore.GetNextItemOrder(_parent.id, _parent.ProtoName),
            });
        }

        public override void RemovePhoto(long id)
        {
            var photo = Meridian.Default.entity_photosStore.Get(id);
            Meridian.Default.entity_photosStore.Delete(photo);

            var photoNames = new List<string>
            {
                photo.original,
                photo.thumbnail_small,
                photo.thumbnail_mid,
                photo.thumbnail_large
            };

            foreach (string name in photoNames)
            {
                if (File.Exists(HttpContext.Current.Server.MapPath(Path.Combine(Constants.HotelsDataFolder, name))))
                {
                    File.Delete(HttpContext.Current.Server.MapPath(Path.Combine(Constants.HotelsDataFolder, name)));
                }
            }

            //если удалили главную фотку, сделать главной другую фотку
            if (photo.is_main)
            {
                var newMainPhoto = Meridian.Default.entity_photosStore.All()
                        .FirstOrDefault(item => item.entity_id == photo.entity_id && item.proto_name == photo.proto_name);
                if (newMainPhoto != null)
                {
                    newMainPhoto.is_main = true;
                    Meridian.Default.entity_photosStore.Update(newMainPhoto);
                }
            }
        }

        public override void SetMain(long id)
        {
            var photos = GetAllPhotos().Cast<entity_photos>().ToArray();

            foreach (var p in photos)
            {
                p.is_main = p.id == id;
                Meridian.Default.UpdateAs<IDatabaseEntity>(p.ProtoName, p.id);
            }
        }
    }
}
