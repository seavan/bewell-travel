using System.Collections.Generic;
using admin.db;

namespace meridian.bewell.proto
{
    public interface IAttachedPhotoAspect
    {
        string FieldName { get;  }

        IDatabaseEntity GetParent();

        IEnumerable<IAttachedPhoto> GetAllPhotos();

        /// <summary>
        /// Добавить фото к объекту и вообще
        /// </summary>
        /// <param name="guid">имя (гуид) оригинальной загруженной фотки</param>
        /// <param name="original">имя (гуид плюс расширение) оригинальной загруженной фотки</param>
        /// <param name="small">имя (гуид плюс расширение) маленькой (140x96) фотки</param>
        /// <param name="mid">имя (гуид плюс расширение) средней (220x146) фотки</param>
        /// <param name="large">имя (гуид плюс расширение) большой (620x424) фотки</param>
        /// <returns></returns>
        IAttachedPhoto AddPhoto(string guid, string original, string small, string mid, string large);

        /// <summary>
        /// Относительный путь (без тильды) к виртуальному каталогу, в котором лежат фотки, например:
        ///         public const string UserDataFolder = "/content/userdata/";
        ///         public const string RestaurantsDataFolder = UserDataFolder + "restaurants/";
        /// </summary>
        /// <returns></returns>
        string GetUploadDataFolder();

        void RemovePhoto(long id);

        void SetMain(long id);
    }
}