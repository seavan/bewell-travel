using System.Collections.Generic;
using System.Linq;
using System.Text;
using bewell.common.Sphinx;

namespace meridian.bewell.impl.Classes
{
    public sealed class FieldSetInfo
    {
        public FieldSetInfo()
        {
            Fields = new List<FieldInfo>();
        }

        public long Id { get; set; }
        public string Title { get; set; }
        public string Url { get; set; }
        public string FullUrl { get; set; }
        public List<FieldInfo> Fields { get; set; }
        public bool ShowGallery { get; set; }
        public bool ShowMap { get; set; }

        public void FormatAsText(StringBuilder builder)
        {
            foreach (var f in Fields)
            {
                if (string.IsNullOrWhiteSpace(f.Value)) 
                    continue;

                if (!string.IsNullOrWhiteSpace(f.Title))
                {
                    builder.Append(f.Title.Trim());
                    builder.Append(" ");
                }

                builder.Append(f.Value.Trim());

                if (f.Value.Length > 0 && f.Value.Last() != '.')
                {
                    builder.Append(". ");
                }
            }
        }
    }
}
