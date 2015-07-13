using System.Text;

namespace bewell.common.Sphinx
{
    public sealed class DocumentId : ISphinxSerializable
    {
        public DocumentId(long id)
        {
            this.EntityId = id;
        }

        public DocumentId(long entityId, long fieldsetId)
        {
            this.EntityId = entityId;
            this.FieldsetId = fieldsetId;
        }

        public long EntityId { get; private set; }
        public long? FieldsetId { get; private set; }

        public long GetIdentifier()
        {
            if (FieldsetId.HasValue)
                return EntityId << 16 | FieldsetId.Value;

            return EntityId;
        }

        public string BuildPipeXml()
        {
            var sb = new StringBuilder();

            sb.AppendLine(string.Format("<entityid>{0}</entityid>", EntityId));
            if (FieldsetId.HasValue)
                sb.AppendLine(string.Format("<fieldsetid>{0}</fieldsetid>", FieldsetId.Value));

            return sb.ToString();
        }
    }
}
