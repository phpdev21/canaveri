ALTER TABLE `phppos_suppliers` DROP INDEX `state_license_number`;
ALTER TABLE `phppos_employees` DROP INDEX `ssn`, DROP INDEX `employee_type`;
ALTER TABLE `phppos_items` DROP INDEX `weight_unit`;
ALTER TABLE `phppos_customers` DROP INDEX `med_account_number`, DROP INDEX `rx_exp_date`, DROP INDEX `rx_number`, DROP INDEX `customer_type`;
ALTER TABLE `phppos_people` DROP INDEX `license_exp_date`, DROP INDEX `license_number`, DROP INDEX `license_state`, DROP INDEX `date_of_birth`;

ALTER TABLE `phppos_suppliers` ADD INDEX `state_license_number` (`state_license_number`(50));
ALTER TABLE `phppos_employees` ADD INDEX `ssn` (`ssn`(255)), ADD INDEX `employee_type` (`employee_type`(50));
ALTER TABLE `phppos_items` ADD INDEX `weight_unit` (`weight_unit`(25));
ALTER TABLE `phppos_customers` ADD INDEX `med_account_number` (`med_account_number`(50)), ADD INDEX `rx_exp_date` (`rx_exp_date`(10)), ADD INDEX `rx_number` (`rx_number`(255)), ADD INDEX `customer_type` (`customer_type`(255));
ALTER TABLE `phppos_people` ADD INDEX `license_exp_date` (`license_exp_date`(10)), ADD INDEX `license_number` (`license_number`(255)), ADD INDEX `license_state` (`license_state`(255)), ADD INDEX `date_of_birth` (`date_of_birth`(255));
