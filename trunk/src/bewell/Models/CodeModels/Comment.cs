using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using meridian.bewell.proto;
using meridian.bewell.system;

namespace bewell.Models.CodeModels
{
    public class Comment : IComment
    {
        public int LeftKey { get; set; }
        public int RightKey { get; set; }
        public int level { get; set; }
        [Required(ErrorMessage = "Введите текст комментария")]
        public string CommentText { get; set; }
        public DateTime CreateDate { get; set; }
        public long MaterialId { get; set; }
        public long AuthorId { get; set; }
        public long id { get; set; }
        public long ParentId { get; set; }
        public bool delete { get; set; }
        public string MaterialProtoName { get; set; }
        public Uri Link { get; set; }

        public accounts GetUser()
        {
            return Meridian.Default.accountsStore.GetById(AuthorId);
        }

        public virtual IComment GetParentComment()
        {
            return null;
        }

        public string ProtoName { get; set; }

        public Comment()
        {
            CreateDate = DateTime.Now;
            LeftKey = 0;
            RightKey = 0;
            level = 0;
            delete = false;
        }
    }
}