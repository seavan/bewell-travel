using System;
using System.Collections.Generic;
using System.Linq;
using bewell.common;
using bewell.Models.ViewModels;
using meridian.bewell.proto;

namespace bewell.Mappers
{
    public class EntityMapper
    {
        public static EntityListViewModel ToResortsListViewModel(List<resorts> entries, int page, int pageSize = Constants.PageSize)
        {
            int count = entries.Count;
            int size = count / pageSize + Convert.ToInt32(count % pageSize != 0);

            var pageEntries = MappingUtils.TakePage(entries, page, pageSize);

            var result = pageEntries.Select(resort => new EntityViewModel
            {
                Title = resort.title,
                FieldSet = resort.GetFieldset(null, true),
                Photos = resort.GetPhotos(),
                EntityUrl = resort.EntityUri().ToString(),
                Terriotry = resort.GetResortsTerritorie(),
                ListImageUrl = resort.GetListImage(),
                Entity = resort,
                EntityMap = resort
            }).ToList();

            return new EntityListViewModel
            {
                Results = result,
                PagesCount = size,
                Page = page,
                TotalCount = count
            };
        }

        public static EntityListViewModel ToHotelsListViewModel(List<hotels> entries, int page, int pageSize = Constants.PageSize)
        {
            int count = entries.Count;
            int size = count / pageSize + Convert.ToInt32(count % pageSize != 0);

            var pageEntries = MappingUtils.TakePage(entries, page, pageSize);

            var result = pageEntries.Select(hotel => new EntityViewModel
            {
                Title = hotel.title,
                FieldSet = hotel.GetFieldset(null, true),
                Photos = hotel.GetPhotos(),
                Stars = hotel.stars,
                BewellStars = hotel.GetHotelsHotel_classe() == null ? 0 : hotel.GetHotelsHotel_classe().stars,
                EntityUrl = hotel.EntityUri().ToString(),
                ListImageUrl = hotel.GetListImage(),
                Entity = hotel,
                EntityMap = hotel
            }).ToList();

            return new EntityListViewModel
            {
                Results = result,
                PagesCount = size,
                Page = page,
                TotalCount = count
            };
        }

        public static NewsListViewModel ToNewsListViewModel(List<news> entries, int page, int pageSize = Constants.PageSize)
        {
            int count = entries.Count;
            int size = count / pageSize + Convert.ToInt32(count % pageSize != 0);

            return new NewsListViewModel
            {
                News = MappingUtils.TakePage(entries, page, pageSize).ToList(),
                PagesCount = size,
                Page = page,
                TotalCount = count
            };
        }
    }
}