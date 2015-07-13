using System;
using MySql.Data.MySqlClient;

namespace meridian.bewell.system
{
    public interface IMeridianMonitorSender
    {
        void MySqlActionBackground(Action<MySqlConnection> action);
        void MySqlActionForeground(Action<MySqlConnection> action);
    }
}