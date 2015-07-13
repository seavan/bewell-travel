set names utf8;

CREATE TABLE `fieldsets` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `entity_type` INT NOT NULL COMMENT 'значение Enum\'a EntityType (из bewell.common)',
  `order_number` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
COMMENT = 'группы полей';

CREATE TABLE `entity_fields` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `fieldset_id` BIGINT NOT NULL COMMENT 'ссылка на fieldsets',
  `order_number` INT NOT NULL DEFAULT 1 COMMENT 'порядок следования поля в fieldset\'e',
  PRIMARY KEY (`id`))
COMMENT = 'поля сущности';

CREATE TABLE `field_values` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `entity_id` BIGINT NOT NULL COMMENT 'ссылка на PK таблицы отеля, курорта, страны и т.д.',
  `entity_type` INT NOT NULL COMMENT 'значение Enum\'a EntityType (из bewell.common)',
  `field_id` BIGINT NOT NULL COMMENT 'ссылка на entity_fields',
  `field_value` TEXT NULL COMMENT 'значение поля',
  PRIMARY KEY (`id`))
COMMENT = 'значения полей';

CREATE TABLE `entity_photos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `entity_id` BIGINT NOT NULL COMMENT 'ссылка на PK таблицы отеля, курорта, страны и т.д.',
  `entity_type` INT NOT NULL COMMENT 'значение Enum\'a EntityType (из bewell.common)',
  `photo` VARCHAR(50) NOT NULL COMMENT 'имя файла (guid) фотографии (460x312 px)',
  `preview` VARCHAR(50) NOT NULL COMMENT 'имя файла (guid) уменьшенной фотографии (220x146 px)',
  `is_main` BIT NULL DEFAULT 0 COMMENT 'использовать как главную (первую) фотографию в галерее',
  `order_number` INT NOT NULL DEFAULT 1 COMMENT 'порядок следования фотографий в галерее',
  PRIMARY KEY (`id`))
COMMENT = 'фотографии сущностей для галереи';

