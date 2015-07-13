using System.Collections.Generic;

namespace meridian.bewell.impl.Interfaces
{
    public class IImageByThemeComparer : IEqualityComparer<IImageByTheme>
    {
        public bool Equals(IImageByTheme x, IImageByTheme y)
        {
            return (x.id == y.id);
        }

        public int GetHashCode(IImageByTheme obj)
        {
            return obj.id.GetHashCode();
        }
    }
}
