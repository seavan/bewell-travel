using System;
using System.Collections.Generic;
using System.Linq;
using admin.db;

namespace meridian.bewell.proto
{
    public class OneToManyAspect<ValueType> : Aspect, IOneToManyAspect where ValueType : ILookupValue
    {
        public OneToManyAspect(
            IDatabaseEntity _parent,
            string _fieldName,
            Func<IEnumerable<ValueType>> _getAvailableValues,
            Func<IEnumerable<ValueType>> _getSelectedValues,
            Action<long> _addValue,
            Action<long> _removeValue
            )
            : base(_fieldName, _parent)
        {
            m_getAvailableValues = _getAvailableValues;
            m_getSelectedValues = _getSelectedValues;
            m_removeValue = _removeValue;
            m_addValue = _addValue;
        }

        public OneToManyAspect(
            IDatabaseEntity _parent,
            string _fieldName,
            Func<IEnumerable<ValueType>> _getAvailableValues,
            Func<Dictionary<string, IEnumerable<ValueType>>> _getAvailableGroupValues,
            Func<IEnumerable<ValueType>> _getSelectedValues,
            Action<long> _addValue,
            Action<long> _removeValue
            )
            : base(_fieldName, _parent)
        {
            m_getAvailableValues = _getAvailableValues;
            m_getAvailableGroupValues = _getAvailableGroupValues;
            m_getSelectedValues = _getSelectedValues;
            m_removeValue = _removeValue;
            m_addValue = _addValue;
        }


        private Func<IEnumerable<ValueType>> m_getAvailableValues;
        private Func<IEnumerable<ValueType>> m_getSelectedValues;
        private Func<Dictionary<string, IEnumerable<ValueType>>> m_getAvailableGroupValues;
        private Action<long> m_removeValue;
        private Action<long> m_addValue;

        public IEnumerable<ILookupValue> GetAvalableValues()
        {
            return m_getAvailableValues().Cast<ILookupValue>();
        }

        public Dictionary<string, IEnumerable<ILookupValue>> GetAvailableGroupValues()
        {
            if (m_getAvailableGroupValues == null)
            {
                return null;
            }

            var values = m_getAvailableGroupValues();
            return values.OrderBy(item => item.Key).ToDictionary(item => item.Key, item => values[item.Key].Cast<ILookupValue>().OrderBy(t => t.title).AsEnumerable());
        }

        public Dictionary<string, IEnumerable<ILookupValue>> GetSelectedGroupValues()
        {
            if (m_getAvailableGroupValues == null)
            {
                return null;
            }

            var values = m_getAvailableGroupValues();
            var selectedValues = m_getSelectedValues();
            var result = new Dictionary<string, IEnumerable<ILookupValue>>();

            foreach (var value in values.OrderBy(item => item.Key))
            {
                var groupValues =
                    values[value.Key].Cast<ILookupValue>()
                        .Where(t => selectedValues.Any(s => s.id.Equals(t.id)))
                        .OrderBy(t => t.title)
                        .ToList();

                if (groupValues.Any())
                {
                    result.Add(value.Key, groupValues);
                }
            }

            return result;
        }

        public IEnumerable<ILookupValue> GetSelectedValues()
        {
            return m_getSelectedValues().Cast<ILookupValue>();
        }

        public void SetValue(long valueId)
        {
            m_addValue(valueId);
        }

        public void RemoveValue(long valueId)
        {
            m_removeValue(valueId);
        }
    }
}