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
	public partial class resortsStore : Meridian.IEntityStore, admin.db.IDataService<proto.resorts>
	{
		public resortsStore()
		{
			m_Items = new SortedList<long, proto.resorts>();
		}
		private SortedList<long, proto.resorts> m_Items;
		public void Commit()
		{
			//throw new NotImplementedException();
		}
		public IQueryable<proto.resorts> GetAll()
		{
			return Queryable.AsQueryable<proto.resorts>(All());
		}
		public proto.resorts GetById(long id)
		{
			return Get(id);
		}
		void admin.db.IDataService<proto.resorts>.Insert(proto.resorts item)
		{
			Insert(item);
		}
		void admin.db.IDataService<proto.resorts>.Delete(proto.resorts item)
		{
			Delete(item);
		}
		public proto.resorts CreateItem()
		{
			return new proto.resorts() {   };
		}
		public void AbortItem(proto.resorts item)
		{
			Delete(item);
		}
		public void Discard()
		{
			;
		}
		void admin.db.IDataService<proto.resorts>.Update(proto.resorts item)
		{
			Persist(item);
		}
		public object GetObject(long _id)
		{
			return Get(_id);
		}
		public System.Type GetObjectType()
		{
			return typeof(proto.resorts);
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
			var cmd = new MySqlCommand("SELECT `id`, `title`, `territory_id`, `cure_profiles`, `ad_cure_profiles`, `health_factors`, `is_recomended`, `coordinates`, `noyayesgo`, `is_published` FROM resorts");
			cmd.Connection = _connection;
			using(var reader = cmd.ExecuteReader())
			{
				while(reader.Read())
				{
					var item = new proto.resorts();
					item.LoadFromReader(reader);
					m_Items[item.id] = item;
				}
			}
		}
		public proto.resorts Insert(MySqlConnection _connection, proto.resorts _item)
		{
			var cmd = new MySqlCommand("INSERT INTO resorts ( `title`, `territory_id`, `cure_profiles`, `ad_cure_profiles`, `health_factors`, `is_recomended`, `coordinates`, `noyayesgo`, `is_published` ) VALUES ( @title, @territory_id, @cure_profiles, @ad_cure_profiles, @health_factors, @is_recomended, @coordinates, @noyayesgo, @is_published ); SELECT LAST_INSERT_ID();"); ;
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "title", Value = _item.title });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "territory_id", Value = _item.territory_id });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "cure_profiles", Value = _item.cure_profiles });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "ad_cure_profiles", Value = _item.ad_cure_profiles });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "health_factors", Value = _item.health_factors });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "is_recomended", Value = _item.is_recomended });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "coordinates", Value = _item.coordinates });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "noyayesgo", Value = _item.noyayesgo });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "is_published", Value = _item.is_published });
			cmd.Connection = _connection;
			_item.id = Convert.ToInt64(cmd.ExecuteScalar());
			m_Items.Add(_item.id, _item);
			_item.LoadAggregations(Meridian.Default);
			return _item;
		}
		public proto.resorts Update(MySqlConnection _connection, proto.resorts _item)
		{
			bool changed =  false;
			var cmdText =  "";
			var cmd = new MySqlCommand("UPDATE resorts SET `title`= @title, `territory_id`= @territory_id, `cure_profiles`= @cure_profiles, `ad_cure_profiles`= @ad_cure_profiles, `health_factors`= @health_factors, `is_recomended`= @is_recomended, `coordinates`= @coordinates, `noyayesgo`= @noyayesgo, `is_published`= @is_published WHERE id=@id"); ;
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
			if(_item.mc_territory_id)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`territory_id` = @territory_id";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "territory_id", Value = _item.territory_id });
			}
			if(_item.mc_cure_profiles)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`cure_profiles` = @cure_profiles";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "cure_profiles", Value = _item.cure_profiles != null ? (object)_item.cure_profiles : DBNull.Value });
			}
			if(_item.mc_ad_cure_profiles)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`ad_cure_profiles` = @ad_cure_profiles";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "ad_cure_profiles", Value = _item.ad_cure_profiles != null ? (object)_item.ad_cure_profiles : DBNull.Value });
			}
			if(_item.mc_health_factors)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`health_factors` = @health_factors";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "health_factors", Value = _item.health_factors != null ? (object)_item.health_factors : DBNull.Value });
			}
			if(_item.mc_is_recomended)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`is_recomended` = @is_recomended";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "is_recomended", Value = _item.is_recomended });
			}
			if(_item.mc_coordinates)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`coordinates` = @coordinates";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "coordinates", Value = _item.coordinates != null ? (object)_item.coordinates : DBNull.Value });
			}
			if(_item.mc_noyayesgo)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`noyayesgo` = @noyayesgo";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "noyayesgo", Value = _item.noyayesgo });
			}
			if(_item.mc_is_published)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`is_published` = @is_published";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "is_published", Value = _item.is_published });
			}
			if(changed)
			{
				cmd.CommandText =  "UPDATE resorts SET " + cmdText + " WHERE id=@id";
				cmd.Connection = _connection;
				cmd.ExecuteNonQuery();
				_item.LoadAggregations(Meridian.Default);
			}
			return _item;
		}
		public proto.resorts Delete(MySqlConnection _connection, proto.resorts _item)
		{
			var cmd = new MySqlCommand("DELETE FROM resorts WHERE id=@id"); ;
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "id", Value = _item.id });
			cmd.Connection = _connection;
			cmd.ExecuteScalar();
			return _item;
		}
		public proto.resorts Insert(proto.resorts _item)
		{
			MeridianMonitor.Default.MySqlActionForeground((conn) => Insert(conn, _item));;
			return _item;
		}
		public proto.resorts Persist(proto.resorts _item)
		{
			if(_item.id <= 0)
			{
				_item = Insert(_item);
			}
			_item = Update(_item);
			return _item;
		}
		public proto.resorts Delete(proto.resorts _item)
		{
			_item.DeleteCompositions(Meridian.Default);
			_item.DeleteAggregations();
			m_Items.Remove(_item.id);
			MeridianMonitor.Default.MySqlActionBackground((conn) => Delete(conn, _item));;
			return _item;
		}
		public proto.resorts Update(proto.resorts _item)
		{
			MeridianMonitor.Default.MySqlActionBackground((conn) => Update(conn, _item));;
			return _item;
		}
		public IList<proto.resorts> All()
		{
			return m_Items.Values;
		}
		public proto.resorts Get(long _id)
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
			var cmd = new MySqlCommand("SELECT `id`, `title`, `territory_id`, `cure_profiles`, `ad_cure_profiles`, `health_factors`, `is_recomended`, `coordinates`, `noyayesgo`, `is_published` FROM resorts WHERE id = " + _id.ToString());
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
			var cmd = new MySqlCommand("SELECT `id`, `title`, `territory_id`, `cure_profiles`, `ad_cure_profiles`, `health_factors`, `is_recomended`, `coordinates`, `noyayesgo`, `is_published` FROM resorts WHERE id = " + _id.ToString());
			cmd.Connection = _connection;
			using(var reader = cmd.ExecuteReader())
			{
				while(reader.Read())
				{
					var item = new proto.resorts();
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