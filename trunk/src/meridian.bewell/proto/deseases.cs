﻿/* Automatically generated codefile, Meridian
 * Generated by magic, please do not interfere
 * Please sleep well and do not smoke. Love, Sam */

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
	[MetadataType(typeof(deseases_meta))]	public partial class deseases : admin.db.IDatabaseEntity
	{
		public deseases()
		{
			deseases_items = new List<hotels>();
		}
		private long m_id = 0;
		internal bool mc_id { get; private set; }
		private string m_icd_code = "";
		internal bool mc_icd_code { get; private set; }
		private string m_title = "";
		internal bool mc_title { get; private set; }
		private string m_international_title = "";
		internal bool mc_international_title { get; private set; }
		private long m_profile_id = 0;
		internal bool mc_profile_id { get; private set; }
		public void LoadFromReader(MySqlDataReader _reader)
		{
			m_id = _reader["id"].GetType() != typeof(System.DBNull) ? _reader.GetInt64("id") : 0;
			mc_id = false;
			m_icd_code = _reader["icd_code"].GetType() != typeof(System.DBNull) ? _reader.GetString("icd_code") : "";
			mc_icd_code = false;
			m_title = _reader["title"].GetType() != typeof(System.DBNull) ? _reader.GetString("title") : "";
			mc_title = false;
			m_international_title = _reader["international_title"].GetType() != typeof(System.DBNull) ? _reader.GetString("international_title") : "";
			mc_international_title = false;
			m_profile_id = _reader["profile_id"].GetType() != typeof(System.DBNull) ? _reader.GetInt64("profile_id") : 0;
			mc_profile_id = false;
		}
		public void LoadAggregations(Meridian _meridian)
		{
			if((profile_id > 0) && (_meridian.cure_profilesStore.Exists(profile_id)))
			{
				this.cure_profiles_deseases_cure_profiles = _meridian.cure_profilesStore.Get(profile_id);;
				this.cure_profiles_deseases_cure_profiles.AddDeseases(this);
			}
		}
		public void DeleteAggregations()
		{
			if(this.cure_profiles_deseases_cure_profiles != null)
			{
				this.cure_profiles_deseases_cure_profiles.RemoveDeseases(this);
			}
		}
		public void LoadCompositions(Meridian _meridian)
		{
			string[] keyIds = null;
		}
		public void SaveCompositions(Meridian _meridian)
		{
		}
		public void DeleteCompositions(Meridian _meridian)
		{
			string[] keyIds = null;
		}
		public string ProtoName
		{
			get { return "deseases"; }
		}
		/* metafile template 
		internal class deseases_meta
		{
			public long id { get; set; }
			public string icd_code { get; set; }
			public string title { get; set; }
			public string international_title { get; set; }
			public long profile_id { get; set; }
		}
		 metafile template */
		public long id
		{
			get
			{
				return m_id;
			}
			set
			{
				if(m_id != value)
				{
					m_id = value != null ? value : 0;
					mc_id = true;
					// call update worker thread;
				}
			}
		}
		public string icd_code
		{
			get
			{
				return m_icd_code;
			}
			set
			{
				if(m_icd_code != value)
				{
					m_icd_code = value != null ? value : "";
					mc_icd_code = true;
					// call update worker thread;
				}
			}
		}
		public string title
		{
			get
			{
				return m_title;
			}
			set
			{
				if(m_title != value)
				{
					m_title = value != null ? value : "";
					mc_title = true;
					// call update worker thread;
				}
			}
		}
		public string international_title
		{
			get
			{
				return m_international_title;
			}
			set
			{
				if(m_international_title != value)
				{
					m_international_title = value != null ? value : "";
					mc_international_title = true;
					// call update worker thread;
				}
			}
		}
		public long profile_id
		{
			get
			{
				return m_profile_id;
			}
			set
			{
				if(m_profile_id != value)
				{
					m_profile_id = value != null ? value : 0;
					mc_profile_id = true;
					// call update worker thread;
				}
			}
		}
		private cure_profiles cure_profiles_deseases_cure_profiles
		{
			get; set; 
		}
		public cure_profiles GetDeseasesCure_profile()
		{
			return cure_profiles_deseases_cure_profiles ;
		}
		[ScriptIgnore]
		[ScaffoldColumn(false)]
		public List<hotels> deseases_items
		{
			get; set; 
		}
		public void add_hotels_item(long id)
		{
			if (Meridian.Default.hotelsStore.Exists(id))
			{
				if (!deseases_items.Any(s => s.id.Equals(id)))
				{
					deseases_items.Add(Meridian.Default.hotelsStore.Get(id));
					SaveCompositions(Meridian.Default);
				}
			}
		}
		public void remove_hotels_item(long id)
		{
			if (deseases_items.Any(s => s.id.Equals(id)))
			{
				deseases_items.Remove(deseases_items.Single(s => s.id.Equals(id)));;
				SaveCompositions(Meridian.Default);
			}
		}
	}
}
