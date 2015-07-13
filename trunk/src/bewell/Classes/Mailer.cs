using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using bewell.Models.ViewModels;
using CuttingEdge.Conditions;
using Footboy.Shared;
using Footboy.Shared.Messages;
using bewell.common.Infrastructure;
using bewell.Models.ViewModels.Mail;

namespace bewell.Classes
{
    public class Mailer
    {
        private const string AdminEmail = "admin@bewell-travel.com";
        private const string BookingEmail = "booking@bewell-travel.com";

        private static readonly EndpointAddress FromAddress = new EmailAddress("bewell-travel.com", "noreply@bewell-travel.com");

        private Controller controller;
        private string currentDomainName;

        public Mailer(Controller controller, string currentDomainName)
        {
            Condition.Requires(controller, "controller").IsNotNull();
            Condition.Requires(currentDomainName, "currentDomainName").IsNotEmpty();

            this.controller = controller;
            this.currentDomainName = currentDomainName;
        }

        public void SendActivationMail(string name, string email, Guid guid)
        {
            SendLinkModel model = new SendLinkModel();
            model.Link = string.Format("http://{0}/Security/Activate?email={1}&activationKey={2}", currentDomainName, email, guid);

            var template = GetTemplate("AccountActivationEmail.aspx");
            var text = template.Apply(model);

            SendNotification(name, email, "Активация", text);
        }

        public void SendRegainPasswordMail(string name, string email, Guid guid)
        {
            SendLinkModel model = new SendLinkModel();
            model.Link = string.Format("http://{0}/Security/RegainPassword?email={1}&regainkey={2}", currentDomainName, email, guid);

            var template = GetTemplate("RegainPasswordEmail.aspx");
            var text = template.Apply(model);

            SendNotification(name, email, "Восстановление пароля", text);
        }

        public void SendOrderRequest(OrderRequestViewModel model)
        {
            var template = GetTemplate("OrderRequest.aspx");
            var text = template.Apply(model);

            SendNotification(string.Format("{0} {1}", model.LastName, model.FirstName), BookingEmail, "Запрос на бронирование", text);
        }

        public void SendCallMeRequest(CallMeViewModel model)
        {
            var template = GetTemplate("CallMeRequest.aspx");
            var text = template.Apply(model);

            SendNotification(string.Empty, AdminEmail, "Запрос перезвонить", text);
        }

        public void SendCommentInfo(CommentViewModel model)
        {
            var template = GetTemplate("CommentInfo.aspx");
            var text = template.Apply(model);

            SendNotification(string.Empty, AdminEmail, "Добавлен отзыв на сайт", text);
        }

        public void SendQuestion(QuestionViewModel model)
        {
            var template = GetTemplate("Question.aspx");
            var text = template.Apply(model);

            SendNotification(model.Name, AdminEmail, "Вопрос", text);
        }

        private void SendNotification(string name, string email, string subject, string text)
        {
            subject += "//уведомление от bewell-travel.com";
            var notification = new Notification(Footboy.Shared.Constants.EmailNotificationType,
                FromAddress, new EmailAddress(name, email), text, subject);

            INotificationSender sender = ServiceLocator.Instance.Locate<INotificationSender>();
            sender.Send(notification);
        }

        private ITemplate GetTemplate(string templateName)
        { 
            ITemplateProvider templateProvider = ServiceLocator.Instance.Locate<ITemplateProvider>();

            return templateProvider.GetTemplate(templateName, this.controller.ControllerContext);
        }
    }
}