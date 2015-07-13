using System;
using System.IO;
using System.Web;

namespace admin.web.common
{
    public static class MeridianWebUtilities
    {
        public static string UploadFileWithExtension(HttpPostedFileBase uploadedFile, string targetPath)
        {
            var extension = Path.GetExtension(uploadedFile.FileName);
            var targetFName = Guid.NewGuid().ToString() + extension;
            using (FileStream stream = new FileStream(targetPath + targetFName, FileMode.Create))
            {
                uploadedFile.InputStream.CopyTo(stream);
            }

            return targetFName;
        }

    }
}
