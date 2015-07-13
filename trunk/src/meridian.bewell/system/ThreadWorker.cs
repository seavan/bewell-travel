using System;
using System.Threading;
using meridian.core;
using log4net;
using System.Reflection;

namespace meridian.bewell.system
{
    public class ThreadWorker : IDisposable
    {
        private static readonly ILog log = LogManager.GetLogger(MethodInfo.GetCurrentMethod().DeclaringType);

        private Thread thread;

        public ThreadWorker()
        {
            StopRequested = false;
        }

        public void Worker()
        {
            while (!StopRequested)
            {
                try
                {
                    DoJob();
                    Thread.Sleep(0);
                }
                catch (ThreadAbortException ex)
                {
                    log.Error("Background thread was aborted", ex);
                    break;
                }
                catch (Exception ex)
                {
                    log.Error("Unhandled exception in worker thread", ex);
                }
            }

            thread = null;
        }

        public virtual void DoJob()
        {
        }

        private bool StopRequested
        {
            get;
            set;
        }

        public bool IsBackground { get; set; }

        public void Start()
        {
            if (IsAlive)
            {
                return;
            }

            thread = new Thread(Worker);
            thread.IsBackground = IsBackground;
            thread.Start();
        }

        public bool IsAlive
        {
            get
            {
                // todo add IsAlive check with lock
                return (thread != null);
            }
        }

        public void Stop()
        {
            if (IsAlive)
            {
                try
                {
                    thread.Abort();
                }
                catch (Exception _e)
                {
                    Tracer.I.Error(_e.Message);
                }
                thread = null;
            }
        }

        public void StopGracefully()
        {
            StopRequested = true;
            int count = 50;
            int c = 0;
            int interval = 500;
            while (IsAlive)
            {
                if (c++ > count)
                {
                    Stop();
                    break;
                }
                Thread.Sleep(interval);
            }
        }

        public void Dispose()
        {
            Stop();
        }
    }
}