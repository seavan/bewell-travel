using System.Collections.Generic;

namespace bewell.common
{
    public static class Transliteration
    {
        private static readonly Dictionary<string, string> Gost = new Dictionary<string, string>(); //ГОСТ 16876-71
        private static readonly Dictionary<string, string> ISO = new Dictionary<string, string>(); //ISO 9-95

        public static string Front(string text)
        {
            return Front(text, TransliterationType.ISO);
        }
        public static string Front(string text, TransliterationType type)
        {
            string output = text;
            Dictionary<string, string> tdict = GetDictionaryByType(type);

            foreach (var key in tdict)
            {
                output = output.Replace(key.Key, key.Value);
            }
            return output;
        }
        public static string Back(string text)
        {
            return Back(text, TransliterationType.ISO);
        }
        public static string Back(string text, TransliterationType type)
        {
            string output = text;
            Dictionary<string, string> tdict = GetDictionaryByType(type);

            foreach (var key in tdict)
            {
                output = output.Replace(key.Value, key.Key);
            }
            return output;
        }

        private static Dictionary<string, string> GetDictionaryByType(TransliterationType type)
        {
            Dictionary<string, string> tdict = ISO;
            if (type == TransliterationType.Gost) tdict = Gost;
            return tdict;
        }

        static Transliteration()
        {
            Gost.Add("Є", "EH");
            Gost.Add("І", "I");
            Gost.Add("і", "i");
            Gost.Add("№", "#");
            Gost.Add("є", "eh");
            Gost.Add("А", "A");
            Gost.Add("Б", "B");
            Gost.Add("В", "V");
            Gost.Add("Г", "G");
            Gost.Add("Д", "D");
            Gost.Add("Е", "E");
            Gost.Add("Ё", "JO");
            Gost.Add("Ж", "ZH");
            Gost.Add("З", "Z");
            Gost.Add("И", "I");
            Gost.Add("Й", "JJ");
            Gost.Add("К", "K");
            Gost.Add("Л", "L");
            Gost.Add("М", "M");
            Gost.Add("Н", "N");
            Gost.Add("О", "O");
            Gost.Add("П", "P");
            Gost.Add("Р", "R");
            Gost.Add("С", "S");
            Gost.Add("Т", "T");
            Gost.Add("У", "U");
            Gost.Add("Ф", "F");
            Gost.Add("Х", "KH");
            Gost.Add("Ц", "C");
            Gost.Add("Ч", "CH");
            Gost.Add("Ш", "SH");
            Gost.Add("Щ", "SHH");
            Gost.Add("Ъ", "'");
            Gost.Add("Ы", "Y");
            Gost.Add("Ь", "");
            Gost.Add("Э", "EH");
            Gost.Add("Ю", "YU");
            Gost.Add("Я", "YA");
            Gost.Add("а", "a");
            Gost.Add("б", "b");
            Gost.Add("в", "v");
            Gost.Add("г", "g");
            Gost.Add("д", "d");
            Gost.Add("е", "e");
            Gost.Add("ё", "jo");
            Gost.Add("ж", "zh");
            Gost.Add("з", "z");
            Gost.Add("и", "i");
            Gost.Add("й", "jj");
            Gost.Add("к", "k");
            Gost.Add("л", "l");
            Gost.Add("м", "m");
            Gost.Add("н", "n");
            Gost.Add("о", "o");
            Gost.Add("п", "p");
            Gost.Add("р", "r");
            Gost.Add("с", "s");
            Gost.Add("т", "t");
            Gost.Add("у", "u");

            Gost.Add("ф", "f");
            Gost.Add("х", "kh");
            Gost.Add("ц", "c");
            Gost.Add("ч", "ch");
            Gost.Add("ш", "sh");
            Gost.Add("щ", "shh");
            Gost.Add("ъ", "");
            Gost.Add("ы", "y");
            Gost.Add("ь", "");
            Gost.Add("э", "eh");
            Gost.Add("ю", "yu");
            Gost.Add("я", "ya");
            Gost.Add("«", "");
            Gost.Add("»", "");
            Gost.Add("—", "-");

            ISO.Add("Є", "YE");
            ISO.Add("І", "I");
            ISO.Add("Ѓ", "G");
            ISO.Add("і", "i");
            ISO.Add("№", "#");
            ISO.Add("є", "ye");
            ISO.Add("ѓ", "g");
            ISO.Add("А", "A");
            ISO.Add("Б", "B");
            ISO.Add("В", "V");
            ISO.Add("Г", "G");
            ISO.Add("Д", "D");
            ISO.Add("Е", "E");
            ISO.Add("Ё", "YO");
            ISO.Add("Ж", "ZH");
            ISO.Add("З", "Z");
            ISO.Add("И", "I");
            ISO.Add("Й", "J");
            ISO.Add("К", "K");
            ISO.Add("Л", "L");
            ISO.Add("М", "M");
            ISO.Add("Н", "N");
            ISO.Add("О", "O");
            ISO.Add("П", "P");
            ISO.Add("Р", "R");
            ISO.Add("С", "S");
            ISO.Add("Т", "T");
            ISO.Add("У", "U");
            ISO.Add("Ф", "F");
            ISO.Add("Х", "X");
            ISO.Add("Ц", "C");
            ISO.Add("Ч", "CH");
            ISO.Add("Ш", "SH");
            ISO.Add("Щ", "SHH");
            ISO.Add("Ъ", "'");
            ISO.Add("Ы", "Y");
            ISO.Add("Ь", "");
            ISO.Add("Э", "E");
            ISO.Add("Ю", "YU");
            ISO.Add("Я", "YA");
            ISO.Add("а", "a");
            ISO.Add("б", "b");
            ISO.Add("в", "v");
            ISO.Add("г", "g");
            ISO.Add("д", "d");
            ISO.Add("е", "e");
            ISO.Add("ё", "yo");
            ISO.Add("ж", "zh");
            ISO.Add("з", "z");
            ISO.Add("и", "i");
            ISO.Add("й", "j");
            ISO.Add("к", "k");
            ISO.Add("л", "l");
            ISO.Add("м", "m");
            ISO.Add("н", "n");
            ISO.Add("о", "o");
            ISO.Add("п", "p");
            ISO.Add("р", "r");
            ISO.Add("с", "s");
            ISO.Add("т", "t");
            ISO.Add("у", "u");
            ISO.Add("ф", "f");
            ISO.Add("х", "x");
            ISO.Add("ц", "c");
            ISO.Add("ч", "ch");
            ISO.Add("ш", "sh");
            ISO.Add("щ", "shh");
            ISO.Add("ъ", "");
            ISO.Add("ы", "y");
            ISO.Add("ь", "");
            ISO.Add("э", "e");
            ISO.Add("ю", "yu");
            ISO.Add("я", "ya");
            ISO.Add("«", "");
            ISO.Add("»", "");
            ISO.Add("—", "-");
        }
    }
}
