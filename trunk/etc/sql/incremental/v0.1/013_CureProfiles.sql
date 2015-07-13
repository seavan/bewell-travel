set names utf8;

CREATE  TABLE `cure_profiles` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NULL ,
  `gender_id` INT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) )
COMMENT = 'Таблица для профилей лечения';

CREATE  TABLE `deseases` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `icd_code` VARCHAR(64) NULL ,
  `title` VARCHAR(255) NULL ,
  `international_title` VARCHAR(255) NULL ,
  `profile_id` BIGINT NULL COMMENT 'Ссылка на профиль лечения' ,
  PRIMARY KEY (`id`) )
COMMENT = 'Таблица заболеваний';

CREATE  TABLE `genders` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) );
  
CREATE  TABLE `health_factors` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NULL ,
  `parent_id` BIGINT NULL ,
  PRIMARY KEY (`id`) )
COMMENT = 'Таблица природных лечебных факторов';

CREATE  TABLE `treatment_option_categories` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
COMMENT = 'Таблица категорий методов лечения';

CREATE  TABLE `treatment_options` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NULL ,
  `category_id` BIGINT NULL ,
  PRIMARY KEY (`id`) )
COMMENT = 'Таблица методов лечения';

INSERT INTO cure_profiles (title, gender_id) VALUES ('Болезни системы кровообращения', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Болезни органов пищеварения', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Болезни нервной системы', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Болезни костно-мышечной системы', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Болезни органов дыхания ', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Болезни ЛОР-органов ', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Болезни кожи и подкожной клетчатки', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Гинекологические болезни', 3);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Болезни почек, мочевыводящих путей, андрологические заболевания', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Болезни эндокринной системы, расстройства питания и нарушения обмена веществ', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Заболевания крови, кроветворных органов и хронические интоксикации', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Глазные болезни', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Онкология', 1);
INSERT INTO cure_profiles (title, gender_id) VALUES ('Аллергология', 1);

INSERT INTO genders (title) VALUES ('Не важно');
INSERT INTO genders (title) VALUES ('Мужчина');
INSERT INTO genders (title) VALUES ('Женщина');



