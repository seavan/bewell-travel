using System;
using System.Threading;
using MySql.Data.MySqlClient;

namespace meridian.bewell.system
{
    public class ReceiverThreadWorker : ThreadWorker
    {
        private Action<MySqlConnection> action;
        private string connection;

        public ReceiverThreadWorker(string connection, Action<MySqlConnection> action)
        {
            this.action = action;
            this.connection = connection;
            IsBackground = true;
        }

        public override void DoJob()
        {
            base.DoJob();
            using (var conn = new MySqlConnection(connection))
            {
                conn.Open();
                action(conn);
                conn.Close();
            }

            Thread.Sleep(100);
        }
    }
}