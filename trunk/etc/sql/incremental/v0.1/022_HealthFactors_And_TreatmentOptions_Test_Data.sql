SET NAMES utf8;

INSERT INTO `health_factors` (`id`, `title`) VALUES (1, 'Климат');
INSERT INTO `health_factors` (`id`, `title`) VALUES (2, 'Море');
INSERT INTO `health_factors` (`id`, `title`) VALUES (3, 'Питьевое лечение');
INSERT INTO `health_factors` (`id`, `title`) VALUES (4, 'Минеральные воды');
INSERT INTO `health_factors` (`id`, `title`) VALUES (5, 'Лечебные грязи');
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (6, 'Сульфидные воды', 4);
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (7, 'Углекислые воды', 4);
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (8, 'Радоновые воды', 4);
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (9, 'Хлоридные воды', 4);
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (10, 'Йодо-бромистые воды', 4);
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (11, 'Питьевые воды', 4);
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (12, 'Торфяные грязи', 5);
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (13, 'Иловые грязи', 5);
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (14, 'Сапропелевые грязи', 5);
INSERT INTO `health_factors` (`id`, `title`, `parent_id`) VALUES (15, 'Вулканические грязи', 5);

INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (1, 'Климатотерапия');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (2, 'Массаж');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (3, 'Лечебное питание');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (4, 'Ландшафтотерапия');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (5, 'Талассотерапия');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (6, 'Бальнеотерапия');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (7, 'Гидропатия');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (8, 'Лечебные души');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (9, 'Грязелечение');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (10, 'Физиотерапия ');
INSERT INTO `treatment_option_categories` (`id`, `title`) VALUES (11, 'Лечебная физическая культура');

INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Аэротерапия', 1);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Гелиотерапия', 1);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Спелеотерапия, лечебные климатические камеры', 1);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Классический массаж', 2);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Спортивный массаж', 2);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Лимфодренажный массаж', 2);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Мануальная терапия', 2);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Остеопатия', 2);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Язвенная болезнь в период затихающего обострения. Стол № 1', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Язвенная болезнь и гастриты с повышенной кислотностью Стол № 1б', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Хронические гастриты с пониженной кислотностью. Стол №2', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Атонические запоры. Стол № 3', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Колиты, энтероколиты. Стол № 4', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Целиакия, глютеновая энтеропатия, идиопатическая стеаторея. Стол № 4а', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Заболевания печени и желчевыводящих путей. Стол № 5', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Хронические панкреатиты. Стол № 5а', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Подагра, мочекаменная болезнь (гиперурикемия). Стол № 6', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Хронические заболевания почек. Стол № 7', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Ожирение. Стол № 8', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Сахарный диабет. Стол № 9', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Болезни сердца и сосудов. Стол № 10', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Анемии, период после болезней, операций, травм. Стол № 11', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Функциональные заболевания нервной системы. Стол № 12', 3);
INSERT INTO `treatment_options` (`title`, `category_id`) VALUES ('Мочекаменная болезнь (фосфатурия). Стол № 14', 3);

UPDATE `resorts` SET `cure_profiles`='2,4,6,8,10', `ad_cure_profiles`='11,12,13', `health_factors`='1,2,6,7,14' WHERE `id`=1;
UPDATE `resorts` SET `cure_profiles`='1,3,5,7,9', `ad_cure_profiles`='2,6,12,13', `health_factors`='1,2,11,13,15' WHERE `id`=2;

UPDATE `hotels` SET `deseases`='1,2,6,10,12,17,22,34,40', `treatment_options`='1,4,6,8,12,22,23' WHERE `id`=1;
UPDATE `hotels` SET `deseases`='3,5,8,9,40,42,44,55', `treatment_options`='1,2,3,9,12,15,19' WHERE `id`=2;
UPDATE `hotels` SET `deseases`='1,5,6,7,9,10,25,37,48', `treatment_options`='4,5,7,11,12,18,24' WHERE `id`=3;
UPDATE `hotels` SET `deseases`='4,9,10,44,28,49', `treatment_options`='3,6,7,9,13,16,18' WHERE `id`=4;
UPDATE `hotels` SET `deseases`='3,5,7,9,20,30,40,51,57', `treatment_options`='2,3,4,5,6,7,12,16' WHERE `id`=5;

UPDATE `entity_fields` SET `show_in_announce`=1 WHERE `id`=14;
UPDATE `entity_fields` SET `show_in_announce`=1, `title`='Методы лечения', `controller`='fields', `action`='treatments' WHERE `id`=3;
UPDATE `entity_fields` SET `title`='Природные лечебные факторы', `controller`='fields', `action`='healthfactors' WHERE `id`=18;

UPDATE `fieldsets` SET `title`='Методы лечения', `url`='treatments' WHERE `id`=2;
UPDATE `fieldsets` SET `title`='Природные лечебные факторы', `url`='health-factors' WHERE `id`=15;

DELETE FROM `field_values` WHERE `id`=36;
DELETE FROM `field_values` WHERE `id`=35;
DELETE FROM `field_values` WHERE `id`=42;
DELETE FROM `field_values` WHERE `id`=43;