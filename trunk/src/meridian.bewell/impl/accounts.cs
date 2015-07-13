using System;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Script.Serialization;
using MySql.Data.MySqlClient;
using meridian.bewell;
using meridian.bewell.system;

namespace meridian.bewell.proto
{
    public partial class accounts : ILookupValue
	{
        public bool IsActivated
        {
            get { return activation_guid == default(Guid); }
        }
        public string ShortName
        {
            get { return String.Format("{0} {1}", lastname, firstname); }
        }
        public string FullName
        {
            get { return String.Format("{0} {1} {2}", lastname, firstname, secondname); }
        }

        public string NameAndSurname
        {
            get { return string.Format("{0} {1}", firstname, lastname); }
        }

        public string title
        {
            get { return NameAndSurname; }
        }

        public int GetLookupValueLevel()
        {
            return 0;
        }

        public bool GetLookupValueDisabled()
        {
            return false;
        }
	}
}
