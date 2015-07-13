using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using bewell.Classes;
using bewell.common;
using meridian.bewell.proto;

namespace bewell.Controllers
{
    public class AjaxController : BaseController
    {
        #region nested classes
        
        public class BaseEntity
        {
            public BaseEntity()
            {
            }

            public BaseEntity(long id, string title)
            {
                Id = id;
                Title = title;
            }

            public static BaseEntity CreateStub()
            {
                return new BaseEntity { Id = 0, Title = "Все" };
            }

            public static List<BaseEntity> CreateListStub()
            {
                return new List<BaseEntity> { CreateStub() };
            }

            public long Id { get; set; }
            public string Title { get; set; }
        }

        public class Entity : BaseEntity
        {
            public Entity()
            {
                Resorts = new List<BaseEntity>();
                Sub = new List<Entity>();
            }

            public string Label { get; set; }

            public List<Entity> Sub { get; set; }
            public List<BaseEntity> Resorts { get; set; }
        } 
        
        #endregion

        [HttpPost]
        public JsonResult GetDeseases(long id)
        {
            return Json(meridian.deseasesStore.All()
                .Where(item => item.profile_id == id)
                .SortByDefault()
                .Select(item => new { item.id, item.title, cureProfileId = item.CureProfile.id })
                .ToList());
        }
        
        [HttpPost]
        public JsonResult GetAllDeseases()
        {
            var deseases = new List<BaseEntity>
                {
                    BaseEntity.CreateStub()
                };

            deseases.AddRange(meridian.deseasesStore.All()
                .SortByDefault()
                .Select(item => new BaseEntity { Id = item.id, Title = item.title }));
            
            return Json(deseases);
        }

        [HttpPost]
        public JsonResult GetTreatments()
        {
            var result = new List<BaseEntity> { BaseEntity.CreateStub() };
            var treatments = meridian.treatment_optionsStore.All().Where(item => item.parent_id == 0).OrderBy(item => item.title).ToList();

            foreach (var treatment in treatments)
            {
                result.Add(new BaseEntity
                {
                    Id = treatment.id,
                    Title = treatment.title,
                });

                foreach (var sub in treatment.SubTreatmentOptions.OrderBy(item => item.title))
                {
                    result.Add(new BaseEntity { Title = "\xA0\xA0\xA0" + sub.title, Id = sub.id });
                }
            }

            return Json(result);
        }

        [HttpPost]
        public JsonResult GetTreatmentOptions()
        {
            var result = new List<Entity>[4];
            for (var i = 0; i < result.Length; i++)
            {
                result[i] = new List<Entity>();
            }

            var index = 0;
            var treatmentOptions = meridian.treatment_optionsStore.All().Where(item => item.parent_id == 0).ToList();
            for (var i = 0; i < treatmentOptions.Count; i++)
            {
                var option = new Entity
                {
                    Id = treatmentOptions[i].id,
                    Title = treatmentOptions[i].title,
                    Label = treatmentOptions[i].EntityUri().ToString()
                };

                foreach (var treatment in treatmentOptions[i].SubTreatmentOptions.OrderBy(item => item.title))
                {
                    option.Sub.Add(new Entity { Title = treatment.title, Id = treatment.id, Label = treatment.EntityUri().ToString() });
                }

                result[index].Add(option);
                index = (i + 1) % 4 == 0 ? 0 : index + 1;
            }
            
            return Json(result);
        }

        [HttpPost]
        public JsonResult GetHealthFactors()
        {
            var result = new List<Entity>[4];
            for (var i = 0; i < result.Length; i++)
                result[i] = new List<Entity>();
            
            var index = 0;
            var healthFactors = meridian.health_factorsStore.All().Where(item => item.parent_id == 0).ToList();
            for (var i = 0; i < healthFactors.Count; i++)
            {
                var factor = new Entity
                {
                    Id = healthFactors[i].id,
                    Title = healthFactors[i].title,
                    Label = healthFactors[i].EntityUri().ToString()
                };

                foreach (var healthFactor in healthFactors[i].SubHealthFactors.OrderBy(item => item.title))
                {
                    factor.Sub.Add(new Entity { Title = healthFactor.title, Id = healthFactor.id, Label = healthFactor.EntityUri().ToString() });
                }

                result[index].Add(factor);
                index = (i + 1) % 4 == 0 ? 0 : index + 1;
            }

            return Json(result);
        }

        [HttpPost]
        public JsonResult GetAllHealthFactors()
        {
            var result = new List<BaseEntity> { BaseEntity.CreateStub() };
            var healthFactors = meridian.health_factorsStore.All().Where(item => item.parent_id == 0).ToList();

            foreach (var healthFactor in healthFactors)
            {
                result.Add(new BaseEntity
                {
                    Id = healthFactor.id,
                    Title = healthFactor.title,
                });

                foreach (var sub in healthFactor.SubHealthFactors.OrderBy(item => item.title))
                {
                    result.Add(new BaseEntity { Title = "\xA0\xA0\xA0" + sub.title, Id = sub.id });
                }
            }

            return Json(result);
        }

        [HttpPost]
        public JsonResult GetCureProfilesList()
        {
            var result = new List<Entity>[4];
            for (var i = 0; i < result.Length; i++)
            {
                result[i] = new List<Entity>();
            }

            var index = 0;
            var cureProfiles = meridian.cure_profilesStore.All().ToList();
            for (var i = 0; i < cureProfiles.Count; i++)
            {
                var cure = new Entity
                {
                    Id = cureProfiles[i].id,
                    Title = cureProfiles[i].title,
                    Label = cureProfiles[i].EntityUri().ToString()
                };

                foreach (var desease in cureProfiles[i].Deseases.OrderBy(item => item.title))
                {
                    cure.Sub.Add(new Entity { Title = desease.title, Id = desease.id, Label = desease.EntityUri().ToString() });
                }

                result[index].Add(cure);
                index = (i + 1) % 4 == 0 ? 0 : index + 1;
            }

            return Json(result);
        }

        public JsonResult GetTerritories(bool withResorts = false)
        {
            var territories = new List<Entity>
            {
                new Entity
                {
                    Id = 0, 
                    Title = "Все", 
                    Label = "Территория", 
                    Sub = new List<Entity>
                    {
                        new Entity
                        {
                            Id = 0, 
                            Title = "Все", 
                            Label = "Страна", 
                            Resorts = BaseEntity.CreateListStub(),
                            Sub = new List<Entity>
                                {
                                    new Entity
                                    {
                                        Id = 0, 
                                        Title = "Все", 
                                        Label = "Город", 
                                        Resorts = BaseEntity.CreateListStub()
                                    }
                                }
                        }
                    }
                }
            };
            
            var root = meridian.territoriesStore.GetRootTerritories().SortByDefault().ToList();
            foreach (var r in root)
            {
                var nested = meridian.territory_categoriesStore.Get(r.nested_category_id);

                var rootTerritory = new Entity
                {
                    Id = r.id, 
                    Title = r.title, 
                    Label = r.Category.title, 
                    Sub = new List<Entity>
                    {
                        new Entity
                        {
                            Id = 0, 
                            Title = "Все", 
                            Label = nested.title, 
                            Resorts = BaseEntity.CreateListStub(),
                            Sub = new List<Entity>
                            {
                                new Entity
                                {
                                    Id = 0, 
                                    Title = "Все", 
                                    Label = "Город", 
                                    Resorts = BaseEntity.CreateListStub()
                                }
                            }
                        }
                    }
                };
                
                foreach (var sub in r.SubTerritories.SortByDefault())
                {
                    territory_categories subNested = null;
                    
                    if (sub.nested_category_id > 0)
                    {
                        subNested = meridian.territory_categoriesStore.Get(sub.nested_category_id);
                    }

                    var subCategory = new Entity
                    {
                        Id = sub.id, 
                        Title = sub.title, 
                        Label = sub.Category.title,
                        Resorts = BaseEntity.CreateListStub(),
                        Sub = new List<Entity>
                            {
                                new Entity
                                {
                                    Id = 0, 
                                    Title = "Все", 
                                    Label = subNested != null ? subNested.title : "Город", 
                                    Resorts = BaseEntity.CreateListStub(),
                                }
                            }
                    };

                    foreach (var sub2 in sub.SubTerritories.SortByDefault())
                    {
                        var subCat = new Entity
                        {
                            Id = sub2.id,
                            Title = sub2.title,
                            Label = sub2.Category.title,
                            Resorts = BaseEntity.CreateListStub(),
                        };

                        if (withResorts)
                        {
                            subCat.Resorts.AddRange(meridian.resortsStore.All().Where(item => item.territory_id == sub2.id).Select(item => new BaseEntity(item.id, item.title)));
                        }
                        
                        subCategory.Sub.Add(subCat);
                    }

                    rootTerritory.Sub.Add(subCategory);
                }

                territories.Add(rootTerritory);
            }

            return Json(territories);
        }

        [HttpPost]
        public ActionResult GetTerritory(long id)
        {
            return Json(meridian.territoriesStore.Get(id));
        }

        [HttpPost]
        public JsonResult GetCureProfiles()
        {
            return Json(meridian.cure_profilesStore.All().Where(item => item.Deseases.Any())
                .SortByDefault()
                .Select(item => new { item.id, item.title, item.css_class, gender = item.Gender.title})
                .ToList());
        }

        [HttpPost]
        public JsonResult GetCures()
        {
            var cureProfiles = new List<Entity>
            {
                new Entity {Title = "Все", Id = 0, Sub = new List<Entity> {new Entity {Title = "Все", Id = 0}}}
            };
            var profiles = meridian.cure_profilesStore.All().Where(item => item.Deseases.Any()).OrderBy(item => item.title).ToList();
            
            foreach (var profile in profiles)
            {
                var entity = new Entity
                {
                    Id = profile.id,
                    Title = profile.title,
                    Sub = new List<Entity> { new Entity { Title = "Все", Id = 0 } }
                };

                foreach (var desease in profile.Deseases.OrderBy(item => item.title))
                {
                    entity.Sub.Add(new Entity { Title = desease.title, Id = desease.id });
                }

                cureProfiles.Add(entity);
            }

            return Json(cureProfiles);
        }

        [HttpPost]
        public JsonResult GetMapTerritories()
        {
            var result = new List<Entity>();
            var eurasia = new Entity {Id = 0, Title = "Евразия", Label = TerritoryName.Eurasia};

            var territories = meridian.territoriesStore.GetRootTerritories().SortByDefault();
            foreach (var territory in territories)
            {
                if (territory.map_key == TerritoryName.Eurasia)
                {
                    eurasia.Sub.Add(new Entity
                    {
                        Id = territory.id, 
                        Title = territory.title, 
                        Sub = territory.SubTerritories
                            .SortByDefault()
                            .Select(item => new Entity { Id = item.id, Title = item.title })
                            .ToList()
                    });
                }
                else
                {
                    var group = new Entity {Id = territory.id, Title = territory.title, Label = territory.map_key};
                    if (territory.SubTerritories.Any())
                    {
                        var subEntities = territory.SubTerritories.SortByDefault()
                            .Select(item => new Entity { Id = item.id, Title = item.title });
                        group.Sub.AddRange(subEntities);
                    }

                    result.Add(group);
                }
            }

            result.Add(eurasia);

            return Json(result);
        }

        public CaptchaImageResult Image()
        {
            return new CaptchaImageResult();
        }

        [HttpPost]
        public ActionResult CheckCaptcha(string guid, string value)
        {
            CaptchaImage image = CaptchaImage.GetCachedCaptcha(guid);
            string expectedValue = image == null ? string.Empty : image.Text;
            var result = !string.IsNullOrEmpty(expectedValue) && string.Equals(value, expectedValue, StringComparison.OrdinalIgnoreCase);
            
            return Json(new {result = Convert.ToInt16(result)});
        }
    }
}