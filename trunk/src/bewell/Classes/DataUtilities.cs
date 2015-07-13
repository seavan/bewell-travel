using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meridian.bewell.proto;
using CuttingEdge.Conditions;

namespace bewell.Classes
{
    public static class DataUtilities
    {
        public static IEnumerable<territories> SortByDefault(this IEnumerable<territories> collection)
        {
            Condition.Requires(collection, "collection").IsNotNull();

            return collection.OrderBy(t => t.item_order).ThenBy(t => t.title);
        }

        public static IEnumerable<cure_profiles> SortByDefault(this IEnumerable<cure_profiles> collection)
        {
            Condition.Requires(collection, "collection").IsNotNull();

            return collection.OrderBy(t => t.item_order).ThenBy(t => t.title);
        }

        public static IEnumerable<deseases> SortByDefault(this IEnumerable<deseases> collection)
        {
            Condition.Requires(collection, "collection").IsNotNull();

            return collection.OrderBy(d => d.title);
        }
    }
}