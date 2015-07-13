SET NAMES utf8;

UPDATE `territories` SET `nested_category_id`='3' WHERE `id`=3;
UPDATE `entity_fields` SET `fieldsets`='1,19' WHERE `id`=2;
UPDATE `entity_fields` SET `fieldsets`='2,19',`announce_order`='2' WHERE `id`=3;
