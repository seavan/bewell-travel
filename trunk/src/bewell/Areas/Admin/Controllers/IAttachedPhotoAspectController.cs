using System;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using admin.web.common;
using bewell.common.Infrastructure;
using bewell.Controllers;
using meridian.bewell.impl.Images;
using meridian.bewell.proto;
using meridian.bewell.system;

namespace bewell.Areas.Admin.Controllers
{
    public class IAttachedPhotoAspectController : AspectController<IAttachedPhoto>
    {
        private const string CommonThumbnailSettings = "&format=jpg&mode=crop&anchor=middlecenter";

        IAttachedPhotoAspectProvider GetModel(string protoName, long id)
        {
            return Meridian.Default.GetAs<IAttachedPhotoAspectProvider>(protoName, id);
        }

        public ActionResult GalleryEditList(long id, string protoName, string fieldName)
        {
            if (id <= 0)
            {
                return new JsonResult();
            }
            ViewData["fieldName"] = fieldName;
            var photos = GetModel(protoName, id).GetAttachedPhotoAspect(fieldName).GetAllPhotos();
            return View(photos);
        }

        public ActionResult UploadTelerik(string protoName, long id, string fieldName)
        {
            var item = GetModel(protoName, id).GetAttachedPhotoAspect(fieldName);
            foreach (var f in Request.Files)
            {
                var file = Request.Files[f.ToString()];
                if (file == null)
                {
                    continue;
                }
                // Some browsers send file names with full path. This needs to be stripped.
                
                var virtualPath = "~" + item.GetUploadDataFolder();
                var physicalPath = Server.MapPath(virtualPath);
                string name = MeridianWebUtilities.UploadFileWithExtension(file, physicalPath);
                if (!string.IsNullOrEmpty(name))
                {
                    var fullName = Path.Combine(physicalPath, name);
                    ProcessUploadedFile(item, name, fullName);
                }
            }
            // Return an empty string to signify success
            return Content("");
        }

        public void ProcessUploadedFile(IAttachedPhotoAspect model, string name, string path)
        {
            var imageNamingStrategy = new ImageNamingStrategy(name);
            var thumbGenerator = new ThumbnailGenerator { CommandString = "width=140&height=96" + CommonThumbnailSettings };
            string small = Path.GetFileName(thumbGenerator.GenerateThumbnail(path, Server.MapPath(Path.Combine(model.GetUploadDataFolder(), imageNamingStrategy.GetSmallThumbnailName()))));
            thumbGenerator.CommandString = "width=220&height=146" + CommonThumbnailSettings;
            string mid = Path.GetFileName(thumbGenerator.GenerateThumbnail(path, Server.MapPath(Path.Combine(model.GetUploadDataFolder(), imageNamingStrategy.GetMediumThumbnailName()))));
            thumbGenerator.CommandString = "width=620&height=424" + CommonThumbnailSettings;
            string large = Path.GetFileName(thumbGenerator.GenerateThumbnail(path, Server.MapPath(Path.Combine(model.GetUploadDataFolder(), imageNamingStrategy.GetLargeThumbnailName()))));

            model.AddPhoto(imageNamingStrategy.GetGuidName(), name, small, mid, large);
        }

        [HttpPost]
        public void RemovePhoto(string protoName, long id, string fieldName, long photoId)
        {
            var model = GetModel(protoName, id).GetAttachedPhotoAspect(fieldName);
            model.RemovePhoto(photoId);
        }

        [HttpPost]
        public void SetMain(string protoName, long id, string fieldName, long photoId)
        {
            var model = GetModel(protoName, id).GetAttachedPhotoAspect(fieldName);
            model.SetMain(photoId);
            
        }

        [HttpPost]
        public void SetOrder(string protoName, long entity_id, string order)
        {
            string[] pairs = order.Split(new[] {';'}, StringSplitOptions.RemoveEmptyEntries);
            foreach (string pair in pairs)
            {
                string[] val = pair.Split(new[] {'='}, StringSplitOptions.RemoveEmptyEntries);
                var photo = Meridian.Default.entity_photosStore.Get(Convert.ToInt64(val[0]));
                
                if (photo != null)
                {
                    photo.order_number = Convert.ToInt32(val[1]);
                    Meridian.Default.entity_photosStore.Update(photo);
                }
            }
        }
    }
}
