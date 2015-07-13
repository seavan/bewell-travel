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
	[MetadataType(typeof(health_factors_meta))]	public partial class health_factors : admin.db.IDatabaseEntity
	{
		public health_factors()
		{
			sub_health_factors = new List<health_factors>();
			health_factors_items = new List<resorts>();
		}
		private long m_id = 0;
		internal bool mc_id { get; private set; }
		private string m_title = "";
		internal bool mc_title { get; private set; }
		private long m_parent_id = 0;
		internal bool mc_parent_id { get; private set; }
		private bool m_show_on_sitemap = false;
		internal bool mc_show_on_sitemap { get; private set; }
		public void LoadFromReader(MySqlDataReader _reader)
		{
			m_id = _reader["id"].GetType() != typeof(System.DBNull) ? _reader.GetInt64("id") : 0;
			mc_id = false;
			m_title = _reader["title"].GetType() != typeof(System.DBNull) ? _reader.GetString("title") : "";
			mc_title = false;
			m_parent_id = _reader["parent_id"].GetType() != typeof(System.DBNull) ? _reader.GetInt64("parent_id") : 0;
			mc_parent_id = false;
			m_show_on_sitemap = _reader["show_on_sitemap"].GetType() != typeof(System.DBNull) ? _reader.GetBoolean("show_on_sitemap") : false;
			mc_show_on_sitemap = false;
		}
		public void LoadAggregations(Meridian _meridian)
		{
			if((parent_id > 0) && (_meridian.health_factorsStore.Exists(parent_id)))
			{
				this.sub_health_factors_health_factors = _meridian.health_factorsStore.Get(parent_id);;
				this.sub_health_factors_health_factors.AddSubHealthFactors(this);
			}
		}
		public void DeleteAggregations()
		{
			if(this.sub_health_factors_health_factors != null)
			{
				this.sub_health_factors_health_factors.RemoveSubHealthFactors(this);
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
			get { return "health_factors"; }
		}
		/* metafile template 
		internal class health_factors_meta
		{
			public long id { get; set; }
			public string title { get; set; }
			public long parent_id { get; set; }
			public bool show_on_sitemap { get; set; }
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
		public long parent_id
		{
			get
			{
				return m_parent_id;
			}
			set
			{
				if(m_parent_id != value)
				{
					m_parent_id = value != null ? value : 0;
					mc_parent_id = true;
					// call update worker thread;
				}
			}
		}
		public bool show_on_sitemap
		{
			get
			{
				return m_show_on_sitemap;
			}
			set
			{
				if(m_show_on_sitemap != value)
				{
					m_show_on_sitemap = value != null ? value : false;
					mc_show_on_sitemap = true;
					// call update worker thread;
				}
			}
		}
		private List<health_factors> sub_health_factors
		{
			get; set; 
		}
		[ScriptIgnore]
		public IEnumerable<health_factors> SubHealthFactors
		{
			get { return sub_health_factors; }
		}
		public IEnumerable<health_factors> GetSubHealthFactors()
		{
			return sub_health_factors;
		}
		public health_factors AddSubHealthFactors(health_factors _item, bool _insertToStore = false)
		{
			if(sub_health_factors.IndexOf(_item) != -1) return _item;
			sub_health_factors.Add(_item);
			_item.parent_id = id;
			if(_insertToStore && !Meridian.Default.health_factorsStore.Exists(_item.id))
			{
				Meridian.Default.health_factorsStore.Insert(_item);
				_item.LoadAggregations(Meridian.Default);
			}
			return _item;
		}
		public health_factors RemoveSubHealthFactors(health_factors _item, bool _complete = false)
		{
			sub_health_factors.Remove(_item);
			if(_complete) Meridian.Default.health_factorsStore.Delete(_item);
			return _item;
		}
		private health_factors sub_health_factors_health_factors
		{
			get; set; 
		}
		public health_factors GetSubHealthFactorsHealth_factor()
		{
			return sub_health_factors_health_factors ;
		}
		[ScriptIgnore]
		[ScaffoldColumn(false)]
		public List<resorts> health_factors_items
		{
			get; set; 
		}
		public void add_resorts_item(long id)
		{
			if (Meridian.Default.resortsStore.Exists(id))
			{
				if (!health_factors_items.Any(s => s.id.Equals(id)))
				{
					health_factors_items.Add(Meridian.Default.resortsStore.Get(id));
					SaveCompositions(Meridian.Default);
				}
			}
		}
		public void remove_resorts_item(long id)
		{
			if (health_factors_items.Any(s => s.id.Equals(id)))
			{
				health_factors_items.Remove(health_factors_items.Single(s => s.id.Equals(id)));;
				SaveCompositions(Meridian.Default);
			}
		}
	}
}
