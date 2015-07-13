using System.Collections.Generic;

namespace meridian.bewell.proto
{
    public interface ICategory : ILookupValue
    {
        IEnumerable<ILookupValue> GetAvailableValues();
        IEnumerable<ICategoryItemValue> GetValues();
    }

    public interface ICategoryItemValue
    {
        int GetOrder();
        string GetTitle();
        long GetEntityId();

        string Value();
    }

    public interface ILookupValue
    {
        long id { get; }
        string title { get; }

        /// <summary>
        /// for multi level value lists
        /// </summary>
        int GetLookupValueLevel();

        /// <summary>
        /// make level lists
        /// </summary>
        bool GetLookupValueDisabled();
    }

   public class LookupValueDummy : ILookupValue
   {
       public long id { get; set; }

       public string title { get; set; }

       private int _lookupValueLevel;
       public int lookup_value_level
       {
           set { _lookupValueLevel = value; }
       }

       public int GetLookupValueLevel()
       {
           return _lookupValueLevel;
       }

       private bool _lookupValueDisabled;
       public bool lookup_value_disabled
       {
           set { _lookupValueDisabled = value; }
       }

       public bool GetLookupValueDisabled()
       {
           return _lookupValueDisabled;
       }
   }
}