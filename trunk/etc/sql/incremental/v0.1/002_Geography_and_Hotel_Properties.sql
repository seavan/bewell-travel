CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL COMMENT 'Название страны или региона России',
  `territory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Страны/регионы (для России)';

CREATE TABLE `hotel_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hotel_id` bigint(20) DEFAULT NULL,
  `property_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связь многие-ко-многим для отелей и дополнительных параметров';

CREATE TABLE `properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(96) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL COMMENT 'Ссылка на property_categories',
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'Для организации вложенности (максимальный уровень вложенности - 2)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Параметры отеля (по ТЗ дополнительные параметры)';

CREATE TABLE `property_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории параметров отеля/санатория';

CREATE TABLE `resorts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL COMMENT 'Название курорта или субъекта РФ для России',
  `country_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Курорты (для России - субъекты РФ по ТЗ)';

CREATE TABLE `territories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL COMMENT 'Название территории (для России - Россия)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Территории - верхний уровень деления по географическому принципу';











