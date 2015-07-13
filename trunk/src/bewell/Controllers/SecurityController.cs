using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bewell.Models.CodeModels.Security;
using bewell.Classes;
using bewell.Services;
using bewell.common;
using bewell.Models.ModelValidators.Attributes;

namespace bewell.Controllers
{
    public class SecurityController : BaseController
    {
        private Mailer mailer;

        public SecurityController()
            : base()
        {
            this.mailer = CreateMailer();
        }

        #region Регистрация
        public ActionResult Registration()
        {
            return PartialView("Widgets/Registration", new UserRegistrationModel());
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Registration(UserRegistrationModel model)
        {
            if (ModelState.IsValid)
            {

                model.EMailReg = model.EMailReg.ToLower();

                RegisterUser(model);

                return PartialView("Widgets/Registration", new UserRegistrationModel() { Success = true });
                
            }

            return PartialView("Widgets/Registration", model);
        }

        private void RegisterUser(UserRegistrationModel model, bool needActivation = true)
        {
            var account = SecurityService.Register(model, needActivation);

            if (needActivation && account != null)
                //Выслать на почту письмо с кодом активации
                mailer.SendActivationMail(account.NameAndSurname, account.email, account.activation_guid);
        }
        #endregion

        #region Активация
        /// <summary>
        /// Активация аккаунта участника
        /// </summary>
        [HttpGet]
        public ActionResult Activate(string email, Guid? activationKey)
        {
            ViewBag.Success = false;

            if (!activationKey.HasValue) { return View(model: "Не указан активационный код."); }
            string errorMessage;

            var acc = SecurityService.ActivateAccount(email, activationKey.Value, out errorMessage);

            if (string.IsNullOrEmpty(errorMessage))
            {
                try
                {
                    // если вошли до того - выходим
                    if (SecurityService.IsAuthorize)
                    {
                        SecurityService.SignOut();
                    }

                    // входим этим аккаунтом
                    SecurityService.SignIn(acc, false);
                    return RedirectToAction("ActivationSuccess", new { name = acc.ShortName });
                }
                catch (Exception ex)
                {
                    LogException("Активация аккаунта участника", ex);
                    return View(model: ex.Message);
                }
            }

            return View(model: errorMessage);
        }
        [HttpGet]
        public ActionResult ActivationSuccess(String name)
        {
            if (string.IsNullOrEmpty(name))
                return RedirectToRoute("Default");

            ViewBag.Success = true;
            return View("Activate", model: name);
        }

        [HttpGet]
        public ActionResult RepeatActivation()
        {
            return View("Remember", new RegainModel() { repeatActivation = true });
        }
        [HttpPost]
        public ActionResult RepeatActivation(RegainModel model)
        {
            if (ModelState.IsValid)
            {
                if (SecurityService.ValidateUser(model.EMailRem, model.Captcha, true, ModelState))
                {
                    var acc = meridian.accountsStore.GetAccountsByLogin(model.EMailRem);
                    if (acc != null)
                    {
                        mailer.SendActivationMail(acc.ShortName, acc.email, acc.activation_guid);
                    }
                    return View("Remember", new RegainModel() { Success = true, repeatActivation = true });
                }
            }

            model.Captcha = string.Empty;
            model.repeatActivation = true;

            return View("Remember", model);
        }
        #endregion

        #region Авторизация
        public ActionResult SignIn()
        {
            return PartialView("Widgets/Authorization", new UserAuthenticationModel());
        }

        [HttpPost]
        public ActionResult SignIn(UserAuthenticationModel model)
        {
            InitUniqueId(true);
            try
            {
                if (ModelState.IsValid)
                {
                    string result;

                    if (SecurityService.Authenticate(model.EMailAuth, model.Password, out result))
                    {
                        SecurityService.SignIn(model.EMailAuth, model.Remember);

                        if (string.IsNullOrEmpty(model.CurrentUrlToReturn))
                        {
                            return new AjaxAwareAuthRedirectResult("/");
                        }
                        return new AjaxAwareAuthRedirectResult(model.CurrentUrlToReturn);

                    }
                    else
                    {
                        ModelState.AddModelError("AuthenticateError", result);
                        SecurityService.SignOut();
                    }
                    if (result.Contains("Ваш аккаунт не активирован")) model.isActivate = false;
                }

                return PartialView("Widgets/Authorization", model);
            }
            catch
            {
                return RedirectToAction("SignOut");
            }
        }

        public ActionResult Autologin(int id)
        {
            if (meridian.accountsStore.Exists(id))
            {
                SecurityService.SignIn(meridian.accountsStore.Get(id), false);
            }
            return new RedirectResult("/");
        }

        public ActionResult SignOut(string ReturnUrl = "")
        {
            InitUniqueId(true);
            SecurityService.SignOut();
            if (!String.IsNullOrEmpty(ReturnUrl) && ReturnUrl.Contains("/Profile"))
                ReturnUrl = string.Empty;

            Response.RedirectLocation = String.IsNullOrEmpty(ReturnUrl) ? "/" : ReturnUrl;

            string[] myCookies = Request.Cookies.AllKeys;
            foreach (string cookie in myCookies)
            {
                Response.Cookies[cookie].Expires = DateTime.Now.AddDays(-1);
            }
            return new RedirectResult(Response.RedirectLocation);
        }
        #endregion

        #region Восстановление пароля
        [HttpGet]
        public ActionResult RememberPassword()
        {
            return PartialView("Widgets/Remember", new RegainModel());
        }

        [HttpPost]
        public ActionResult RememberPassword(RegainModel model)
        {
            if (ModelState.IsValid)
            {
                if (SecurityService.ValidateUser(model.EMailRem, model.Captcha, false, ModelState))
                {
                    var account = SecurityService.RememberPassword(model.EMailRem);
                    if (account != null)
                        //Выслать на почту письмо с кодом восстановления
                        mailer.SendRegainPasswordMail(account.NameAndSurname, account.email, account.rememberpass_guid);

                    return PartialView("Widgets/Remember", new RegainModel() { Success = true });
                }
            }

            model.Captcha = string.Empty;

            return PartialView("Widgets/Remember", model);
        }

        [HttpGet]
        public ActionResult RegainPassword(string email, Guid? regainkey)
        {
            if (!regainkey.HasValue) { return View(model: "Не указан код восстановления."); }
            string errorMessage;

            try
            {
                if (SecurityService.ValidateRegainPassword(email, regainkey.Value, out errorMessage))
                {
                    // если вошли до того - выходим
                    if (SecurityService.IsAuthorize)
                    {
                        SecurityService.SignOut();
                    }

                    // входим этим аккаунтом
                    SecurityService.SignIn(email, false);

                    return RedirectToAction("ChangeRegainPassword");
                }
            }
            catch (Exception ex)
            {
                return View(model: ex.Message);
            }

            return View(model: errorMessage);
        }

        [Authorize403]
        public ActionResult ChangeRegainPassword()
        {
            return View(new ChangePasswordModel());
        }

        [HttpPost]
        [Authorize403]
        [ValidateInput(false)]
        public ActionResult ChangeRegainPassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                var acc = SecurityService.ChangePassword(model, HttpContext.UserPrincipal().id);
                if (acc != null)
                {
                    ViewBag.Success = true;
                    return View("RegainPassword", model: acc.ShortName);
                }
            }
            return View(model);
        }
        #endregion
    }
}
