using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bewell.Models.ModelValidators.Attributes;

namespace bewell.Models.ModelValidators
{
    public class EMailValidator : DataAnnotationsModelValidator<EMailAttribute>
    {
        private string m_message;

        public EMailValidator(ModelMetadata metadata, ControllerContext context, EMailAttribute attribute)
            : base(metadata, context, attribute)
        {
            m_message = attribute.ErrorMessage;
        }

        public override IEnumerable<ModelClientValidationRule> GetClientValidationRules()
        {
            var rule = new ModelClientValidationRule
            {
                ErrorMessage = m_message,
                ValidationType = "email"
            };

            return new[] { rule };
        }
    }
}