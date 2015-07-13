using System;
using System.Collections.Generic;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using bewell.Classes;
using bewell.common.Sphinx;
using bewell.Models.CodeModels;
using bewell.Models.ModelValidators.Attributes;
using bewell.Models.ViewModels.Mail;
using bewell.Services;

using log4net;

using meridian.bewell.system;

using SNA.Controllers;
using System.Configuration;

namespace bewell.Controllers
{
    public abstract class BaseController : SNABaseController
    {
        protected static readonly ILog log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        protected Meridian meridian;

        public BaseController()
        {
            meridian = Meridian.Default;
        }

        public void InitUniqueId(bool rewrite = false)
        {
            HttpCookie cookie = Request.Cookies["buid"];
            if (cookie == null || rewrite)
            {
                cookie = new HttpCookie("buid", Guid.NewGuid().ToString());
                cookie.Expires = DateTime.Now.AddMinutes(20);
                Response.Cookies.Add(cookie);
            }
        }

        [HttpPost]
        [Authorize403]
        public ActionResult Index(Comment comment)
        {
            comment.AuthorId = HttpContext.UserPrincipal().id;
            long commentId = meridian.commentsStore.AddComment(comment);

            if (commentId > 0)
            {
                var model = new CommentViewModel();

                switch (comment.ProtoName.ToLower())
                {
                    case "hotels":
                        model.EntityName = meridian.hotelsStore.Get(comment.id).title;
                        model.EntityType = "отеля";
                        break;
                    case "resorts":
                        model.EntityName = meridian.resortsStore.Get(comment.id).title;
                        model.EntityType = "курорта";
                        break;
                }

                model.Comment = comment.CommentText;

                model.EntityUrl = Request.Url.ToString();
                model.EntityAdminUrl = string.Format("{0}://{1}/admin/admin_comments/Single/{2}",
                    Request.Url.Scheme, Request.Url.Authority, commentId);

                CreateMailer().SendCommentInfo(model);
            }

            return Redirect(Request.Url.AbsolutePath);
        }

        protected static void LogException(string message, Exception ex)
        {
            log.Error(message, ex);
        }

        protected void OutputSphinx(IEnumerable<ISphinxExportableEntity> items)
        {
            Response.ContentType = "text/xml";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            this.Response.Clear();

            var documents = new List<ISphinxSerializable>(512);
            foreach (var item in items)
                documents.AddRange(item.ExportToSphinx());

            using (SphinxXmlPipeWriter writer = new SphinxXmlPipeWriter(this.Response.OutputStream))
                writer.WriteDocuments(documents);

            this.Response.Flush();
            this.Response.End();
        }

        protected int GetPage()
        {
            string page = Request.QueryString["page"];
            int pageNumber;
            if (string.IsNullOrEmpty(page))
            {
                pageNumber = 1;
            }
            else
            {
                pageNumber = int.Parse(page);
            }

            return pageNumber;
        }

        protected Mailer CreateMailer()
        {
            string domainNameKey = "DomainName";
            string defaultDomainName = "bewell.etcetera.ws";

            return new Mailer(this, ConfigurationManager.AppSettings[domainNameKey] ?? defaultDomainName);
        }
    }
}