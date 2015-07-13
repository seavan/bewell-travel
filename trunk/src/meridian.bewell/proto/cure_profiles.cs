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
	[MetadataType(typeof(cure_profiles_meta))]	public partial class cure_profiles : admin.db.IDatabaseEntity
	{
		public cure_profiles()
		{
			cure_profiles_deseases = new List<deseases>();
			cure_profiles_items = new List<resorts>();
			ad_cure_profiles_items = new List<resorts>();
		}
		private long m_id = 0;
		internal bool mc_id { get; private set; }
		private string m_title = "";
		internal bool mc_title { get; private set; }
		private long m_gender_id = 0;
		internal bool mc_gender_id { get; private set; }
		private string m_css_class = "";
		internal bool mc_css_class { get; private set; }
		private int m_item_order = 0;
		internal bool mc_item_order { get; private set; }
		public void LoadFromReader(MySqlDataReader _reader)
		{
			m_id = _reader["id"].GetType() != typeof(System.DBNull) ? _reader.GetInt64("id") : 0;
			mc_id = false;
			m_title = _reader["title"].GetType() != typeof(System.DBNull) ? _reader.GetString("title") : "";
			mc_title = false;
			m_gender_id = _reader["gender_id"].GetType() != typeof(System.DBNull) ? _reader.GetInt64("gender_id") : 0;
			mc_gender_id = false;
			m_css_class = _reader["css_class"].GetType() != typeof(System.DBNull) ? _reader.GetString("css_class") : "";
			mc_css_class = false;
			m_item_order = _reader["item_order"].GetType() != typeof(System.DBNull) ? _reader.GetInt32("item_order") : 0;
			mc_item_order = false;
		}
		public void LoadAggregations(Meridian _meridian)
		{
		}
		public void DeleteAggregations()
		{
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
			get { return "cure_profiles"; }
		}
		/* metafile template 
		internal class cure_profiles_meta
		{
			public long id { get; set; }
			public string title { get; set; }
			public long gender_id { get; set; }
			public string css_class { get; set; }
			public int item_order { get; set; }
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
		public long gender_id
		{
			get
			{
				return m_gender_id;
			}
			set
			{
				if(m_gender_id != value)
				{
					m_gender_id = value != null ? value : 0;
					mc_gender_id = true;
					// call update worker thread;
				}
			}
		}
		public string css_class
		{
			get
			{
				return m_css_class;
			}
			set
			{
				if(m_css_class != value)
				{
					m_css_class = value != null ? value : "";
					mc_css_class = true;
					// call update worker thread;
				}
			}
		}
		public int item_order
		{
			get
			{
				return m_item_order;
			}
			set
			{
				if(m_item_order != value)
				{
					m_item_order = value != null ? value : 0;
					mc_item_order = true;
					// call update worker thread;
				}
			}
		}
		private List<deseases> cure_profiles_deseases
		{
			get; set; 
		}
		[ScriptIgnore]
		public IEnumerable<deseases> Deseases
		{
			get { return cure_profiles_deseases; }
		}
		public IEnumerable<deseases> GetDeseases()
		{
			return cure_profiles_deseases;
		}
		public deseases AddDeseases(deseases _item, bool _insertToStore = false)
		{
			if(cure_profiles_deseases.IndexOf(_item) != -1) return _item;
			cure_profiles_deseases.Add(_item);
			_item.profile_id = id;
			if(_insertToStore && !Meridian.Default.deseasesStore.Exists(_item.id))
			{
				Meridian.Default.deseasesStore.Insert(_item);
				_item.LoadAggregations(Meridian.Default);
			}
			return _item;
		}
		public deseases RemoveDeseases(deseases _item, bool _complete = false)
		{
			cure_profiles_deseases.Remove(_item);
			if(_complete) Meridian.Default.deseasesStore.Delete(_item);
			return _item;
		}
		[ScriptIgnore]
		[ScaffoldColumn(false)]
		public List<resorts> cure_profiles_items
		{
			get; set; 
		}
		public void add_resorts_item(long id)
		{
			if (Meridian.Default.resortsStore.Exists(id))
			{
				if (!cure_profiles_items.Any(s => s.id.Equals(id)))
				{
					cure_profiles_items.Add(Meridian.Default.resortsStore.Get(id));
					SaveCompositions(Meridian.Default);
				}
			}
		}
		public void remove_resorts_item(long id)
		{
			if (cure_profiles_items.Any(s => s.id.Equals(id)))
			{
				cure_profiles_items.Remove(cure_profiles_items.Single(s => s.id.Equals(id)));;
				SaveCompositions(Meridian.Default);
			}
		}
		[ScriptIgnore]
		[ScaffoldColumn(false)]
		public List<resorts> ad_cure_profiles_items
		{
			get; set; 
		}
		public void add_resorts_ad_item(long id)
		{
			if (Meridian.Default.resortsStore.Exists(id))
			{
				if (!ad_cure_profiles_items.Any(s => s.id.Equals(id)))
				{
					ad_cure_profiles_items.Add(Meridian.Default.resortsStore.Get(id));
					SaveCompositions(Meridian.Default);
				}
			}
		}
		public void remove_resorts_ad_item(long id)
		{
			if (ad_cure_profiles_items.Any(s => s.id.Equals(id)))
			{
				ad_cure_profiles_items.Remove(ad_cure_profiles_items.Single(s => s.id.Equals(id)));;
				SaveCompositions(Meridian.Default);
			}
		}
	}
}