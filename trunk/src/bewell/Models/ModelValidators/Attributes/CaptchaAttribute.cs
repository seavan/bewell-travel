using System;
using System.ComponentModel.DataAnnotations;
using System.Web;
using bewell.common;

namespace bewell.Models.ModelValidators.Attributes
{
    public class CaptchaAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (HttpContext.Current.Request.IsAuthenticated)
            {
                return true;
            }

            string guid = HttpContext.Current.Request.Form["captcha-guid"];
            CaptchaImage image = CaptchaImage.GetCachedCaptcha(guid);
            string expectedValue = image == null ? string.Empty : image.Text;
            var result = !string.IsNullOrEmpty(expectedValue) && string.Equals(value.ToString(), expectedValue, StringComparison.OrdinalIgnoreCase);
            
            if (result)
            {
                HttpContext.Current.Cache.Remove(guid);
            }

            return result;
        }
    }
}