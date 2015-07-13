using System.Collections.Generic;
using System.Web.Mvc;
using bewell.Models.ModelValidators.Attributes;

namespace bewell.Models.ModelValidators
{
    public class CaptchaValidator : DataAnnotationsModelValidator<CaptchaAttribute>
    {
        private readonly string _message;

        public CaptchaValidator(ModelMetadata metadata, ControllerContext context, CaptchaAttribute attribute) 
            : base(metadata, context, attribute)
        {
            _message = attribute.ErrorMessage;
        }

        public override IEnumerable<ModelClientValidationRule> GetClientValidationRules()
        {
            var rule = new ModelClientValidationRule
            {
                ErrorMessage = _message,
                ValidationType = "captcha"
            };

            return new[] { rule };
        }
    }
}