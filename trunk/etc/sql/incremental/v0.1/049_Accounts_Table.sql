SET NAMES utf8;

CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `firstname` varchar(80) DEFAULT NULL,
  `lastname` varchar(80) DEFAULT NULL,
  `secondname` varchar(80) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `password` varchar(32) NOT NULL DEFAULT '',
  `salt` varchar(36) NOT NULL DEFAULT '',
  `activation_guid` varchar(36) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `rememberpass_guid` varchar(36) DEFAULT NULL, 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `accounts_sna` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `facebook_id` varchar(40) DEFAULT NULL,
  `vk_id` varchar(40) DEFAULT NULL,
  `google_id` varchar(40) DEFAULT NULL,
  `odnoklassniki_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

