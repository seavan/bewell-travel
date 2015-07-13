SET NAMES utf8;

CREATE  TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `left_key` int(11) NOT NULL,
  `right_key` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `delete` bit(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `account_id` bigint(20) NOT NULL ,
  `text` text NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `entity_id` bigint(20) NOT NULL,
  `entity_type` int(11) NOT NULL,
  PRIMARY KEY (`id`) 
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

