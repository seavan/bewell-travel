using System.Globalization;
using admin.db;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class prices : IPriceTable
    {
        public double Price
        {
            get { return price; }
        }

        public string Comment
        {
            get { return comment; }
        }

        public string Month
        {
            get
            {
                var mfi = DateTimeFormatInfo.GetInstance(CultureInfo.CurrentCulture.DateTimeFormat);
                return mfi != null ? mfi.GetMonthName(month) : new DateTimeFormatInfo().GetMonthName(month);
            }
        }

        public IDatabaseEntity EntityContainer
        {
            get { return Meridian.Default.GetAs<IDatabaseEntity>(proto_name, entity_id); }
        }
    }
}
