SET NAMES utf8;

ALTER TABLE `health_factors` 
ADD COLUMN `show_on_sitemap` BIT NULL DEFAULT 1 AFTER `parent_id`;

ALTER TABLE `treatment_options` 
ADD COLUMN `show_on_sitemap` BIT NULL DEFAULT 1 AFTER `parent_id`;
