SET NAMES utf8;

UPDATE `territories` SET `title`='Россия', `category_id`='1', `nested_category_id`='5' WHERE `id`='1';
UPDATE `territories` SET `category_id`='1', `nested_category_id`='2' WHERE `id`='2';
UPDATE `territories` SET `category_id`='1', `nested_category_id`='2' WHERE `id`='3';
UPDATE `territories` SET `category_id`='1', `nested_category_id`='2' WHERE `id`='4';
UPDATE `territories` SET `category_id`='1', `nested_category_id`='2' WHERE `id`='5';
UPDATE `territories` SET `category_id`='1', `nested_category_id`='2' WHERE `id`='6';
UPDATE `territories` SET `category_id`='1', `nested_category_id`='2' WHERE `id`='7';
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('8', 'Северо-Западный федеральный округ', '8', '5', '3');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('9', 'Центральный федеральный округ ', '8', '5', '3');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('10', 'Южный федеральный округ ', '8', '5', '3');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('11', 'Северо-Кавказский федеральный округ', '8', '5', '3');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('12', 'Дальневосточный федеральный округ', '8', '5', '3');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('13', 'Сибирский федеральный округ', '8', '5', '3');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('14', 'Уральский федеральный округ', '8', '5', '3');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('15', 'Приволжский федеральный округ', '8', '5', '3');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('16', 'Архангельскя область', '9', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('17', 'Мурманская область', '9', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('18', 'Московская область', '10', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('19', 'Ярославская область', '10', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('20', 'Австрия', '2', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('21', 'Черногория', '2', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('22', 'Западная Австралия', '3', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('23', 'Северная территория', '3', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('24', 'Новый Южный Уэльс', '3', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('25', 'Виктория', '3', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('26', 'Квинсленд', '3', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('27', 'Южная Австралия', '3', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('28', 'Тасмания', '3', '3', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('29', 'Алжир', '5', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('30', 'Египет', '5', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('31', 'Мадагаскар', '5', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('32', 'ЮАР', '5', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('33', 'Канада', '6', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('34', 'США', '6', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('35', 'Гаити', '6', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('36', 'Гватемала', '6', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('37', 'Ямайка', '6', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('38', 'Аргентина', '7', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('39', 'Бразилия', '7', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('40', 'Колумбия', '7', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`, `nested_category_id`) VALUES ('41', 'Чили', '7', '2', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`) VALUES ('42', 'Москва', '18', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`) VALUES ('43', 'Архангельск', '16', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`) VALUES ('44', 'Аделаида', '27', '4');
INSERT INTO `territories` (`id`, `title`, `parent_id`, `category_id`) VALUES ('45', 'Нью Йорк', '34', '4');


DELETE FROM `countries` WHERE id > 0;
ALTER TABLE `countries` AUTO_INCREMENT = 1;
ALTER TABLE `countries` COMMENT = 'Таблица для хранения информации о странах (как курортах)' ;


DELETE FROM `resorts` WHERE id > 0;
ALTER TABLE `resorts` AUTO_INCREMENT = 1;

ALTER TABLE `resorts` 
CHANGE COLUMN `country_id` `territory_id` BIGINT(20) NULL DEFAULT NULL, 
COMMENT = 'Таблица для хранения информации о курортах' ;