using System;
using System.Collections.Generic;
using admin.db;

namespace meridian.bewell.proto
{
    public class LookupAspect : Aspect, ILookupValueAspect 
    {
        public LookupAspect(string _fieldName, IDatabaseEntity _parent, Func<IEnumerable<ILookupValue>> _getAll ) : base(_fieldName, _parent)
        {
            m_getAll = _getAll;
        }

        private Func<IEnumerable<ILookupValue>> m_getAll;

        public IEnumerable<ILookupValue> GetValues()
        {
            return m_getAll();
        }


    }

    public abstract class AttachedPhotoAspect : Aspect, IAttachedPhotoAspect
    {
        private string dataFolder;


        public AttachedPhotoAspect(string fieldName, IDatabaseEntity parent, string dataFolder) : base(fieldName, parent)
        {
            this.dataFolder = dataFolder;
        }

        public abstract IEnumerable<IAttachedPhoto> GetAllPhotos();
        public abstract IAttachedPhoto AddPhoto(string guid, string original, string small, string mid, string large);

        public string GetUploadDataFolder()
        {
            return dataFolder;
        }

        public abstract void RemovePhoto(long id);

        public abstract void SetMain(long id);
    }

}