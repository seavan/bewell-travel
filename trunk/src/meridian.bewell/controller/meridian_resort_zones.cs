﻿/* Automatically generated codefile, Meridian
 * Generated by magic, please do not interfere
 * Please sleep well and do not smoke. Love, Sam */

using System;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using meridian.bewell;
using meridian.bewell.system;
using meridian.bewell.proto;
using admin.web.common;

namespace meridian.bewell.controller
{
	public partial class meridian_resort_zones : BaseUniversalController<resort_zones>
	{
		public meridian_resort_zones()
		{
		}
		protected override admin.db.IDataService<resort_zones> GetService()
		{
			return Meridian.Default.resort_zonesStore;
		}
	}
}
