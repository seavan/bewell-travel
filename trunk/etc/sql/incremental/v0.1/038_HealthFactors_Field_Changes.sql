SET NAMES utf8;

UPDATE `entity_fields` SET `title`='Природные лечебные факторы', `fieldsets`='14,15,53,57' WHERE `id`='17';
UPDATE `entity_fields` SET `fieldsets`='18,22,29,34' WHERE `id`='18';

UPDATE `fieldset_fields_order` SET `field_id`='17' WHERE `id`='18';

INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('1', '1', '17', 'Тут будет описание природных лечебных факторов');
INSERT INTO `field_values` (`entity_id`, `entity_type`, `field_id`, `field_value`) VALUES ('2', '1', '17', 'Тут будет описание природных лечебных факторов');

