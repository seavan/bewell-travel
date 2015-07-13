SET NAMES utf8;

ALTER TABLE `pages` 
DROP COLUMN `template`,
DROP COLUMN `user_id`,
ADD COLUMN `parent_id` BIGINT NULL AFTER `id`;

DELETE FROM `pages` WHERE id > 0;
ALTER TABLE `pages` AUTO_INCREMENT = 1;

INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (1,NULL,'О курортах','2013-11-28 09:00:00','<a href=\"/resorts/spa\">Спа</a><br>\r\n<a href=\"/resorts/velnes\">Велнес</a><br>\r\n<a href=\"/resorts/types\">Какие бывают курорты</a><br>\r\n<a href=\"/resorts/home\">Курорт у вас дома</a><br>','resorts');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (2,NULL,'Welcome to Russia','2013-11-28 09:00:00','Раздел \"Welcome to Russia\"<br><a href=\"/welcometorussia/resorts\">Курорты России</a><br>','welcometorussia');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (3,NULL,'Советы туристам','2013-11-28 09:00:00','Раздел \"Советы туристам\"<br><a href=\"/tourists/luggage\">Что взять с собой в отпуск?</a><br>','tourists');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (4,NULL,'Библиотека','2013-12-04 09:00:00','Раздел библиотека<br><a href=\"/dictionary\">Курортнй словарь </a>','library');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (5,NULL,'О компании','2013-12-13 09:00:00','Тут будет информация о Bewell Travel','about');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (6,NULL,'Контакты','2013-12-13 09:00:00','Тут будут контакты','contacts');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (7,NULL,'Карта проезда','2013-12-13 09:00:00','Тут будет карта проезда','map');

INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (8,1,'Спа','2013-11-28 09:00:00','Тут будет информация о спа','spa');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (9,1,'Велнес','2013-11-28 09:00:00','Тут будет информация о велнес','velnes');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (10,1,'Какие бывают курорты','2013-11-28 09:00:00','Перечисление типов курортов','types');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (11,1,'Курорт у вас дома','2013-11-28 09:00:00','<a href=\"/resorts/home/recipes\">Коллекция рецептов здоровья от BeWell-Travel</a><br>\r\n<a href=\"/resorts/home/spa\">Спа салон у вас дома</a><br>\r\n','home');

INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (12,2,'Курорты России','2013-11-28 09:00:00','Страница раздела \"Welcome to Russia\"','resorts');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (13,3,'Что взять с собой в отпуск?','2013-11-28 09:00:00','Страница раздела \"Советы туристам\"','luggage');

INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (14,11,'Коллекция рецептов здоровья от BeWell-Travel','2013-11-28 09:00:00','<a href=\"/resorts/home/recipes/meal\">Здорового питания</a><br><a href=\"/resorts/home/recipes/weight\">Снижения веса</a><br><a href=\"/resorts/home/recipes/cosmetics\">Рецепты домашней косметики</a><br>','recipes');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (15,14,'Здорового питания','2013-11-28 09:00:00','Страница о здоровом питании','meal');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (16,14,'Снижения веса','2013-11-28 09:00:00','Страница о снижении веса','weight');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (17,14,'Рецепты домашней косметики','2013-11-28 09:00:00','Страница с рецептами косметики','cosmetics');

INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (18,11,'Спа салон у вас дома','2013-11-28 09:00:00','<a href=\"/resorts/home/spa/bowels\">Очищение кишечника в домашних условиях</a><br>','spa');
INSERT INTO `pages` (`id`,`parent_id`,`title`,`publish_date`,`html`,`alias`) VALUES (19,18,'Очищение кишечника в домашних условиях','2013-11-28 09:00:00','Страница об очищении кишечника','bowels');
