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
	public partial class changelog_meta
	{
		public changelog_meta()
		{
		}
		/* metafile template */
		public int changeid { get; set; }
		public string folder { get; set; }
		public int scriptnumber { get; set; }
		public string scriptname { get; set; }
		public DateTime startdate { get; set; }
		public DateTime completedate { get; set; }
		public string appliedby { get; set; }
		public byte scriptstatus { get; set; }
		public string scriptoutput { get; set; }
		/* metafile template */
	}
}
