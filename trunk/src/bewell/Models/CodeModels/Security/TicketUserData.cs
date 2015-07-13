using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bewell.Models.CodeModels.Security
{
    [Serializable]
    public class TicketUserData
    {
        public List<string> Roles { get; set; }

        public string FriendlyName { get; set; }

        public long Id { get; set; }

        public bool Persist { get; set; }
    }
}