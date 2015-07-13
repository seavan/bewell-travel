﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bewell.Models.ModelValidators.Attributes
{
    public interface ICrossFieldValidationAttribute
    {
        bool IsValid(ControllerContext controllerContext, object model, ModelMetadata modelMetadata);
    }
}