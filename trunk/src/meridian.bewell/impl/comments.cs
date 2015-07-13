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
    public partial class comments : ILookupValueAspectProvider
	{
        public ILookupValueAspect GetLookupValueAspect(string _fieldName)
        {
            switch (_fieldName)
            {
                case "account_id":
                    return new LookupAspect("account_id", this,
                        () => Meridian.Default.accountsStore.All());
            }

            return null;
        }

        public string entityUrl
        {
            get
            {
                switch (proto_name)
                {
                    case "hotels":
                        {
                            var hotel = Meridian.Default.hotelsStore.All().First(h => h.id == entity_id);
                            return String.Format("{0}comments|{1}", hotel.EntityUri(), hotel.title);
                            break;
                        }
                    case "resorts":
                        {
                            var resort = Meridian.Default.resortsStore.All().First(h => h.id == entity_id);
                            return String.Format("{0}comments|{1}", resort.EntityUri(), resort.title);
                            break;
                        }
                }

                return string.Empty;
            }
        }
	}
}
