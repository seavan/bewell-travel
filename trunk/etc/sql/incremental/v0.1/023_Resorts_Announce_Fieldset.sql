SET NAMES utf8;

INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (18, 'Анонс курорта', 'announce', 1, 1, 0, 0, 1);
INSERT INTO `fieldsets` (`id`, `title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES (19, 'Анонс отеля', 'announce', 0, 1, 0, 0, 1);

UPDATE `entity_fields` SET `fieldsets`='11,18' WHERE `id`=14;
UPDATE `entity_fields` SET `fieldsets`='15,18' WHERE `id`=18;