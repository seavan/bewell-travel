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
	public partial class questions_meta
	{
		public questions_meta()
		{
		}
		/* metafile template */
		public long id { get; set; }
		public long account_id { get; set; }
		public DateTime ask_date { get; set; }
		public string asking_user_name { get; set; }
		public string asking_user_email { get; set; }
		public string question { get; set; }
		public long replier_account_id { get; set; }
		public string reply_text { get; set; }
		/* metafile template */
	}
}