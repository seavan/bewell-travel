using System;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using meridian.bewell;
using meridian.bewell.system;
using admin.db;
using meridian.bewell.proto;

namespace meridian.bewell.protoStore
{
	public partial class accountsStore : Meridian.IEntityStore, IDataService<accounts>
	{
        public accounts GetAccountsByLogin(string email)
        {
            return All().FirstOrDefault(a => a.email == email);
        }
        public bool HasAccountByEmail(string email)
        {
            return All().Any(a => a.email == email);
        }
	}
}
