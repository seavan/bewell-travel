SET NAMES utf8;

INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('1', 'Основная информация', 'main', '0', '1', 1, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('2', 'Природные лечебные факторы', 'medical-factors', '0', '2', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('3', 'Показания', 'symptoms', '0', '3', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('4', 'Питание', 'nutrition', '0', '4', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('5', 'Размещение', 'allocation', '0', '5', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('6', 'Досуг', 'leisure', '0', '6', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('7', 'Спорт', 'sport', '0', '7', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('8', 'Экскурсионная программа', 'tour', '0', '8', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('9', 'Сервис', 'service', '0', '9', 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`) VALUES ('10', 'Контакты', 'contacts', '0', '10', 0, 1);

INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('1', 'Почему выбирают отель', '1', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('2', 'Кратко об отеле', '1', '2');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('3', 'Природные лечебные факторы', '2', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('4', 'Показания', '3', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('5', 'Питание', '4', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('6', 'Размещение', '5', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('7', 'Досуг', '6', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('8', 'Спорт', '7', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('9', 'Экскурсионная программа', '8', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('10', 'Сервис', '9', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('11', 'Адрес', '10', '1');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('12', 'Как проехать', '10', '2');
INSERT INTO `entity_fields` (`id`, `title`, `fieldset_id`, `order_number`) VALUES ('13', 'Где купить', '10', '3');

CREATE TABLE `hotels` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `territory_id` BIGINT NOT NULL,
  `stars` INT NOT NULL DEFAULT 0,
  `coordinates` VARCHAR(30) NULL,
PRIMARY KEY (`id`));

INSERT INTO `hotels` (`id`, `title`, `description`, `territory_id`, `stars`, `coordinates`) VALUES ('1', 'Санаторий Беломорье', 'Санаторий «Беломорье» расположен в хвойном лесу у живописных озер Смердье и Опогра г. Архангельска. Лесные прогулки – это тишина, запах смолы и целебный воздух, это врачующий душу глухой шум могучих сосен. После таких прогулок крепче сон и лучше настроение.', '16', '4', '64.294026,40.889632');
INSERT INTO `hotels` (`id`, `title`, `description`, `territory_id`, `stars`, `coordinates`) VALUES ('2', 'Rogner Bad Blumau Hotel ', 'Предпочитаете останавливаться в пятизвездочных гостиницах в центре Москвы? В таком случае отель «Ronger bad» - именно то, что Вам нужно! Мы позаботились обо всем, чтобы Вы могли по-настоящему открыть и полюбить столицу. К вашим услугам роскошный трансфер на BMW, персональный шопинг-гид, уроки гольфа, лучшие рестораны, шикарные номера и многое другое. Среди пятизвездочных гостиниц в центре Москвы «Ronger bad» занимает почетное место.', '18', '5', '55.652,37.735953');
INSERT INTO `hotels` (`id`, `title`, `description`, `territory_id`, `stars`, `coordinates`) VALUES ('3', 'Enfield Hotel', 'The Enfield Hotel is available for all your special occasions. We cater for birthdays, engagements, weddings, christenings, kids parties and wakes.', '44', '5', '-34.865396,138.618326');
INSERT INTO `hotels` (`id`, `title`, `description`, `territory_id`, `stars`, `coordinates`) VALUES ('4', 'Пур Наволок', 'Новый современный отель расположен на берегу красавицы Северной Двины, в историческом месте. Отсюда, с мыса Пур-Наволок, в конце XVI века начинался город. Здесь вырос его административный, деловой и культурный центр. Здесь нет промышленных предприятий. Отсюда открывается чудесный вид на Двину.', '43', '5', '64.541339,40.510753');
INSERT INTO `hotels` (`id`, `title`, `description`, `territory_id`, `stars`, `coordinates`) VALUES ('5', 'Washington Square Hotel', "Located in the heart of New York City's Greenwich Village, the Washington Square Hotel is situated on historic Washington Square Park.", '45', '5', '40.732407,-73.998773');

INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('1', '0', '1', 'Потому что он хороший');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('1', '0', '2', 'Санаторий «Беломорье» расположен в хвойном лесу у живописных озер Смердье и Опогра г. Архангельска. Лесные прогулки – это тишина, запах см...');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('1', '0', '5', 'К услугам отдыхающих может быть предложено:Стандартное питание с обслуживанием в кафе;Индивидуальное питание по предварительному заказу с обслуживанием в кафе.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('1', '0', '8', 'Имеется спортзал, беговые дорожки');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('1', '0', '10', 'Отличный сервис!');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('1', '0', '11', '163534, Архангельская обл., Приморский р-н, п. Беломорье, д.20');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('1', '0', '12', 'Автобус санатория № 163 - г. Архангельск, от Морского речного вокзала в 7-30, 11-00 и 17-20');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('1', '0', '13', 'Купить путевку в санаторий можно на нашем сайте');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('2', '0', '1', 'Лучшая гостиница в центре Москвы');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('2', '0', '2', 'Предпочитаете останавливаться в пятизвездочных гостиницах в центре Москвы? В таком случае отель «Ronger bad» - именно то, что Вам нужно! Мы поза...');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('2', '0', '5', 'Хорошее питание');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('2', '0', '8', 'Гольф, Теннис, Бильярд, Спортзал');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('2', '0', '10', 'Высший сервис, лучшее обслуживание');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('2', '0', '11', 'Москва, улица Перерва, 44');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('2', '0', '12', 'На метро');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('2', '0', '13', 'Забронировать можно на нашем сайте');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('3', '0', '1', 'The best in this area');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('3', '0', '2', 'The Enfield Hotel is available for all your special occasions. We cater for birthdays, engagements, weddings, christenings, kids parties and wakes.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('3', '0', '5', 'National, european food');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('3', '0', '11', 'Аделаида, Южная Австралия, Австралия, Hampstead Rd 321');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('3', '0', '13', 'On our website');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('4', '0', '1', 'Отличный вид на набережную и Северную Двину');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('4', '0', '2', 'Новый современный отель расположен на берегу красавицы Северной Двины, в историческом месте. Отсюда, с мыса Пур-Наволок, в конце XVI века начинался город. Здесь вырос его административный, деловой и культурный центр. Здесь нет промышленных предприятий. Отсюда открывается чудесный вид на Двину.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('4', '0', '5', 'Отличное питание, разнообразные кухни');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('4', '0', '11', 'наб. Северной Двины, д.88, Архангельск, 163061');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('4', '0', '13', 'Забронировать можно на сайте');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('5', '0', '1', 'The best in this area');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('5', '0', '2', "Located in the heart of New York City's Greenwich Village, the Washington Square Hotel is situated on historic Washington Square Park.");
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('5', '0', '5', 'National, european food');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('5', '0', '11', '103 Waverly Place, New York');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('5', '0', '13', 'On our website');

INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '2');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '9');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '24');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '29');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '34');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '43');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '46');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '56');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '58');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('1', '93');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '4');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '9');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '34');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '46');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '69');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '72');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '92');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '97');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '130');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('2', '132');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '1');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '15');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '34');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '46');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '69');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '72');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '92');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '97');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '130');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('3', '132');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '2');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '9');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '34');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '46');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '69');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '73');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '94');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '97');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '130');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('4', '132');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '4');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '8');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '45');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '49');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '69');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '73');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '94');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '97');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '130');
INSERT INTO `hotel_properties` (`hotel_id`, `property_id`) VALUES ('5', '132');

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('1', '0', 'hotel1_2.jpg', 'hotel1_2m.jpg', 1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('1', '0', 'hotel1_3.jpg', 'hotel1_3m.jpg', 0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('1', '0', 'hotel1_1.jpg', 'hotel1_1m.jpg', 0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('1', '0', 'hotel1_4.jpg', 'hotel1_4m.jpg', 0, 4);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('1', '0', 'hotel1_5.jpg', 'hotel1_5m.jpg', 0, 5);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('1', '0', 'hotel1_6.jpg', 'hotel1_6m.jpg', 0, 6);

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('2', '0', 'hotel2_1.jpg', 'hotel2_1m.jpg', 1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('2', '0', 'hotel2_2.jpg', 'hotel2_2m.jpg', 0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('2', '0', 'hotel2_3.jpg', 'hotel2_3m.jpg', 0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('2', '0', 'hotel2_4.jpg', 'hotel2_4m.jpg', 0, 4);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('2', '0', 'hotel2_5.jpg', 'hotel2_5m.jpg', 0, 5);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('2', '0', 'hotel2_6.jpg', 'hotel2_6m.jpg', 0, 6);

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('3', '0', 'hotel3_1.jpg', 'hotel3_1m.jpg', 1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('3', '0', 'hotel3_2.jpg', 'hotel3_2m.jpg', 0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('3', '0', 'hotel3_3.jpg', 'hotel3_3m.jpg', 0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('3', '0', 'hotel3_4.jpg', 'hotel3_4m.jpg', 0, 4);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('3', '0', 'hotel3_5.jpg', 'hotel3_5m.jpg', 0, 5);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('3', '0', 'hotel3_6.jpg', 'hotel3_6m.jpg', 0, 6);

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('4', '0', 'hotel4_1.jpg', 'hotel4_1m.jpg', 1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('4', '0', 'hotel4_2.jpg', 'hotel4_2m.jpg', 0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('4', '0', 'hotel4_3.jpg', 'hotel4_3m.jpg', 0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('4', '0', 'hotel4_4.jpg', 'hotel4_4m.jpg', 0, 4);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('4', '0', 'hotel4_5.jpg', 'hotel4_5m.jpg', 0, 5);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('4', '0', 'hotel4_6.jpg', 'hotel4_6m.jpg', 0, 6);

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('5', '0', 'hotel5_1.jpg', 'hotel5_1m.jpg', 1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('5', '0', 'hotel5_2.jpg', 'hotel5_2m.jpg', 0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('5', '0', 'hotel5_3.jpg', 'hotel5_3m.jpg', 0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('5', '0', 'hotel5_4.jpg', 'hotel5_4m.jpg', 0, 4);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('5', '0', 'hotel5_5.jpg', 'hotel5_5m.jpg', 0, 5);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `photo`, `preview`, `is_main`, `order_number`) VALUES ('5', '0', 'hotel5_6.jpg', 'hotel5_6m.jpg', 0, 6);



