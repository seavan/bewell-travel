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
	public partial class fieldset_fields_orderStore : Meridian.IEntityStore, admin.db.IDataService<proto.fieldset_fields_order>
	{
		public fieldset_fields_orderStore()
		{
			m_Items = new SortedList<long, proto.fieldset_fields_order>();
		}
		private SortedList<long, proto.fieldset_fields_order> m_Items;
		public void Commit()
		{
			//throw new NotImplementedException();
		}
		public IQueryable<proto.fieldset_fields_order> GetAll()
		{
			return Queryable.AsQueryable<proto.fieldset_fields_order>(All());
		}
		public proto.fieldset_fields_order GetById(long id)
		{
			return Get(id);
		}
		void admin.db.IDataService<proto.fieldset_fields_order>.Insert(proto.fieldset_fields_order item)
		{
			Insert(item);
		}
		void admin.db.IDataService<proto.fieldset_fields_order>.Delete(proto.fieldset_fields_order item)
		{
			Delete(item);
		}
		public proto.fieldset_fields_order CreateItem()
		{
			return new proto.fieldset_fields_order() {   };
		}
		public void AbortItem(proto.fieldset_fields_order item)
		{
			Delete(item);
		}
		public void Discard()
		{
			;
		}
		void admin.db.IDataService<proto.fieldset_fields_order>.Update(proto.fieldset_fields_order item)
		{
			Persist(item);
		}
		public object GetObject(long _id)
		{
			return Get(_id);
		}
		public System.Type GetObjectType()
		{
			return typeof(proto.fieldset_fields_order);
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
		public void Select(MySqlConnection _connection)
		{
			var cmd = new MySqlCommand("SELECT `id`, `fieldset_id`, `field_id`, `order_number` FROM fieldset_fields_order");
			cmd.Connection = _connection;
			using(var reader = cmd.ExecuteReader())
			{
				while(reader.Read())
				{
					var item = new proto.fieldset_fields_order();
					item.LoadFromReader(reader);
					m_Items[item.id] = item;
				}
			}
		}
		public proto.fieldset_fields_order Insert(MySqlConnection _connection, proto.fieldset_fields_order _item)
		{
			var cmd = new MySqlCommand("INSERT INTO fieldset_fields_order ( `fieldset_id`, `field_id`, `order_number` ) VALUES ( @fieldset_id, @field_id, @order_number ); SELECT LAST_INSERT_ID();"); ;
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "fieldset_id", Value = _item.fieldset_id });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "field_id", Value = _item.field_id });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "order_number", Value = _item.order_number });
			cmd.Connection = _connection;
			_item.id = Convert.ToInt64(cmd.ExecuteScalar());
			m_Items.Add(_item.id, _item);
			_item.LoadAggregations(Meridian.Default);
			return _item;
		}
		public proto.fieldset_fields_order Update(MySqlConnection _connection, proto.fieldset_fields_order _item)
		{
			bool changed =  false;
			var cmdText =  "";
			var cmd = new MySqlCommand("UPDATE fieldset_fields_order SET `fieldset_id`= @fieldset_id, `field_id`= @field_id, `order_number`= @order_number WHERE id=@id"); ;
			if(_item.mc_id)
			{
			}
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "id", Value = _item.id });
			if(_item.mc_fieldset_id)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`fieldset_id` = @fieldset_id";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "fieldset_id", Value = _item.fieldset_id });
			}
			if(_item.mc_field_id)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`field_id` = @field_id";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "field_id", Value = _item.field_id });
			}
			if(_item.mc_order_number)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`order_number` = @order_number";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "order_number", Value = _item.order_number });
			}
			if(changed)
			{
				cmd.CommandText =  "UPDATE fieldset_fields_order SET " + cmdText + " WHERE id=@id";
				cmd.Connection = _connection;
				cmd.ExecuteNonQuery();
				_item.LoadAggregations(Meridian.Default);
			}
			return _item;
		}
		public proto.fieldset_fields_order Delete(MySqlConnection _connection, proto.fieldset_fields_order _item)
		{
			var cmd = new MySqlCommand("DELETE FROM fieldset_fields_order WHERE id=@id"); ;
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "id", Value = _item.id });
			cmd.Connection = _connection;
			cmd.ExecuteScalar();
			return _item;
		}
		public proto.fieldset_fields_order Insert(proto.fieldset_fields_order _item)
		{
			MeridianMonitor.Default.MySqlActionForeground((conn) => Insert(conn, _item));;
			return _item;
		}
		public proto.fieldset_fields_order Persist(proto.fieldset_fields_order _item)
		{
			if(_item.id <= 0)
			{
				_item = Insert(_item);
			}
			_item = Update(_item);
			return _item;
		}
		public proto.fieldset_fields_order Delete(proto.fieldset_fields_order _item)
		{
			_item.DeleteCompositions(Meridian.Default);
			_item.DeleteAggregations();
			m_Items.Remove(_item.id);
			MeridianMonitor.Default.MySqlActionBackground((conn) => Delete(conn, _item));;
			return _item;
		}
		public proto.fieldset_fields_order Update(proto.fieldset_fields_order _item)
		{
			MeridianMonitor.Default.MySqlActionBackground((conn) => Update(conn, _item));;
			return _item;
		}
		public IList<proto.fieldset_fields_order> All()
		{
			return m_Items.Values;
		}
		public proto.fieldset_fields_order Get(long _id)
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
			var cmd = new MySqlCommand("SELECT `id`, `fieldset_id`, `field_id`, `order_number` FROM fieldset_fields_order WHERE id = " + _id.ToString());
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
			var cmd = new MySqlCommand("SELECT `id`, `fieldset_id`, `field_id`, `order_number` FROM fieldset_fields_order WHERE id = " + _id.ToString());
			cmd.Connection = _connection;
			using(var reader = cmd.ExecuteReader())
			{
				while(reader.Read())
				{
					var item = new proto.fieldset_fields_order();
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
