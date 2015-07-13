using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bewell.Models.ViewModels;

namespace bewell.Controllers
{
    public class DictionaryController : BaseController
    {
        public ActionResult Index(char letter = 'а', long id = 0)
        {
            var model = new DictionaryViewModel
            {
                Words = meridian.dictionaryStore.All()
                        .Where(item => item.word.ToLower().StartsWith(letter.ToString(CultureInfo.InvariantCulture)))
                        .OrderBy(item => item.word).ToList(),
                CurrentLetter = letter,
                CurrentWord = id > 0 ? meridian.dictionaryStore.Get(id) : null
            };

            return View(model);
        }

        public PartialViewResult Alphabet(char currentLetter)
        {
            const string alphabet = "абвгдежзиклмнопрстуфхцчшщэюя";
            
            var model = alphabet.ToDictionary(letter => letter, letter => meridian.dictionaryStore.All()
                .Count(item => item.word.ToLower().StartsWith(letter.ToString(CultureInfo.InvariantCulture))));
            
            ViewBag.CurrentLetter = currentLetter;
            
            return PartialView(model);
        }

        public ActionResult Word(char currentChar, long id)
        {
            return null;
        }
    }
}
