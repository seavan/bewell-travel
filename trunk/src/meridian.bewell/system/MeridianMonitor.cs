using System;
using System.Collections.Generic;
using System.Threading;
using meridian.core;
using MySql.Data.MySqlClient;

namespace meridian.bewell.system
{
    public partial class MeridianMonitor : IMeridianMonitorSender
    {
        private static MeridianMonitor m_MeridianMonitor = new MeridianMonitor();

        private string connectionString;
        private SenderThreadWorker senderThreadWorker;
        private ReceiverThreadWorker receiverThreadWorker;

        public void Init(string connection, string sphinxHost, int sphinxPort)
        {
            connectionString = connection;
            SphinxHost = sphinxHost;
            SphinxPort = sphinxPort;
        }

        public string SphinxHost
        {
            get;
            set;
        }

        public int SphinxPort
        {
            get;
            set;
        }

        public void KeepAlive()
        {
            if (!IsSenderThreadRunning())
            {
                //StartSenderThread();
            }

            if (!IsReceiverThreadRunning())
            {
                //StartReceiverThread();
            }
        }

        public void Receive(MySqlConnection _conn)
        {
            var cmd = new MySqlCommand("SELECT * FROM meridian_updates");
            cmd.Connection = _conn;

            var toDel = new List<long>();
            var toUpd = new List<MeridianUpdate>();

            long lastProtoId = -1;
            var lastAction = -1;
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    try
                    {
                        var protoid = (long)reader["id"];
                        var action = (int)reader["action"];

                        if (protoid == lastProtoId && lastAction == action)
                        {
                            continue;
                        }

                        lastProtoId = protoid;
                        lastAction = action;

                        toUpd.Add(new MeridianUpdate()
                        {
                            id = protoid,
                            proto = reader["proto"].ToString(),
                            proto_id = (long)reader["proto_id"],
                            action = action,
                            instance = reader["instance"] != null ? reader["instance"].ToString() : ""
                        });
                    }
                    catch (Exception ex)
                    {
                        Tracer.I.Error("#update gather exception \r\n!!!!!!\r\n{0}\r\n{1}", ex.Message, ex.StackTrace);
                    }
                }
            }

            foreach (var i in toUpd)
            {
                if (i.instance.Contains("meridian"))
                {
                    toDel.Add(i.id);
                    continue;
                }
                try
                {
                    Meridian.Default.PassUpdate(_conn, i.proto, i.action, i.proto_id);
                }
                catch (Exception ex)
                {
                    Tracer.I.Error("#update execute exception \r\n!!!!!!\r\n{0}\r\n{1}", ex.Message, ex.StackTrace);
                }
                toDel.Add(i.id);
            }

            foreach (var id in toDel)
            {
                try
                {
                    var cmdDel = new MySqlCommand("DELETE FROM meridian_updates WHERE id = " + id.ToString());
                    cmdDel.Connection = _conn;
                    cmdDel.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Tracer.I.Error("#update gather delete exception \r\n!!!!!!\r\n{0}\r\n{1}", ex.Message, ex.StackTrace);
                }
            }

            Thread.Sleep(4000);
        }

        // todo: batching
        public void MySqlActionBackground(Action<MySqlConnection> _action)
        {
            MySqlActionForeground(_action);
        }

        // todo: batching
        public void MySqlActionForeground(Action<MySqlConnection> _action)
        {
            using (var conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                _action(conn);
            }
        }

        public bool IsSenderThreadRunning()
        {
            return (senderThreadWorker != null) && (senderThreadWorker.IsAlive);
        }

        public void StartSenderThread()
        {
            if (IsSenderThreadRunning())
            {
                return;
            }

            if (senderThreadWorker == null)
            {
                senderThreadWorker = new SenderThreadWorker(connectionString);
            }

            senderThreadWorker.Start();
        }

        public bool IsReceiverThreadRunning()
        {
            return (receiverThreadWorker != null) && (receiverThreadWorker.IsAlive);
        }

        public void StartReceiverThread()
        {
            if (IsReceiverThreadRunning())
            {
                return;
            }

            if (receiverThreadWorker == null)
            {
                receiverThreadWorker = new ReceiverThreadWorker(connectionString, Receive);
            }

            receiverThreadWorker.Start();
        }

        public static MeridianMonitor Default
        {
            get
            {
                return m_MeridianMonitor;
            }
        }
    }
}