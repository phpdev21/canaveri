ALTER TABLE `phppos_suppliers` ADD COLUMN `supplier_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'processor', ADD INDEX `supplier_type` (`supplier_type`(50));