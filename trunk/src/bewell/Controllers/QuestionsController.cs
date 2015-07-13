using System;
using System.Linq;
using System.Web.Mvc;
using bewell.Classes;
using bewell.Models.ViewModels;
using bewell.Services;
using meridian.bewell.proto;

namespace bewell.Controllers
{
    public class QuestionsController : BaseController
    {
        public ActionResult Index()
        {
            const bool onlyAnswered = false;

            var questions = onlyAnswered
                ? meridian.questionsStore.All()
                    .Where(item => !string.IsNullOrEmpty(item.reply_text))
                    .OrderByDescending(item => item.ask_date)
                : meridian.questionsStore.All().OrderByDescending(item => item.ask_date);

            int pages = Extensions.Extensions.CalculatePagesCount(questions.Count());
            int currentPage = GetPage();
            var model = Extensions.Extensions.TakePage(questions, currentPage);
            ViewBag.PagesCount = pages;
            ViewBag.Page = currentPage;

            return View(model);
        }

        [HttpPost]
        public ActionResult Add(QuestionViewModel model)
        {
            if (ModelState.IsValid)
            {
                var question = new questions
                {
                    account_id = model.AccountId,
                    ask_date = DateTime.Now,
                    asking_user_email = model.Email,
                    asking_user_name = model.Name,
                    question = model.Question
                };

                meridian.questionsStore.Insert(question);

                model.QuestionId = question.id;
                CreateMailer().SendQuestion(model);
                PopupMessage.AddMessage("Раздел 'Задать вопрос'", "Мы получили ваш вопрос и с радостью ответим на него в ближайшее время");
            }

            return RedirectToAction("index", "questions");
        }

        public ActionResult QuestionForm()
        {
            var model = new QuestionViewModel();

            if (Request.IsAuthenticated)
            {
                var user = HttpContext.UserPrincipal();
                model.Name = user.NameAndSurname;
                model.Email = user.email;
                model.AccountId = user.id;
                model.Captcha = "authenticated"; //чтобы RequiredValidator не ругался (для авторизованных не показываем капчу)
            }

            return View(model);
        }
    }
}
