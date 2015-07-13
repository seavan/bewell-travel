using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace bewell.common.Sphinx
{
    public interface ISphinxExportableEntity
    {
        ISphinxDocument GetDocumentById(DocumentId id);
        ICollection<ISphinxSerializable> ExportToSphinx();
    }
}
