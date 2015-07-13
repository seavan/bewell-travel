using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq.Expressions;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace bewell.common.HtmlHelpers
{
    public static class Helpers
    {
        /// <summary>
        /// Проверяет наличие ошибок валидации в модели
        /// </summary>
        /// <typeparam name="TModel"></typeparam>
        /// <typeparam name="TValue"></typeparam>
        /// <param name="_helper"></param>
        /// <param name="_expression"></param>
        /// <returns></returns>
        internal static bool ModelHasErrors<TModel, TValue>(HtmlHelper<TModel> _helper,
                                                            Expression<Func<TModel, TValue>> _expression)
        {
            string fieldName = ExpressionHelper.GetExpressionText(_expression);
            string modelName = _helper.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(fieldName);

            ModelState modelState = _helper.ViewData.ModelState[modelName];

            ModelErrorCollection modelErrors = (modelState == null) ? null : modelState.Errors;

            // если были ошибки валидации
            return ((modelErrors != null) && (modelErrors.Count > 0));
        }

        /// <summary>
        /// Читает описание енума из атрибута Description, если он есть. Атрибут DisplayName к элементам
        /// енума, к сожалению, не применим.
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string GetDescription(this Enum value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());

            var attributes = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);

            return (attributes.Length > 0) ? attributes[0].Description : value.ToString();
        }

        /// <summary>
        /// Получить идентификатор контрола, связанного с элементом модели
        /// </summary>
        /// <typeparam name="TModel"></typeparam>
        /// <typeparam name="TValue"></typeparam>
        /// <param name="_helper"></param>
        /// <param name="_expression"></param>
        /// <returns></returns>
        public static string IdFor<TModel, TValue>(this HtmlHelper<TModel> _helper,
                                                                   Expression<Func<TModel, TValue>> _expression)
        {
            string htmlFieldName = ExpressionHelper.GetExpressionText(_expression);
            return _helper.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldId(htmlFieldName);
        }


        public static List<SelectListItem> TrueFalseListForSelection<TModel>(this HtmlHelper<TModel> _helper, string falseText = "Нет", string trueText = "Да")
        {
            return new List<SelectListItem>
            {
                           new SelectListItem {Value = "False", Text = falseText},
                           new SelectListItem {Value = "True", Text = trueText}
                       };
        }

        public static string CaptchaImage(this HtmlHelper helper, int height, int width, int charcount)
        {
            common.CaptchaImage.TextLength = charcount;
            common.CaptchaImage.LineNoise = LineNoiseLevel.Medium;
            common.CaptchaImage.FontWarp = FontWarpFactor.High;
            common.CaptchaImage.BackgroundNoise = BackgroundNoiseLevel.Medium;

            var image = new CaptchaImage
            {
                Width = width,
                Height = height
            };

            HttpRuntime.Cache.Add(
                image.UniqueId,
                image,
                null,
                DateTime.Now.AddSeconds(common.CaptchaImage.CacheTimeOut),
                System.Web.Caching.Cache.NoSlidingExpiration,
                System.Web.Caching.CacheItemPriority.NotRemovable,
                null
            );

            var inputBuilder = new TagBuilder("input");
            inputBuilder.Attributes.Add("type", "hidden");
            inputBuilder.Attributes.Add("name", "captcha-guid");
            inputBuilder.Attributes.Add("id", "captcha-guid");
            inputBuilder.Attributes.Add("value", image.UniqueId);

            var imgBuilder = new TagBuilder("img");
            imgBuilder.Attributes.Add("src", "/Ajax/Image?guid=" + image.UniqueId);
            imgBuilder.Attributes.Add("alt", "Captcha Image");
            imgBuilder.Attributes.Add("width", width.ToString(CultureInfo.InvariantCulture));
            imgBuilder.Attributes.Add("height", height.ToString(CultureInfo.InvariantCulture));

            return inputBuilder.ToString(TagRenderMode.Normal) + imgBuilder.ToString(TagRenderMode.Normal);
        }
    }
}
