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
	public partial class comments_meta
	{
		public comments_meta()
		{
		}
		/* metafile template */
		public long id { get; set; }
		public int left_key { get; set; }
		public int right_key { get; set; }
		public int level { get; set; }
		public bool delete { get; set; }
		public DateTime create_date { get; set; }
		public long account_id { get; set; }
		public string text { get; set; }
		public long parent_id { get; set; }
		public long entity_id { get; set; }
		public string proto_name { get; set; }
		/* metafile template */
	}
}
