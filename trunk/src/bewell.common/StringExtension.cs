using System.Text.RegularExpressions;
using System.Web;
using bewell.common;

namespace System
{
    public static class StringExtension
    {
        private const string NameStringPattern = @"[<>/\\'=\$`\*\^%\?\+\!@#;:\.,&«»-]+";
        
        public static string ClearTranslateName(this String str, bool noLower = false, bool noSubstr = false, bool noWhiteSpace = true)
        {
            if (!string.IsNullOrEmpty(str))
            {
                str = HttpUtility.HtmlDecode(str);
                Regex rgx = new Regex(NameStringPattern);
                str = rgx.Replace(str, "").Trim();
                if (noWhiteSpace) str = str.Replace(" ", "_");
                str = str.Replace("\"", "").Replace("|", "").Replace("\n", "").Replace("\r", "").Replace("(", "").Replace(")", "");
                if (!noLower) str = str.ToLower();
                if (str.Length > 100 && !noSubstr)
                {
                    str = str.Substring(0, 100);
                }
            }

            return str;
        }

        public static string TransliterateAndClear(this String str)
        {
            return Transliteration.Front(str).ClearTranslateName();
        }
        
        public static string Transliterate(this String str)
        {
            return Transliteration.Front(str);
        }


        public static string ClearGeoLocationData(this string str)
        {
            if (!string.IsNullOrEmpty(str))
            {
                str = str.Replace("\"", "\\\"").Replace("\r", "").Replace("\n", "");
            }
            return str;
        }
    }
}