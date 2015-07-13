SET NAMES utf8;

ALTER TABLE `resorts` 
ADD COLUMN `ad_cure_profiles` VARCHAR(255) NULL AFTER `cure_profiles`;

DELETE FROM cure_profiles WHERE id > 0;
ALTER TABLE cure_profiles AUTO_INCREMENT = 1;

ALTER TABLE `cure_profiles` 
ADD COLUMN `css_class` VARCHAR(100) NULL AFTER `gender_id`;

INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (1,'Болезни системы кровообращения',1,'b-illness__img__active_2');
INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (2,'Болезни органов пищеварения',1,'b-illness__img__active_9');
INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (3,'Болезни нервной системы',1,'b-illness__img__active_10');
INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (4,'Болезни костно-мышечной системы',1,'b-illness__img__active_1');
INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (5,'Болезни органов дыхания ',1,'b-illness__img__active_8');
INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (6,'Болезни ЛОР-органов ',1,'b-illness__img__active_7');
INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (7,'Гинекологические болезни',3,'b-illness__img__active_6');
INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (8,'Болезни почек, мочевыводящих путей, андрологические заболевания',1,'b-illness__img__active_5');
INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (9,'Болезни эндокринной системы, расстройства питания и нарушения обмена веществ',1,'b-illness__img__active_3');
INSERT INTO `cure_profiles` (`id`,`title`,`gender_id`, `css_class`) VALUES (10,'Глазные болезни',1,'b-illness__img__active_4');

INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (1, "I05-I08", "Ревматические болезни сердца", "Chronic rheumatic heart diseases", "1");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (2, "I09.1", "Ревматические болезни эндокарда", "Rheumatic diseases of endocardium", "1");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (3, "I10", "Эссенциальная [первичная] гипертензия", "Essential (primary) hypertension", "1");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (4, "I15", "Вторичнaя гипертензия", "Secondary hypertension", "1");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (5, "I20", "Стенокaрдия [груднaя жaбa]", "Angina pectoris", "1");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (6, "К20", "Эзофагит", "Oesophagitis", "2");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (7, "К21.0", "Гастроэзофагеальный рефлюкс с эзофагитом", "Gastro-oesophageal reflux disease with oesophagitis", "2");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (8, "К21.9", "Гастроэзофагеальный рефлюкс без эзофагита", "Gastro-oesophageal reflux disease without oesophagitis", "2");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (9, "К22.0", "Ахалазия кардиальной части", "Achalasia of cardia", "2");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (10, "К22.1", "Язва пищевода", "Ulcer of oesophagus", "2");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (11, "G09", "Последствия воспалительных болезней центральной нервной системы", "Sequelae of inflammatory diseases of central nervous system", "3");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (12, "G20", "Болезнь Паркинсона", "Parkinson's disease", "3");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (13, "G24", "Дистония", "Dystonia", "3");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (14, "G30", "Болезнь Альцгеймера", "Alzheimer's disease with early onset", "3");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (15, "G35", "Рассеянный склероз", "Multiple sclerosis", "3");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (16, "M03", "Постинфекционные и реактивные артропатии", "Postinfective and reactive arthropathies", "4");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (17, "M06", "Ревматоидный артрит", "Rheumatoid arthritis", "4");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (18, "M07", "Псориатическая артропатия", "Psoriatic and enteropathic arthropathies", "4");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (19, "M08", "Юношеский [ювенильный] артрит", "Juvenile arthritis", "4");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (20, "M10.0", "Идиопатическая подагра", "Idiopathic gout", "4");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (21, "J18", "Пневмонии (период выздоровления)", "Pneumonia, Bronchopneumonia (recovery period)", "5");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (22, "J18.9", "Хроническая пневмония", "Pneumonia, chronic", "5");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (23, "J18.9", "Пневмония затяжного течения", "Pneumonia, lingering illness", "5");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (24, "J30", "Вазомоторный и аллергический ринит, поллинозы", "Vasomotor and allergic rhinitis, Pollinosis", "5");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (25, "J41", "Хронический бронхит", "Simple chronic bronchitis", "5");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (26, "Класс VIII", "Болезни уха и сосцевидного отростка", "Diseases of the ear and mastoid process", "6");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (27, "Класс X", "Болезни верхних дыхательных путей", "Diseases of upper respiratory tract", "6");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (28, "H60", "Наружный отит", "Otitis externa", "6");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (29, "H65-H75", "Болезни среднего уха и сосцевидного отростка", "Diseases of middle ear and mastoid", "6");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (30, "H80", "Отосклероз", "Otosclerosis", "6");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (31, "N70.1", "Хронический сальпингит и оофорит", "Chronic salpingitis and oophoritis", "7");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (32, "N71.1", "Хронический эндо (мио) метрит, хронический метрит", "Chronic inflammatory disease of uterus", "7");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (33, "N73.1", "Хронический параметрит и тазовый целлюлит", "Chronic parametritis and pelvic cellulitis", "7");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (34, "N73.4", "Хронический тазовый перитонит у женщин", "Female chronic pelvic peritonitis", "7");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (35, "N73.6", "Тазовые перитонеальные спайки у женщин", "Female pelvic peritoneal adhesions", "7");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (36, "N03", "Хронический нефритический синдром [гломерулонефрит]", "Chronic nephritic syndrome [glomerulonephritis]", "8");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (37, "N11", "Хронический тубулоинтерстициальный нефрит [пиелит, пиелонефрит]", "Chronic tubulo-interstitial nephritis [pyelitis, pyelonephritis]", "8");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (38, "N18", "Хроническaя почечнaя недостaточность", "Chronic renal failure", "8");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (39, "N20", "Мочекаменная болезнь", "Calculus of kidney and ureter", "8");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (40, "N21", "Кaмни нижних отделов мочевых путей", "Calculus of lower urinary tract", "8");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (41, "E01", "Болезни щитовидной железы связанные с йодной недостаточностью", "Iodine-deficiency-related thyroid disorders and allied conditions", "9");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (42, "E02", "Субклинический гипотиреоз вследствие йодной недостаточности", "Subclinical iodine-deficiency hypothyroidism", "9");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (43, "E04.0", "Нетоксический диффузный зоб", "Nontoxic diffuse goitre", "9");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (44, "E05.0", "Тиреотоксикоз с диффузным зобом", "Thyrotoxicosis with diffuse goitre", "9");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (55, "Е06.3", "Аутоиммунный тиреоидит", "Autoimmune thyroiditis", "9");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (56, "H01.0", "Блефарит", "Blepharitis", "10");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (57, "H01.1", "Неинфекционные дермaтозы века", "Noninfectious dermatoses of eyelid", "10");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (58, "H04.4", "Дакриоцистит хронический", "Dacryocystitis chronic", "10");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (59, "H10.4", "Хронический конъюнктивит", "Chronic conjunctivitis", "10");
INSERT INTO `deseases` (`id`, `icd_code`, `title`, `international_title`, `profile_id`) VALUES (60, "H15.0", "Склерит", "Scleritis ", "10");