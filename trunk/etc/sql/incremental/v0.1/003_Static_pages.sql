CREATE TABLE `static_pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `html_text` varchar(20000) NOT NULL,
  `alias` varchar (64) NOT NULL,
  `lang` varchar (5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица для статических страниц';