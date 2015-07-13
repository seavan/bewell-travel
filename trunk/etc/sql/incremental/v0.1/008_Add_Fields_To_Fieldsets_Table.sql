ALTER TABLE `fieldsets` 
ADD COLUMN `show_gallery` BIT NOT NULL DEFAULT 0 AFTER `order_number`,
ADD COLUMN `show_map` BIT NOT NULL DEFAULT 0 AFTER `show_gallery`;
