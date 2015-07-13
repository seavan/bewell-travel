SET NAMES utf8;

INSERT INTO `resorts` (`id`, `title`, `territory_id`) VALUES ('1', 'Бечичи', '21');
INSERT INTO `resorts` (`id`, `title`, `territory_id`) VALUES ('2', 'Золотое Побережье', '27');

UPDATE `fieldsets` SET `url`='' WHERE `id`='1';

INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('11', 'Основная информация', '', '1', '1', 1, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('12', 'Время', 'season', '1', '2', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('13', 'Климат', 'climate', '1', '3', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('14', 'Природные факторы', 'natural-factor', '1', '4', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('15', 'Основные показания для лечения', 'treatment-factors', '1', '5', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('16', 'Курортная медицина', 'medicine', '1', '6', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('17', 'Рекреационные ресурсы', 'recreational-resources', '1', '7', 0, 0);

INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('14', 'География', '11', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('15', 'Время', '12', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('16', 'Климат', '13', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('17', 'Природные факторы', '14', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('18', 'Основные показания для лечения', '15', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('19', 'Курортная медицина', '16', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('20', 'Рекреационные ресурсы', '17', '1');

INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('32', '1', '1', '14', 'Курорт в Черногории, расположенный на территории муниципалитета города Будвы. Расположен юго-восточнее Будвы на побережье Адриатического моря и имеет постоянное население порядка 800 человек, согласно данным переписи населения 2003 года. Бечичи является достаточно крупным центром туризма на Будванской ривьере и знаменит своим протяжённым песчаным пляжем. Длина пляжа составляет 1950 метров и он считается одним из самых живописных пляжей в Черногории и южной Адриатике. Более того, в 1935 году пляж завоевал гран-при в Париже как самый красивый пляж Европы. В Бечичи расположено множество гостиниц, построенных как в период социалистической Югославии, так и современных. В настоящее время в городе производится реконструкция старых гостиниц и возведение новых.');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('33', '1', '1', '15', 'Курортный сезон длится почти весь год - 10 месяцев');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('34', '1', '1', '16', 'Лучшие сезоны для отдыха:<br>начало мая – конец июня – много европейцев, низкие цены. Воздух прогревается до +28 — +30 градусов, а море + 18 — +19 градусов. Купаться уже можно в 20-х числах мая.<br>до середины июля – великолепная погода и цены на проживание.<br>середина июля – конец августа – высокий сезон. Все стабильно хорошо: погода, море, и лишь цены в ресторанах увеличиваются на 5-10 евро.<br>сентябрь – бархатный сезон. Погода еще комфортная и теплая, даже в начале октября еще можно купаться, но вечера становятся прохладными.');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('35', '1', '1', '17', 'Море, солнце, пляж, хороший климат.');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('36', '1', '1', '18', 'Пребывание тут лечит все болезни!');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('37', '1', '1', '19', 'К услугам отдыхающих предлагаются спа-салоны, массажи, консультации разных врачей');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('38', '1', '1', '20', 'Много всяких рекреационных ресурсов');

INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('39', '2', '1', '14', 'Золотое Побережье (или Голд-Кост) — курортная зона Австралии, расположенная недалеко от Брисбена. Условно её можно разделить на три курорта: изысканный Мейн-Бич с фешенебельными ресторанами, магазинами и отелями, «заводной» Серферс-Парадайз, который считается центром Золотого Побережья и несколько более спокойный Брод-Бич, предлагающий отдых и развлечения по доступным ценам. Везде — отличные золотистые пляжи и прекрасная погода большую часть года (правда, волна бывает сильной и коварной, так что купаться там следует с осторожностью и слишком далеко не заплывать).');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('40', '2', '1', '15', 'Курортный сезон длится круглый год');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('41', '2', '1', '16', 'Средняя температура воздуха: декабрь-февраль +21..+29С, март-май +17..+26С, июнь-август +10..+20С, сентябрь-ноябрь +14..+24С.');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('42', '2', '1', '17', 'Бесконечная цепочка пляжей, белые башни отелей, шум прибоя, яхт-клубы, бассейны, прекрасная погода. Серферс Парадайз - одно из замечательнейших мест побережья.');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('43', '2', '1', '18', 'Пребывание тут лечит все болезни!');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('44', '2', '1', '19', 'На Золотом Побережье много возможностей для занятий спортом: серфинг, виндсерфинг, очень популярные «банги джамп» (прыжки с тросом), параглайдинг (спортивный парашют, прицепленный тросом к катеру), водные лыжи, прыжки на водных лыжах.');
INSERT INTO `field_values` (`id`, `entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('45', '2', '1', '20', 'Экскурсии: «Водный Парк», Заповедник Каррамбин — «зоопарк без клеток», развлекательные парки «Мир Кино», «Мир Мечты», «Мир Моря», «Мир Тропических Фруктов». Музей Рипли «Хочешь — верь, хочешь — не верь», национальный парк Ламингтон, «Парк необычных развлечений».');

ALTER TABLE `entity_photos` 
CHANGE COLUMN `photo` `thumbnail_small` VARCHAR(50) NOT NULL COMMENT 'уменьшенное изображение (140x96 px) для отображения в списках',
CHANGE COLUMN `preview` `thumbnail_mid` VARCHAR(50) NOT NULL COMMENT 'среднее изображение (220x146 px) для отображения в галерее',
ADD COLUMN `guid` VARCHAR(50) NOT NULL COMMENT 'имя файла (guid) без разширения' AFTER `entity_type`,
ADD COLUMN `original` VARCHAR(50) NOT NULL COMMENT 'оригинальное изображение' AFTER `guid`,
ADD COLUMN `thumbnail_large` VARCHAR(45) NOT NULL COMMENT 'большое изображение (460x312 px) для отображения главного изображения в галерее' AFTER `thumbnail_mid`;

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES ('1', '1', 'resort1_1', 'resort1_1.original.jpg', 'resort1_1.large.jpg', 'resort1_1.mid.jpg', 'resort1_1.small.jpg',1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES ('1', '1', 'resort1_2', 'resort1_2.original.jpg', 'resort1_2.large.jpg', 'resort1_2.mid.jpg', 'resort1_2.small.jpg',0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES ('1', '1', 'resort1_3', 'resort1_3.original.jpg', 'resort1_3.large.jpg', 'resort1_3.mid.jpg', 'resort1_3.small.jpg',0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES ('1', '1', 'resort1_4', 'resort1_4.original.jpg', 'resort1_4.large.jpg', 'resort1_4.mid.jpg', 'resort1_4.small.jpg',0, 4);

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES ('2', '1', 'resort2_1', 'resort2_1.original.jpg', 'resort2_1.large.jpg', 'resort2_1.mid.jpg', 'resort2_1.small.jpg',1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES ('2', '1', 'resort2_2', 'resort2_2.original.jpg', 'resort2_2.large.jpg', 'resort2_2.mid.jpg', 'resort2_2.small.jpg',0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES ('2', '1', 'resort2_3', 'resort2_3.original.jpg', 'resort2_3.large.jpg', 'resort2_3.mid.jpg', 'resort2_3.small.jpg',0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES ('2', '1', 'resort2_4', 'resort2_4.original.jpg', 'resort2_4.large.jpg', 'resort2_4.mid.jpg', 'resort2_4.small.jpg',0, 4);
