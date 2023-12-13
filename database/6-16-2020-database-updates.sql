ALTER TABLE `phppos_suppliers` ADD COLUMN `state_license_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `phppos_employees` ADD COLUMN `ssn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `phppos_items` ADD COLUMN `weight_unit` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL;