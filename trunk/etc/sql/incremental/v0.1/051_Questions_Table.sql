SET NAMES utf8;

CREATE TABLE `questions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `account_id` BIGINT NULL,
  `ask_date` DATETIME NULL,
  `asking_user_name` VARCHAR(255) NULL,
  `asking_user_email` VARCHAR(255) NULL,
  `question` TEXT NULL,
  `replier_account_id` BIGINT NULL,
  `reply_text` TEXT NULL,
PRIMARY KEY (`id`));
