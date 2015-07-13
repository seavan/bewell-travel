using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web.Mvc;
using bewell.common;

namespace bewell.Classes
{
    public class CaptchaImageResult : ActionResult
    {
        public override void ExecuteResult(ControllerContext context)
        {
            string guid = context.HttpContext.Request.QueryString["guid"];
            CaptchaImage ci = CaptchaImage.GetCachedCaptcha(guid);

            if (String.IsNullOrEmpty(guid) || ci == null)
            {
                context.HttpContext.Response.StatusCode = 404;
                context.HttpContext.Response.StatusDescription = "Not Found";
                context.HttpContext.ApplicationInstance.CompleteRequest();
                return;
            }

            // Запись изображения в выходной поток HTTP как массива байтов                
            using (Bitmap b = ci.RenderImage())
            {
                b.Save(context.HttpContext.Response.OutputStream, ImageFormat.Jpeg);
            }

            context.HttpContext.Response.ContentType = "image/jpeg";
            context.HttpContext.Response.StatusCode = 200;
            context.HttpContext.Response.StatusDescription = "OK";
            context.HttpContext.ApplicationInstance.CompleteRequest();
        }
    }
}