SET NAMES utf8;

ALTER TABLE `treatment_options` 
CHANGE COLUMN `category_id` `parent_id` BIGINT(20) NULL DEFAULT NULL;

DELETE FROM `treatment_options` WHERE id > 0;
ALTER TABLE `treatment_options` AUTO_INCREMENT = 1;

INSERT INTO `treatment_options` (`id`,`title`) VALUES (1,'Климатотерапия');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (2,'Массаж');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (3,'Лечебное питание');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (4,'Ландшафтотерапия');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (5,'Талассотерапия');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (6,'Бальнеотерапия');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (7,'Гидропатия');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (8,'Лечебные души');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (9,'Грязелечение');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (10,'Физиотерапия ');
INSERT INTO `treatment_options` (`id`,`title`) VALUES (11,'Лечебная физическая культура');
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (12,'Аэротерапия',1);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (13,'Гелиотерапия',1);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (14,'Спелеотерапия, лечебные климатические камеры',1);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (15,'Классический массаж',2);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (16,'Спортивный массаж',2);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (17,'Лимфодренажный массаж',2);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (18,'Мануальная терапия',2);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (19,'Остеопатия',2);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (20,'Язвенная болезнь в период затихающего обострения. Стол № 1',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (21,'Язвенная болезнь и гастриты с повышенной кислотностью Стол № 1б',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (22,'Хронические гастриты с пониженной кислотностью. Стол №2',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (23,'Атонические запоры. Стол № 3',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (24,'Колиты, энтероколиты. Стол № 4',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (25,'Целиакия, глютеновая энтеропатия, идиопатическая стеаторея. Стол № 4а',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (26,'Заболевания печени и желчевыводящих путей. Стол № 5',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (27,'Хронические панкреатиты. Стол № 5а',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (28,'Подагра, мочекаменная болезнь (гиперурикемия). Стол № 6',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (29,'Хронические заболевания почек. Стол № 7',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (30,'Ожирение. Стол № 8',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (31,'Сахарный диабет. Стол № 9',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (32,'Болезни сердца и сосудов. Стол № 10',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (33,'Анемии, период после болезней, операций, травм. Стол № 11',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (34,'Функциональные заболевания нервной системы. Стол № 12',3);
INSERT INTO `treatment_options` (`id`,`title`,`parent_id`) VALUES (35,'Мочекаменная болезнь (фосфатурия). Стол № 14',3);

DROP TABLE `treatment_option_categories`;

UPDATE `field_values` SET `entity_id`=12 WHERE `id`=72;
UPDATE `field_values` SET `entity_id`=12 WHERE `id`=73;
UPDATE `field_values` SET `entity_id`=12 WHERE `id`=74;
UPDATE `field_values` SET `entity_id`=12 WHERE `id`=75;
UPDATE `field_values` SET `entity_id`=12 WHERE `id`=76;
