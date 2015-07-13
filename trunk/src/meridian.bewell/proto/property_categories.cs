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
	[MetadataType(typeof(property_categories_meta))]	public partial class property_categories : admin.db.IDatabaseEntity
	{
		public property_categories()
		{
			category_properties = new List<properties>();
		}
		private long m_id = 0;
		internal bool mc_id { get; private set; }
		private string m_title = "";
		internal bool mc_title { get; private set; }
		private bool m_show_in_search = false;
		internal bool mc_show_in_search { get; private set; }
		private long m_order_number = 0;
		internal bool mc_order_number { get; private set; }
		public void LoadFromReader(MySqlDataReader _reader)
		{
			m_id = _reader["id"].GetType() != typeof(System.DBNull) ? _reader.GetInt64("id") : 0;
			mc_id = false;
			m_title = _reader["title"].GetType() != typeof(System.DBNull) ? _reader.GetString("title") : "";
			mc_title = false;
			m_show_in_search = _reader["show_in_search"].GetType() != typeof(System.DBNull) ? _reader.GetBoolean("show_in_search") : false;
			mc_show_in_search = false;
			m_order_number = _reader["order_number"].GetType() != typeof(System.DBNull) ? _reader.GetInt64("order_number") : 0;
			mc_order_number = false;
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
			get { return "property_categories"; }
		}
		/* metafile template 
		internal class property_categories_meta
		{
			public long id { get; set; }
			public string title { get; set; }
			public bool show_in_search { get; set; }
			public long order_number { get; set; }
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
		public bool show_in_search
		{
			get
			{
				return m_show_in_search;
			}
			set
			{
				if(m_show_in_search != value)
				{
					m_show_in_search = value != null ? value : false;
					mc_show_in_search = true;
					// call update worker thread;
				}
			}
		}
		public long order_number
		{
			get
			{
				return m_order_number;
			}
			set
			{
				if(m_order_number != value)
				{
					m_order_number = value != null ? value : 0;
					mc_order_number = true;
					// call update worker thread;
				}
			}
		}
		private List<properties> category_properties
		{
			get; set; 
		}
		[ScriptIgnore]
		public IEnumerable<properties> Properties
		{
			get { return category_properties; }
		}
		public IEnumerable<properties> GetProperties()
		{
			return category_properties;
		}
		public properties AddProperties(properties _item, bool _insertToStore = false)
		{
			if(category_properties.IndexOf(_item) != -1) return _item;
			category_properties.Add(_item);
			_item.category_id = id;
			if(_insertToStore && !Meridian.Default.propertiesStore.Exists(_item.id))
			{
				Meridian.Default.propertiesStore.Insert(_item);
				_item.LoadAggregations(Meridian.Default);
			}
			return _item;
		}
		public properties RemoveProperties(properties _item, bool _complete = false)
		{
			category_properties.Remove(_item);
			if(_complete) Meridian.Default.propertiesStore.Delete(_item);
			return _item;
		}
	}
}
