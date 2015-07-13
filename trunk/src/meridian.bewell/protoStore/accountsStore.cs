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
	public partial class accountsStore : Meridian.IEntityStore, admin.db.IDataService<proto.accounts>
	{
		public accountsStore()
		{
			m_Items = new SortedList<long, proto.accounts>();
		}
		private SortedList<long, proto.accounts> m_Items;
		public void Commit()
		{
			//throw new NotImplementedException();
		}
		public IQueryable<proto.accounts> GetAll()
		{
			return Queryable.AsQueryable<proto.accounts>(All());
		}
		public proto.accounts GetById(long id)
		{
			return Get(id);
		}
		void admin.db.IDataService<proto.accounts>.Insert(proto.accounts item)
		{
			Insert(item);
		}
		void admin.db.IDataService<proto.accounts>.Delete(proto.accounts item)
		{
			Delete(item);
		}
		public proto.accounts CreateItem()
		{
			return new proto.accounts() {   };
		}
		public void AbortItem(proto.accounts item)
		{
			Delete(item);
		}
		public void Discard()
		{
			;
		}
		void admin.db.IDataService<proto.accounts>.Update(proto.accounts item)
		{
			Persist(item);
		}
		public object GetObject(long _id)
		{
			return Get(_id);
		}
		public System.Type GetObjectType()
		{
			return typeof(proto.accounts);
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
			var cmd = new MySqlCommand("SELECT `id`, `email`, `firstname`, `lastname`, `secondname`, `role_id`, `post`, `created`, `password`, `salt`, `activation_guid`, `lastlogin`, `rememberpass_guid` FROM accounts");
			cmd.Connection = _connection;
			using(var reader = cmd.ExecuteReader())
			{
				while(reader.Read())
				{
					var item = new proto.accounts();
					item.LoadFromReader(reader);
					m_Items[item.id] = item;
				}
			}
		}
		public proto.accounts Insert(MySqlConnection _connection, proto.accounts _item)
		{
			var cmd = new MySqlCommand("INSERT INTO accounts ( `email`, `firstname`, `lastname`, `secondname`, `role_id`, `post`, `created`, `password`, `salt`, `activation_guid`, `lastlogin`, `rememberpass_guid` ) VALUES ( @email, @firstname, @lastname, @secondname, @role_id, @post, @created, @password, @salt, @activation_guid, @lastlogin, @rememberpass_guid ); SELECT LAST_INSERT_ID();"); ;
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "email", Value = _item.email });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "firstname", Value = _item.firstname });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "lastname", Value = _item.lastname });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "secondname", Value = _item.secondname });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "role_id", Value = _item.role_id });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "post", Value = _item.post });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "created", Value = (_item.created != null && _item.created.Year > 1800) ? _item.created : new DateTime(1800, 1, 1) });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "password", Value = _item.password });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "salt", Value = _item.salt });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "activation_guid", Value = _item.activation_guid });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "lastlogin", Value = (_item.lastlogin != null && _item.lastlogin.Year > 1800) ? _item.lastlogin : new DateTime(1800, 1, 1) });
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "rememberpass_guid", Value = _item.rememberpass_guid });
			cmd.Connection = _connection;
			_item.id = Convert.ToInt64(cmd.ExecuteScalar());
			m_Items.Add(_item.id, _item);
			_item.LoadAggregations(Meridian.Default);
			return _item;
		}
		public proto.accounts Update(MySqlConnection _connection, proto.accounts _item)
		{
			bool changed =  false;
			var cmdText =  "";
			var cmd = new MySqlCommand("UPDATE accounts SET `email`= @email, `firstname`= @firstname, `lastname`= @lastname, `secondname`= @secondname, `role_id`= @role_id, `post`= @post, `created`= @created, `password`= @password, `salt`= @salt, `activation_guid`= @activation_guid, `lastlogin`= @lastlogin, `rememberpass_guid`= @rememberpass_guid WHERE id=@id"); ;
			if(_item.mc_id)
			{
			}
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "id", Value = _item.id });
			if(_item.mc_email)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`email` = @email";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "email", Value = _item.email != null ? (object)_item.email : DBNull.Value });
			}
			if(_item.mc_firstname)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`firstname` = @firstname";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "firstname", Value = _item.firstname != null ? (object)_item.firstname : DBNull.Value });
			}
			if(_item.mc_lastname)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`lastname` = @lastname";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "lastname", Value = _item.lastname != null ? (object)_item.lastname : DBNull.Value });
			}
			if(_item.mc_secondname)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`secondname` = @secondname";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "secondname", Value = _item.secondname != null ? (object)_item.secondname : DBNull.Value });
			}
			if(_item.mc_role_id)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`role_id` = @role_id";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "role_id", Value = _item.role_id });
			}
			if(_item.mc_post)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`post` = @post";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "post", Value = _item.post != null ? (object)_item.post : DBNull.Value });
			}
			if(_item.mc_created)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`created` = @created";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "created", Value = (_item.created != null && _item.created.Year > 1800) ? _item.created : new DateTime(1800, 1, 1) });
			}
			if(_item.mc_password)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`password` = @password";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "password", Value = _item.password != null ? (object)_item.password : DBNull.Value });
			}
			if(_item.mc_salt)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`salt` = @salt";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "salt", Value = _item.salt });
			}
			if(_item.mc_activation_guid)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`activation_guid` = @activation_guid";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "activation_guid", Value = _item.activation_guid });
			}
			if(_item.mc_lastlogin)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`lastlogin` = @lastlogin";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "lastlogin", Value = (_item.lastlogin != null && _item.lastlogin.Year > 1800) ? _item.lastlogin : new DateTime(1800, 1, 1) });
			}
			if(_item.mc_rememberpass_guid)
			{
				changed =  true;
				cmdText += (cmdText.Length > 0 ? ", " : "") + "`rememberpass_guid` = @rememberpass_guid";
				cmd.Parameters.Add( new MySqlParameter() { ParameterName = "rememberpass_guid", Value = _item.rememberpass_guid });
			}
			if(changed)
			{
				cmd.CommandText =  "UPDATE accounts SET " + cmdText + " WHERE id=@id";
				cmd.Connection = _connection;
				cmd.ExecuteNonQuery();
				_item.LoadAggregations(Meridian.Default);
			}
			return _item;
		}
		public proto.accounts Delete(MySqlConnection _connection, proto.accounts _item)
		{
			var cmd = new MySqlCommand("DELETE FROM accounts WHERE id=@id"); ;
			cmd.Parameters.Add( new MySqlParameter() { ParameterName = "id", Value = _item.id });
			cmd.Connection = _connection;
			cmd.ExecuteScalar();
			return _item;
		}
		public proto.accounts Insert(proto.accounts _item)
		{
			MeridianMonitor.Default.MySqlActionForeground((conn) => Insert(conn, _item));;
			return _item;
		}
		public proto.accounts Persist(proto.accounts _item)
		{
			if(_item.id <= 0)
			{
				_item = Insert(_item);
			}
			_item = Update(_item);
			return _item;
		}
		public proto.accounts Delete(proto.accounts _item)
		{
			_item.DeleteCompositions(Meridian.Default);
			_item.DeleteAggregations();
			m_Items.Remove(_item.id);
			MeridianMonitor.Default.MySqlActionBackground((conn) => Delete(conn, _item));;
			return _item;
		}
		public proto.accounts Update(proto.accounts _item)
		{
			MeridianMonitor.Default.MySqlActionBackground((conn) => Update(conn, _item));;
			return _item;
		}
		public IList<proto.accounts> All()
		{
			return m_Items.Values;
		}
		public proto.accounts Get(long _id)
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
			var cmd = new MySqlCommand("SELECT `id`, `email`, `firstname`, `lastname`, `secondname`, `role_id`, `post`, `created`, `password`, `salt`, `activation_guid`, `lastlogin`, `rememberpass_guid` FROM accounts WHERE id = " + _id.ToString());
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
			var cmd = new MySqlCommand("SELECT `id`, `email`, `firstname`, `lastname`, `secondname`, `role_id`, `post`, `created`, `password`, `salt`, `activation_guid`, `lastlogin`, `rememberpass_guid` FROM accounts WHERE id = " + _id.ToString());
			cmd.Connection = _connection;
			using(var reader = cmd.ExecuteReader())
			{
				while(reader.Read())
				{
					var item = new proto.accounts();
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
