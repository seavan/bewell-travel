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
	public partial class meridian_pages_files : BaseUniversalController<pages_files>
	{
		public meridian_pages_files()
		{
		}
		protected override admin.db.IDataService<pages_files> GetService()
		{
			return Meridian.Default.pages_filesStore;
		}
	}
}
