ALTER TABLE `phppos_customers` ADD COLUMN `customer_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'REC';
ALTER TABLE `phppos_people` ADD COLUMN `license_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `phppos_people` ADD COLUMN `license_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `phppos_people` ADD COLUMN `date_of_birth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL;