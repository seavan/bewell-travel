using System;
using System.Collections.Generic;
using System.Threading;
using MySql.Data.MySqlClient;
using meridian.core;

namespace meridian.bewell.system
{
    public class SenderThreadWorker : ThreadWorker
    {
        private string connection;
        private Queue<Action<MySqlConnection>> queue = new Queue<Action<MySqlConnection>>();

        public SenderThreadWorker(string connection)
        {
            this.connection = connection;
            IsBackground = true;
        }

        public override void DoJob()
        {
            base.DoJob();
            var cnt = queue.Count;
            for(int i = 0; i < cnt; ++i)
            {
                using (var conn = new MySqlConnection(connection))
                {
                    conn.Open();
                    var action = queue.Peek();
                    
                    try
                    {
                        action.Invoke(conn);
                    }
                    catch (Exception ex)
                    {
                        Tracer.I.Error(ex.Message);
                    }

                    queue.Dequeue();
                }
            }

            Thread.Sleep(100);
        }

        public void AddAction(Action<MySqlConnection> action)
        {
            queue.Enqueue(action);
        }
    }
}