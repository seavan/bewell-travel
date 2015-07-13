using System;

namespace bewell.Classes.Sitemap
{
    public class SitemapItem
    {
        public string Url { get; set; }
        public ChangeFrequency Frequency { get; set; }
        public DateTime LastModified { get; set; }
        public double Priority { get; set; }
            
        public SitemapItem()
        {
            LastModified = DateTime.Now;
            Priority = 0.8;
            Frequency = ChangeFrequency.Always;
        }
    }
}