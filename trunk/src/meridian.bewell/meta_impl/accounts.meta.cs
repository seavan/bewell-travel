﻿/* Automatically generated codefile, Meridian
 * Generated by magic, please do not interfere
 * Please sleep well and do not smoke. Love, Sam */

using System;
using System.Linq;
using System.Text;
using System.Data.Linq;
using System.Collections.Generic;

namespace meridian.bewell.proto
{
	public partial class accounts_meta
	{
		public accounts_meta()
		{
		}
		/* metafile template */
		public long id { get; set; }
		public string email { get; set; }
		public string firstname { get; set; }
		public string lastname { get; set; }
		public string secondname { get; set; }
		public long role_id { get; set; }
		public DateTime created { get; set; }
		public string password { get; set; }
		public System.Guid salt { get; set; }
		public System.Guid activation_guid { get; set; }
		public DateTime lastlogin { get; set; }
		public System.Guid rememberpass_guid { get; set; }
		/* metafile template */
	}
}