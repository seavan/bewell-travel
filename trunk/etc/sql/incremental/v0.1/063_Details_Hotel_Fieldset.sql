SET NAMES utf8;

INSERT INTO `fieldsets` (`id`, `title`, `url`, `proto_name`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES ('61', 'Подробнее об отеле', 'details', 'hotels', '12', 0, 0, 0);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`, `controller`, `action`) VALUES ('41', 'Подробнее об отеле', '61', '1', 0, 'fields', 'hoteldetails');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('61', '41', '1');
