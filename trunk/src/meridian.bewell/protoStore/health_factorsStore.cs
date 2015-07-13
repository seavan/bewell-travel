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

namespace meridian.bewell.protoStore
{
	public partial class health_factorsStore : Meridian.IEntityStore, admin.db.IDataService<proto.health_factors>
	{
		public health_factorsStore()
		{
			m_Items = new SortedList<long, proto.health_factors>();
		}
		private SortedList<long, proto.health_factors> m_Items;
		public void Commit()
		{
			//throw new NotImplementedException();
		}
		public IQueryable<proto.health_factors> GetAll()
		{
			return Queryable.AsQueryable<proto.health_factors>(All());
		}
		public proto.health_factors GetById(long id)
		{
			return Get(id);
		}
		void admin.db.IDataService<proto.health_factors>.Insert(proto.health_factors item)
		{
			Insert(item);
		}
		void admin.db.IDataService<proto.health_factors>.Delete(proto.health_factors item)
		{
			Delete(item);
		}
		public proto.health_factors CreateItem()
		{
			return new proto.health_factors() {   };
		}
		public void AbortItem(proto.health_factors item)
		{
			Delete(item);
		}
		public void Discard()
		{
			;
		}
		void admin.db.IDataService<proto.health_factors>.Update(proto.health_factors item)
		{
			Persist(item);
		}
		public object GetObject(long _id)
		{
			return Get(_id);
		}
		public System.Type GetObjectType()
		{
			return typeof(proto.health_factors);
		}
		public void DeleteById(long _id)
		{
			Delete(Get(_id));
		}
		public void UpdateById(long _id)
		{
			Update(Get(_id));
		}
		public void LoadAggregations(Meridian _meridian)
		{
			foreach(var item in m_Items.Values)
			{
				item.LoadAggregations(_meridian);
			}
		}
		public void LoadCompositions(Meridian _meridian)
		{
			foreach(var item in m_Items.Values)
			{
				item.LoadCompositions(_meridian);
			}
		}
		public void Select(MySqlConnection _connection)
		{
			var cmd = new MySqlCommand("SELECT `id`, `title`, `parent_id`, `show_on_sitemap` FROM health_factors");
			cmd.Connection = _connection;
			using(var reader = cmd.ExecuteReader())
			{
				while(reader.Read())
				{
					var item = new proto.health_factors();
					item.LoadFromReader(reader);
					m_Items[item.id] = item;
				}
			}
		}
		public proto.health_factors Insert(MySqlConnection _connection, proto.health_factors _item)
		{
			var cmd = new MySqlCommand("INSERT INTO health_factors ( `title`, `parent_id`, `show_on_sitemap` ) VALUES ( @title, @parent_id, @show_on_sitemap ); SELECT LAST_INSERT_ID();"); ;
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "title", Value = _item.title });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "parent_id", Value = _item.parent_id });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "show_on_sitemap", Value = _item.show_on_sitemap });
			cmd.Connection = _connection;
			_item.id = Convert.ToInt64(cmd.ExecuteScalar());
			m_Items.Add(_item.id, _item);
			_item.LoadAggregations(Meridian.Default);
			return _item;
		}
		public proto.health_factors Update(MySqlConnection _connection, proto.health_factors _item)
		{
			bool changed =  false;
			var cmdText =  "";
			var cmd = new MySqlCommand("UPDATE health_factors SET `title`= @title, `parent_id`= @parent_id, `show_on_sitemap`= @show_on_sitemap WHERE id=@id"); ;
			if(_item.mc_id)
			{
			}
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "id", Value = _item.id });
			if(_item.mc_title)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`title` = @title";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "title", Value = _item.title != null ? (object)_item.title : DBNull.Value });
			}
			if(_item.mc_parent_id)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`parent_id` = @parent_id";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "parent_id", Value = _item.parent_id });
			}
			if(_item.mc_show_on_sitemap)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`show_on_sitemap` = @show_on_sitemap";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "show_on_sitemap", Value = _item.show_on_sitemap });
			}
			if(changed)
			{
				cmd.CommandText =  "UPDATE health_factors SET " + cmdText + " WHERE id=@id";
				cmd.Connection = _connection;
				cmd.ExecuteNonQuery();
				_item.LoadAggregations(Meridian.Default);
			}
			return _item;
		}
		public proto.health_factors Delete(MySqlConnection _connection, proto.health_factors _item)
		{
			var cmd = new MySqlCommand("DELETE FROM health_factors WHERE id=@id"); ;
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "id", Value = _item.id });
			cmd.Connection = _connection;
			cmd.ExecuteScalar();
			return _item;
		}
		public proto.health_factors Insert(proto.health_factors _item)
		{
			MeridianMonitor.Default.MySqlActionForeground((conn) => Insert(conn, _item));;
			return _item;
		}
		public proto.health_factors Persist(proto.health_factors _item)
		{
			if(_item.id <= 0)
			{
				_item = Insert(_item);
			}
			_item = Update(_item);
			return _item;
		}
		public proto.health_factors Delete(proto.health_factors _item)
		{
			_item.DeleteCompositions(Meridian.Default);
			_item.DeleteAggregations();
			m_Items.Remove(_item.id);
			MeridianMonitor.Default.MySqlActionBackground((conn) => Delete(conn, _item));;
			return _item;
		}
		public proto.health_factors Update(proto.health_factors _item)
		{
			MeridianMonitor.Default.MySqlActionBackground((conn) => Update(conn, _item));;
			return _item;
		}
		public IList<proto.health_factors> All()
		{
			return m_Items.Values;
		}
		public proto.health_factors Get(long _id)
		{
			return m_Items[_id];
		}
		public bool Exists(long _id)
		{
			return m_Items.ContainsKey(_id);
		}
		public void UpdateSync(MySqlConnection _connection, long _id, Meridian _meridian)
		{
			if (!Exists(_id))
			{
			return;
			}
			var item = Get(_id);
			var cmd = new MySqlCommand("SELECT `id`, `title`, `parent_id`, `show_on_sitemap` FROM health_factors WHERE id = " + _id.ToString());
			cmd.Connection = _connection;
			using(var reader = cmd.ExecuteReader())
			{
				while(reader.Read())
				{
					item.DeleteCompositions(Meridian.Default);
					item.DeleteAggregations();
					item.LoadFromReader(reader);
					item.LoadAggregations(_meridian);
					item.LoadCompositions(_meridian);
				}
			}
		}
		public void InsertSync(MySqlConnection _connection, long _id, Meridian _meridian)
		{
			if(Exists(_id)) return;;
			var cmd = new MySqlCommand("SELECT `id`, `title`, `parent_id`, `show_on_sitemap` FROM health_factors WHERE id = " + _id.ToString());
			cmd.Connection = _connection;
			using(var reader = cmd.ExecuteReader())
			{
				while(reader.Read())
				{
					var item = new proto.health_factors();
					item.LoadFromReader(reader);
					item.LoadAggregations(_meridian);
					item.LoadCompositions(_meridian);
					m_Items.Add(item.id, item);
				}
			}
		}
		public void DeleteSync(MySqlConnection _connection, long _id, Meridian _meridian)
		{
			if (!Exists(_id))
			{
			return;
			}
			var item = Get(_id);
			item.DeleteCompositions(Meridian.Default);
			item.DeleteAggregations();
			m_Items.Remove(item.id);
		}
	}
}