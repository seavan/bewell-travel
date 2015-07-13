using System;
using System.Linq;
using System.Collections.Generic;
using meridian.bewell.proto;

namespace meridian.bewell.protoStore
{
	public partial class commentsStore
	{
		public IEnumerable<comments> GetEntitiesReview(long id, string protoName)
		{
		    return All().Where(c => c.entity_id == id && c.proto_name == protoName).OrderByDescending(c=>c.create_date);
		}

        public long AddComment(IComment comment)
        {
            if (!string.IsNullOrEmpty(comment.CommentText))
            {
                var review = new comments
                {
                    text = comment.CommentText,
                    entity_id = comment.MaterialId,
                    parent_id = comment.ParentId,
                    proto_name = comment.ProtoName,
                    account_id = comment.AuthorId,
                    create_date = DateTime.Now
                };

                Insert(review);

                UpdateNestedSets(review.entity_id, review.proto_name, review.parent_id, review.level, review.left_key);

                return review.id;
            }

            return 0;
        }


        public int UpdateNestedSets(long entityId, string protoName, long parId, int level, int lk)
        {
            var comments = All().Where(c => c.entity_id.Equals(entityId) && c.parent_id.Equals(parId) && c.proto_name.Equals(protoName));

            int curLevel;
            int curRK;
            int curLK;
            int comCur = lk;

            foreach (var comment in comments)
            {
                ++comCur;
                curLK = comCur;

                curLevel = level + 1;

                curRK = UpdateNestedSets(entityId, protoName, comment.id, curLevel, curLK);

                comCur = curRK;

                comment.left_key = curLK;
                comment.right_key = curRK;
                comment.level = level;

                Update(comment);
            }

            ++comCur;

            return comCur;

        }
	}
}
