SET NAMES utf8;

ALTER TABLE `resort_zones` ADD COLUMN `treatment_options` VARCHAR(255) NULL AFTER `health_factors`;

INSERT INTO `countries` (`id`, `title`, `territory_id`, `health_factors`) VALUES (1, 'Черногория', 21, '1,2,3');
INSERT INTO `regions` (`id`, `title`, `territory_id`, `health_factors`) VALUES (1, 'Южная Австралия', 44, '1,2,3');
INSERT INTO `resort_zones` (`id`, `title`, `territory_id`, `health_factors`, `treatment_options`) VALUES (1, 'Курортная зона на острове Мадагаскар', 31, '1,2,3', '1,4,6,8,14,21');

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 2, 'country1_1', 'country1_1.original.jpg', 'country1_1.large.jpg', 'country1_1.mid.jpg', 'country1_1.small.jpg', 1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 2, 'country1_2', 'country1_2.original.jpg', 'country1_2.large.jpg', 'country1_2.mid.jpg', 'country1_2.small.jpg', 0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 2, 'country1_3', 'country1_3.original.jpg', 'country1_3.large.jpg', 'country1_3.mid.jpg', 'country1_3.small.jpg', 0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 2, 'country1_4', 'country1_4.original.jpg', 'country1_4.large.jpg', 'country1_4.mid.jpg', 'country1_4.small.jpg', 0, 4);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 2, 'country1_5', 'country1_5.original.jpg', 'country1_5.large.jpg', 'country1_5.mid.jpg', 'country1_5.small.jpg', 0, 5);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 2, 'country1_6', 'country1_6.original.jpg', 'country1_6.large.jpg', 'country1_6.mid.jpg', 'country1_6.small.jpg', 0, 6);

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 3, 'region1_1', 'region1_1.original.jpg', 'region1_1.large.jpg', 'region1_1.mid.jpg', 'region1_1.small.jpg', 1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 3, 'region1_2', 'region1_2.original.jpg', 'region1_2.large.jpg', 'region1_2.mid.jpg', 'region1_2.small.jpg', 0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 3, 'region1_3', 'region1_3.original.jpg', 'region1_3.large.jpg', 'region1_3.mid.jpg', 'region1_3.small.jpg', 0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 3, 'region1_4', 'region1_4.original.jpg', 'region1_4.large.jpg', 'region1_4.mid.jpg', 'region1_4.small.jpg', 0, 4);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 3, 'region1_5', 'region1_5.original.jpg', 'region1_5.large.jpg', 'region1_5.mid.jpg', 'region1_5.small.jpg', 0, 5);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 3, 'region1_6', 'region1_6.original.jpg', 'region1_6.large.jpg', 'region1_6.mid.jpg', 'region1_6.small.jpg', 0, 6);

INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 4, 'resortzone1_1', 'resortzone1_1.original.jpg', 'resortzone1_1.large.jpg', 'resortzone1_1.mid.jpg', 'resortzone1_1.small.jpg', 1, 1);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 4, 'resortzone1_2', 'resortzone1_2.original.jpg', 'resortzone1_2.large.jpg', 'resortzone1_2.mid.jpg', 'resortzone1_2.small.jpg', 0, 2);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 4, 'resortzone1_3', 'resortzone1_3.original.jpg', 'resortzone1_3.large.jpg', 'resortzone1_3.mid.jpg', 'resortzone1_3.small.jpg', 0, 3);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 4, 'resortzone1_4', 'resortzone1_4.original.jpg', 'resortzone1_4.large.jpg', 'resortzone1_4.mid.jpg', 'resortzone1_4.small.jpg', 0, 4);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 4, 'resortzone1_5', 'resortzone1_5.original.jpg', 'resortzone1_5.large.jpg', 'resortzone1_5.mid.jpg', 'resortzone1_5.small.jpg', 0, 5);
INSERT INTO `entity_photos` (`entity_id`, `entity_type`, `guid`, `original`, `thumbnail_large`, `thumbnail_mid`, `thumbnail_small`, `is_main`, `order_number`) VALUES (1, 4, 'resortzone1_6', 'resortzone1_6.original.jpg', 'resortzone1_6.large.jpg', 'resortzone1_6.mid.jpg', 'resortzone1_6.small.jpg', 0, 6);

UPDATE `entity_fields` SET `fieldsets`='11,18,20,28,32' WHERE `id`=14;
UPDATE `entity_fields` SET `fieldsets`='12,20,28,32' WHERE `id`=15;
UPDATE `entity_fields` SET `fieldsets`='13,20,28,32' WHERE `id`=16;
UPDATE `entity_fields` SET `fieldsets`='15,18,22,29,34' WHERE `id`=18;
UPDATE `entity_fields` SET `fieldsets`='2,19,36' WHERE `id`=3;
UPDATE `entity_fields` SET `fieldsets`='7,37' WHERE `id`=8;
UPDATE `entity_fields` SET `fieldsets`='6,38' WHERE `id`=7;

INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (21, 'О стране в двух словах', '20', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (22, 'Государство', '21', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (23, 'Население', '21', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (24, 'Язык', '21', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (25, 'Виза', '21', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (26, 'Курортная медицина', '24,35', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (27, 'Курорты', '24,30', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (28, 'Как проехать на курорты', '24,40', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (29, 'Достопримечательности', '26,31,39', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (30, 'Полезные советы', '27', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (31, 'В двух словах о курортной зоне', '32', 1, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES (32, 'Из истории курорта', '33', 1, 0);

DELETE FROM `fieldsets` WHERE `id`=23;
DELETE FROM `fieldsets` WHERE `id`=25;

INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (20, 21, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (20, 14, 2);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (20, 15, 3);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (20, 16, 4);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (21, 22, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (21, 23, 2);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (21, 24, 3);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (21, 25, 4);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (22, 18, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (24, 26, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (24, 27, 2);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (24, 28, 3);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (26, 29, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (27, 30, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (28, 14, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (28, 15, 2);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (28, 16, 3);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (29, 18, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (30, 27, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (31, 29, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (32, 31, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (32, 14, 2);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (32, 15, 3);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (32, 16, 4);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (33, 32, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (34, 18, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (35, 26, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (36, 3, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (37, 8, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (38, 7, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (39, 29, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (40, 28, 1);

INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 21, 'Черного́рия (серб./черногор. Црна Гора, Crna Gora; итал. Montenegro, происходит от топонима Црна Гора (чёрная гора) — государство в юго-восточной Европе, на адриатическом побережье Балканского полуострова.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 14, 'Омывается Адриатическим морем, имеет сухопутные границы с Хорватией на западе, Боснией и Герцеговиной — на северо-западе, Сербией — на северо-востоке, частично признанной Республикой Косово — на востоке и Албанией на юго-востоке.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 15, 'Курортный сезон длится почти весь год - 10 месяцев');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 16, 'В северной Черногории — умеренно-континентальный, на Адриатическом побережье — средиземноморский. В приморской области лето обычно продолжительное, жаркое (+23-25 °C) и достаточно сухое, зима — короткая и прохладная (+3—7 °C). В горных районах умеренно тёплое лето (+19-25 °C) и относительно холодная зима (от +5 до −10 °C), осадки выпадают в основном в виде снега. Осадков выпадает от 500 до 1500 мм в год, преимущественно в виде дождя, в горах близ морского побережья местами выпадает свыше 3000 мм. В северных областях Черногории снег лежит до 5 месяцев в году. Количество солнечных часов в год: в Игало — 2386, в Улцине — 2700.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 22, '20 октября 2007 года была принята Конституция Черногории. В соответствии с первой статьей Конституции, Черногория является свободным, демократическим, экологичным государством социальной справедливости, основанным на принципах верховенства закона.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 23, 'По данным переписи 1 — 15 апреля 2011 года: численность населения — 626 тысяч чел. Особенностью Черногории является дуализм национального самосознания. Черногорцев роднит с сербами язык (черногорский большинством населения считается диалектом сербского, см. результаты опроса по родному языку), религия (православное христианство) и общие вехи истории. Около половины респондентов, упомянутых в результатах переписи 2003 года как черногорцы, в анкетах писали «черногорец, серб» или «серб-черногорец».');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 24, 'Официальный язык - черногорский/сербский');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 25, 'Граждане Российской Федерации и Белоруссии пребывают на территории Черногории без визы сроком до 30 дней включительно.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 27, 'Весьма популярны международные курорты в городах Херцег-Нови, Будва, Бечичи, Петровац.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 2, 29, 'Исторические и природные достопримечательности — город Котор на берегу Которского залива, бывшая столица Цетине, Скадарское озеро, гора Ловчен, высокогорный монастырь Острог, каньон реки Тара (самый большой в Европе и второй в мире: его глубина достигает 1300 м), национальный парк Дурмитор и его горнолыжный курорт Жабляк (1465 метров над уровнем моря, это самый высокогорный город на Балканах).');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 3, 14, 'Южная Австралия граничит со всеми штатами и территориями страны, кроме территории федеральной столицы и Тасмании. Территория, ныне известная как Северная территория, была присоединена к Южной Австралии в 1863 году и передана в федеральное подчинение в 1911, став отдельной территорией');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 3, 15, 'Административный центр Южной Австралии - Аделаида. Часовой пояс UTC+9.30, летом UTC+10.3');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 3, 16, 'Средняя температура составляет 29°C в январе и 15 °C в июле. Дневные температуры в некоторых частях штата могут достигать 48 °C в январе и феврале.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 3, 27, 'Голд-Кост (Золотое Побережье) - главный курорт Австралии, один из лучших и самых популярных курортов мира, расположен между Сиднеем и Брисбеном.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 3, 29, 'Национальный парк Флиндерс-Рейнджес, Озеро Эйр, Парк Little Dip');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 4, 31, 'Республика Мадагаскар (малаг. Repoblikan Madagasikara [republiˈkʲan madaɡasˈkʲarə̥], фр. République de Madagascar) — островное государство в Восточной Африке. Расположено в западной части Индийского океана, на острове Мадагаскар и прилегающих мелких островах у побережья Африки. Площадь — 587 тыс. км², население — 20,7 млн чел. (2009 г.). Столица — Антананариву.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 4, 14, 'Остров Мадагаскар омывается водами Индийского океана и располагается около восточного побережья Южной Африки, отделённый от неё Мозамбикским проливом. Высшей точкой является потухший вулкан Марумукутру (2876 м), который находится в горном массиве Царатанана, в северной части острова. Общая площадь государства — 587 040 км². Длина около 1600 км, ширина свыше 600 км. Центральную часть острова занимает высокогорное плато Анджафи, полого спускающееся на запад и круто обрывающееся к низменностям восточного побережья.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 4, 15, 'Часовой пояс: UTC+3');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 4, 16, 'Климат острова формируется юго-восточным пассатом и Южно-Индийским антициклоном. На острове представлены три климатических пояса: тропический муссонный климат на восточном побережье, умеренный морской климат в центральном нагорье и засушливый климат в пустыне на южной оконечности острова. Западное побережье заметно суше восточного, так как пассат теряет влагу на восточном побережье и центральном нагорье. Типичные годичные нормы осадков: 350 см для южного побережья, 140 см для центрального нагорья (в данном случае — для столицы страны), 32 см на юге острова, на границе с пустыней');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 4, 32, 'Мадагаскарская культура формировалась под влиянием двух культур, лежащих в основе магаласийского народа, австронезийской культуры и культуры племён Банту. Начиная с X-го века она испытывала арабское влияние, а после XVI-го европейское, особенно французское в XX-м веке.');
INSERT INTO `bewell`.`field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 4, 8, 'На международных соревнованиях по футболу Мадагаскар представляет национальная сборная. Команда принимает соперников на стадионе «Махамасина» (22000 мест). Федерация Футбола Мадагаскара проводит Чемпионат, Кубок и Суперкубок страны по футболу.');