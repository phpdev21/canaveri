ALTER TABLE `phppos_people` ADD COLUMN `license_exp_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `phppos_customers` ADD COLUMN `rx_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `phppos_customers` ADD COLUMN `rx_exp_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `phppos_customers` ADD COLUMN `med_account_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL;

update phppos_modules set sort=10 where name_lang_key = "module_sales";
update phppos_modules set sort=15 where name_lang_key = "module_customers";
update phppos_modules set sort=18 where name_lang_key = "module_deliveries";

ALTER TABLE `phppos_employees` ADD COLUMN `employee_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'budtender';