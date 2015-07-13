using System.Collections.Generic;
using meridian.bewell.proto;

namespace bewell.Models.ViewModels
{
    public class DictionaryViewModel
    {
        public List<dictionary> Words { get; set; }
        public dictionary CurrentWord { get; set; }
        public char CurrentLetter { get; set; }
    }
}