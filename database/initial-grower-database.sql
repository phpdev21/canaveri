-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2020 at 04:08 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `canaver_pos_dump`
--

-- --------------------------------------------------------

--
-- Table structure for table `phppos_access`
--

CREATE TABLE `phppos_access` (
  `id` int(11) NOT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `all_access` tinyint(1) NOT NULL DEFAULT 0,
  `controller` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_additional_item_numbers`
--

CREATE TABLE `phppos_additional_item_numbers` (
  `item_id` int(11) NOT NULL,
  `item_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_variation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_appointments`
--

CREATE TABLE `phppos_appointments` (
  `id` int(11) NOT NULL,
  `location_id` int(10) NOT NULL,
  `person_id` int(10) DEFAULT NULL,
  `employee_id` int(10) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `appointments_type_id` int(10) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_appointment_types`
--

CREATE TABLE `phppos_appointment_types` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_appointment_types`
--

INSERT INTO `phppos_appointment_types` (`id`, `name`, `deleted`) VALUES
(1, 'On-Line Order', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_app_config`
--

CREATE TABLE `phppos_app_config` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_app_config`
--

INSERT INTO `phppos_app_config` (`key`, `value`) VALUES
('additional_payment_types', ''),
('allow_scan_of_customer_into_item_field', '0'),
('always_minimize_menu', '1'),
('always_print_duplicate_receipt_all', '0'),
('always_show_item_grid', '0'),
('always_use_average_cost_method', '0'),
('amount_of_cash_to_be_left_in_drawer_at_closing', ''),
('announcement_special', ''),
('auto_capture_signature', '0'),
('auto_focus_on_item_after_sale_and_receiving', '0'),
('automatically_email_receipt', '0'),
('automatically_print_duplicate_receipt_for_cc_transactions', '0'),
('automatically_show_comments_on_receipt', '0'),
('averaging_method', 'moving_average'),
('barcode_price_include_tax', '0'),
('bluejay_seen', '1'),
('calculate_average_cost_price_from_receivings', '0'),
('calculate_profit_for_giftcard_when', ''),
('capture_internal_notes_during_sale', '0'),
('capture_sig_for_all_payments', '0'),
('cas_company_title', '2021 NE Washington Blvd'),
('cas_license_number', 'WASH-M1JI-2020'),
('cas_store_type', 'Grower'),
('cash_alert_high', ''),
('cash_alert_low', ''),
('change_sale_date_for_new_sale', '0'),
('change_sale_date_when_completing_suspended_sale', '0'),
('change_sale_date_when_suspending', '0'),
('charge_tax_on_recv', '0'),
('collapse_recv_ui_by_default', '0'),
('collapse_sales_ui_by_default', '0'),
('commission_default_rate', '0'),
('commission_percent_type', 'selling_price'),
('company', 'Canaveri Shop'),
('company_logo', '5'),
('confirm_error_adding_item', '0'),
('crlf', '\r\n'),
('currency_code', ''),
('currency_symbol', '$'),
('currency_symbol_location', 'before'),
('customers_store_accounts', '0'),
('date_format', 'middle_endian'),
('decimal_point', '.'),
('default_age_to_verify', ''),
('default_credit_limit', ''),
('default_days_to_expire_when_creating_items', ''),
('default_new_customer_to_current_location', '0'),
('default_new_items_to_service', '0'),
('default_payment_type', 'Cash'),
('default_payment_type_recv', 'Cash'),
('default_reorder_level_when_creating_items', ''),
('default_sales_person', 'logged_in_employee'),
('default_tax_1_name', 'Sales Tax'),
('default_tax_1_rate', ''),
('default_tax_2_cumulative', '0'),
('default_tax_2_name', 'Sales Tax 2'),
('default_tax_2_rate', ''),
('default_tax_3_name', ''),
('default_tax_3_rate', ''),
('default_tax_4_name', ''),
('default_tax_4_rate', ''),
('default_tax_5_name', ''),
('default_tax_5_rate', ''),
('default_tax_rate', '8'),
('default_tier_fixed_type_for_excel_import', 'fixed_amount'),
('default_tier_percent_type_for_excel_import', 'percent_off'),
('default_type_for_grid', 'categories'),
('deleted_payment_types', 'Check,Check,Cheque,Gift Card,Gift Card,Tarjeta de regalo,Credit Card,Credit Card,Tarjeta de crÃ©dito'),
('disable_confirm_recv', '0'),
('disable_confirmation_sale', '0'),
('disable_gift_cards_sold_from_loyalty', '0'),
('disable_giftcard_detection', '0'),
('disable_price_rules_dialog', '0'),
('disable_quick_complete_sale', '0'),
('disable_recv_number_on_barcode', '0'),
('disable_sale_notifications', '0'),
('disable_store_account_when_over_credit_limit', '0'),
('disable_test_mode', '0'),
('discount_percent_earned', '0'),
('do_not_allow_below_cost', '0'),
('do_not_allow_item_with_variations_to_be_sold_without_selecting_variation', '0'),
('do_not_allow_out_of_stock_items_to_be_sold', '0'),
('do_not_delete_saved_card_after_failure', '0'),
('do_not_delete_serial_number_when_selling', '0'),
('do_not_force_http', '1'),
('do_not_group_same_items', '0'),
('do_not_show_closing', '0'),
('do_not_tax_service_items_for_deliveries', '0'),
('do_not_upload_images_to_ecommerce', '0'),
('ecom_store_location', '1'),
('ecommerce_cron_running', '0'),
('ecommerce_cron_sync_operations', 'a:13:{i:0;s:22:\"sync_inventory_changes\";i:1;s:33:\"import_ecommerce_tags_into_phppos\";i:2;s:39:\"import_ecommerce_categories_into_phppos\";i:3;s:39:\"import_ecommerce_attributes_into_phppos\";i:4;s:30:\"import_tax_classes_into_phppos\";i:5;s:35:\"import_shipping_classes_into_phppos\";i:6;s:34:\"import_ecommerce_items_into_phppos\";i:7;s:35:\"import_ecommerce_orders_into_phppos\";i:8;s:31:\"export_phppos_tags_to_ecommerce\";i:9;s:37:\"export_phppos_categories_to_ecommerce\";i:10;s:37:\"export_phppos_attributes_to_ecommerce\";i:11;s:30:\"export_tax_classes_into_phppos\";i:12;s:32:\"export_phppos_items_to_ecommerce\";}'),
('ecommerce_platform', 'woocommerce'),
('ecommerce_sync_message', 'Export items to ecommerce'),
('ecommerce_sync_percent_complete', '100'),
('edit_customer_web_hook', ''),
('edit_item_price_if_zero_after_adding', '0'),
('edit_recv_web_hook', ''),
('edit_sale_web_hook', ''),
('email_charset', ''),
('email_provider', 'Use System Default'),
('emailed_receipt_subject', ''),
('enable_customer_loyalty_system', '0'),
('enable_customer_quick_add', '0'),
('enable_ebt_payments', '0'),
('enable_margin_calculator', '0'),
('enable_markup_calculator', '0'),
('enable_pdf_receipts', '0'),
('enable_points_for_giftcard_payments', '0'),
('enable_quick_edit', '0'),
('enable_scale', '0'),
('enable_sounds', '0'),
('enable_supplier_quick_add', '0'),
('enable_tips', '0'),
('enable_wic', '0'),
('enhanced_search_method', '0'),
('fast_user_switching', '0'),
('flat_discounts_discount_tax', '0'),
('force_https', '0'),
('grams_per_pound', '453.5923'),
('group_all_taxes_on_receipt', '0'),
('hide_all_prices_on_recv', '1'),
('hide_available_giftcards', '0'),
('hide_barcode_on_barcode_labels', '0'),
('hide_barcode_on_sales_and_recv_receipt', '0'),
('hide_customer_recent_sales', '0'),
('hide_desc_emailed_receipts', '0'),
('hide_desc_on_receipt', '0'),
('hide_description_on_sales_and_recv', '0'),
('hide_email_on_receipts', '0'),
('hide_expire_dashboard', '0'),
('hide_expire_date_on_barcodes', '0'),
('hide_images_in_grid', '0'),
('hide_item_descriptions_in_reports', '0'),
('hide_layaways_sales_in_reports', '0'),
('hide_merchant_id_from_receipt', '0'),
('hide_name_on_barcodes', '0'),
('hide_out_of_stock_grid', '0'),
('hide_points_on_receipt', '0'),
('hide_price_on_barcodes', '0'),
('hide_prices_on_fill_sheet', '0'),
('hide_sales_to_discount_on_receipt', '0'),
('hide_signature', '0'),
('hide_size_field', '1'),
('hide_store_account_balance_on_receipt', '0'),
('hide_store_account_payments_from_report_totals', '0'),
('hide_store_account_payments_in_reports', '0'),
('hide_suspended_recv_in_reports', '0'),
('hide_test_mode_home', '1'),
('hide_tier_on_receipt', '0'),
('highlight_low_inventory_items_in_items_module', '0'),
('id_to_show_on_barcode', 'id'),
('id_to_show_on_sale_interface', 'number'),
('import_all_past_orders_for_woo_commerce', '0'),
('include_child_categories_when_searching_or_reporting', '0'),
('indicate_taxable_on_receipt', '0'),
('item_id_auto_increment', '1'),
('item_kit_id_auto_increment', '1'),
('item_lookup_order', 'a:6:{i:0;s:7:\"item_id\";i:1;s:11:\"item_number\";i:2;s:10:\"product_id\";i:3;s:23:\"additional_item_numbers\";i:4;s:14:\"serial_numbers\";i:5;s:26:\"item_variation_item_number\";}'),
('kill_ecommerce_cron', '0'),
('language', 'english'),
('last_ecommerce_sync_date', '2020-06-18 00:29:22'),
('legacy_detailed_report_export', '0'),
('limit_manual_price_adj', '0'),
('lock_prices_suspended_sales', '0'),
('logout_on_clock_out', '0'),
('loyalty_option', 'simple'),
('loyalty_points_without_tax', '0'),
('mailing_labels_type', 'pdf'),
('markup_markdown', 'a:7:{s:4:\"Cash\";d:0;s:5:\"Check\";d:0;s:9:\"Gift Card\";d:0;s:10:\"Debit Card\";d:0;s:11:\"Credit Card\";d:0;s:13:\"Store Account\";d:0;s:6:\"Points\";d:0;}'),
('max_discount_percent', ''),
('mercury_activate_seen', '1'),
('minimum_points_to_redeem', ''),
('new_customer_web_hook', ''),
('new_items_are_ecommerce_by_default', '1'),
('new_receiving_web_hook', ''),
('new_sale_web_hook', ''),
('newline', '\r\n'),
('number_of_decimals', ''),
('number_of_decimals_for_quantity_on_receipt', ''),
('number_of_items_in_grid', '25'),
('number_of_items_per_page', '50'),
('number_of_recent_sales', '10'),
('number_of_sales_for_discount', ''),
('online_price_tier', '0'),
('ounce_per_pound', '16'),
('override_receipt_title', ''),
('override_tier_name', ''),
('overwrite_existing_items_on_excel_import', '0'),
('past_inventory_date', '2020-06-15'),
('paypal_me', ''),
('pdf_receipt_message', ''),
('phppos_session_expiration', '0'),
('point_value', ''),
('prices_include_tax', '0'),
('print_after_receiving', '0'),
('print_after_sale', '0'),
('prompt_for_ccv_swipe', '0'),
('prompt_to_use_points', '0'),
('protocol', ''),
('qb_export_start_date', ''),
('qb_sync_operations', 'a:1:{i:0;s:33:\"export_journalentry_to_quickbooks\";}'),
('quick_variation_grid', '0'),
('receipt_text_size', 'small'),
('receiving_id_auto_increment', '1'),
('redirect_to_sale_or_recv_screen_after_printing_receipt', '0'),
('remind_customer_facing_display', '0'),
('remove_commission_from_profit_in_reports', '0'),
('remove_customer_company_from_receipt', '0'),
('remove_customer_contact_info_from_receipt', '0'),
('remove_customer_name_from_receipt', '0'),
('remove_employee_from_receipt', '0'),
('remove_points_from_profit', '0'),
('report_sort_order', 'asc'),
('require_customer_for_sale', '0'),
('require_customer_for_suspended_sale', '0'),
('require_employee_login_before_each_sale', '0'),
('require_supplier_for_recv', '0'),
('reseller_activate_seen', '1'),
('reset_location_when_switching_employee', '0'),
('return_policy', 'No Change return policy'),
('round_cash_on_sales', '0'),
('round_tier_prices_to_2_decimals', '0'),
('sale_id_auto_increment', '1'),
('sale_prefix', 'POS'),
('scale_divide_by', '100'),
('scale_format', 'scale_1'),
('scan_and_set_recv', '1'),
('scan_and_set_sales', '0'),
('second_language', ''),
('select_sales_person_during_sale', '0'),
('show_barcode_company_name', '1'),
('show_clock_on_header', '0'),
('show_full_category_path', '0'),
('show_item_id_on_receipt', '1'),
('show_item_id_on_recv_receipt', '0'),
('show_item_kit_items_on_receipt', '1'),
('show_language_switcher', '0'),
('show_orig_price_if_marked_down_on_receipt', '0'),
('show_receipt_after_suspending_sale', '0'),
('show_selling_price_on_recv', '0'),
('show_tax_per_item_on_receipt', '0'),
('show_total_discount_on_receipt', '0'),
('shown_setup_wizard', '1'),
('smtp_crypto', ''),
('smtp_host', ''),
('smtp_pass', ''),
('smtp_port', ''),
('smtp_timeout', ''),
('smtp_user', ''),
('sort_receipt_column', ''),
('speed_up_search_queries', '0'),
('spend_to_point_ratio', ''),
('spreadsheet_format', 'XLSX'),
('store_account_statement_message', ''),
('store_closing_time', '12:30 am'),
('store_opening_time', '09:30 am'),
('strict_age_format_check', '1'),
('suppliers_store_accounts', '0'),
('supports_full_text', '1'),
('tax_class_id', '2'),
('taxes_summary_details_on_receipt', '0'),
('taxes_summary_on_receipt', '0'),
('taxjar_api_key', ''),
('test_mode', '0'),
('thousands_separator', ','),
('time_format', '12_hour'),
('timeclock', '1'),
('timeclock_pto', '0'),
('track_cash', '0'),
('track_payment_types', 'a:0:{}'),
('track_shipping_cost_recv', '0'),
('uppercase_receipts', '0'),
('use_rtl_barcode_library', '0'),
('user_configured_layaway_name', ''),
('verify_age_for_products', '0'),
('version', '17.4'),
('virtual_keyboard', ''),
('website', 'www.canaveri.com'),
('week_start_day', 'monday'),
('wide_printer_receipt_format', '0'),
('wizard_add_customer', '1'),
('wizard_add_inventory', '1'),
('wizard_configure_company', '1'),
('wizard_configure_locations', '1'),
('wizard_create_sale', '1'),
('wizard_edit_employees', '1'),
('woo_api_key', 'ck_0413ed2f1b66bd793eef8507b0d9128ac7805dab'),
('woo_api_secret', 'cs_ebfcbac9aa7db44a0ba4077945e9ceb4f8ab39b9'),
('woo_api_url', 'http://cannatraffic.net'),
('woo_enable_html_desc', '0'),
('woo_shipping_classes', 'a:0:{}'),
('woo_sku_sync_field', 'item_number'),
('woo_version', '3.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_app_files`
--

CREATE TABLE `phppos_app_files` (
  `file_id` int(10) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_data` longblob NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expires` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `phppos_app_files` (`file_id`, `file_name`, `file_data`, `timestamp`, `expires`) VALUES
(1, 'Canaveri-Logo-01.jpg', 0xc3bfc398c3bfc3a000104a46494600010100000100010000c3bfc3be003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763632292c207175616c697479203d2039300ac3bfc39b0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514c3bfc39b00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414c3bfc380001108005a007503012200021101031101c3bfc384001f0000010501010101010100000000000000000102030405060708090a0bc3bfc38400c2b5100002010303020403050504040000017d0102030004110512213141061351610722711432c281e28098c2a1082342c2b1c3811552c391c3b024336272e2809a090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797ac692e2809ee280a6e280a0e280a1cb86e280b0c5a0e28099e2809ce2809de280a2e28093e28094cb9ce284a2c5a1c2a2c2a3c2a4c2a5c2a6c2a7c2a8c2a9c2aac2b2c2b3c2b4c2b5c2b6c2b7c2b8c2b9c2bac382c383c384c385c386c387c388c389c38ac392c393c394c395c396c397c398c399c39ac3a1c3a2c3a3c3a4c3a5c3a6c3a7c3a8c3a9c3aac3b1c3b2c3b3c3b4c3b5c3b6c3b7c3b8c3b9c3bac3bfc384001f0100030101010101010101010000000000000102030405060708090a0bc3bfc38400c2b5110002010204040304070504040001027700010203110405213106124151076171132232c281081442e28098c2a1c2b1c38109233352c3b0156272c3910a162434c3a125c3b11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797ae2809ac692e2809ee280a6e280a0e280a1cb86e280b0c5a0e28099e2809ce2809de280a2e28093e28094cb9ce284a2c5a1c2a2c2a3c2a4c2a5c2a6c2a7c2a8c2a9c2aac2b2c2b3c2b4c2b5c2b6c2b7c2b8c2b9c2bac382c383c384c385c386c387c388c389c38ac392c393c394c395c396c397c398c399c39ac3a2c3a3c3a4c3a5c3a6c3a7c3a8c3a9c3aac3b2c3b3c3b4c3b5c3b6c3b7c3b8c3b9c3bac3bfc39a000c03010002110311003f00c3b2c5927bc391c28f7a3f0a5fc382c2be50c3be54131462c593cb86c392c2b84442c3ac7a2ac592e2809c5a29c3a1c29d62550cc5a145c3b3c2a9c3aec2b6c38e47c3b2c2a65ae2809ec2a5c3b0c2abe284a2cb9cc3b7c2a31ec3b53dc395e280a6c38dc6926dc2b9c2b6e28093c39dc2ba62542a7f5ac692c3b0c2a0e28093c5a1c391e280a03dc3a8c387c2bd2fc3a149c3b8521063c39ec5927bc392c3be15c39dc3b86fc3a047c3843f1742e2809c695e0ec395c2ae2071e2809dc5be4b73146c3d43c2be01c3bc0d524e5b237a542ac3977cc2b4c2a0c3a4c3bce2809c7fe28098c381c3a2c5927bc397c2b65bc3bec3865f17c2ae1371c3b0c2a2c3840fc3bcc3b4c3946d41c3bf00c391c2b5c3887c46c3b81bc3a31fe280a616c3b04dc3a27d3ec3974e59c38e224fc3ad0b79257f711ac3885cc281c39cc3a302c2adc393c59355c39c59c397532dc386c391c692c2a956c592c2a315c395c385c2a5c3b91c1628c3851fe280a61fe280a66479c2a1c28f7a28c3bc28c2a003c3b1c2a5c2a2c28f5a00c39fc3b057c28fc3bc43c3b0c3ab575d4fc3837ac2b5c38ee280a27831c2b9c2a06fe2809341c3a8c3aa72c2ae3dcb9c115f6fc3bc02c3bdc2b6c2b4c39f1c5cc39b683e35c5bd0d135ae2809dcb86c3a1c394233b6d6e5bc2a00dc5b8c3b56c7dc389527bc5bd057c03456f4ac2b4c3a93f7763c39ec38b33c2ac5e5534c3a8c38ac3b1c3ab17c2b3c3bf0027c3a6c28fc39a19c3adc3a1c2bae280b0c2a3c5a134e28093361828c3aa181fc380c397c29d78c38fc3b672c3b86fc3a3c2a8c2a41ae28094e280a634c3b8c2a7707fc392c2ac63c3bb34c380c3bac3aec28f19c3bc722bc3853f62c39fc39a39c3bc556517e282acc2bc497464c3962d63c38ee284a2773365c2ae6151c38c4c4f5740320f751ec2abe2809cc3b5c2a735c3aec38250c2af0e6b1fc2ba612bc3a133c2ac2c6b72c2a945c3aec5a14ec38fc2aa7fc397e284a2c3b9c3b1c3b1c393c3b623c396c2bc096f71c2acc3b83a69c3bc47c2a2c3860bc38b68c3aa3ec39902c3bac3a1462503c395403fc3acc3b535c3a33f087e0f6bc3bf001a3c52c2ba36e280b01ac2a2c38604e2809457e2809c64456d1e71c2b9c2bd49c3a814724fc2b648c3bd6dc3a6c2be65c3b8c3afc3b07b54c3b87dc2aec2bfc385c2afe280a04bc3b61d6ec38f32c3aac3ba544bc3bbe280bac3a87ac388c39b0753c386597bc3a370c3830cc5be2ac2b858c385c3b3c3876ec2a8c3b8c2bcc393e280a6c2b0c394c2aa2c5d18c2bf66c29dc3a505c2bdc2bac2b8c3bf00e28094c39c77c5b8083f65c3bf0004c3bc22c2b7e2809a7b7b14c39635c39500c2bec2ad7ec281c3a40dc3ab1ac3b4c5927d39c3b526c2bd77c5bdc386c2b8c39fe2809e7f1434c38fe280b9c3be05c2b0c3b11ee284a2c3bbc2b5cb9c18c3ae2de284a2c2b2c396c3b32e37c3867ec29d41c3ae083dc3abcb86c3bdc2aa7e397fc382e284a2c3b0011a7ce280b9c3bf000926c2adc2bac39ec38075c3b2e282ac1f3cc3847fc2b208c387c3bb4cc2bd466bc2b53a74c3a9c3b34763c3ad215703e28094607ec2b14528c3924ac3ba75c3adc3aac39fc39f73e280a2c3bdc2a5c3bf006bc2ab3fe280a6c28f3fe280a13c31c3a56a5e2ac38626e284a2c3be686c323fcb867f14c5b8c3acc3b41d4fc2a1c3b803c384c5be26c3957c61c2acc39cc3aac39ac396c2a13ec2a7c2a8c39c36c3a92e2e1cc2b31f6f603b01c380c3ad546e6e26c2bcc2b8e28093c3a2795e79c3a562c3b24b23166762724927e2809949c3af51c3b35e1d5ac392c2acc3aec3b63f0cc38dc2b3c5934e6d57c5a1c2a3c2b416c391c3a8c2bfc38dc3b9e280b0452d15c38e78027e3452c3b3453012c28f5a5a4f5e6803c2b6c3b007c3816f1ac3bc5005c3bc35c3a1c3abc2bd46c39836c386c2bbc380c5bd0561c394191ce280a6c388c3b4c38e6bc39c3c3dc3bf0004c3b8c3b1c2adc3ba2cc5a1c2bec2b9c2a3c3a901c2bac38719e28099c3a245c3bae282acc2aac2bfe2809c1ac3b9c39fc381c3be3bc3b10fe282ac3531c2a8787759c2bbc3922ee280a032c3b6c392150e07675ec5923dcb9c115f5dc3bc1ac3bdc2bdc385c38cc3b6c3ba5fc3842b44e280a1710835c2bb14c382c692c3ab2c5dc2bdc3993fc3afc5a1c3abc2a2c2a83d2a6fc3b81f63e28099c38324c2acc39431c3bcc38a6fc2bbc3b77ec3b566c2be7a79e28098c3a9c3bf00c3b04fc38d67c383e28094c396c5a1c2aec28fc3b11238755b39167b793fc2b2c39a3de2809929c38ac29dc38253c39c7a57c2a46bc2bf187e2ec3bc260d71c3a33f025878e2809444c28fc3bd66c2adc3a169c593796bc39dc5be27c39cc39d3ac3a42ac3bbc397c3907657c2b06a3670c39d5ac38f1dc38dc2b4c3a824c5a068cb9c323ae28098c290c380c5bd0823c2bd705f18c2be39c3b85fc3a0c2aec28fc3b6c2ad72c3abc38cc2bde280a249c2b5c3932dc3b0c3971707c398765f56381f53c3857ac5bec38a14c2a2c39c1f29c3bac28fc3b65e0f2cc2a32ac2b85ac5bdc5a0c39dc2bbc39d7cc394c2aec5b8c38ac38c6fc382c3bf00c28fc39e09c3b8c2b7c2a7c3893ee280b0c2ab247730c38664c2b8c2b0c2bdc3843710c2a8c3aac38cc2a4c3a0c2a8c3aec38a48c3b7c2ae03c3a237c3ade28094c3a14f0e5fc29d17c382e28093771e3bc397c39dc592696fc2a60260c39dc3a9c3a60077c3bf00c380037d4578c5b8e280a63f670d77c3b6e2809cc3b1e280a6c387c28dc3b5c29d22c39bc3a1c397e280a02fc5bdc3b4c2b5c2b1c592c2acc3b7487fe280b054c3b00b0ec2b21001c3aa14c3a4c397c397c39f0e3e10784bc3a146c5932d7c37c2a3c38164c38576c38b7646c3bbe280b0c2bfc39fc290c3bcc387c3971d07602a612ac395176f3fc3b806384c466dcb9c52c39146c5937fc5bec38ec3b25d1c60c3b6c2bfc3b7c5b8c2a23e41c3b87bc3b023c3a3e280a2c3bdc38ec2b775c2a24ac5b80bc3b47d6ec3a0c39cc38b642ec5a12de282ace2809940c28d1773c2a63711c38953c5927a0ac3ac6dc2bfc3a0c5b8c2a355c5b8c3ad7e27c3b8c2817fc2aa5e3f2ec3b15b7cc39fc3b7c39cc5bdc384c3bd702bc3abc3bf00c386c28fc386c2a96169c2a5c2aec2a6c2b4c2b86b0118c2a8c396c3a6c2a96fc3a6e2809cc2b7c3892b25c3b71f2dc385c3bf0004c3b4c3b00ac2a625c397c2bc48c3adc3aae2809c5bc2a8c3bcc2bce2809c5c67c384c38fc398c3a7c3a167c3835d19c2b51d63c387c3bae28093e280a109c38fe280932f045349291de280993455673f4ac3b5c3afc39a6bc3b6c5bec2b2c3b829c2a7c28d2b4a58c2b51f175d47c2ba381fcb9cc3ad10c3b4e280995c75c38f65c3afc394c3a075c3bcc3abc3b16fc59275c2af1dc3ab73c3aac3bac3bec2a53ec2a9c2a8c38c7e69c2a76cc3a07f75474551c39940007a571d7746c5b8c2bb18c39dc5b821c5be56c38972c3a6c3b0c3b470c3b1c29d4ec2bbc3997ac2b4c3af7f25c3b7e280a2c3b5c3bb7d2ec39b56c2b8c28f46c2bcc2b9c2bfc393e2809dc3a22be280b9c2bb65c2b7e28098c387c2a940c3ae07c3bdc3b5c3b80ee280a2c29d47c3a347c3a35e61c3b97cc5b8336d2b01c385141fc2ad14122d27c2ad2d27c2ad001fe280a62fc3a15dc3bf00e282ac3e06c3b8c2afc3a23ee2809871c2abc3a9e28093c3b6c2b6c2ba3c32c3b90750c394c2aec3a3c2b6e280a6c2a5c3803b15c593c28dc38dc388c3a9583e32c3b87dc2afc3b803c384c38dc2a06bc5a174e280937ac2a0c39a521ce280a112c2ab7dc39646524303c398c692c39723c2a8354e324ac3b6c390c3abe2809313110a4ac2b4c2a0c3945ec38ec38ec387c2ad7c16c3bdc2adc2bc45c3b0e2809cc380c3bac5b8e280a0c3a3c2b41ac2b861c29d21c2ae18e2809867231fcb9c11c395e2809cc29dc381411f37c2b138c3b47fe280a6c2be1dc3b056c28dc2ac37c3841fc28dc5be33c393353f165cc2b0c5be2d1ec3a6c3a56e1ec397c3bbc2ad3449c2b8c3ae1fc3831e36c2a7c2a6785fe280bac3be28c3bc23c3b11fc381c3ad66c3934cc3b125c2bc505cc39d5b0bcb9cc59212e280b010c2a92411e28098c39c10411f4f5a3c61c3b0e280b9c384c39e04c3b106e28098c2a36ac3b64b05c3a6c2ad145359e2809de2809d324ac2b21c2fc38c38041e083d3ee2809e56c3b1c593c3a3c2a4e280a2c3adc39fc2a1c3b45471c3b8c3ac35c2a1e280b0c2a4c3aa7b1b24c2a57b45c2bdc2aec2bac2bee28098c2bbc393c2a1c3b766c2b3c3bb767c2dc392c38b0b69c3b55d5c0ee280a0c38ec384c2a83fc3b7c3b4c2a572c3975fc3b0510f08c2a31fc2b3785f5ae2809d7632c2b431c5b8c391c5a1c2be33c2bec3b867c2af587c45c3bf00e2809e1e4b747f10e280bac384c2b010c387206432c2b1007cc39d31c38839c3ac2b72c3a3c3a017c5922dc3be27c389c3a003690378e280b062332c42c3a1447220e280b9c38cc38a31c3867e5cc3b1c39720c3ba1ac39bc3ab35c39ec38bc3b03d6971267955c2be4825c3af72c3a91fc2b5c39b5bc3abc3a47d4c3fc3a0c2a2c5be1e27c5b807c3aa607b5cc387c3be1535c387c3bc143fc382c3874fc2ba30c3b867575bc3a113790ac3a62311e2809c1f28721c10c2b9c3864804c3a3c2b57c5bc3a05f02c3ab1f11c2bc536bc3a1c3bd12c39d67c394c3ae03e2809d491c46c2a0221762c38c78180a7ac3976bc3a1c39fc399c2b7c3855e23c3b0c2bee284a2c3a204c2bbc390c3b4c3bd3b51121b56c3947548c2a0690239462031c3a70476c3b51ec2b4c2a3cb86c2af2dc2bf232a1c41c5b86215c3a97bc38b5fc2b2c2ba5ac3bf0075c397c39ec28f3dc3b137e280b0351f186bc3b7c3bac396c2ad72c397c5a1e280a2c3b4c2ad34c3933f52c387c393c3900ee282ac74000159c2b5c3aa7a57c3acc39fc3a2c2ad6b5cc39674c38b4bc2bd0e53c2a44115c385c39dc398c3952236c388c2b2642fc3af01c38678391dc2bf1159c3be30c3b809c3a2c3bf0004c29d224bc39b5b5bc2ab1d5ac3a16d2cc3afc3ac2ec3a3c2b8c2b7e280996270137ac5be0fc3971d0fc2a1c2ae5709c3aec391c3b2e280a23018c396c29d69c393e2809c5777767bc39ec38fc3b1c3bc4f3bc2a2c2b63c61c3a14d43c380c39e26c394741d55123d46c382530cc38b1be280a150c3831d08c3abc396c2b1c3ab36c5a1c391c5be7cc3a12a7270e28099c2b35a303f4a28345040c2bec2b4c5bec2b451c3abc385007be28094c28fe280b04fc3993fc3a162292ac2afc2a9c3aa6cc38a3a31121009c3b5207156c3be095bc3b8e280b9c3a2c39fc386c2bf0147c3a2e280a6c2b8c2b9c2b2c3b0c3bec5b81dc3841bc3adc2b6c2b1c2b1c2b6c38bc385e282ac1419017dc2abc2bbe28099777535c38cc3b82fc3a33ec28d65c3a0183c1bc3a32f07c2a7e280b9746b3bc2a7c2bcc2b068c3afc39ec38a7b677fc2bec2bbe2809d1dc38a4e4e38c3a4c3b7c3a31b7ac28fc3ad4dc2a8c39c5c78c5a07b0d0e1d1e4bc38d120f0fc3a92d6574c38a74e280ba48c39cc2b1556c65c399c281c3bbc399520807c2b62bc2a94a17526fc2b6c5bee280a1c39853c38460c39d4a58c5a0e280a2c2b44a09c38127c2abe2809e767a5ac38dc2ad357bc3ab6d4ec393c3a3c2a5c2afcb86c3be227c02c2b2c3b16fe280b0345d4749c396c3b43d7ec3ae0963c3946d64c281c38dc2a5c38bc3b9cb8646c3b032c2aac38ce28098c59274c3857ac2bfc384e280ba2b5fe280b91ac38de280a1e280a652245f14784e2d335dc39308c3bbc39736c2acc2b1e280b9cb9cc2bdc388c3806f73c2b47ac397c38a1e1bc3b8c3b5c2ae69c39e10c3b1e280a1e280a175c2b92f3c4f67c3a20b35c2b74fc3ad0bc3a77fc2b24ac2ac59255dc39bc2b3e2809a7a0c64e280a6c3a7c5a0c2bbc2aac3bec390c3bae280a2c38fc3862d17c3a206c29dc2a7c2aee280ba77c2a6c3816f6c6cc3bcc3b322c38ce28098c387c3a5c2bac2b36d1c3ac3ae1d38c38f7c66c2ad55c5bdc3afc2adc2afc3b8c3bf00c3803d08c3a6c3b83b39c38dc2b7c3ad3914c3935ac3bbc2bcc389c2bbc39ac3974be280a2c2af347b56e2809cc2a05cc38bc3bb5a7c51c3b15dc2bde2809ec39ae280b9c3b85ec39ac3a6c3bac39ec39a08c5a157c5a1c3a9c2a1090c6154124925cb86c3bf0076c2b37e21c3aac2bac39fe280a6c2a0c3b823c3b16357c2b0c2bfc393c3b57b1dc2ba4ec2b2e28094c3903c33c2bfe28099c3a402c381e282ac24c38911cb9cc3a7c390c397c5a178e280b9c3b6e28093c394352b3f1cc28d234de2809c40c3943c55c2aa437f2ec2a16b7cc39e6c30c386c2b858010ac2a4c3b3c38ec3acc5bdc2a463c5a1c380e2809cc3a3e280a0c2abc2a9c3bc27c3963c15c2ae2dc386c2bcc39777c3b0c39fc39ac3aa57c397c28f24e280936ce282ac06003025c69228c38751c592c2b707343ae28098c2b349c3b77f3be284a2c394c38d3071e280a64a74c2a6c3aec39cc2a6c29dc2b4c3a7c3a7c3a6c28f4bc39ec3914ac3bb6ac38f6bc3943c291fc3817f117c74c3b16c3b63e280a03b6163c2a248c2bd0b6a043868c38fc2ac687f2cc3961fc592c3b46f0b6ac2bfc2b3c28fc381c3b7c3b117e280b02e7419c3a1c2b5c3950dc2a476c3ba69c2bb170c6e1720c290c3abc2b3042fc2ae777b5705c3b123c3b6c692c2bec3b8e280b0c3b0c2b3c382c2be0de280ba4e5b4fc3ac7de280a0c3a6c3b44dc2b9c2af5a38c3bcc2a8e280b90dc2a31b50c290724e49c3ad57c2b4c3afc5bd3e11c2bcc3b877c3a15f0bc3b8c2afc3a1c393c3b8c290c3b8792e12c39ac3ad35c3996cc3b226e2809c7b651233c3a8c2a3e280997a76c38d2e7836c392c39ac39e7dc3ae44c3b1c39829c38ac2a51a724a0e1a73295bc5a1535369c3b2c2abc3a8c2b45fc3a146c387c3acc39965c2a76a5f0cc2be315b6ac39ae284a2c391c2b4c3a934c3ab3135c3b0c2b76bc69208c3b3c5b8c5b82d482dc38e0601c3af5d2fe280b06cc2b4c39fe2809e7e11c3b87fc3a02d2ec3bec3a7c38470c3b8c6925dc2b3c3b132c3ab6f6e21c2b668e280b058c39638e28094731dc39c02c399c381191ec2bc7962c3bc61c391746d2bc3873a57e280a13c20745d2fc384c39656c3b6c2a2c39dc3b537c2b936c2ad13e2809367c39cc389e28094c39dc5bec59363c394c3956b2fc28d1347c3b0c3b7c383c5be19c2bec392e2809c50e28094c383c39ac382c3aa5a76c2a0c3b3157862c38ec3a7c2b7c386c393c3b2c2b37cc399c38f1ee280a102c2a54e2a36c3ab6dc3be6614c2b1c3985a387850c3a65cc391e280b95cc3894bc3b9c39b71c2b3c2b6c5bd3b3b5d7e537ec393c2bfc3b25f3c6dc3bf005fc3adc3bf00c2a0c2ad79e280a674c39f137c6c7e23c3b8c3bb5bc3b129c2b3161fc39a57067fc2b3093cc38f2f200c6ec380c38f4ec2b815c38c573cc39dc3a4c39a3e6b1b5235c2b1556a41c39d3936c2bd1b6068c2a0c39152710bc3b8c3927e34c2a7c2bd1dc28d0027c3a34bc3b8c3907ac391c3a94804c3bc696814e280a1c2ad300ec39d68c2a5c3ad483ac392014fc396c290c392c5a14a60147ac3907ac392c3b73400e2809d1a074a0f4a000d141a2803c3bfc399, '2020-08-31 23:19:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_attributes`
--

CREATE TABLE `phppos_attributes` (
  `id` int(10) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `ecommerce_attribute_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_attribute_values`
--

CREATE TABLE `phppos_attribute_values` (
  `id` int(10) NOT NULL,
  `ecommerce_attribute_term_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_categories`
--

CREATE TABLE `phppos_categories` (
  `id` int(11) NOT NULL,
  `ecommerce_category_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  `hide_from_grid` int(1) NOT NULL DEFAULT 0,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(10) DEFAULT NULL,
  `color` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_category` int(1) DEFAULT 0,
  `exclude_from_e_commerce` int(1) NOT NULL DEFAULT 0,
  `category_info_popup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sold_by` enum('sold_by_item','sold_by_weight') COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_mmj_weight` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_categories`
--

INSERT INTO `phppos_categories` (`id`, `ecommerce_category_id`, `last_modified`, `deleted`, `hide_from_grid`, `parent_id`, `name`, `image_id`, `color`, `system_category`, `exclude_from_e_commerce`, `category_info_popup`, `sold_by`, `enable_mmj_weight`) VALUES
(1, NULL, '2020-07-05 13:02:26', 1, 0, NULL, 'Preroll-Trim/Shake', NULL, NULL, 0, 0, NULL, NULL, b'0'),
(2, NULL, '2020-07-05 12:55:45', 1, 1, NULL, 'Flower', NULL, NULL, 0, 1, NULL, NULL, b'0'),
(3, '22', '2020-06-17 20:54:16', 0, 0, NULL, 'Edible', NULL, '', 0, 0, NULL, NULL, b'0'),
(4, '31', '2020-06-17 20:54:16', 0, 0, NULL, 'Cartridges', NULL, '', 0, 0, NULL, NULL, b'0'),
(5, '21', '2020-06-17 20:54:17', 0, 0, NULL, 'Concentrate', NULL, '', 0, 0, NULL, NULL, b'0'),
(6, '15', '2020-06-17 20:54:17', 0, 0, NULL, 'Accessories', NULL, '', 0, 0, NULL, NULL, b'0'),
(7, '26', '2020-06-17 20:54:18', 0, 0, NULL, 'Topical', NULL, '', 0, 0, NULL, NULL, b'0'),
(8, '27', '2020-06-17 20:54:18', 0, 0, NULL, 'Immature Plant', NULL, '', 0, 0, NULL, NULL, b'0'),
(9, '28', '2020-06-17 20:54:23', 0, 0, NULL, 'Tincture', NULL, '', 0, 0, NULL, NULL, b'0'),
(10, '30', '2020-06-17 20:54:23', 0, 0, NULL, 'Capsule/RSO Pills', NULL, '', 0, 0, NULL, NULL, b'0'),
(11, NULL, '2020-06-24 16:21:07', 1, 0, NULL, 'Cartridge', NULL, '', 0, 0, NULL, NULL, b'0'),
(12, '20', '2020-06-18 00:26:02', 0, 0, NULL, 'CBD', NULL, '', 0, 0, NULL, NULL, b'0'),
(13, '24', '2020-06-18 00:26:02', 0, 0, NULL, 'Merchandise', NULL, '', 0, 0, NULL, NULL, b'0'),
(14, '35', '2020-07-05 13:00:07', 0, 0, NULL, 'Preroll- Trim/Shake', NULL, NULL, 0, 0, NULL, NULL, b'0'),
(15, '36', '2020-06-24 16:52:22', 0, 0, NULL, 'Flower/Bud', NULL, '', 0, 0, NULL, NULL, b'0'),
(16, '37', '2020-06-24 16:52:26', 0, 0, NULL, 'Trans-dermal Patch', NULL, '', 0, 0, NULL, NULL, b'0'),
(17, NULL, '2020-08-03 23:56:13', 0, 1, NULL, 'Discount', NULL, NULL, 1, 0, NULL, NULL, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_currency_exchange_rates`
--

CREATE TABLE `phppos_currency_exchange_rates` (
  `id` int(10) NOT NULL,
  `currency_code_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` decimal(23,10) NOT NULL,
  `currency_symbol_location` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `number_of_decimals` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thousands_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `decimal_point` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_customers`
--

CREATE TABLE `phppos_customers` (
  `id` int(10) NOT NULL,
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT 0,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `balance` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `credit_limit` decimal(23,10) DEFAULT NULL,
  `points` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `disable_loyalty` int(1) NOT NULL DEFAULT 0,
  `current_spend_for_points` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `current_sales_for_discount` int(10) NOT NULL DEFAULT 0,
  `taxable` int(1) NOT NULL DEFAULT 1,
  `tax_certificate` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cc_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_ref_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_preview` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_issuer` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tier_id` int(10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `tax_class_id` int(10) DEFAULT NULL,
  `custom_field_1_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_2_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_3_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_4_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_5_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_6_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_7_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_8_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_9_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_10_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `internal_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `customer_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'REC',
  `rx_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rx_exp_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_account_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_customers_series`
--

CREATE TABLE `phppos_customers_series` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `item_id` int(1) NOT NULL DEFAULT 0,
  `expire_date` date DEFAULT NULL,
  `quantity_remaining` decimal(23,10) DEFAULT 0.0000000000,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_customers_series_log`
--

CREATE TABLE `phppos_customers_series_log` (
  `id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity_used` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_customers_taxes`
--

CREATE TABLE `phppos_customers_taxes` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_damaged_items_log`
--

CREATE TABLE `phppos_damaged_items_log` (
  `id` int(10) NOT NULL,
  `damaged_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `damaged_qty` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `item_id` int(10) NOT NULL,
  `item_variation_id` int(10) DEFAULT NULL,
  `sale_id` int(10) DEFAULT NULL,
  `location_id` int(10) NOT NULL,
  `damaged_safe` double(23,10) NOT NULL,
  `damaged_floor` double(23,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_ecommerce_locations`
--

CREATE TABLE `phppos_ecommerce_locations` (
  `location_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_ecommerce_locations`
--

INSERT INTO `phppos_ecommerce_locations` (`location_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employees`
--

CREATE TABLE `phppos_employees` (
  `id` int(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `force_password_change` int(1) NOT NULL DEFAULT 0,
  `always_require_password` int(1) NOT NULL DEFAULT 0,
  `person_id` int(10) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission_percent` decimal(23,10) DEFAULT 0.0000000000,
  `commission_percent_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `hourly_pay_rate` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `not_required_to_clock_in` int(1) NOT NULL DEFAULT 0,
  `inactive` int(1) NOT NULL DEFAULT 0,
  `reason_inactive` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `employee_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `custom_field_1_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_2_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_3_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_4_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_5_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_6_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_7_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_8_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_9_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_10_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_discount_percent` decimal(15,3) DEFAULT NULL,
  `employee_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'budtender',
  `ssn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_employees`
--

INSERT INTO `phppos_employees` (`id`, `username`, `password`, `force_password_change`, `always_require_password`, `person_id`, `language`, `commission_percent`, `commission_percent_type`, `hourly_pay_rate`, `not_required_to_clock_in`, `inactive`, `reason_inactive`, `hire_date`, `employee_number`, `birthday`, `termination_date`, `deleted`, `custom_field_1_value`, `custom_field_2_value`, `custom_field_3_value`, `custom_field_4_value`, `custom_field_5_value`, `custom_field_6_value`, `custom_field_7_value`, `custom_field_8_value`, `custom_field_9_value`, `custom_field_10_value`, `max_discount_percent`, `employee_type`, `ssn`) VALUES
(1, 'admin', 'a5e060ca9ecfaeea180f2a046c3bfd7e', 0, 0, 1, 'english', '0.0000000000', 'selling_price', '0.0000000000', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'budtender', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employees_app_config`
--

CREATE TABLE `phppos_employees_app_config` (
  `employee_id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employees_locations`
--

CREATE TABLE `phppos_employees_locations` (
  `employee_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_employees_locations`
--

INSERT INTO `phppos_employees_locations` (`employee_id`, `location_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employees_reset_password`
--

CREATE TABLE `phppos_employees_reset_password` (
  `id` int(10) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `expire` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employees_time_clock`
--

CREATE TABLE `phppos_employees_time_clock` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `clock_in` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clock_out` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clock_in_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `clock_out_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `hourly_pay_rate` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `ip_address_clock_in` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address_clock_out` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employees_time_off`
--

CREATE TABLE `phppos_employees_time_off` (
  `id` int(11) NOT NULL,
  `approved` int(1) NOT NULL DEFAULT 0,
  `start_day` date DEFAULT NULL,
  `end_day` date DEFAULT NULL,
  `hours_requested` decimal(23,10) DEFAULT 0.0000000000,
  `is_paid` int(1) NOT NULL DEFAULT 0,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_requested_person_id` int(10) DEFAULT NULL,
  `employee_requested_location_id` int(10) DEFAULT NULL,
  `employee_approved_person_id` int(10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employee_registers`
--

CREATE TABLE `phppos_employee_registers` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `register_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_expenses`
--

CREATE TABLE `phppos_expenses` (
  `id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `expense_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expense_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `expense_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expense_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `expense_amount` decimal(23,10) NOT NULL,
  `expense_tax` decimal(23,10) NOT NULL,
  `expense_note` text COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` int(10) NOT NULL,
  `approved_employee_id` int(10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `expense_payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_giftcards`
--

CREATE TABLE `phppos_giftcards` (
  `giftcard_id` int(11) NOT NULL,
  `giftcard_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(23,10) NOT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `inactive` int(1) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `integrated_gift_card` int(1) NOT NULL DEFAULT 0,
  `integrated_auth_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_giftcards_log`
--

CREATE TABLE `phppos_giftcards_log` (
  `id` int(10) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `giftcard_id` int(11) NOT NULL,
  `transaction_amount` decimal(23,10) NOT NULL,
  `log_message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_grid_hidden_categories`
--

CREATE TABLE `phppos_grid_hidden_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_grid_hidden_items`
--

CREATE TABLE `phppos_grid_hidden_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_grid_hidden_item_kits`
--

CREATE TABLE `phppos_grid_hidden_item_kits` (
  `id` int(11) NOT NULL,
  `item_kit_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_grid_hidden_tags`
--

CREATE TABLE `phppos_grid_hidden_tags` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_inventory`
--

CREATE TABLE `phppos_inventory` (
  `trans_id` int(11) NOT NULL,
  `trans_items` int(11) NOT NULL DEFAULT 0,
  `item_variation_id` int(10) DEFAULT NULL,
  `trans_user` int(11) NOT NULL DEFAULT 0,
  `trans_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `trans_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `trans_inventory` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `location_id` int(11) NOT NULL,
  `trans_current_quantity` decimal(23,10) DEFAULT NULL,
  `trans_inventory_safe` double(23,10) DEFAULT NULL,
  `trans_inventory_floor` double(23,10) DEFAULT NULL,
  `trans_current_safe` double(23,10) DEFAULT NULL,
  `trans_current_floor` double(23,10) DEFAULT NULL,
  `trans_type` enum('inventory','sale') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_inventory_counts`
--

CREATE TABLE `phppos_inventory_counts` (
  `id` int(11) NOT NULL,
  `count_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `employee_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_inventory_counts_items`
--

CREATE TABLE `phppos_inventory_counts_items` (
  `id` int(11) NOT NULL,
  `inventory_counts_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_variation_id` int(10) DEFAULT NULL,
  `count` decimal(23,10) DEFAULT 0.0000000000,
  `actual_quantity` decimal(23,10) DEFAULT 0.0000000000,
  `comment` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_inventory_snapshot`
--

CREATE TABLE `phppos_inventory_snapshot` (
  `inventory_cron_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `mmj_weight` decimal(23,10) NOT NULL,
  `weight_unit` enum('grams','ounces') NOT NULL,
  `safe` double(23,10) NOT NULL,
  `floor` double(23,10) NOT NULL,
  `purchase` double(23,10) NOT NULL,
  `sale` double(23,10) NOT NULL,
  `balance_safe` double(23,10) NOT NULL,
  `balance_floor` double(23,10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items`
--

CREATE TABLE `phppos_items` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ecommerce_product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ecommerce_product_quantity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_included` int(1) NOT NULL DEFAULT 0,
  `cost_price` decimal(23,10) NOT NULL,
  `unit_price` decimal(23,10) NOT NULL,
  `promo_price` decimal(23,10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reorder_level` decimal(23,10) DEFAULT NULL,
  `expire_days` int(10) DEFAULT NULL,
  `item_id` int(10) NOT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT 0,
  `is_ecommerce` int(1) DEFAULT 1,
  `is_service` int(1) NOT NULL DEFAULT 0,
  `is_ebt_item` int(1) NOT NULL DEFAULT 0,
  `commission_percent` decimal(23,10) DEFAULT 0.0000000000,
  `commission_percent_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `commission_fixed` decimal(23,10) DEFAULT 0.0000000000,
  `change_cost_price` int(1) NOT NULL DEFAULT 0,
  `disable_loyalty` int(1) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `ecommerce_last_modified` timestamp NULL DEFAULT NULL,
  `tax_class_id` int(10) DEFAULT NULL,
  `replenish_level` decimal(23,10) DEFAULT NULL,
  `system_item` int(1) NOT NULL DEFAULT 0,
  `max_discount_percent` decimal(15,3) DEFAULT NULL,
  `max_edit_price` decimal(23,10) DEFAULT NULL,
  `min_edit_price` decimal(23,10) DEFAULT NULL,
  `custom_field_1_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_2_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_3_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_4_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_5_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_6_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_7_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_8_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_9_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_10_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required_age` int(10) DEFAULT NULL,
  `verify_age` int(1) NOT NULL DEFAULT 0,
  `weight` decimal(23,10) DEFAULT NULL,
  `length` decimal(23,10) DEFAULT NULL,
  `width` decimal(23,10) DEFAULT NULL,
  `height` decimal(23,10) DEFAULT NULL,
  `ecommerce_shipping_class_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `long_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `allow_price_override_regardless_of_permissions` int(1) DEFAULT 0,
  `main_image_id` int(10) DEFAULT NULL,
  `only_integer` int(1) NOT NULL DEFAULT 0,
  `is_series_package` int(1) NOT NULL DEFAULT 0,
  `series_quantity` int(10) DEFAULT NULL,
  `series_days_to_use_within` int(10) DEFAULT NULL,
  `is_barcoded` int(1) NOT NULL DEFAULT 1,
  `default_quantity` decimal(23,10) DEFAULT NULL,
  `disable_from_price_rules` int(1) DEFAULT 0,
  `last_edited` timestamp NULL DEFAULT NULL,
  `info_popup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_inactive` int(1) DEFAULT 0,
  `weight_unit` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `ecommerce_product_safe` double(23,10) DEFAULT NULL,
  `ecommerce_product_floor` double(23,10) DEFAULT NULL,
  `mmj_weight` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_pricing_history`
--

CREATE TABLE `phppos_items_pricing_history` (
  `id` int(11) NOT NULL,
  `on_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_variation_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_quantity_units`
--

CREATE TABLE `phppos_items_quantity_units` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit_quantity` decimal(23,10) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_serial_numbers`
--

CREATE TABLE `phppos_items_serial_numbers` (
  `id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_tags`
--

CREATE TABLE `phppos_items_tags` (
  `item_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_taxes`
--

CREATE TABLE `phppos_items_taxes` (
  `id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_tier_prices`
--

CREATE TABLE `phppos_items_tier_prices` (
  `tier_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT 0.0000000000,
  `percent_off` decimal(15,3) DEFAULT NULL,
  `cost_plus_percent` decimal(15,3) DEFAULT NULL,
  `cost_plus_fixed_amount` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_attributes`
--

CREATE TABLE `phppos_item_attributes` (
  `attribute_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_attribute_values`
--

CREATE TABLE `phppos_item_attribute_values` (
  `item_id` int(10) NOT NULL,
  `attribute_value_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_images`
--

CREATE TABLE `phppos_item_images` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alt_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_id` int(11) DEFAULT NULL,
  `item_variation_id` int(10) DEFAULT NULL,
  `ecommerce_image_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kits`
--

CREATE TABLE `phppos_item_kits` (
  `item_kit_id` int(11) NOT NULL,
  `item_kit_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_included` int(1) NOT NULL DEFAULT 0,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT 0,
  `is_ebt_item` int(1) NOT NULL DEFAULT 0,
  `commission_percent` decimal(23,10) DEFAULT 0.0000000000,
  `commission_percent_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `commission_fixed` decimal(23,10) DEFAULT 0.0000000000,
  `change_cost_price` int(1) NOT NULL DEFAULT 0,
  `disable_loyalty` int(1) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `tax_class_id` int(10) DEFAULT NULL,
  `max_discount_percent` decimal(15,3) DEFAULT NULL,
  `max_edit_price` decimal(23,10) DEFAULT NULL,
  `min_edit_price` decimal(23,10) DEFAULT NULL,
  `custom_field_1_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_2_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_3_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_4_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_5_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_6_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_7_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_8_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_9_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_10_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required_age` int(10) DEFAULT NULL,
  `verify_age` int(1) NOT NULL DEFAULT 0,
  `allow_price_override_regardless_of_permissions` int(1) DEFAULT 0,
  `only_integer` int(1) NOT NULL DEFAULT 0,
  `is_barcoded` int(1) NOT NULL DEFAULT 1,
  `default_quantity` decimal(23,10) DEFAULT NULL,
  `disable_from_price_rules` int(1) DEFAULT 0,
  `main_image_id` int(10) DEFAULT NULL,
  `dynamic_pricing` int(1) NOT NULL DEFAULT 0,
  `info_popup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_kit_inactive` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kits_pricing_history`
--

CREATE TABLE `phppos_item_kits_pricing_history` (
  `id` int(11) NOT NULL,
  `on_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_id` int(11) NOT NULL,
  `item_kit_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kits_tags`
--

CREATE TABLE `phppos_item_kits_tags` (
  `item_kit_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kits_taxes`
--

CREATE TABLE `phppos_item_kits_taxes` (
  `id` int(10) NOT NULL,
  `item_kit_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kits_tier_prices`
--

CREATE TABLE `phppos_item_kits_tier_prices` (
  `tier_id` int(10) NOT NULL,
  `item_kit_id` int(10) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT 0.0000000000,
  `percent_off` decimal(15,3) DEFAULT NULL,
  `cost_plus_percent` decimal(15,3) DEFAULT NULL,
  `cost_plus_fixed_amount` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kit_images`
--

CREATE TABLE `phppos_item_kit_images` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alt_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_kit_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kit_items`
--

CREATE TABLE `phppos_item_kit_items` (
  `id` int(10) NOT NULL,
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_variation_id` int(10) DEFAULT NULL,
  `quantity` decimal(23,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kit_item_kits`
--

CREATE TABLE `phppos_item_kit_item_kits` (
  `id` int(10) NOT NULL,
  `item_kit_id` int(11) NOT NULL,
  `item_kit_item_kit` int(11) NOT NULL,
  `quantity` decimal(23,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_variations`
--

CREATE TABLE `phppos_item_variations` (
  `id` int(10) NOT NULL,
  `ecommerce_variation_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ecommerce_variation_quantity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `item_id` int(10) NOT NULL,
  `reorder_level` decimal(23,10) DEFAULT NULL,
  `replenish_level` decimal(23,10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `item_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL,
  `promo_price` decimal(23,10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `ecommerce_last_modified` timestamp NULL DEFAULT NULL,
  `is_ecommerce` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_variation_attribute_values`
--

CREATE TABLE `phppos_item_variation_attribute_values` (
  `attribute_value_id` int(10) NOT NULL,
  `item_variation_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_keys`
--

CREATE TABLE `phppos_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `key_ending` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_limits`
--

CREATE TABLE `phppos_limits` (
  `id` int(11) NOT NULL,
  `api_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_locations`
--

CREATE TABLE `phppos_locations` (
  `location_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_logo` int(10) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc_email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `return_policy` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `receive_stock_alert` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_alert_email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `mailchimp_api_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_credit_card_processing` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_processor` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `hosted_checkout_merchant_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `hosted_checkout_merchant_password` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `emv_merchant_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `net_e_pay_server` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `listener_port` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `com_port` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_public` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_private` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_currency_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `braintree_merchant_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `braintree_public_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `braintree_private_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_1_rate` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_1_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_2_rate` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_2_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_2_cumulative` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_3_rate` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_3_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_4_rate` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_4_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_5_rate` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax_5_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) DEFAULT 0,
  `secure_device_override_emv` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secure_device_override_non_emv` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_class_id` int(10) DEFAULT NULL,
  `ebt_integrated` int(1) NOT NULL DEFAULT 0,
  `integrated_gift_cards` int(1) NOT NULL DEFAULT 0,
  `square_currency_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `square_location_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `square_currency_multiplier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '100',
  `email_sales_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_receivings_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_alerts_just_order_level` int(1) DEFAULT 0,
  `platformly_api_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `platformly_project_id` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_locations`
--

INSERT INTO `phppos_locations` (`location_id`, `name`, `company`, `website`, `company_logo`, `address`, `phone`, `fax`, `email`, `cc_email`, `bcc_email`, `color`, `return_policy`, `receive_stock_alert`, `stock_alert_email`, `timezone`, `mailchimp_api_key`, `enable_credit_card_processing`, `credit_card_processor`, `hosted_checkout_merchant_id`, `hosted_checkout_merchant_password`, `emv_merchant_id`, `net_e_pay_server`, `listener_port`, `com_port`, `stripe_public`, `stripe_private`, `stripe_currency_code`, `braintree_merchant_id`, `braintree_public_key`, `braintree_private_key`, `default_tax_1_rate`, `default_tax_1_name`, `default_tax_2_rate`, `default_tax_2_name`, `default_tax_2_cumulative`, `default_tax_3_rate`, `default_tax_3_name`, `default_tax_4_rate`, `default_tax_4_name`, `default_tax_5_rate`, `default_tax_5_name`, `deleted`, `secure_device_override_emv`, `secure_device_override_non_emv`, `tax_class_id`, `ebt_integrated`, `integrated_gift_cards`, `square_currency_code`, `square_location_id`, `square_currency_multiplier`, `email_sales_email`, `email_receivings_email`, `stock_alerts_just_order_level`, `platformly_api_key`, `platformly_project_id`) VALUES
(1, 'Default', 'Canaveri Shop', 'www.canaveri.com', 1, '2021 NE Washington Blvd, Seattle WA 98114', '(918) 876-4522', '', 'info@canaveri.com', 'info@canaveri.com', '', NULL, '', '1', '', 'America/Boise', '', '1', 'other_usb', '', '', '', '', '', '', '', '', 'usd', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', 0, '', '', NULL, 0, 0, 'USD', '', '100', '', '', 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_items`
--

CREATE TABLE `phppos_location_items` (
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cost_price` decimal(23,10) DEFAULT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `promo_price` decimal(23,10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `quantity` decimal(23,10) DEFAULT 0.0000000000,
  `reorder_level` decimal(23,10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT 0,
  `tax_class_id` int(10) DEFAULT NULL,
  `replenish_level` decimal(23,10) DEFAULT NULL,
  `safe` decimal(23,10) DEFAULT 0.0000000000,
  `floor` decimal(23,10) DEFAULT 0.0000000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_items_taxes`
--

CREATE TABLE `phppos_location_items_taxes` (
  `id` int(10) NOT NULL,
  `location_id` int(11) NOT NULL,
  `item_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(16,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_items_tier_prices`
--

CREATE TABLE `phppos_location_items_tier_prices` (
  `tier_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT 0.0000000000,
  `percent_off` decimal(15,3) DEFAULT NULL,
  `cost_plus_percent` decimal(15,3) DEFAULT NULL,
  `cost_plus_fixed_amount` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_item_kits`
--

CREATE TABLE `phppos_location_item_kits` (
  `location_id` int(11) NOT NULL,
  `item_kit_id` int(11) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT 0,
  `tax_class_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_item_kits_taxes`
--

CREATE TABLE `phppos_location_item_kits_taxes` (
  `id` int(10) NOT NULL,
  `location_id` int(11) NOT NULL,
  `item_kit_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(16,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_item_kits_tier_prices`
--

CREATE TABLE `phppos_location_item_kits_tier_prices` (
  `tier_id` int(10) NOT NULL,
  `item_kit_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT 0.0000000000,
  `percent_off` decimal(15,3) DEFAULT NULL,
  `cost_plus_percent` decimal(15,3) DEFAULT NULL,
  `cost_plus_fixed_amount` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_item_variations`
--

CREATE TABLE `phppos_location_item_variations` (
  `item_variation_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL,
  `quantity` int(1) DEFAULT NULL,
  `reorder_level` decimal(23,10) DEFAULT NULL,
  `replenish_level` decimal(23,10) DEFAULT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL,
  `safe` double(23,10) NOT NULL,
  `floor` double(23,10) NOT NULL,
  `item_weight` double(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_logs`
--

CREATE TABLE `phppos_logs` (
  `id` int(11) NOT NULL,
  `api_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `method` enum('get','post','options','put','patch','delete') COLLATE utf8_unicode_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `response_code` smallint(3) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_manufacturers`
--

CREATE TABLE `phppos_manufacturers` (
  `id` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_messages`
--

CREATE TABLE `phppos_messages` (
  `id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_message_receiver`
--

CREATE TABLE `phppos_message_receiver` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message_read` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_migrations`
--

CREATE TABLE `phppos_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_migrations`
--

INSERT INTO `phppos_migrations` (`version`) VALUES
(20200114094106);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_modules`
--

CREATE TABLE `phppos_modules` (
  `name_lang_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc_lang_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_modules`
--

INSERT INTO `phppos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `icon`, `module_id`) VALUES
('module_appointments', 'module_appointments_desc', 75, 'ti-calendar', 'appointments'),
('module_config', 'module_config_desc', 100, 'icon ti-settings', 'config'),
('module_customers', 'module_customers_desc', 15, 'icon ti-user', 'customers'),
('module_deliveries', 'module_deliveries_desc', 18, 'ion-android-car', 'deliveries'),
('module_employees', 'module_employees_desc', 80, 'icon ti-id-badge', 'employees'),
('module_expenses', 'module_expenses_desc', 75, 'icon ti-money', 'expenses'),
('module_giftcards', 'module_giftcards_desc', 90, 'icon ti-credit-card', 'giftcards'),
('module_items', 'module_items_desc', 20, 'icon ti-harddrive', 'items'),
('module_locations', 'module_locations_desc', 110, 'icon ti-home', 'locations'),
('module_messages', 'module_messages_desc', 120, 'icon ti-email', 'messages'),
('module_price_rules', 'module_item_price_rules_desc', 35, 'ion-ios-pricetags-outline', 'price_rules'),
('module_receivings', 'module_receivings_desc', 60, 'icon ti-cloud-down', 'receivings'),
('module_reports', 'module_reports_desc', 50, 'icon ti-bar-chart', 'reports'),
('module_sales', 'module_sales_desc', 10, 'icon ti-shopping-cart', 'sales'),
('module_state_reporting', 'module_state_reporting', 55, 'icon ti-flag', 'state_reporting'),
('module_suppliers', 'module_suppliers_desc', 40, 'icon ti-download', 'suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_modules_actions`
--

CREATE TABLE `phppos_modules_actions` (
  `action_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `action_name_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_modules_actions`
--

INSERT INTO `phppos_modules_actions` (`action_id`, `module_id`, `action_name_key`, `sort`) VALUES
('add', 'appointments', 'appointments_add', 240),
('add_update', 'customers', 'module_action_add_update', 1),
('add_update', 'deliveries', 'deliveries_add_update', 240),
('add_update', 'employees', 'module_action_add_update', 130),
('add_update', 'expenses', 'module_expenses_add_update', 315),
('add_update', 'giftcards', 'module_action_add_update', 200),
('add_update', 'items', 'module_action_add_update', 40),
('add_update', 'locations', 'module_action_add_update', 240),
('add_update', 'price_rules', 'module_action_add_update', 400),
('add_update', 'suppliers', 'module_action_add_update', 100),
('assign_all_locations', 'employees', 'module_action_assign_all_locations', 151),
('count_inventory', 'items', 'items_count_inventory', 65),
('delete', 'appointments', 'appointments_delete', 250),
('delete', 'customers', 'module_action_delete', 20),
('delete', 'deliveries', 'deliveries_delete', 250),
('delete', 'employees', 'module_action_delete', 140),
('delete', 'expenses', 'module_expenses_delete', 330),
('delete', 'giftcards', 'module_action_delete', 210),
('delete', 'items', 'module_action_delete', 50),
('delete', 'locations', 'module_action_delete', 250),
('delete', 'price_rules', 'module_action_delete', 405),
('delete', 'suppliers', 'module_action_delete', 110),
('delete_receiving', 'receivings', 'module_action_delete_receiving', 306),
('delete_register_log', 'reports', 'common_delete_register_log', 232),
('delete_sale', 'sales', 'module_action_delete_sale', 230),
('delete_suspended_sale', 'sales', 'module_action_delete_suspended_sale', 181),
('delete_taxes', 'receivings', 'module_action_delete_taxes', 300),
('delete_taxes', 'sales', 'module_action_delete_taxes', 182),
('edit', 'appointments', 'appointments_edit', 245),
('edit', 'deliveries', 'deliveries_edit', 245),
('edit_customer_points', 'customers', 'module_edit_customer_points', 35),
('edit_giftcard_value', 'giftcards', 'module_edit_giftcard_value', 205),
('edit_profile', 'employees', 'common_edit_profile', 155),
('edit_quantity', 'items', 'items_edit_quantity', 62),
('edit_receiving', 'receivings', 'module_action_edit_receiving', 303),
('edit_register_log', 'reports', 'common_edit_register_log', 231),
('edit_sale', 'sales', 'module_edit_sale', 190),
('edit_sale_cost_price', 'sales', 'module_edit_sale_cost_price', 175),
('edit_sale_price', 'sales', 'module_edit_sale_price', 170),
('edit_store_account_balance', 'customers', 'customers_edit_store_account_balance', 31),
('edit_store_account_balance', 'suppliers', 'suppliers_edit_store_account_balance', 130),
('edit_suspended_sale', 'sales', 'sales_edit_suspended_sale', 192),
('edit_taxes', 'receivings', 'module_edit_taxes', 304),
('edit_taxes', 'sales', 'module_edit_taxes', 191),
('edit_tier', 'customers', 'customers_edit_tier', 45),
('excel_export', 'customers', 'common_excel_export', 40),
('excel_export', 'employees', 'common_excel_export', 160),
('excel_export', 'giftcards', 'common_excel_export', 225),
('excel_export', 'items', 'common_excel_export', 80),
('excel_export', 'suppliers', 'common_excel_export', 135),
('give_discount', 'sales', 'module_give_discount', 180),
('manage_categories', 'items', 'items_manage_categories', 70),
('manage_manufacturers', 'items', 'items_manage_manufacturers', 76),
('manage_tags', 'items', 'items_manage_tags', 75),
('process_returns', 'sales', 'config_process_returns', 184),
('receive_store_account_payment', 'receivings', 'common_receive_store_account_payment', 260),
('receive_store_account_payment', 'sales', 'common_receive_store_account_payment', 255),
('search', 'appointments', 'appointments_search', 255),
('search', 'customers', 'module_action_search_customers', 30),
('search', 'deliveries', 'deliveries_search', 255),
('search', 'employees', 'module_action_search_employees', 150),
('search', 'expenses', 'module_expenses_search', 310),
('search', 'giftcards', 'module_action_search_giftcards', 220),
('search', 'items', 'module_action_search_items', 60),
('search', 'locations', 'module_action_search_locations', 260),
('search', 'price_rules', 'module_action_search_price_rules', 415),
('search', 'sales', 'module_action_search_sales', 235),
('search', 'suppliers', 'module_action_search_suppliers', 120),
('see_cost_price', 'items', 'module_see_cost_price', 61),
('see_count_when_count_inventory', 'items', 'items_see_count_when_count_inventory', 66),
('send_message', 'messages', 'employees_send_message', 350),
('show_cost_price', 'reports', 'reports_show_cost_price', 290),
('show_profit', 'reports', 'reports_show_profit', 280),
('suspend_sale', 'sales', 'sales_suspend_sale', 183),
('view_all_employee_commissions', 'reports', 'reports_view_all_employee_commissions', 107),
('view_appointments', 'reports', 'reports_appointments', 95),
('view_categories', 'reports', 'reports_categories', 100),
('view_closeout', 'reports', 'reports_closeout', 105),
('view_commissions', 'reports', 'reports_commission', 106),
('view_customers', 'reports', 'reports_customers', 120),
('view_dashboard_stats', 'reports', 'reports_view_dashboard_stats', 300),
('view_deleted_sales', 'reports', 'reports_deleted_sales', 130),
('view_deliveries', 'reports', 'reports_deliveries', 135),
('view_discounts', 'reports', 'reports_discounts', 140),
('view_employees', 'reports', 'reports_employees', 150),
('view_expenses', 'reports', 'module_expenses_report', 155),
('view_giftcards', 'reports', 'reports_giftcards', 160),
('view_inventory_at_all_locations', 'items', 'common_view_inventory_at_all_locations', 268),
('view_inventory_at_all_locations', 'reports', 'reports_view_inventory_at_all_locations', 300),
('view_inventory_print_list', 'items', 'common_view_inventory_print_list', 267),
('view_inventory_reports', 'reports', 'reports_inventory_reports', 170),
('view_items', 'reports', 'reports_items', 190),
('view_manufacturers', 'reports', 'reports_manufacturers', 195),
('view_payments', 'reports', 'reports_payments', 200),
('view_price_rules', 'reports', 'reports_price_rules', 205),
('view_profit_and_loss', 'reports', 'reports_profit_and_loss', 210),
('view_receivings', 'reports', 'reports_receivings', 220),
('view_register_log', 'reports', 'reports_register_log_title', 230),
('view_registers', 'reports', 'reports_registers', 235),
('view_sales', 'reports', 'reports_sales', 240),
('view_sales_generator', 'reports', 'reports_sales_generator', 110),
('view_store_account', 'reports', 'reports_store_account', 250),
('view_store_account_suppliers', 'reports', 'reports_store_account_suppliers', 255),
('view_suppliers', 'reports', 'reports_suppliers', 260),
('view_suspended_sales', 'reports', 'reports_suspended_sales', 261),
('view_tags', 'reports', 'common_tags', 264),
('view_taxes', 'reports', 'reports_taxes', 270),
('view_tiers', 'reports', 'reports_tiers', 275),
('view_timeclock', 'reports', 'employees_timeclock', 280);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_people`
--

CREATE TABLE `phppos_people` (
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` text COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(10) DEFAULT NULL,
  `person_id` int(10) NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  `license_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_exp_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_people`
--

INSERT INTO `phppos_people` (`first_name`, `last_name`, `full_name`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `image_id`, `person_id`, `create_date`, `last_modified`, `license_number`, `license_state`, `date_of_birth`, `license_exp_date`) VALUES
('Admin', 'Canaveri Support', 'Admin Canaveri Support', '800-858-0729', 'info@canaveri.com', 'Address 1', '', '', '', '', '', '', NULL, 1, NULL, '2020-08-26 21:29:51', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_people_files`
--

CREATE TABLE `phppos_people_files` (
  `id` int(11) NOT NULL,
  `file_id` int(10) NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_permissions`
--

CREATE TABLE `phppos_permissions` (
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_permissions`
--

INSERT INTO `phppos_permissions` (`module_id`, `person_id`) VALUES
('appointments', 1),
('config', 1),
('customers', 1),
('deliveries', 1),
('employees', 1),
('expenses', 1),
('giftcards', 1),
('items', 1),
('locations', 1),
('messages', 1),
('price_rules', 1),
('receivings', 1),
('reports', 1),
('sales', 1),
('state_reporting', 1),
('suppliers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_permissions_actions`
--

CREATE TABLE `phppos_permissions_actions` (
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` int(11) NOT NULL,
  `action_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_permissions_actions`
--

INSERT INTO `phppos_permissions_actions` (`module_id`, `person_id`, `action_id`) VALUES
('appointments', 1, 'add'),
('appointments', 1, 'delete'),
('appointments', 1, 'edit'),
('appointments', 1, 'search'),
('customers', 1, 'add_update'),
('customers', 1, 'delete'),
('customers', 1, 'edit_customer_points'),
('customers', 1, 'edit_store_account_balance'),
('customers', 1, 'edit_tier'),
('customers', 1, 'excel_export'),
('customers', 1, 'search'),
('deliveries', 1, 'add_update'),
('deliveries', 1, 'delete'),
('deliveries', 1, 'edit'),
('deliveries', 1, 'search'),
('employees', 1, 'add_update'),
('employees', 1, 'assign_all_locations'),
('employees', 1, 'delete'),
('employees', 1, 'edit_profile'),
('employees', 1, 'excel_export'),
('employees', 1, 'search'),
('expenses', 1, 'add_update'),
('expenses', 1, 'delete'),
('expenses', 1, 'search'),
('giftcards', 1, 'add_update'),
('giftcards', 1, 'delete'),
('giftcards', 1, 'edit_giftcard_value'),
('giftcards', 1, 'excel_export'),
('giftcards', 1, 'search'),
('items', 1, 'add_update'),
('items', 1, 'count_inventory'),
('items', 1, 'delete'),
('items', 1, 'edit_quantity'),
('items', 1, 'excel_export'),
('items', 1, 'manage_categories'),
('items', 1, 'manage_manufacturers'),
('items', 1, 'manage_tags'),
('items', 1, 'search'),
('items', 1, 'see_cost_price'),
('items', 1, 'see_count_when_count_inventory'),
('items', 1, 'view_inventory_at_all_locations'),
('items', 1, 'view_inventory_print_list'),
('locations', 1, 'add_update'),
('locations', 1, 'delete'),
('locations', 1, 'search'),
('messages', 1, 'send_message'),
('price_rules', 1, 'add_update'),
('price_rules', 1, 'delete'),
('price_rules', 1, 'search'),
('receivings', 1, 'delete_receiving'),
('receivings', 1, 'delete_taxes'),
('receivings', 1, 'edit_receiving'),
('receivings', 1, 'edit_taxes'),
('receivings', 1, 'receive_store_account_payment'),
('reports', 1, 'delete_register_log'),
('reports', 1, 'edit_register_log'),
('reports', 1, 'show_cost_price'),
('reports', 1, 'show_profit'),
('reports', 1, 'view_all_employee_commissions'),
('reports', 1, 'view_appointments'),
('reports', 1, 'view_categories'),
('reports', 1, 'view_closeout'),
('reports', 1, 'view_commissions'),
('reports', 1, 'view_customers'),
('reports', 1, 'view_dashboard_stats'),
('reports', 1, 'view_deleted_sales'),
('reports', 1, 'view_deliveries'),
('reports', 1, 'view_discounts'),
('reports', 1, 'view_employees'),
('reports', 1, 'view_expenses'),
('reports', 1, 'view_giftcards'),
('reports', 1, 'view_inventory_at_all_locations'),
('reports', 1, 'view_inventory_reports'),
('reports', 1, 'view_items'),
('reports', 1, 'view_manufacturers'),
('reports', 1, 'view_payments'),
('reports', 1, 'view_price_rules'),
('reports', 1, 'view_profit_and_loss'),
('reports', 1, 'view_receivings'),
('reports', 1, 'view_register_log'),
('reports', 1, 'view_registers'),
('reports', 1, 'view_sales'),
('reports', 1, 'view_sales_generator'),
('reports', 1, 'view_store_account'),
('reports', 1, 'view_store_account_suppliers'),
('reports', 1, 'view_suppliers'),
('reports', 1, 'view_suspended_sales'),
('reports', 1, 'view_tags'),
('reports', 1, 'view_taxes'),
('reports', 1, 'view_tiers'),
('reports', 1, 'view_timeclock'),
('sales', 1, 'delete_sale'),
('sales', 1, 'delete_suspended_sale'),
('sales', 1, 'delete_taxes'),
('sales', 1, 'edit_sale'),
('sales', 1, 'edit_sale_cost_price'),
('sales', 1, 'edit_sale_price'),
('sales', 1, 'edit_suspended_sale'),
('sales', 1, 'edit_taxes'),
('sales', 1, 'give_discount'),
('sales', 1, 'process_returns'),
('sales', 1, 'receive_store_account_payment'),
('sales', 1, 'search'),
('sales', 1, 'suspend_sale'),
('suppliers', 1, 'add_update'),
('suppliers', 1, 'delete'),
('suppliers', 1, 'edit_store_account_balance'),
('suppliers', 1, 'excel_export'),
('suppliers', 1, 'search');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_permissions_actions_locations`
--

CREATE TABLE `phppos_permissions_actions_locations` (
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` int(11) NOT NULL,
  `action_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_permissions_locations`
--

CREATE TABLE `phppos_permissions_locations` (
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_rules`
--

CREATE TABLE `phppos_price_rules` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `added_on` timestamp NULL DEFAULT current_timestamp(),
  `active` int(1) NOT NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items_to_buy` decimal(23,10) DEFAULT NULL,
  `items_to_get` decimal(23,10) DEFAULT NULL,
  `percent_off` decimal(23,10) DEFAULT NULL,
  `fixed_off` decimal(23,10) DEFAULT NULL,
  `spend_amount` decimal(23,10) DEFAULT NULL,
  `num_times_to_apply` int(10) NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_on_receipt` int(1) NOT NULL DEFAULT 0,
  `coupon_spend_amount` decimal(23,10) DEFAULT NULL,
  `mix_and_match` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_rules_categories`
--

CREATE TABLE `phppos_price_rules_categories` (
  `id` int(10) NOT NULL,
  `rule_id` int(10) NOT NULL,
  `category_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_rules_items`
--

CREATE TABLE `phppos_price_rules_items` (
  `id` int(10) NOT NULL,
  `rule_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_rules_item_kits`
--

CREATE TABLE `phppos_price_rules_item_kits` (
  `id` int(10) NOT NULL,
  `rule_id` int(10) NOT NULL,
  `item_kit_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_rules_locations`
--

CREATE TABLE `phppos_price_rules_locations` (
  `id` int(10) NOT NULL,
  `rule_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_rules_manufacturers`
--

CREATE TABLE `phppos_price_rules_manufacturers` (
  `id` int(10) NOT NULL,
  `rule_id` int(10) NOT NULL,
  `manufacturer_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_rules_price_breaks`
--

CREATE TABLE `phppos_price_rules_price_breaks` (
  `id` int(10) NOT NULL,
  `rule_id` int(10) NOT NULL,
  `item_qty_to_buy` decimal(23,10) DEFAULT NULL,
  `discount_per_unit_fixed` decimal(23,10) DEFAULT NULL,
  `discount_per_unit_percent` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_rules_tags`
--

CREATE TABLE `phppos_price_rules_tags` (
  `id` int(10) NOT NULL,
  `rule_id` int(10) NOT NULL,
  `tag_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_tiers`
--

CREATE TABLE `phppos_price_tiers` (
  `id` int(10) NOT NULL,
  `order` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_percent_off` decimal(15,3) DEFAULT NULL,
  `default_cost_plus_percent` decimal(15,3) DEFAULT NULL,
  `default_cost_plus_fixed_amount` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_receivings`
--

CREATE TABLE `phppos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT 0,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `receiving_id` int(10) NOT NULL,
  `payment_type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `deleted_by` int(10) DEFAULT NULL,
  `suspended` int(1) NOT NULL DEFAULT 0,
  `location_id` int(11) NOT NULL,
  `transfer_to_location_id` int(11) DEFAULT NULL,
  `deleted_taxes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_po` int(1) NOT NULL DEFAULT 0,
  `store_account_payment` int(1) NOT NULL DEFAULT 0,
  `total_quantity_purchased` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `total_quantity_received` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `subtotal` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `tax` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `total` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `profit` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `custom_field_1_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_2_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_3_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_4_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_5_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_6_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_7_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_8_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_9_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_10_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  `override_taxes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` decimal(23,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_receivings_items`
--

CREATE TABLE `phppos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT 0,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `item_variation_id` int(10) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serialnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(11) NOT NULL DEFAULT 0,
  `quantity_purchased` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `quantity_received` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `item_cost_price` decimal(23,10) NOT NULL,
  `item_unit_price` decimal(23,10) NOT NULL,
  `discount_percent` decimal(15,3) NOT NULL DEFAULT 0.000,
  `expire_date` date DEFAULT NULL,
  `subtotal` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `tax` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `total` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `profit` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `override_taxes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_quantity` decimal(23,10) DEFAULT NULL,
  `items_quantity_units_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_receivings_items_taxes`
--

CREATE TABLE `phppos_receivings_items_taxes` (
  `receiving_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_receivings_payments`
--

CREATE TABLE `phppos_receivings_payments` (
  `payment_id` int(10) NOT NULL,
  `receiving_id` int(10) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_amount` decimal(23,10) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_registers`
--

CREATE TABLE `phppos_registers` (
  `register_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iptran_device_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emv_terminal_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_registers`
--

INSERT INTO `phppos_registers` (`register_id`, `location_id`, `name`, `iptran_device_id`, `emv_terminal_id`, `deleted`) VALUES
(1, 1, 'Default', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_registers_cart`
--

CREATE TABLE `phppos_registers_cart` (
  `id` int(10) NOT NULL,
  `register_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_registers_cart`
--

INSERT INTO `phppos_registers_cart` (`id`, `register_id`, `data`) VALUES
(1, 1, 0x613a31323a7b733a383a22737562746f74616c223b733a353a2232332e3333223b733a353a22746f74616c223b733a353a2233342e3330223b733a333a22746178223b643a31302e3936393939393939393939393939393b733a31333a2265786368616e67655f72617465223b693a313b733a31333a2265786368616e67655f6e616d65223b4e3b733a31353a2265786368616e67655f73796d626f6c223b733a313a2224223b733a32343a2265786368616e67655f73796d626f6c5f6c6f636174696f6e223b733a363a226265666f7265223b733a32373a2265786368616e67655f6e756d6265725f6f665f646563696d616c73223b4e3b733a32383a2265786368616e67655f74686f7573616e64735f736570617261746f72223b733a313a222c223b733a32323a2265786368616e67655f646563696d616c5f706f696e74223b733a313a222e223b733a393a2263616e5f656d61696c223b623a313b733a373a2273616c655f6964223b693a353036333b7d);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_register_currency_denominations`
--

CREATE TABLE `phppos_register_currency_denominations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(23,10) NOT NULL,
  `deleted` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_register_currency_denominations`
--

INSERT INTO `phppos_register_currency_denominations` (`id`, `name`, `value`, `deleted`) VALUES
(1, '100\'s', '100.0000000000', 0),
(2, '50\'s', '50.0000000000', 0),
(3, '20\'s', '20.0000000000', 0),
(4, '10\'s', '10.0000000000', 0),
(5, '5\'s', '5.0000000000', 0),
(6, '2\'s', '2.0000000000', 0),
(7, '1\'s', '1.0000000000', 0),
(8, 'Half Dollars', '0.5000000000', 0),
(9, 'Quarters', '0.2500000000', 0),
(10, 'Dimes', '0.1000000000', 0),
(11, 'Nickels', '0.0500000000', 0),
(12, 'Pennies', '0.0100000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_register_log`
--

CREATE TABLE `phppos_register_log` (
  `register_log_id` int(10) NOT NULL,
  `employee_id_open` int(10) NOT NULL,
  `employee_id_close` int(11) DEFAULT NULL,
  `register_id` int(11) DEFAULT NULL,
  `shift_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shift_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_register_log_audit`
--

CREATE TABLE `phppos_register_log_audit` (
  `id` int(11) NOT NULL,
  `register_log_id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_register_log_denoms`
--

CREATE TABLE `phppos_register_log_denoms` (
  `id` int(11) NOT NULL,
  `register_log_id` int(11) NOT NULL,
  `register_currency_denominations_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_register_log_payments`
--

CREATE TABLE `phppos_register_log_payments` (
  `id` int(11) NOT NULL,
  `register_log_id` int(10) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `open_amount` decimal(23,10) NOT NULL,
  `close_amount` decimal(23,10) NOT NULL,
  `payment_sales_amount` decimal(23,10) NOT NULL,
  `total_payment_additions` decimal(23,10) NOT NULL,
  `total_payment_subtractions` decimal(23,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales`
--

CREATE TABLE `phppos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT 0,
  `sold_by_employee_id` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `discount_reason` text COLLATE utf8_unicode_ci NOT NULL,
  `show_comment_on_receipt` int(1) NOT NULL DEFAULT 0,
  `sale_id` int(10) NOT NULL,
  `rule_id` int(10) DEFAULT NULL,
  `rule_discount` decimal(23,10) DEFAULT NULL,
  `payment_type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_ref_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `deleted_by` int(10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `suspended` int(10) NOT NULL DEFAULT 0,
  `is_ecommerce` int(1) NOT NULL DEFAULT 0,
  `ecommerce_order_id` int(10) DEFAULT NULL,
  `ecommerce_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `store_account_payment` int(1) NOT NULL DEFAULT 0,
  `was_layaway` int(1) NOT NULL DEFAULT 0,
  `was_estimate` int(1) NOT NULL DEFAULT 0,
  `location_id` int(11) NOT NULL,
  `register_id` int(11) DEFAULT NULL,
  `tier_id` int(10) DEFAULT NULL,
  `points_used` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `points_gained` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `did_redeem_discount` int(1) NOT NULL DEFAULT 0,
  `signature_image_id` int(10) DEFAULT NULL,
  `deleted_taxes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_quantity_purchased` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `subtotal` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `tax` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `total` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `profit` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `exchange_rate` decimal(23,10) NOT NULL DEFAULT 1.0000000000,
  `exchange_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `exchange_currency_symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `exchange_currency_symbol_location` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `exchange_number_of_decimals` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `exchange_thousands_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `exchange_decimal_point` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_purchase_points` int(1) NOT NULL DEFAULT 0,
  `custom_field_1_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_2_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_3_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_4_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_5_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_6_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_7_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_8_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_9_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_10_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  `override_taxes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `return_sale_id` int(10) DEFAULT NULL,
  `tip` decimal(23,10) DEFAULT NULL,
  `total_quantity_received` decimal(23,10) NOT NULL DEFAULT 0.0000000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_coupons`
--

CREATE TABLE `phppos_sales_coupons` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_deliveries`
--

CREATE TABLE `phppos_sales_deliveries` (
  `id` int(11) NOT NULL,
  `sale_id` int(10) NOT NULL,
  `shipping_address_person_id` int(10) NOT NULL,
  `delivery_employee_person_id` int(10) DEFAULT NULL,
  `shipping_method_id` int(10) DEFAULT NULL,
  `shipping_zone_id` int(10) DEFAULT NULL,
  `tax_class_id` int(10) DEFAULT NULL,
  `status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `estimated_shipping_date` timestamp NULL DEFAULT NULL,
  `actual_shipping_date` timestamp NULL DEFAULT NULL,
  `estimated_delivery_or_pickup_date` timestamp NULL DEFAULT NULL,
  `actual_delivery_or_pickup_date` timestamp NULL DEFAULT NULL,
  `is_pickup` int(1) NOT NULL DEFAULT 0,
  `tracking_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_items`
--

CREATE TABLE `phppos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT 0,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `item_variation_id` int(10) DEFAULT NULL,
  `rule_id` int(10) DEFAULT NULL,
  `rule_discount` decimal(23,10) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `serialnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(11) NOT NULL DEFAULT 0,
  `quantity_purchased` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `quantity_received` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `item_cost_price` decimal(23,10) NOT NULL,
  `item_unit_price` decimal(23,10) NOT NULL,
  `regular_item_unit_price_at_time_of_sale` decimal(23,10) DEFAULT NULL,
  `discount_percent` decimal(15,3) NOT NULL DEFAULT 0.000,
  `commission` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `subtotal` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `tax` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `total` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `profit` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `tier_id` int(10) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `damaged_qty` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `override_taxes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_quantity` decimal(23,10) DEFAULT NULL,
  `items_quantity_units_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_items_taxes`
--

CREATE TABLE `phppos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_item_kits`
--

CREATE TABLE `phppos_sales_item_kits` (
  `sale_id` int(10) NOT NULL DEFAULT 0,
  `item_kit_id` int(10) NOT NULL DEFAULT 0,
  `rule_id` int(10) DEFAULT NULL,
  `rule_discount` decimal(23,10) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(11) NOT NULL DEFAULT 0,
  `quantity_purchased` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `quantity_received` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `item_kit_cost_price` decimal(23,10) NOT NULL,
  `item_kit_unit_price` decimal(23,10) NOT NULL,
  `regular_item_kit_unit_price_at_time_of_sale` decimal(23,10) DEFAULT NULL,
  `discount_percent` decimal(15,3) NOT NULL DEFAULT 0.000,
  `commission` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `subtotal` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `tax` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `total` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `profit` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `tier_id` int(10) DEFAULT NULL,
  `override_taxes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_item_kits_taxes`
--

CREATE TABLE `phppos_sales_item_kits_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_kit_id` int(10) NOT NULL,
  `line` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_payments`
--

CREATE TABLE `phppos_sales_payments` (
  `payment_id` int(10) NOT NULL,
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_amount` decimal(23,10) NOT NULL,
  `auth_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ref_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `cc_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `acq_ref_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `process_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `entry_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `aid` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tvr` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `iad` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tsi` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `arc` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `cvm` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tran_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `application_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `truncated_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `card_issuer` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ebt_auth_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ebt_voucher_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sale_types`
--

CREATE TABLE `phppos_sale_types` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(10) NOT NULL,
  `system_sale_type` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `phppos_sale_types` (`id`, `name`, `sort`, `system_sale_type`) VALUES
(0, 'common_sale', 0, 1),
(1, 'common_layaway', 0, 1),
(2, 'common_estimate', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sessions`
--

CREATE TABLE `phppos_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_shipping_methods`
--

CREATE TABLE `phppos_shipping_methods` (
  `id` int(10) NOT NULL,
  `shipping_provider_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fee` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `fee_tax_class_id` int(10) DEFAULT NULL,
  `time_in_days` int(11) DEFAULT NULL,
  `has_tracking_number` int(1) NOT NULL DEFAULT 0,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_shipping_providers`
--

CREATE TABLE `phppos_shipping_providers` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_shipping_zones`
--

CREATE TABLE `phppos_shipping_zones` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fee` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `tax_class_id` int(10) DEFAULT NULL,
  `order` int(10) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_store_accounts`
--

CREATE TABLE `phppos_store_accounts` (
  `sno` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `transaction_amount` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `balance` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `comment` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_store_accounts_paid_sales`
--

CREATE TABLE `phppos_store_accounts_paid_sales` (
  `id` int(10) NOT NULL,
  `store_account_payment_sale_id` int(10) DEFAULT NULL,
  `sale_id` int(10) DEFAULT NULL,
  `partial_payment_amount` decimal(23,10) NOT NULL DEFAULT 0.0000000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_suppliers`
--

CREATE TABLE `phppos_suppliers` (
  `id` int(10) NOT NULL,
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT 0,
  `balance` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `tax_class_id` int(10) DEFAULT NULL,
  `custom_field_1_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_2_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_3_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_4_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_5_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_6_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_7_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_8_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_9_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_10_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_license_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_regulatory_agency_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'processor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_suppliers_taxes`
--

CREATE TABLE `phppos_suppliers_taxes` (
  `id` int(10) NOT NULL,
  `supplier_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_supplier_brands`
--

CREATE TABLE `phppos_supplier_brands` (
  `supplier_brand_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `brand` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_supplier_store_accounts`
--

CREATE TABLE `phppos_supplier_store_accounts` (
  `sno` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `receiving_id` int(11) DEFAULT NULL,
  `transaction_amount` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `balance` decimal(23,10) NOT NULL DEFAULT 0.0000000000,
  `comment` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_supplier_store_accounts_paid_receivings`
--

CREATE TABLE `phppos_supplier_store_accounts_paid_receivings` (
  `id` int(10) NOT NULL,
  `store_account_payment_receiving_id` int(10) DEFAULT NULL,
  `receiving_id` int(10) DEFAULT NULL,
  `partial_payment_amount` decimal(23,10) NOT NULL DEFAULT 0.0000000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_tags`
--

CREATE TABLE `phppos_tags` (
  `id` int(11) NOT NULL,
  `ecommerce_tag_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_tax_classes`
--

CREATE TABLE `phppos_tax_classes` (
  `id` int(10) NOT NULL,
  `order` int(10) NOT NULL DEFAULT 0,
  `location_id` int(10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ecommerce_tax_class_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_tax_classes_taxes`
--

CREATE TABLE `phppos_tax_classes_taxes` (
  `id` int(10) NOT NULL,
  `order` int(10) NOT NULL DEFAULT 0,
  `tax_class_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT 0,
  `ecommerce_tax_class_tax_rate_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_zips`
--

CREATE TABLE `phppos_zips` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_zone_id` int(10) DEFAULT NULL,
  `order` int(10) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `phppos_access`
--
ALTER TABLE `phppos_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controller` (`controller`),
  ADD KEY `phppos_access_key_fk` (`key`);

--
-- Indexes for table `phppos_additional_item_numbers`
--
ALTER TABLE `phppos_additional_item_numbers`
  ADD PRIMARY KEY (`item_id`,`item_number`),
  ADD UNIQUE KEY `item_number` (`item_number`),
  ADD KEY `phppos_additional_item_numbers_ibfk_2` (`item_variation_id`);

--
-- Indexes for table `phppos_appointments`
--
ALTER TABLE `phppos_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_appointments_ibfk_1` (`appointments_type_id`),
  ADD KEY `phppos_appointments_ibfk_2` (`person_id`),
  ADD KEY `phppos_appointments_ibfk_3` (`location_id`),
  ADD KEY `phppos_appointments_ibfk_4` (`employee_id`);

--
-- Indexes for table `phppos_appointment_types`
--
ALTER TABLE `phppos_appointment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phppos_app_config`
--
ALTER TABLE `phppos_app_config`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `phppos_app_files`
--
ALTER TABLE `phppos_app_files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `phppos_attributes`
--
ALTER TABLE `phppos_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`item_id`,`name`);

--
-- Indexes for table `phppos_attribute_values`
--
ALTER TABLE `phppos_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_attribute_id` (`name`,`attribute_id`),
  ADD KEY `phppos_attribute_values_ibfk_1` (`attribute_id`);

--
-- Indexes for table `phppos_categories`
--
ALTER TABLE `phppos_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `phppos_categories_ibfk_1` (`parent_id`),
  ADD KEY `phppos_categories_ibfk_2` (`image_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `phppos_currency_exchange_rates`
--
ALTER TABLE `phppos_currency_exchange_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phppos_customers`
--
ALTER TABLE `phppos_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `cc_token` (`cc_token`),
  ADD KEY `phppos_customers_ibfk_2` (`tier_id`),
  ADD KEY `company_name` (`company_name`),
  ADD KEY `phppos_customers_ibfk_3` (`tax_class_id`),
  ADD KEY `custom_field_1_value` (`custom_field_1_value`),
  ADD KEY `custom_field_2_value` (`custom_field_2_value`),
  ADD KEY `custom_field_3_value` (`custom_field_3_value`),
  ADD KEY `custom_field_4_value` (`custom_field_4_value`),
  ADD KEY `custom_field_5_value` (`custom_field_5_value`),
  ADD KEY `custom_field_6_value` (`custom_field_6_value`),
  ADD KEY `custom_field_7_value` (`custom_field_7_value`),
  ADD KEY `custom_field_8_value` (`custom_field_8_value`),
  ADD KEY `custom_field_9_value` (`custom_field_9_value`),
  ADD KEY `custom_field_10_value` (`custom_field_10_value`),
  ADD KEY `phppos_customers_ibfk_4` (`location_id`);

--
-- Indexes for table `phppos_customers_series`
--
ALTER TABLE `phppos_customers_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_customers_series_ibfk_1` (`item_id`),
  ADD KEY `phppos_customers_series_ibfk_2` (`customer_id`),
  ADD KEY `phppos_customers_series_ibfk_3` (`sale_id`);

--
-- Indexes for table `phppos_customers_series_log`
--
ALTER TABLE `phppos_customers_series_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_customers_series_log_ibfk_1` (`series_id`);

--
-- Indexes for table `phppos_customers_taxes`
--
ALTER TABLE `phppos_customers_taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tax` (`customer_id`,`name`,`percent`);

--
-- Indexes for table `phppos_damaged_items_log`
--
ALTER TABLE `phppos_damaged_items_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_damaged_items_log_ibfk_1` (`item_id`),
  ADD KEY `phppos_damaged_items_log_ibfk_2` (`item_variation_id`),
  ADD KEY `phppos_damaged_items_log_ibfk_3` (`sale_id`),
  ADD KEY `phppos_damaged_items_log_ibfk_4` (`location_id`);

--
-- Indexes for table `phppos_ecommerce_locations`
--
ALTER TABLE `phppos_ecommerce_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `phppos_employees`
--
ALTER TABLE `phppos_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `employee_number` (`employee_number`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `custom_field_1_value` (`custom_field_1_value`),
  ADD KEY `custom_field_2_value` (`custom_field_2_value`),
  ADD KEY `custom_field_3_value` (`custom_field_3_value`),
  ADD KEY `custom_field_4_value` (`custom_field_4_value`),
  ADD KEY `custom_field_5_value` (`custom_field_5_value`),
  ADD KEY `custom_field_6_value` (`custom_field_6_value`),
  ADD KEY `custom_field_7_value` (`custom_field_7_value`),
  ADD KEY `custom_field_8_value` (`custom_field_8_value`),
  ADD KEY `custom_field_9_value` (`custom_field_9_value`),
  ADD KEY `custom_field_10_value` (`custom_field_10_value`);

--
-- Indexes for table `phppos_employees_app_config`
--
ALTER TABLE `phppos_employees_app_config`
  ADD PRIMARY KEY (`employee_id`,`key`);

--
-- Indexes for table `phppos_employees_locations`
--
ALTER TABLE `phppos_employees_locations`
  ADD PRIMARY KEY (`employee_id`,`location_id`),
  ADD KEY `phppos_employees_locations_ibfk_2` (`location_id`);

--
-- Indexes for table `phppos_employees_reset_password`
--
ALTER TABLE `phppos_employees_reset_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_employees_reset_password_ibfk_1` (`employee_id`);

--
-- Indexes for table `phppos_employees_time_clock`
--
ALTER TABLE `phppos_employees_time_clock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_employees_time_clock_ibfk_1` (`employee_id`),
  ADD KEY `phppos_employees_time_clock_ibfk_2` (`location_id`);

--
-- Indexes for table `phppos_employees_time_off`
--
ALTER TABLE `phppos_employees_time_off`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_employees_time_off_ibfk_1` (`employee_requested_person_id`),
  ADD KEY `phppos_employees_time_off_ibfk_2` (`employee_approved_person_id`),
  ADD KEY `phppos_employees_time_off_ibfk_3` (`employee_requested_location_id`);

--
-- Indexes for table `phppos_employee_registers`
--
ALTER TABLE `phppos_employee_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_employee_registers_ibfk_1` (`employee_id`),
  ADD KEY `phppos_employee_registers_ibfk_2` (`register_id`);

--
-- Indexes for table `phppos_expenses`
--
ALTER TABLE `phppos_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `approved_employee_id` (`approved_employee_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `expense_type` (`expense_type`),
  ADD KEY `expense_date` (`expense_date`),
  ADD KEY `expense_amount` (`expense_amount`),
  ADD KEY `expense_description` (`expense_description`(255)),
  ADD KEY `expense_reason` (`expense_reason`),
  ADD KEY `expense_note` (`expense_note`(255));

--
-- Indexes for table `phppos_giftcards`
--
ALTER TABLE `phppos_giftcards`
  ADD PRIMARY KEY (`giftcard_id`),
  ADD UNIQUE KEY `giftcard_number` (`giftcard_number`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `phppos_giftcards_ibfk_1` (`customer_id`),
  ADD KEY `description` (`description`(255));

--
-- Indexes for table `phppos_giftcards_log`
--
ALTER TABLE `phppos_giftcards_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_giftcards_log_ibfk_1` (`giftcard_id`);

--
-- Indexes for table `phppos_grid_hidden_categories`
--
ALTER TABLE `phppos_grid_hidden_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_grid` (`category_id`,`location_id`),
  ADD KEY `phppos_grid_hidden_categories_ibfk_2` (`location_id`);

--
-- Indexes for table `phppos_grid_hidden_items`
--
ALTER TABLE `phppos_grid_hidden_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_grid` (`item_id`,`location_id`),
  ADD KEY `phppos_grid_hidden_items_ibfk_2` (`location_id`);

--
-- Indexes for table `phppos_grid_hidden_item_kits`
--
ALTER TABLE `phppos_grid_hidden_item_kits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_grid` (`item_kit_id`,`location_id`),
  ADD KEY `phppos_grid_hidden_item_kits_ibfk_2` (`location_id`);

--
-- Indexes for table `phppos_grid_hidden_tags`
--
ALTER TABLE `phppos_grid_hidden_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_grid` (`tag_id`,`location_id`),
  ADD KEY `phppos_grid_hidden_tags_ibfk_2` (`location_id`);

--
-- Indexes for table `phppos_inventory`
--
ALTER TABLE `phppos_inventory`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `phppos_inventory_ibfk_1` (`trans_items`),
  ADD KEY `phppos_inventory_ibfk_2` (`trans_user`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `trans_date` (`trans_date`,`trans_inventory`,`location_id`),
  ADD KEY `phppos_inventory_ibfk_4` (`item_variation_id`);

--
-- Indexes for table `phppos_inventory_counts`
--
ALTER TABLE `phppos_inventory_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_inventory_counts_ibfk_1` (`employee_id`),
  ADD KEY `phppos_inventory_counts_ibfk_2` (`location_id`);

--
-- Indexes for table `phppos_inventory_counts_items`
--
ALTER TABLE `phppos_inventory_counts_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_inventory_counts_items_ibfk_1` (`inventory_counts_id`),
  ADD KEY `phppos_inventory_counts_items_ibfk_2` (`item_id`),
  ADD KEY `inventory_counts_items_ibfk_3` (`item_variation_id`);

--
-- Indexes for table `phppos_inventory_snapshot`
--
ALTER TABLE `phppos_inventory_snapshot`
  ADD PRIMARY KEY (`inventory_cron_id`);

--
-- Indexes for table `phppos_items`
--
ALTER TABLE `phppos_items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_number` (`item_number`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `phppos_items_ibfk_1` (`supplier_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `phppos_items_ibfk_3` (`category_id`),
  ADD KEY `phppos_items_ibfk_4` (`manufacturer_id`),
  ADD KEY `phppos_items_ibfk_5` (`ecommerce_product_id`),
  ADD KEY `description` (`description`(255)),
  ADD KEY `size` (`size`),
  ADD KEY `reorder_level` (`reorder_level`),
  ADD KEY `cost_price` (`cost_price`),
  ADD KEY `unit_price` (`unit_price`),
  ADD KEY `promo_price` (`promo_price`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `name` (`name`),
  ADD KEY `phppos_items_ibfk_6` (`tax_class_id`),
  ADD KEY `deleted_system_item` (`deleted`,`system_item`),
  ADD KEY `custom_field_1_value` (`custom_field_1_value`),
  ADD KEY `custom_field_2_value` (`custom_field_2_value`),
  ADD KEY `custom_field_3_value` (`custom_field_3_value`),
  ADD KEY `custom_field_4_value` (`custom_field_4_value`),
  ADD KEY `custom_field_5_value` (`custom_field_5_value`),
  ADD KEY `custom_field_6_value` (`custom_field_6_value`),
  ADD KEY `custom_field_7_value` (`custom_field_7_value`),
  ADD KEY `custom_field_8_value` (`custom_field_8_value`),
  ADD KEY `custom_field_9_value` (`custom_field_9_value`),
  ADD KEY `custom_field_10_value` (`custom_field_10_value`),
  ADD KEY `verify_age` (`verify_age`),
  ADD KEY `phppos_items_ibfk_7` (`main_image_id`),
  ADD KEY `item_inactive_index` (`item_inactive`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `full_search` (`name`,`item_number`,`product_id`,`description`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `name_search` (`name`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `item_number_search` (`item_number`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `product_id_search` (`product_id`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `description_search` (`description`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `size_search` (`size`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_1_value_search` (`custom_field_1_value`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_2_value_search` (`custom_field_2_value`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_3_value_search` (`custom_field_3_value`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_4_value_search` (`custom_field_4_value`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_5_value_search` (`custom_field_5_value`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_6_value_search` (`custom_field_6_value`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_7_value_search` (`custom_field_7_value`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_8_value_search` (`custom_field_8_value`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_9_value_search` (`custom_field_9_value`);
ALTER TABLE `phppos_items` ADD FULLTEXT KEY `custom_field_10_value_search` (`custom_field_10_value`);

--
-- Indexes for table `phppos_items_pricing_history`
--
ALTER TABLE `phppos_items_pricing_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_items_pricing_history_ibfk_1` (`item_id`),
  ADD KEY `phppos_items_pricing_history_ibfk_2` (`item_variation_id`),
  ADD KEY `phppos_items_pricing_history_ibfk_3` (`location_id`),
  ADD KEY `phppos_items_pricing_history_ibfk_4` (`employee_id`);

--
-- Indexes for table `phppos_items_quantity_units`
--
ALTER TABLE `phppos_items_quantity_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_items_quantity_units_ibfk_1` (`item_id`);

--
-- Indexes for table `phppos_items_serial_numbers`
--
ALTER TABLE `phppos_items_serial_numbers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD KEY `phppos_items_serial_numbers_ibfk_1` (`item_id`);

--
-- Indexes for table `phppos_items_tags`
--
ALTER TABLE `phppos_items_tags`
  ADD PRIMARY KEY (`item_id`,`tag_id`),
  ADD KEY `phppos_items_tags_ibfk_2` (`tag_id`);

--
-- Indexes for table `phppos_items_taxes`
--
ALTER TABLE `phppos_items_taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tax` (`item_id`,`name`,`percent`);

--
-- Indexes for table `phppos_items_tier_prices`
--
ALTER TABLE `phppos_items_tier_prices`
  ADD PRIMARY KEY (`tier_id`,`item_id`),
  ADD KEY `phppos_items_tier_prices_ibfk_2` (`item_id`);

--
-- Indexes for table `phppos_item_attributes`
--
ALTER TABLE `phppos_item_attributes`
  ADD PRIMARY KEY (`attribute_id`,`item_id`),
  ADD KEY `phppos_item_attributes_ibfk_1` (`item_id`);

--
-- Indexes for table `phppos_item_attribute_values`
--
ALTER TABLE `phppos_item_attribute_values`
  ADD PRIMARY KEY (`attribute_value_id`,`item_id`),
  ADD KEY `phppos_item_attribute_values_ibfk_1` (`item_id`);

--
-- Indexes for table `phppos_item_images`
--
ALTER TABLE `phppos_item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_item_images_ibfk_1` (`item_id`),
  ADD KEY `phppos_item_images_ibfk_2` (`image_id`),
  ADD KEY `phppos_item_images_ibfk_3` (`item_variation_id`);

--
-- Indexes for table `phppos_item_kits`
--
ALTER TABLE `phppos_item_kits`
  ADD PRIMARY KEY (`item_kit_id`),
  ADD UNIQUE KEY `item_kit_number` (`item_kit_number`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `phppos_item_kits_ibfk_1` (`category_id`),
  ADD KEY `phppos_item_kits_ibfk_2` (`manufacturer_id`),
  ADD KEY `name` (`name`),
  ADD KEY `description` (`description`),
  ADD KEY `cost_price` (`cost_price`),
  ADD KEY `unit_price` (`unit_price`),
  ADD KEY `phppos_item_kits_ibfk_3` (`tax_class_id`),
  ADD KEY `custom_field_1_value` (`custom_field_1_value`),
  ADD KEY `custom_field_2_value` (`custom_field_2_value`),
  ADD KEY `custom_field_3_value` (`custom_field_3_value`),
  ADD KEY `custom_field_4_value` (`custom_field_4_value`),
  ADD KEY `custom_field_5_value` (`custom_field_5_value`),
  ADD KEY `custom_field_6_value` (`custom_field_6_value`),
  ADD KEY `custom_field_7_value` (`custom_field_7_value`),
  ADD KEY `custom_field_8_value` (`custom_field_8_value`),
  ADD KEY `custom_field_9_value` (`custom_field_9_value`),
  ADD KEY `custom_field_10_value` (`custom_field_10_value`),
  ADD KEY `verify_age` (`verify_age`),
  ADD KEY `phppos_item_kits_ibfk_4` (`main_image_id`),
  ADD KEY `item_kit_inactive_index` (`item_kit_inactive`);

--
-- Indexes for table `phppos_item_kits_pricing_history`
--
ALTER TABLE `phppos_item_kits_pricing_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_item_kits_pricing_history_ibfk_1` (`item_kit_id`),
  ADD KEY `phppos_item_kits_pricing_history_ibfk_2` (`location_id`),
  ADD KEY `phppos_item_kits_pricing_history_ibfk_3` (`employee_id`);

--
-- Indexes for table `phppos_item_kits_tags`
--
ALTER TABLE `phppos_item_kits_tags`
  ADD PRIMARY KEY (`item_kit_id`,`tag_id`),
  ADD KEY `phppos_item_kits_tags_ibfk_2` (`tag_id`);

--
-- Indexes for table `phppos_item_kits_taxes`
--
ALTER TABLE `phppos_item_kits_taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tax` (`item_kit_id`,`name`,`percent`);

--
-- Indexes for table `phppos_item_kits_tier_prices`
--
ALTER TABLE `phppos_item_kits_tier_prices`
  ADD PRIMARY KEY (`tier_id`,`item_kit_id`),
  ADD KEY `phppos_item_kits_tier_prices_ibfk_2` (`item_kit_id`);

--
-- Indexes for table `phppos_item_kit_images`
--
ALTER TABLE `phppos_item_kit_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_item_kit_images_ibfk_1` (`item_kit_id`),
  ADD KEY `phppos_item_kit_images_ibfk_2` (`image_id`);

--
-- Indexes for table `phppos_item_kit_items`
--
ALTER TABLE `phppos_item_kit_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_item_kit_items_ibfk_1` (`item_kit_id`),
  ADD KEY `phppos_item_kit_items_ibfk_2` (`item_id`),
  ADD KEY `phppos_item_kit_items_ibfk_3` (`item_variation_id`);

--
-- Indexes for table `phppos_item_kit_item_kits`
--
ALTER TABLE `phppos_item_kit_item_kits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_item_kit_item_kits_ibfk_1` (`item_kit_id`),
  ADD KEY `phppos_item_kit_item_kits_ibfk_2` (`item_kit_item_kit`);

--
-- Indexes for table `phppos_item_variations`
--
ALTER TABLE `phppos_item_variations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_number` (`item_number`),
  ADD KEY `phppos_item_variations_ibfk_1` (`item_id`),
  ADD KEY `phppos_item_variations_ibfk_2` (`ecommerce_variation_id`);
ALTER TABLE `phppos_item_variations` ADD FULLTEXT KEY `name_search` (`name`);

--
-- Indexes for table `phppos_item_variation_attribute_values`
--
ALTER TABLE `phppos_item_variation_attribute_values`
  ADD PRIMARY KEY (`attribute_value_id`,`item_variation_id`),
  ADD KEY `phppos_item_variation_attribute_values_ibfk_2` (`item_variation_id`);

--
-- Indexes for table `phppos_keys`
--
ALTER TABLE `phppos_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `phppos_keys_user_id_fk` (`user_id`);

--
-- Indexes for table `phppos_limits`
--
ALTER TABLE `phppos_limits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uri` (`uri`),
  ADD KEY `phppos_limits_api_key_fk` (`api_key`);

--
-- Indexes for table `phppos_locations`
--
ALTER TABLE `phppos_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `phppos_locations_ibfk_1` (`company_logo`),
  ADD KEY `name` (`name`(255)),
  ADD KEY `address` (`address`(255)),
  ADD KEY `phone` (`phone`(255)),
  ADD KEY `email` (`email`(255)),
  ADD KEY `phppos_locations_ibfk_2` (`tax_class_id`);

--
-- Indexes for table `phppos_location_items`
--
ALTER TABLE `phppos_location_items`
  ADD PRIMARY KEY (`location_id`,`item_id`),
  ADD KEY `phppos_location_items_ibfk_2` (`item_id`),
  ADD KEY `quantity` (`quantity`),
  ADD KEY `phppos_location_items_ibfk_3` (`tax_class_id`);

--
-- Indexes for table `phppos_location_items_taxes`
--
ALTER TABLE `phppos_location_items_taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tax` (`location_id`,`item_id`,`name`,`percent`),
  ADD KEY `phppos_location_items_taxes_ibfk_2` (`item_id`);

--
-- Indexes for table `phppos_location_items_tier_prices`
--
ALTER TABLE `phppos_location_items_tier_prices`
  ADD PRIMARY KEY (`tier_id`,`item_id`,`location_id`),
  ADD KEY `phppos_location_items_tier_prices_ibfk_2` (`location_id`),
  ADD KEY `phppos_location_items_tier_prices_ibfk_3` (`item_id`);

--
-- Indexes for table `phppos_location_item_kits`
--
ALTER TABLE `phppos_location_item_kits`
  ADD PRIMARY KEY (`location_id`,`item_kit_id`),
  ADD KEY `phppos_location_item_kits_ibfk_2` (`item_kit_id`),
  ADD KEY `phppos_location_item_kits_ibfk_3` (`tax_class_id`);

--
-- Indexes for table `phppos_location_item_kits_taxes`
--
ALTER TABLE `phppos_location_item_kits_taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tax` (`location_id`,`item_kit_id`,`name`,`percent`),
  ADD KEY `phppos_location_item_kits_taxes_ibfk_2` (`item_kit_id`);

--
-- Indexes for table `phppos_location_item_kits_tier_prices`
--
ALTER TABLE `phppos_location_item_kits_tier_prices`
  ADD PRIMARY KEY (`tier_id`,`item_kit_id`,`location_id`),
  ADD KEY `phppos_location_item_kits_tier_prices_ibfk_2` (`location_id`),
  ADD KEY `phppos_location_item_kits_tier_prices_ibfk_3` (`item_kit_id`);

--
-- Indexes for table `phppos_location_item_variations`
--
ALTER TABLE `phppos_location_item_variations`
  ADD PRIMARY KEY (`item_variation_id`,`location_id`),
  ADD KEY `phppos_item_attribute_location_values_ibfk_2` (`location_id`);

--
-- Indexes for table `phppos_logs`
--
ALTER TABLE `phppos_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phppos_manufacturers`
--
ALTER TABLE `phppos_manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `phppos_messages`
--
ALTER TABLE `phppos_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_messages_ibfk_1` (`sender_id`),
  ADD KEY `phppos_messages_key_1` (`deleted`,`created_at`,`id`);

--
-- Indexes for table `phppos_message_receiver`
--
ALTER TABLE `phppos_message_receiver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_message_receiver_ibfk_2` (`receiver_id`),
  ADD KEY `phppos_message_receiver_key_1` (`message_id`,`receiver_id`);

--
-- Indexes for table `phppos_modules`
--
ALTER TABLE `phppos_modules`
  ADD PRIMARY KEY (`module_id`),
  ADD UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  ADD UNIQUE KEY `name_lang_key` (`name_lang_key`);

--
-- Indexes for table `phppos_modules_actions`
--
ALTER TABLE `phppos_modules_actions`
  ADD PRIMARY KEY (`action_id`,`module_id`),
  ADD KEY `phppos_modules_actions_ibfk_1` (`module_id`);

--
-- Indexes for table `phppos_people`
--
ALTER TABLE `phppos_people`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `phppos_people_ibfk_1` (`image_id`),
  ADD KEY `first_name` (`first_name`),
  ADD KEY `last_name` (`last_name`),
  ADD KEY `email` (`email`),
  ADD KEY `phone_number` (`phone_number`),
  ADD KEY `full_name` (`full_name`(255));

--
-- Indexes for table `phppos_people_files`
--
ALTER TABLE `phppos_people_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_people_files_ibfk_1` (`file_id`);

--
-- Indexes for table `phppos_permissions`
--
ALTER TABLE `phppos_permissions`
  ADD PRIMARY KEY (`module_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `phppos_permissions_actions`
--
ALTER TABLE `phppos_permissions_actions`
  ADD PRIMARY KEY (`module_id`,`person_id`,`action_id`),
  ADD KEY `phppos_permissions_actions_ibfk_2` (`person_id`),
  ADD KEY `phppos_permissions_actions_ibfk_3` (`action_id`);

--
-- Indexes for table `phppos_permissions_actions_locations`
--
ALTER TABLE `phppos_permissions_actions_locations`
  ADD PRIMARY KEY (`module_id`,`person_id`,`action_id`,`location_id`),
  ADD KEY `phppos_permissions_actions_locations_ibfk_2` (`person_id`),
  ADD KEY `phppos_permissions_actions_locations_ibfk_3` (`action_id`),
  ADD KEY `phppos_permissions_actions_locations_ibfk_4` (`location_id`);

--
-- Indexes for table `phppos_permissions_locations`
--
ALTER TABLE `phppos_permissions_locations`
  ADD PRIMARY KEY (`module_id`,`person_id`,`location_id`),
  ADD KEY `phppos_permissions_locations_ibfk_1` (`person_id`),
  ADD KEY `phppos_permissions_locations_ibfk_3` (`location_id`);

--
-- Indexes for table `phppos_price_rules`
--
ALTER TABLE `phppos_price_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `phppos_price_rules_categories`
--
ALTER TABLE `phppos_price_rules_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_price_rules_categories_ibfk_1` (`rule_id`),
  ADD KEY `phppos_price_rules_categories_ibfk_2` (`category_id`);

--
-- Indexes for table `phppos_price_rules_items`
--
ALTER TABLE `phppos_price_rules_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_price_rules_items_ibfk_1` (`rule_id`),
  ADD KEY `phppos_price_rules_items_ibfk_2` (`item_id`);

--
-- Indexes for table `phppos_price_rules_item_kits`
--
ALTER TABLE `phppos_price_rules_item_kits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_price_rules_item_kits_ibfk_1` (`rule_id`),
  ADD KEY `phppos_price_rules_item_kits_ibfk_2` (`item_kit_id`);

--
-- Indexes for table `phppos_price_rules_locations`
--
ALTER TABLE `phppos_price_rules_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_price_rules_locations_ibfk_1` (`rule_id`),
  ADD KEY `phppos_price_rules_locations_ibfk_2` (`location_id`);

--
-- Indexes for table `phppos_price_rules_manufacturers`
--
ALTER TABLE `phppos_price_rules_manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_price_rules_manufacturers_ibfk_1` (`rule_id`),
  ADD KEY `phppos_price_rules_manufacturers_ibfk_2` (`manufacturer_id`);

--
-- Indexes for table `phppos_price_rules_price_breaks`
--
ALTER TABLE `phppos_price_rules_price_breaks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_price_rules_custom_ibfk_1` (`rule_id`);

--
-- Indexes for table `phppos_price_rules_tags`
--
ALTER TABLE `phppos_price_rules_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_price_rules_tags_ibfk_1` (`rule_id`),
  ADD KEY `phppos_price_rules_tags_ibfk_2` (`tag_id`);

--
-- Indexes for table `phppos_price_tiers`
--
ALTER TABLE `phppos_price_tiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phppos_receivings`
--
ALTER TABLE `phppos_receivings`
  ADD PRIMARY KEY (`receiving_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `transfer_to_location_id` (`transfer_to_location_id`),
  ADD KEY `recv_search` (`location_id`,`deleted`,`receiving_time`,`suspended`,`store_account_payment`,`total_quantity_purchased`),
  ADD KEY `custom_field_1_value` (`custom_field_1_value`),
  ADD KEY `custom_field_2_value` (`custom_field_2_value`),
  ADD KEY `custom_field_3_value` (`custom_field_3_value`),
  ADD KEY `custom_field_4_value` (`custom_field_4_value`),
  ADD KEY `custom_field_5_value` (`custom_field_5_value`),
  ADD KEY `custom_field_6_value` (`custom_field_6_value`),
  ADD KEY `custom_field_7_value` (`custom_field_7_value`),
  ADD KEY `custom_field_8_value` (`custom_field_8_value`),
  ADD KEY `custom_field_9_value` (`custom_field_9_value`),
  ADD KEY `custom_field_10_value` (`custom_field_10_value`);

--
-- Indexes for table `phppos_receivings_items`
--
ALTER TABLE `phppos_receivings_items`
  ADD PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `phppos_receivings_items_ibfk_3` (`item_variation_id`),
  ADD KEY `phppos_receivings_items_ibfk_4` (`items_quantity_units_id`);

--
-- Indexes for table `phppos_receivings_items_taxes`
--
ALTER TABLE `phppos_receivings_items_taxes`
  ADD PRIMARY KEY (`receiving_id`,`item_id`,`line`,`name`,`percent`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `phppos_receivings_payments`
--
ALTER TABLE `phppos_receivings_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `receiving_id` (`receiving_id`),
  ADD KEY `payment_date` (`payment_date`);

--
-- Indexes for table `phppos_registers`
--
ALTER TABLE `phppos_registers`
  ADD PRIMARY KEY (`register_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `phppos_registers_ibfk_1` (`location_id`);

--
-- Indexes for table `phppos_registers_cart`
--
ALTER TABLE `phppos_registers_cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `register_id` (`register_id`);

--
-- Indexes for table `phppos_register_currency_denominations`
--
ALTER TABLE `phppos_register_currency_denominations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phppos_register_log`
--
ALTER TABLE `phppos_register_log`
  ADD PRIMARY KEY (`register_log_id`),
  ADD KEY `phppos_register_log_ibfk_1` (`employee_id_open`),
  ADD KEY `phppos_register_log_ibfk_2` (`register_id`),
  ADD KEY `phppos_register_log_ibfk_3` (`employee_id_close`);

--
-- Indexes for table `phppos_register_log_audit`
--
ALTER TABLE `phppos_register_log_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `register_log_audit_ibfk_1` (`register_log_id`),
  ADD KEY `register_log_audit_ibfk_2` (`employee_id`);

--
-- Indexes for table `phppos_register_log_denoms`
--
ALTER TABLE `phppos_register_log_denoms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_register_log_denoms_ibfk_1` (`register_log_id`),
  ADD KEY `phppos_register_log_denoms_ibfk_2` (`register_currency_denominations_id`);

--
-- Indexes for table `phppos_register_log_payments`
--
ALTER TABLE `phppos_register_log_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_register_log_payments_ibfk_1` (`register_log_id`);

--
-- Indexes for table `phppos_sales`
--
ALTER TABLE `phppos_sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `phppos_sales_ibfk_4` (`deleted_by`),
  ADD KEY `phppos_sales_ibfk_5` (`tier_id`),
  ADD KEY `phppos_sales_ibfk_7` (`register_id`),
  ADD KEY `phppos_sales_ibfk_6` (`sold_by_employee_id`),
  ADD KEY `phppos_sales_ibfk_8` (`signature_image_id`),
  ADD KEY `was_layaway` (`was_layaway`),
  ADD KEY `was_estimate` (`was_estimate`),
  ADD KEY `phppos_sales_ibfk_9` (`rule_id`),
  ADD KEY `sales_search` (`location_id`,`deleted`,`sale_time`,`suspended`,`store_account_payment`,`total_quantity_purchased`),
  ADD KEY `phppos_sales_ibfk_10` (`suspended`),
  ADD KEY `custom_field_1_value` (`custom_field_1_value`),
  ADD KEY `custom_field_2_value` (`custom_field_2_value`),
  ADD KEY `custom_field_3_value` (`custom_field_3_value`),
  ADD KEY `custom_field_4_value` (`custom_field_4_value`),
  ADD KEY `custom_field_5_value` (`custom_field_5_value`),
  ADD KEY `custom_field_6_value` (`custom_field_6_value`),
  ADD KEY `custom_field_7_value` (`custom_field_7_value`),
  ADD KEY `custom_field_8_value` (`custom_field_8_value`),
  ADD KEY `custom_field_9_value` (`custom_field_9_value`),
  ADD KEY `custom_field_10_value` (`custom_field_10_value`),
  ADD KEY `phppos_sales_ibfk_11` (`return_sale_id`);

--
-- Indexes for table `phppos_sales_coupons`
--
ALTER TABLE `phppos_sales_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_sales_coupons_ibfk_1` (`sale_id`),
  ADD KEY `phppos_sales_coupons_ibfk_2` (`rule_id`);

--
-- Indexes for table `phppos_sales_deliveries`
--
ALTER TABLE `phppos_sales_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_index` (`status`,`shipping_address_person_id`),
  ADD KEY `phppos_sales_deliveries_ibfk_1` (`sale_id`),
  ADD KEY `phppos_sales_deliveries_ibfk_2` (`shipping_address_person_id`),
  ADD KEY `phppos_sales_deliveries_ibfk_3` (`shipping_method_id`),
  ADD KEY `phppos_sales_deliveries_ibfk_4` (`shipping_zone_id`),
  ADD KEY `phppos_sales_deliveries_ibfk_5` (`tax_class_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `phppos_sales_deliveries_ibfk_6` (`delivery_employee_person_id`);

--
-- Indexes for table `phppos_sales_items`
--
ALTER TABLE `phppos_sales_items`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `phppos_sales_items_ibfk_3` (`rule_id`),
  ADD KEY `phppos_sales_items_ibfk_4` (`item_variation_id`),
  ADD KEY `phppos_sales_items_ibfk_5` (`series_id`),
  ADD KEY `phppos_sales_items_ibfk_6` (`items_quantity_units_id`);

--
-- Indexes for table `phppos_sales_items_taxes`
--
ALTER TABLE `phppos_sales_items_taxes`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `phppos_sales_item_kits`
--
ALTER TABLE `phppos_sales_item_kits`
  ADD PRIMARY KEY (`sale_id`,`item_kit_id`,`line`),
  ADD KEY `item_kit_id` (`item_kit_id`),
  ADD KEY `phppos_sales_item_kits_ibfk_3` (`rule_id`);

--
-- Indexes for table `phppos_sales_item_kits_taxes`
--
ALTER TABLE `phppos_sales_item_kits_taxes`
  ADD PRIMARY KEY (`sale_id`,`item_kit_id`,`line`,`name`,`percent`),
  ADD KEY `item_id` (`item_kit_id`);

--
-- Indexes for table `phppos_sales_payments`
--
ALTER TABLE `phppos_sales_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `payment_date` (`payment_date`);

--
-- Indexes for table `phppos_sale_types`
--
ALTER TABLE `phppos_sale_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phppos_sessions`
--
ALTER TABLE `phppos_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `phppos_shipping_methods`
--
ALTER TABLE `phppos_shipping_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_shipping_methods_ibfk_1` (`shipping_provider_id`),
  ADD KEY `phppos_shipping_methods_ibfk_2` (`fee_tax_class_id`);

--
-- Indexes for table `phppos_shipping_providers`
--
ALTER TABLE `phppos_shipping_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phppos_shipping_zones`
--
ALTER TABLE `phppos_shipping_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_shipping_zones_ibfk_1` (`tax_class_id`);

--
-- Indexes for table `phppos_store_accounts`
--
ALTER TABLE `phppos_store_accounts`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `phppos_store_accounts_ibfk_1` (`sale_id`),
  ADD KEY `phppos_store_accounts_ibfk_2` (`customer_id`);

--
-- Indexes for table `phppos_store_accounts_paid_sales`
--
ALTER TABLE `phppos_store_accounts_paid_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_store_accounts_sales_ibfk_1` (`sale_id`),
  ADD KEY `phppos_store_accounts_sales_ibfk_2` (`store_account_payment_sale_id`);

--
-- Indexes for table `phppos_suppliers`
--
ALTER TABLE `phppos_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `phppos_suppliers_ibfk_2` (`tax_class_id`),
  ADD KEY `custom_field_1_value` (`custom_field_1_value`),
  ADD KEY `custom_field_2_value` (`custom_field_2_value`),
  ADD KEY `custom_field_3_value` (`custom_field_3_value`),
  ADD KEY `custom_field_4_value` (`custom_field_4_value`),
  ADD KEY `custom_field_5_value` (`custom_field_5_value`),
  ADD KEY `custom_field_6_value` (`custom_field_6_value`),
  ADD KEY `custom_field_7_value` (`custom_field_7_value`),
  ADD KEY `custom_field_8_value` (`custom_field_8_value`),
  ADD KEY `custom_field_9_value` (`custom_field_9_value`),
  ADD KEY `custom_field_10_value` (`custom_field_10_value`),
  ADD KEY `state_regulatory_agency_number` (`state_regulatory_agency_number`),
  ADD KEY `supplier_type` (`supplier_type`);

--
-- Indexes for table `phppos_suppliers_taxes`
--
ALTER TABLE `phppos_suppliers_taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tax` (`supplier_id`,`name`,`percent`);

--
-- Indexes for table `phppos_supplier_brands`
--
ALTER TABLE `phppos_supplier_brands`
  ADD PRIMARY KEY (`supplier_brand_id`),
  ADD KEY `supplier_id` (`supplier_id`);
ALTER TABLE `phppos_supplier_brands` ADD FULLTEXT KEY `index_name` (`brand`);
ALTER TABLE `phppos_supplier_brands` ADD FULLTEXT KEY `brand` (`brand`);

--
-- Indexes for table `phppos_supplier_store_accounts`
--
ALTER TABLE `phppos_supplier_store_accounts`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `phppos_supplier_store_accounts_ibfk_1` (`receiving_id`),
  ADD KEY `phppos_supplier_store_accounts_ibfk_2` (`supplier_id`);

--
-- Indexes for table `phppos_supplier_store_accounts_paid_receivings`
--
ALTER TABLE `phppos_supplier_store_accounts_paid_receivings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_supplier_store_accounts_paid_receivings_ibfk_1` (`receiving_id`),
  ADD KEY `phppos_supplier_store_accounts_paid_receivings_ibfk_2` (`store_account_payment_receiving_id`);

--
-- Indexes for table `phppos_tags`
--
ALTER TABLE `phppos_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_name` (`name`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `phppos_tax_classes`
--
ALTER TABLE `phppos_tax_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phppos_tax_classes_ibfk_1` (`location_id`);

--
-- Indexes for table `phppos_tax_classes_taxes`
--
ALTER TABLE `phppos_tax_classes_taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_tax` (`tax_class_id`,`name`,`percent`);

--
-- Indexes for table `phppos_zips`
--
ALTER TABLE `phppos_zips`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `phppos_zips_ibfk_1` (`shipping_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `phppos_access`
--
ALTER TABLE `phppos_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_appointments`
--
ALTER TABLE `phppos_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_appointment_types`
--
ALTER TABLE `phppos_appointment_types`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phppos_app_files`
--
ALTER TABLE `phppos_app_files`
  MODIFY `file_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_attributes`
--
ALTER TABLE `phppos_attributes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_attribute_values`
--
ALTER TABLE `phppos_attribute_values`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_categories`
--
ALTER TABLE `phppos_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `phppos_currency_exchange_rates`
--
ALTER TABLE `phppos_currency_exchange_rates`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_customers`
--
ALTER TABLE `phppos_customers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_customers_series`
--
ALTER TABLE `phppos_customers_series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_customers_series_log`
--
ALTER TABLE `phppos_customers_series_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_customers_taxes`
--
ALTER TABLE `phppos_customers_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_damaged_items_log`
--
ALTER TABLE `phppos_damaged_items_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_employees`
--
ALTER TABLE `phppos_employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phppos_employees_reset_password`
--
ALTER TABLE `phppos_employees_reset_password`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_employees_time_clock`
--
ALTER TABLE `phppos_employees_time_clock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_employees_time_off`
--
ALTER TABLE `phppos_employees_time_off`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_employee_registers`
--
ALTER TABLE `phppos_employee_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_expenses`
--
ALTER TABLE `phppos_expenses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_giftcards`
--
ALTER TABLE `phppos_giftcards`
  MODIFY `giftcard_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_giftcards_log`
--
ALTER TABLE `phppos_giftcards_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_grid_hidden_categories`
--
ALTER TABLE `phppos_grid_hidden_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_grid_hidden_items`
--
ALTER TABLE `phppos_grid_hidden_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_grid_hidden_item_kits`
--
ALTER TABLE `phppos_grid_hidden_item_kits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_grid_hidden_tags`
--
ALTER TABLE `phppos_grid_hidden_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_inventory`
--
ALTER TABLE `phppos_inventory`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_inventory_counts`
--
ALTER TABLE `phppos_inventory_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_inventory_counts_items`
--
ALTER TABLE `phppos_inventory_counts_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_inventory_snapshot`
--
ALTER TABLE `phppos_inventory_snapshot`
  MODIFY `inventory_cron_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_items`
--
ALTER TABLE `phppos_items`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_items_pricing_history`
--
ALTER TABLE `phppos_items_pricing_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_items_quantity_units`
--
ALTER TABLE `phppos_items_quantity_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_items_serial_numbers`
--
ALTER TABLE `phppos_items_serial_numbers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_items_taxes`
--
ALTER TABLE `phppos_items_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_item_images`
--
ALTER TABLE `phppos_item_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_item_kits`
--
ALTER TABLE `phppos_item_kits`
  MODIFY `item_kit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_item_kits_pricing_history`
--
ALTER TABLE `phppos_item_kits_pricing_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_item_kits_taxes`
--
ALTER TABLE `phppos_item_kits_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_item_kit_images`
--
ALTER TABLE `phppos_item_kit_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_item_kit_items`
--
ALTER TABLE `phppos_item_kit_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_item_kit_item_kits`
--
ALTER TABLE `phppos_item_kit_item_kits`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_item_variations`
--
ALTER TABLE `phppos_item_variations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_keys`
--
ALTER TABLE `phppos_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_limits`
--
ALTER TABLE `phppos_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_locations`
--
ALTER TABLE `phppos_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phppos_location_items_taxes`
--
ALTER TABLE `phppos_location_items_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_location_item_kits_taxes`
--
ALTER TABLE `phppos_location_item_kits_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_logs`
--
ALTER TABLE `phppos_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_manufacturers`
--
ALTER TABLE `phppos_manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_messages`
--
ALTER TABLE `phppos_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_message_receiver`
--
ALTER TABLE `phppos_message_receiver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_people`
--
ALTER TABLE `phppos_people`
  MODIFY `person_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phppos_people_files`
--
ALTER TABLE `phppos_people_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_price_rules`
--
ALTER TABLE `phppos_price_rules`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_price_rules_categories`
--
ALTER TABLE `phppos_price_rules_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_price_rules_items`
--
ALTER TABLE `phppos_price_rules_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_price_rules_item_kits`
--
ALTER TABLE `phppos_price_rules_item_kits`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_price_rules_locations`
--
ALTER TABLE `phppos_price_rules_locations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_price_rules_manufacturers`
--
ALTER TABLE `phppos_price_rules_manufacturers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_price_rules_price_breaks`
--
ALTER TABLE `phppos_price_rules_price_breaks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_price_rules_tags`
--
ALTER TABLE `phppos_price_rules_tags`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_price_tiers`
--
ALTER TABLE `phppos_price_tiers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_receivings`
--
ALTER TABLE `phppos_receivings`
  MODIFY `receiving_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_receivings_payments`
--
ALTER TABLE `phppos_receivings_payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_registers`
--
ALTER TABLE `phppos_registers`
  MODIFY `register_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phppos_registers_cart`
--
ALTER TABLE `phppos_registers_cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phppos_register_currency_denominations`
--
ALTER TABLE `phppos_register_currency_denominations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `phppos_register_log`
--
ALTER TABLE `phppos_register_log`
  MODIFY `register_log_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_register_log_audit`
--
ALTER TABLE `phppos_register_log_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_register_log_denoms`
--
ALTER TABLE `phppos_register_log_denoms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_register_log_payments`
--
ALTER TABLE `phppos_register_log_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_sales`
--
ALTER TABLE `phppos_sales`
  MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_sales_coupons`
--
ALTER TABLE `phppos_sales_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_sales_deliveries`
--
ALTER TABLE `phppos_sales_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_sales_payments`
--
ALTER TABLE `phppos_sales_payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_sale_types`
--
ALTER TABLE `phppos_sale_types`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_shipping_methods`
--
ALTER TABLE `phppos_shipping_methods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_shipping_providers`
--
ALTER TABLE `phppos_shipping_providers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_shipping_zones`
--
ALTER TABLE `phppos_shipping_zones`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_store_accounts`
--
ALTER TABLE `phppos_store_accounts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_store_accounts_paid_sales`
--
ALTER TABLE `phppos_store_accounts_paid_sales`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_suppliers`
--
ALTER TABLE `phppos_suppliers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_suppliers_taxes`
--
ALTER TABLE `phppos_suppliers_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_supplier_brands`
--
ALTER TABLE `phppos_supplier_brands`
  MODIFY `supplier_brand_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_supplier_store_accounts`
--
ALTER TABLE `phppos_supplier_store_accounts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_supplier_store_accounts_paid_receivings`
--
ALTER TABLE `phppos_supplier_store_accounts_paid_receivings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_tags`
--
ALTER TABLE `phppos_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_tax_classes`
--
ALTER TABLE `phppos_tax_classes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phppos_tax_classes_taxes`
--
ALTER TABLE `phppos_tax_classes_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `phppos_access`
--
ALTER TABLE `phppos_access`
  ADD CONSTRAINT `phppos_access_key_fk` FOREIGN KEY (`key`) REFERENCES `phppos_keys` (`key`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phppos_additional_item_numbers`
--
ALTER TABLE `phppos_additional_item_numbers`
  ADD CONSTRAINT `phppos_additional_item_numbers_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_additional_item_numbers_ibfk_2` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`);

--
-- Constraints for table `phppos_appointments`
--
ALTER TABLE `phppos_appointments`
  ADD CONSTRAINT `phppos_appointments_ibfk_1` FOREIGN KEY (`appointments_type_id`) REFERENCES `phppos_appointment_types` (`id`),
  ADD CONSTRAINT `phppos_appointments_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `phppos_people` (`person_id`),
  ADD CONSTRAINT `phppos_appointments_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_appointments_ibfk_4` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_attributes`
--
ALTER TABLE `phppos_attributes`
  ADD CONSTRAINT `phppos_attributes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_attribute_values`
--
ALTER TABLE `phppos_attribute_values`
  ADD CONSTRAINT `phppos_attribute_values_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `phppos_attributes` (`id`);

--
-- Constraints for table `phppos_categories`
--
ALTER TABLE `phppos_categories`
  ADD CONSTRAINT `phppos_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `phppos_categories` (`id`),
  ADD CONSTRAINT `phppos_categories_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `phppos_app_files` (`file_id`);

--
-- Constraints for table `phppos_customers`
--
ALTER TABLE `phppos_customers`
  ADD CONSTRAINT `phppos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_people` (`person_id`),
  ADD CONSTRAINT `phppos_customers_ibfk_2` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`),
  ADD CONSTRAINT `phppos_customers_ibfk_3` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`),
  ADD CONSTRAINT `phppos_customers_ibfk_4` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_customers_series`
--
ALTER TABLE `phppos_customers_series`
  ADD CONSTRAINT `phppos_customers_series_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_customers_series_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `phppos_people` (`person_id`),
  ADD CONSTRAINT `phppos_customers_series_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`);

--
-- Constraints for table `phppos_customers_series_log`
--
ALTER TABLE `phppos_customers_series_log`
  ADD CONSTRAINT `phppos_customers_series_log_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `phppos_customers_series` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_customers_taxes`
--
ALTER TABLE `phppos_customers_taxes`
  ADD CONSTRAINT `phppos_customers_taxes_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `phppos_customers` (`person_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_damaged_items_log`
--
ALTER TABLE `phppos_damaged_items_log`
  ADD CONSTRAINT `phppos_damaged_items_log_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_damaged_items_log_ibfk_2` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`),
  ADD CONSTRAINT `phppos_damaged_items_log_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`),
  ADD CONSTRAINT `phppos_damaged_items_log_ibfk_4` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_ecommerce_locations`
--
ALTER TABLE `phppos_ecommerce_locations`
  ADD CONSTRAINT `phppos_ecommerce_locations_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_employees`
--
ALTER TABLE `phppos_employees`
  ADD CONSTRAINT `phppos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_people` (`person_id`);

--
-- Constraints for table `phppos_employees_app_config`
--
ALTER TABLE `phppos_employees_app_config`
  ADD CONSTRAINT `phppos_employees_app_config_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_employees_locations`
--
ALTER TABLE `phppos_employees_locations`
  ADD CONSTRAINT `phppos_employees_locations_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_employees_locations_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_employees_reset_password`
--
ALTER TABLE `phppos_employees_reset_password`
  ADD CONSTRAINT `phppos_employees_reset_password_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_employees_time_clock`
--
ALTER TABLE `phppos_employees_time_clock`
  ADD CONSTRAINT `phppos_employees_time_clock_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_employees_time_clock_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_employees_time_off`
--
ALTER TABLE `phppos_employees_time_off`
  ADD CONSTRAINT `phppos_employees_time_off_ibfk_1` FOREIGN KEY (`employee_requested_person_id`) REFERENCES `phppos_people` (`person_id`),
  ADD CONSTRAINT `phppos_employees_time_off_ibfk_2` FOREIGN KEY (`employee_approved_person_id`) REFERENCES `phppos_people` (`person_id`),
  ADD CONSTRAINT `phppos_employees_time_off_ibfk_3` FOREIGN KEY (`employee_requested_location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_employee_registers`
--
ALTER TABLE `phppos_employee_registers`
  ADD CONSTRAINT `phppos_employee_registers_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_employee_registers_ibfk_2` FOREIGN KEY (`register_id`) REFERENCES `phppos_registers` (`register_id`);

--
-- Constraints for table `phppos_expenses`
--
ALTER TABLE `phppos_expenses`
  ADD CONSTRAINT `phppos_expenses_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_expenses_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_expenses_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `phppos_categories` (`id`),
  ADD CONSTRAINT `phppos_expenses_ibfk_4` FOREIGN KEY (`approved_employee_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_giftcards`
--
ALTER TABLE `phppos_giftcards`
  ADD CONSTRAINT `phppos_giftcards_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `phppos_customers` (`person_id`);

--
-- Constraints for table `phppos_giftcards_log`
--
ALTER TABLE `phppos_giftcards_log`
  ADD CONSTRAINT `phppos_giftcards_log_ibfk_1` FOREIGN KEY (`giftcard_id`) REFERENCES `phppos_giftcards` (`giftcard_id`);

--
-- Constraints for table `phppos_grid_hidden_categories`
--
ALTER TABLE `phppos_grid_hidden_categories`
  ADD CONSTRAINT `phppos_grid_hidden_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `phppos_categories` (`id`),
  ADD CONSTRAINT `phppos_grid_hidden_categories_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_grid_hidden_items`
--
ALTER TABLE `phppos_grid_hidden_items`
  ADD CONSTRAINT `phppos_grid_hidden_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_grid_hidden_items_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_grid_hidden_item_kits`
--
ALTER TABLE `phppos_grid_hidden_item_kits`
  ADD CONSTRAINT `phppos_grid_hidden_item_kits_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`),
  ADD CONSTRAINT `phppos_grid_hidden_item_kits_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_grid_hidden_tags`
--
ALTER TABLE `phppos_grid_hidden_tags`
  ADD CONSTRAINT `phppos_grid_hidden_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `phppos_tags` (`id`),
  ADD CONSTRAINT `phppos_grid_hidden_tags_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_inventory`
--
ALTER TABLE `phppos_inventory`
  ADD CONSTRAINT `phppos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_inventory_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_inventory_ibfk_4` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`);

--
-- Constraints for table `phppos_inventory_counts`
--
ALTER TABLE `phppos_inventory_counts`
  ADD CONSTRAINT `phppos_inventory_counts_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_inventory_counts_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_inventory_counts_items`
--
ALTER TABLE `phppos_inventory_counts_items`
  ADD CONSTRAINT `inventory_counts_items_ibfk_3` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`),
  ADD CONSTRAINT `phppos_inventory_counts_items_ibfk_1` FOREIGN KEY (`inventory_counts_id`) REFERENCES `phppos_inventory_counts` (`id`),
  ADD CONSTRAINT `phppos_inventory_counts_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_items`
--
ALTER TABLE `phppos_items`
  ADD CONSTRAINT `phppos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `phppos_suppliers` (`person_id`),
  ADD CONSTRAINT `phppos_items_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `phppos_categories` (`id`),
  ADD CONSTRAINT `phppos_items_ibfk_4` FOREIGN KEY (`manufacturer_id`) REFERENCES `phppos_manufacturers` (`id`),
  ADD CONSTRAINT `phppos_items_ibfk_6` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`),
  ADD CONSTRAINT `phppos_items_ibfk_7` FOREIGN KEY (`main_image_id`) REFERENCES `phppos_item_images` (`image_id`);

--
-- Constraints for table `phppos_items_pricing_history`
--
ALTER TABLE `phppos_items_pricing_history`
  ADD CONSTRAINT `phppos_items_pricing_history_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_items_pricing_history_ibfk_2` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`),
  ADD CONSTRAINT `phppos_items_pricing_history_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_items_pricing_history_ibfk_4` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_items_quantity_units`
--
ALTER TABLE `phppos_items_quantity_units`
  ADD CONSTRAINT `phppos_items_quantity_units_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_items_serial_numbers`
--
ALTER TABLE `phppos_items_serial_numbers`
  ADD CONSTRAINT `phppos_items_serial_numbers_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_items_tags`
--
ALTER TABLE `phppos_items_tags`
  ADD CONSTRAINT `phppos_items_tags_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_items_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `phppos_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_items_taxes`
--
ALTER TABLE `phppos_items_taxes`
  ADD CONSTRAINT `phppos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_items_tier_prices`
--
ALTER TABLE `phppos_items_tier_prices`
  ADD CONSTRAINT `phppos_items_tier_prices_ibfk_1` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_items_tier_prices_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_item_attributes`
--
ALTER TABLE `phppos_item_attributes`
  ADD CONSTRAINT `phppos_item_attributes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_item_attributes_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `phppos_attributes` (`id`);

--
-- Constraints for table `phppos_item_attribute_values`
--
ALTER TABLE `phppos_item_attribute_values`
  ADD CONSTRAINT `phppos_item_attribute_values_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_item_attribute_values_ibfk_2` FOREIGN KEY (`attribute_value_id`) REFERENCES `phppos_attribute_values` (`id`);

--
-- Constraints for table `phppos_item_images`
--
ALTER TABLE `phppos_item_images`
  ADD CONSTRAINT `phppos_item_images_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_item_images_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `phppos_app_files` (`file_id`),
  ADD CONSTRAINT `phppos_item_images_ibfk_3` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`);

--
-- Constraints for table `phppos_item_kits`
--
ALTER TABLE `phppos_item_kits`
  ADD CONSTRAINT `phppos_item_kits_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `phppos_categories` (`id`),
  ADD CONSTRAINT `phppos_item_kits_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `phppos_manufacturers` (`id`),
  ADD CONSTRAINT `phppos_item_kits_ibfk_3` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`),
  ADD CONSTRAINT `phppos_item_kits_ibfk_4` FOREIGN KEY (`main_image_id`) REFERENCES `phppos_item_kit_images` (`image_id`);

--
-- Constraints for table `phppos_item_kits_pricing_history`
--
ALTER TABLE `phppos_item_kits_pricing_history`
  ADD CONSTRAINT `phppos_item_kits_pricing_history_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`),
  ADD CONSTRAINT `phppos_item_kits_pricing_history_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_item_kits_pricing_history_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_item_kits_tags`
--
ALTER TABLE `phppos_item_kits_tags`
  ADD CONSTRAINT `phppos_item_kits_tags_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`),
  ADD CONSTRAINT `phppos_item_kits_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `phppos_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_item_kits_taxes`
--
ALTER TABLE `phppos_item_kits_taxes`
  ADD CONSTRAINT `phppos_item_kits_taxes_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_item_kits_tier_prices`
--
ALTER TABLE `phppos_item_kits_tier_prices`
  ADD CONSTRAINT `phppos_item_kits_tier_prices_ibfk_1` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_item_kits_tier_prices_ibfk_2` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`);

--
-- Constraints for table `phppos_item_kit_images`
--
ALTER TABLE `phppos_item_kit_images`
  ADD CONSTRAINT `phppos_item_kit_images_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`),
  ADD CONSTRAINT `phppos_item_kit_images_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `phppos_app_files` (`file_id`);

--
-- Constraints for table `phppos_item_kit_items`
--
ALTER TABLE `phppos_item_kit_items`
  ADD CONSTRAINT `phppos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_item_kit_items_ibfk_3` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`);

--
-- Constraints for table `phppos_item_kit_item_kits`
--
ALTER TABLE `phppos_item_kit_item_kits`
  ADD CONSTRAINT `phppos_item_kit_item_kits_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_item_kit_item_kits_ibfk_2` FOREIGN KEY (`item_kit_item_kit`) REFERENCES `phppos_item_kits` (`item_kit_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_item_variations`
--
ALTER TABLE `phppos_item_variations`
  ADD CONSTRAINT `phppos_item_variations_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_item_variation_attribute_values`
--
ALTER TABLE `phppos_item_variation_attribute_values`
  ADD CONSTRAINT `phppos_item_variation_attribute_values_ibfk_1` FOREIGN KEY (`attribute_value_id`) REFERENCES `phppos_attribute_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_item_variation_attribute_values_ibfk_2` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_keys`
--
ALTER TABLE `phppos_keys`
  ADD CONSTRAINT `phppos_keys_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `phppos_employees` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phppos_limits`
--
ALTER TABLE `phppos_limits`
  ADD CONSTRAINT `phppos_limits_api_key_fk` FOREIGN KEY (`api_key`) REFERENCES `phppos_keys` (`key`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phppos_locations`
--
ALTER TABLE `phppos_locations`
  ADD CONSTRAINT `phppos_locations_ibfk_1` FOREIGN KEY (`company_logo`) REFERENCES `phppos_app_files` (`file_id`),
  ADD CONSTRAINT `phppos_locations_ibfk_2` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`);

--
-- Constraints for table `phppos_location_items`
--
ALTER TABLE `phppos_location_items`
  ADD CONSTRAINT `phppos_location_items_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_location_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_location_items_ibfk_3` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`);

--
-- Constraints for table `phppos_location_items_taxes`
--
ALTER TABLE `phppos_location_items_taxes`
  ADD CONSTRAINT `phppos_location_items_taxes_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_location_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_location_items_tier_prices`
--
ALTER TABLE `phppos_location_items_tier_prices`
  ADD CONSTRAINT `phppos_location_items_tier_prices_ibfk_1` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_location_items_tier_prices_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_location_items_tier_prices_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_location_item_kits`
--
ALTER TABLE `phppos_location_item_kits`
  ADD CONSTRAINT `phppos_location_item_kits_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_location_item_kits_ibfk_2` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`),
  ADD CONSTRAINT `phppos_location_item_kits_ibfk_3` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`);

--
-- Constraints for table `phppos_location_item_kits_taxes`
--
ALTER TABLE `phppos_location_item_kits_taxes`
  ADD CONSTRAINT `phppos_location_item_kits_taxes_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_location_item_kits_taxes_ibfk_2` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_location_item_kits_tier_prices`
--
ALTER TABLE `phppos_location_item_kits_tier_prices`
  ADD CONSTRAINT `phppos_location_item_kits_tier_prices_ibfk_1` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_location_item_kits_tier_prices_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_location_item_kits_tier_prices_ibfk_3` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`);

--
-- Constraints for table `phppos_location_item_variations`
--
ALTER TABLE `phppos_location_item_variations`
  ADD CONSTRAINT `phppos_item_attribute_location_values_ibfk_1` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`),
  ADD CONSTRAINT `phppos_item_attribute_location_values_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_messages`
--
ALTER TABLE `phppos_messages`
  ADD CONSTRAINT `phppos_messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_message_receiver`
--
ALTER TABLE `phppos_message_receiver`
  ADD CONSTRAINT `phppos_message_receiver_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `phppos_messages` (`id`),
  ADD CONSTRAINT `phppos_message_receiver_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_modules_actions`
--
ALTER TABLE `phppos_modules_actions`
  ADD CONSTRAINT `phppos_modules_actions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `phppos_modules` (`module_id`);

--
-- Constraints for table `phppos_people`
--
ALTER TABLE `phppos_people`
  ADD CONSTRAINT `phppos_people_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `phppos_app_files` (`file_id`);

--
-- Constraints for table `phppos_people_files`
--
ALTER TABLE `phppos_people_files`
  ADD CONSTRAINT `phppos_people_files_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `phppos_app_files` (`file_id`);

--
-- Constraints for table `phppos_permissions`
--
ALTER TABLE `phppos_permissions`
  ADD CONSTRAINT `phppos_permissions_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_permissions_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `phppos_modules` (`module_id`);

--
-- Constraints for table `phppos_permissions_actions`
--
ALTER TABLE `phppos_permissions_actions`
  ADD CONSTRAINT `phppos_permissions_actions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `phppos_modules` (`module_id`),
  ADD CONSTRAINT `phppos_permissions_actions_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_permissions_actions_ibfk_3` FOREIGN KEY (`action_id`) REFERENCES `phppos_modules_actions` (`action_id`);

--
-- Constraints for table `phppos_permissions_actions_locations`
--
ALTER TABLE `phppos_permissions_actions_locations`
  ADD CONSTRAINT `phppos_permissions_actions_locations_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `phppos_modules` (`module_id`),
  ADD CONSTRAINT `phppos_permissions_actions_locations_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_permissions_actions_locations_ibfk_3` FOREIGN KEY (`action_id`) REFERENCES `phppos_modules_actions` (`action_id`),
  ADD CONSTRAINT `phppos_permissions_actions_locations_ibfk_4` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_permissions_locations`
--
ALTER TABLE `phppos_permissions_locations`
  ADD CONSTRAINT `phppos_permissions_locations_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_permissions_locations_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `phppos_modules` (`module_id`),
  ADD CONSTRAINT `phppos_permissions_locations_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_price_rules_categories`
--
ALTER TABLE `phppos_price_rules_categories`
  ADD CONSTRAINT `phppos_price_rules_categories_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`),
  ADD CONSTRAINT `phppos_price_rules_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `phppos_categories` (`id`);

--
-- Constraints for table `phppos_price_rules_items`
--
ALTER TABLE `phppos_price_rules_items`
  ADD CONSTRAINT `phppos_price_rules_items_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`),
  ADD CONSTRAINT `phppos_price_rules_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_price_rules_item_kits`
--
ALTER TABLE `phppos_price_rules_item_kits`
  ADD CONSTRAINT `phppos_price_rules_item_kits_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`),
  ADD CONSTRAINT `phppos_price_rules_item_kits_ibfk_2` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`);

--
-- Constraints for table `phppos_price_rules_locations`
--
ALTER TABLE `phppos_price_rules_locations`
  ADD CONSTRAINT `phppos_price_rules_locations_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`),
  ADD CONSTRAINT `phppos_price_rules_locations_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_price_rules_manufacturers`
--
ALTER TABLE `phppos_price_rules_manufacturers`
  ADD CONSTRAINT `phppos_price_rules_manufacturers_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`),
  ADD CONSTRAINT `phppos_price_rules_manufacturers_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `phppos_manufacturers` (`id`);

--
-- Constraints for table `phppos_price_rules_price_breaks`
--
ALTER TABLE `phppos_price_rules_price_breaks`
  ADD CONSTRAINT `phppos_price_rules_price_breaks_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`);

--
-- Constraints for table `phppos_price_rules_tags`
--
ALTER TABLE `phppos_price_rules_tags`
  ADD CONSTRAINT `phppos_price_rules_tags_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`),
  ADD CONSTRAINT `phppos_price_rules_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `phppos_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_receivings`
--
ALTER TABLE `phppos_receivings`
  ADD CONSTRAINT `phppos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `phppos_suppliers` (`person_id`),
  ADD CONSTRAINT `phppos_receivings_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_receivings_ibfk_4` FOREIGN KEY (`transfer_to_location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_receivings_items`
--
ALTER TABLE `phppos_receivings_items`
  ADD CONSTRAINT `phppos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `phppos_receivings` (`receiving_id`),
  ADD CONSTRAINT `phppos_receivings_items_ibfk_3` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`),
  ADD CONSTRAINT `phppos_receivings_items_ibfk_4` FOREIGN KEY (`items_quantity_units_id`) REFERENCES `phppos_items_quantity_units` (`id`);

--
-- Constraints for table `phppos_receivings_items_taxes`
--
ALTER TABLE `phppos_receivings_items_taxes`
  ADD CONSTRAINT `phppos_receivings_items_taxes_ibfk_1` FOREIGN KEY (`receiving_id`) REFERENCES `phppos_receivings` (`receiving_id`),
  ADD CONSTRAINT `phppos_receivings_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_receivings_payments`
--
ALTER TABLE `phppos_receivings_payments`
  ADD CONSTRAINT `phppos_receivings_payments_ibfk_1` FOREIGN KEY (`receiving_id`) REFERENCES `phppos_receivings` (`receiving_id`);

--
-- Constraints for table `phppos_registers`
--
ALTER TABLE `phppos_registers`
  ADD CONSTRAINT `phppos_registers_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_registers_cart`
--
ALTER TABLE `phppos_registers_cart`
  ADD CONSTRAINT `phppos_registers_cart_ibfk_1` FOREIGN KEY (`register_id`) REFERENCES `phppos_registers` (`register_id`);

--
-- Constraints for table `phppos_register_log`
--
ALTER TABLE `phppos_register_log`
  ADD CONSTRAINT `phppos_register_log_ibfk_1` FOREIGN KEY (`employee_id_open`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_register_log_ibfk_2` FOREIGN KEY (`register_id`) REFERENCES `phppos_registers` (`register_id`),
  ADD CONSTRAINT `phppos_register_log_ibfk_3` FOREIGN KEY (`employee_id_close`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_register_log_audit`
--
ALTER TABLE `phppos_register_log_audit`
  ADD CONSTRAINT `register_log_audit_ibfk_1` FOREIGN KEY (`register_log_id`) REFERENCES `phppos_register_log` (`register_log_id`),
  ADD CONSTRAINT `register_log_audit_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_register_log_denoms`
--
ALTER TABLE `phppos_register_log_denoms`
  ADD CONSTRAINT `phppos_register_log_denoms_ibfk_1` FOREIGN KEY (`register_log_id`) REFERENCES `phppos_register_log` (`register_log_id`),
  ADD CONSTRAINT `phppos_register_log_denoms_ibfk_2` FOREIGN KEY (`register_currency_denominations_id`) REFERENCES `phppos_register_currency_denominations` (`id`);

--
-- Constraints for table `phppos_register_log_payments`
--
ALTER TABLE `phppos_register_log_payments`
  ADD CONSTRAINT `phppos_register_log_payments_ibfk_1` FOREIGN KEY (`register_log_id`) REFERENCES `phppos_register_log` (`register_log_id`);

--
-- Constraints for table `phppos_sales`
--
ALTER TABLE `phppos_sales`
  ADD CONSTRAINT `phppos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_10` FOREIGN KEY (`suspended`) REFERENCES `phppos_sale_types` (`id`),
  ADD CONSTRAINT `phppos_sales_ibfk_11` FOREIGN KEY (`return_sale_id`) REFERENCES `phppos_sales` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `phppos_customers` (`person_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_4` FOREIGN KEY (`deleted_by`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_5` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`),
  ADD CONSTRAINT `phppos_sales_ibfk_6` FOREIGN KEY (`sold_by_employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_7` FOREIGN KEY (`register_id`) REFERENCES `phppos_registers` (`register_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_8` FOREIGN KEY (`signature_image_id`) REFERENCES `phppos_app_files` (`file_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_9` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`);

--
-- Constraints for table `phppos_sales_coupons`
--
ALTER TABLE `phppos_sales_coupons`
  ADD CONSTRAINT `phppos_sales_coupons_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_coupons_ibfk_2` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`);

--
-- Constraints for table `phppos_sales_deliveries`
--
ALTER TABLE `phppos_sales_deliveries`
  ADD CONSTRAINT `phppos_sales_deliveries_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_deliveries_ibfk_2` FOREIGN KEY (`shipping_address_person_id`) REFERENCES `phppos_people` (`person_id`),
  ADD CONSTRAINT `phppos_sales_deliveries_ibfk_3` FOREIGN KEY (`shipping_method_id`) REFERENCES `phppos_shipping_methods` (`id`),
  ADD CONSTRAINT `phppos_sales_deliveries_ibfk_4` FOREIGN KEY (`shipping_zone_id`) REFERENCES `phppos_shipping_zones` (`id`),
  ADD CONSTRAINT `phppos_sales_deliveries_ibfk_5` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`),
  ADD CONSTRAINT `phppos_sales_deliveries_ibfk_6` FOREIGN KEY (`delivery_employee_person_id`) REFERENCES `phppos_employees` (`person_id`);

--
-- Constraints for table `phppos_sales_items`
--
ALTER TABLE `phppos_sales_items`
  ADD CONSTRAINT `phppos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_items_ibfk_3` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`),
  ADD CONSTRAINT `phppos_sales_items_ibfk_4` FOREIGN KEY (`item_variation_id`) REFERENCES `phppos_item_variations` (`id`),
  ADD CONSTRAINT `phppos_sales_items_ibfk_5` FOREIGN KEY (`series_id`) REFERENCES `phppos_customers_series` (`id`),
  ADD CONSTRAINT `phppos_sales_items_ibfk_6` FOREIGN KEY (`items_quantity_units_id`) REFERENCES `phppos_items_quantity_units` (`id`);

--
-- Constraints for table `phppos_sales_items_taxes`
--
ALTER TABLE `phppos_sales_items_taxes`
  ADD CONSTRAINT `phppos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales_items` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_sales_item_kits`
--
ALTER TABLE `phppos_sales_item_kits`
  ADD CONSTRAINT `phppos_sales_item_kits_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`),
  ADD CONSTRAINT `phppos_sales_item_kits_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_item_kits_ibfk_3` FOREIGN KEY (`rule_id`) REFERENCES `phppos_price_rules` (`id`);

--
-- Constraints for table `phppos_sales_item_kits_taxes`
--
ALTER TABLE `phppos_sales_item_kits_taxes`
  ADD CONSTRAINT `phppos_sales_item_kits_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales_item_kits` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_item_kits_taxes_ibfk_2` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`);

--
-- Constraints for table `phppos_sales_payments`
--
ALTER TABLE `phppos_sales_payments`
  ADD CONSTRAINT `phppos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`);

--
-- Constraints for table `phppos_shipping_methods`
--
ALTER TABLE `phppos_shipping_methods`
  ADD CONSTRAINT `phppos_shipping_methods_ibfk_1` FOREIGN KEY (`shipping_provider_id`) REFERENCES `phppos_shipping_providers` (`id`),
  ADD CONSTRAINT `phppos_shipping_methods_ibfk_2` FOREIGN KEY (`fee_tax_class_id`) REFERENCES `phppos_tax_classes` (`id`);

--
-- Constraints for table `phppos_shipping_zones`
--
ALTER TABLE `phppos_shipping_zones`
  ADD CONSTRAINT `phppos_shipping_zones_ibfk_1` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`);

--
-- Constraints for table `phppos_store_accounts`
--
ALTER TABLE `phppos_store_accounts`
  ADD CONSTRAINT `phppos_store_accounts_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`),
  ADD CONSTRAINT `phppos_store_accounts_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `phppos_customers` (`person_id`);

--
-- Constraints for table `phppos_store_accounts_paid_sales`
--
ALTER TABLE `phppos_store_accounts_paid_sales`
  ADD CONSTRAINT `phppos_store_accounts_sales_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`),
  ADD CONSTRAINT `phppos_store_accounts_sales_ibfk_2` FOREIGN KEY (`store_account_payment_sale_id`) REFERENCES `phppos_sales` (`sale_id`);

--
-- Constraints for table `phppos_suppliers`
--
ALTER TABLE `phppos_suppliers`
  ADD CONSTRAINT `phppos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_people` (`person_id`),
  ADD CONSTRAINT `phppos_suppliers_ibfk_2` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`);

--
-- Constraints for table `phppos_suppliers_taxes`
--
ALTER TABLE `phppos_suppliers_taxes`
  ADD CONSTRAINT `phppos_suppliers_taxes_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `phppos_suppliers` (`person_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_supplier_brands`
--
ALTER TABLE `phppos_supplier_brands`
  ADD CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `phppos_suppliers` (`person_id`);

--
-- Constraints for table `phppos_supplier_store_accounts`
--
ALTER TABLE `phppos_supplier_store_accounts`
  ADD CONSTRAINT `phppos_supplier_store_accounts_ibfk_1` FOREIGN KEY (`receiving_id`) REFERENCES `phppos_receivings` (`receiving_id`),
  ADD CONSTRAINT `phppos_supplier_store_accounts_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `phppos_suppliers` (`person_id`);

--
-- Constraints for table `phppos_supplier_store_accounts_paid_receivings`
--
ALTER TABLE `phppos_supplier_store_accounts_paid_receivings`
  ADD CONSTRAINT `phppos_supplier_store_accounts_paid_receivings_ibfk_1` FOREIGN KEY (`receiving_id`) REFERENCES `phppos_receivings` (`receiving_id`),
  ADD CONSTRAINT `phppos_supplier_store_accounts_paid_receivings_ibfk_2` FOREIGN KEY (`store_account_payment_receiving_id`) REFERENCES `phppos_receivings` (`receiving_id`);

--
-- Constraints for table `phppos_tax_classes`
--
ALTER TABLE `phppos_tax_classes`
  ADD CONSTRAINT `phppos_tax_classes_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_tax_classes_taxes`
--
ALTER TABLE `phppos_tax_classes_taxes`
  ADD CONSTRAINT `phppos_tax_classes_taxes_ibfk_1` FOREIGN KEY (`tax_class_id`) REFERENCES `phppos_tax_classes` (`id`);

--
-- Constraints for table `phppos_zips`
--
ALTER TABLE `phppos_zips`
  ADD CONSTRAINT `phppos_zips_ibfk_1` FOREIGN KEY (`shipping_zone_id`) REFERENCES `phppos_shipping_zones` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
