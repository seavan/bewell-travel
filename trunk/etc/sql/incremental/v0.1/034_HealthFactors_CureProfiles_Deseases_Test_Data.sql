SET NAMES utf8;

INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (41, 'Основная информация', '', '5', '1', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (42, 'Из истории', 'history', '5', '2', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (43, 'Клиническая эффективность', 'efficiency', '5', '3', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (44, 'Показания/Противопоказания', 'indication', '5', '4', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (45, 'Полезные советы', 'advice', '5', '5', 0, 0, 0);

INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (46, 'Основная информация', '', '6', '1', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (47, 'Из истории', 'history', '6', '2', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (48, 'Клиническая эффективность', 'efficiency', '6', '3', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (49, 'Показания/Противопоказания', 'indication', '6', '4', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (50, 'Полезные советы', 'advice', '6', '5', 0, 0, 0);

INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (51, 'Основная информация', '', '7', '1', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (52, 'Из истории', 'history', '7', '2', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (53, 'Природные факторы', 'factors', '7', '3', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (54, 'Показания/Противопоказания', 'indication', '7', '4', 0, 0, 0);

INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (55, 'Основная информация', '', '8', '1', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (56, 'Из истории', 'history', '8', '2', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (57, 'Природные факторы', 'factors', '8', '3', 0, 0, 0);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (58, 'Показания/Противопоказания', 'indication', '8', '4', 0, 0, 0);

INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES ('33', 'Основная информация', '41,46,51,55', '1', 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES ('34', 'Из истории', '42,47,52,56', '1', 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES ('35', 'Клиническая эффективность', '43,48', '1', 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES ('36', 'Показания/Противопоказания', '44,49,54,58', '1', 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES ('37', 'Полезные советы', '45,50', '1', 0);

UPDATE `entity_fields` SET `fieldsets`='14,53,57' WHERE `id`=17;

INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (2, 5, 33, 'Мо́ре — часть Мирового океана, обособленная сушей или возвышениями подводного рельефа. Отличается от Мирового океана также гидрологическим, метеорологическим и климатическим режимом, что связано с их окраинным положением относительно океанов и замедлению водообмена из-за ограниченности связи с открытой частью');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (2, 5, 34, 'Русское слово «море» восходит к праслав. *mor`e, которое, в свою очередь, продолжает пра-и.е. *mori, первоначальным значением которого, видимо, было «стоячая вода» (оттуда же и лат. mare «море»)');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (2, 5, 35, 'Морская вода непригодна для питья из-за высокого содержания минералов, для выведения которых из организма требуется воды больше, чем её выпитое количество. Однако после опреснения такую воду можно пить.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (2, 5, 36, 'Морская вода используется для лечения посредством ванн, ингаляций и полосканий. Она помогает при заболеваниях дыхательной системы, способствует уменьшению боли в суставах и мышцах. Имеет антибактериальные свойства. Способствует регенерации тканей и повышает тургор кожи. Помогает снять стресс и усталость.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (2, 5, 37, 'По степени обособленности и особенностям гидрологического режима моря подразделяются на 3 группы: внутренние моря (средиземные моря и полузамкнутые моря), окраинные моря и межостровные моря. По географическому положению средиземные моря иногда делят на межматериковые моря и внутриматериковые моря');

INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 6, 33, 'Аэротерапия — (лат. aeris – воздух) – воздухолечение, лечение воздушными ваннами, пребывание на открытом воздухе. Метод климатотерапии, использующий дозированное воздействие так называемым открытым (атмосферным) воздухом на организм в лечебно-профилактических целях. Особенно полезна аэроионотерапия (лат. ion — идущий, движущийся).');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 6, 34, 'С древних времен люди эмпирически использовали с лечебными целями ресурсы естественной аэроионизации на берегах морей, горных рек, у водопадов, в лесах, где концентрация аэроионов и фитонцидов оптимальна. Античные врачи рекомендовали чахоточным больным морские путешествия, а древнеримский врач Гален настоятельно рекомендовал легочным больным дышать морским воздухом. Но сама сущность целебного эффекта была им непонятна.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 6, 35, 'Основной эффект от аэротерапии заключается в следующем — открытый воздух охлаждает кожные рецепторы, нервные окончания слизистой, приводя к повышению порога чувствительности, совершенствуя терморегуляцию организма и тем самым способствуя его закалке.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 6, 36, 'Аэротерапия показана при заболеваниях сердца, лёгких, желудка, кожи.<br>Противопоказания — ОРЗ, легочно-сердечная недостаточность 3 степени, обострения хронических заболеваний.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 6, 37, 'К аэротерапии относятся прогулки по парку санатория, спортивные игры в парковых зонах и на пляже, сон на открытом воздухе, у моря, в специальных павильонах. Все спортивные площадки, терренкуры, променады, «тропы здоровья» устроены в лесу или в непосредственной близости от водоемов – моря, озера, реки. ');

INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 7, 33, 'Нарушения функции сердца, сосудистого тонуса или изменения в системе крови могут привести к недостаточности кровообращения — состоянию, при котором система кровообращения не обеспечивает потребности тканей и органов в доставке к ним с кровью кислорода и субстратов метаболизма, а также транспорт от тканей углекислоты и метаболитов.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 7, 34, '«Эпохой сердечно-сосудистых заболеваний» назовут будущие поколения XX век. Сердечно-сосудистые заболевания являются самыми распространенными и опасными болезнями не только XX, но уже XXI века. Сравниться с ними по распространенности и опасности для человека могут только онкологические заболевания и диабет. В прежние времена эпидемии чумы, оспы и тифа уносили миллионы человеческих жизней. К счастью, эти бедствия остались в прошлом, но людей продолжают забрать новые заболевания.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 7, 17, 'Как ни странно, к заболеваниям приводят не перегрузки сердечно-сосудистой системы, а малоподвижный образ жизни, ее длительная, перманентная недозагруженность. Известно, что тренировка необходима мышцам, чтобы держать их в здоровом тонусе, поддерживать их нормальную функцию, не допускать их ослабления. Но сердце – это не что иное, как постоянно работающая мышца, которая нуждается для своей тренировки в высоких нагрузках.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (1, 7, 36, 'При рекомендации санаторно-курортного лечения больным с заболеваниями сердечно-сосудистой системы следует учитывать их реактивность на смену погоды и воздерживаться от направления больных с метеотропными реакциями в периоды резких колебаний погоды, особенно в холодный период года, а также на курорты с контрастными климато-географическими условиями.');

INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (4, 8, 33, 'Артериальная гипертензия часто сопровождает заболевания почек, потому что именно почки являются важнейшим органом в регуляции AД. Они контролируют внеклеточный объем жидкости и общее содержания натрия и электролитов в организме. А еще почки синтезируют вазоконстрикторные субстанции, такие как ренин, эндотелий, простагландин Е и вазодилататоры - оксид азота, простагландин Fla и кинины.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (4, 8, 34, 'Гипертензивный почечный синдром возникает примерно в 5-10% всех случаев артериальных гипертензий. Ее существование можно заподозрить при устойчивом высоком АД, при быстропрогрессирующей или злокачественной артериальной гипертензии, особенно у молодых людей (до 30-летнего возраста) и у больных после 50 лет.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (4, 8, 17, 'В основе гипертензивного почечного синдрома лежит широкий перечень заболеваний, которые можно разделить на три группы, а в последние годы было добавлено такой фактор, как трансплантирована почка.');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES (4, 8, 36, 'Терапия с помощью комбинации изменения образа жизни и антигипертензивных лекарственных средств обычно может поддерживать кровяное давление на уровне, который не будет вызывать повреждения почек или других органов. Ключ к избежанию серьезных осложнений гипертонии заключается в ранней диагностике и лечении, прежде чем нанесен ущерб. Потому что антигипертензивные лекарства могут регулировать АД, но не вылечить его, пациенты должны продолжать принимать лекарства, чтобы поддерживать снижение уровня артериального давления и избежать осложнений.');

INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('41', '33', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('42', '34', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('43', '35', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('44', '36', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('45', '37', '1');

INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('46', '33', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('47', '34', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('48', '35', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('49', '36', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('50', '37', '1');

INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('51', '33', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('52', '34', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('53', '17', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('54', '36', '1');

INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('55', '33', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('56', '34', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('57', '17', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('58', '36', '1');