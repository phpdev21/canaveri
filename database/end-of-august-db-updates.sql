ALTER TABLE `phppos_suppliers` ADD COLUMN `state_regulatory_agency_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `phppos_suppliers` ADD INDEX `state_regulatory_agency_number` (`state_regulatory_agency_number`(50));