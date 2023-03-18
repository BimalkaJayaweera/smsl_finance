/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50731
Source Host           : localhost:3306
Source Database       : smsl_finance_sqm

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2023-03-19 02:47:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `acc_account_types`
-- ----------------------------
DROP TABLE IF EXISTS `acc_account_types`;
CREATE TABLE `acc_account_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_account_types
-- ----------------------------
INSERT INTO `acc_account_types` VALUES ('1', 'Fixed Deposits Account');
INSERT INTO `acc_account_types` VALUES ('2', 'Checking Account');
INSERT INTO `acc_account_types` VALUES ('3', 'Savings Account');
INSERT INTO `acc_account_types` VALUES ('4', 'Other');

-- ----------------------------
-- Table structure for `acc_bank_account`
-- ----------------------------
DROP TABLE IF EXISTS `acc_bank_account`;
CREATE TABLE `acc_bank_account` (
  `account_id` int(4) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) NOT NULL,
  `account_code` varchar(20) DEFAULT NULL,
  `credit_limit` double DEFAULT NULL,
  `account_status` char(1) DEFAULT NULL,
  `business_id` int(4) DEFAULT NULL,
  `account_type_id` int(11) NOT NULL,
  `last_reconcil` date DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `business_id` (`business_id`),
  CONSTRAINT `acc_bank_account_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `acc_business` (`business_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_bank_account
-- ----------------------------
INSERT INTO `acc_bank_account` VALUES ('1', 'BOC-8065', 'B8065', '70000', '1', '1', '0', '2019-03-30');
INSERT INTO `acc_bank_account` VALUES ('2', 'NTB-253625', 'N25', '80000', '1', '1', '0', '0000-00-00');

-- ----------------------------
-- Table structure for `acc_business`
-- ----------------------------
DROP TABLE IF EXISTS `acc_business`;
CREATE TABLE `acc_business` (
  `business_id` int(4) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `PMS_project_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_business
-- ----------------------------
INSERT INTO `acc_business` VALUES ('1', 'DSI Site Maharagama', '1', '5');
INSERT INTO `acc_business` VALUES ('2', 'Building Complex - Nugegoda', '1', '7');
INSERT INTO `acc_business` VALUES ('3', 'Company', '1', '15');
INSERT INTO `acc_business` VALUES ('4', 'Galle Site', '1', '18');
INSERT INTO `acc_business` VALUES ('5', 'Matara Site', '1', '25');
INSERT INTO `acc_business` VALUES ('6', 'Kohuwala Site', '1', '30');

-- ----------------------------
-- Table structure for `acc_business_duration`
-- ----------------------------
DROP TABLE IF EXISTS `acc_business_duration`;
CREATE TABLE `acc_business_duration` (
  `duration_id` int(4) NOT NULL AUTO_INCREMENT,
  `business_from` date NOT NULL,
  `business_to` date NOT NULL,
  `business_id` int(4) DEFAULT NULL,
  `duration_status` int(1) NOT NULL,
  PRIMARY KEY (`duration_id`),
  KEY `business_id` (`business_id`),
  CONSTRAINT `acc_business_duration_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `acc_business` (`business_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_business_duration
-- ----------------------------
INSERT INTO `acc_business_duration` VALUES ('1', '2018-04-01', '2019-03-31', '1', '1');

-- ----------------------------
-- Table structure for `acc_cash_account`
-- ----------------------------
DROP TABLE IF EXISTS `acc_cash_account`;
CREATE TABLE `acc_cash_account` (
  `account_id` int(4) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) NOT NULL,
  `account_code` varchar(20) DEFAULT NULL,
  `account_status` char(1) DEFAULT NULL,
  `business_id` int(4) DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `fkbusiness_id` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_cash_account
-- ----------------------------
INSERT INTO `acc_cash_account` VALUES ('1', 'My Cash Acc', 'CSH001', '1', '1', '0');
INSERT INTO `acc_cash_account` VALUES ('2', 'My Cash Ac2', 'CSH002', '1', '1', '0');

-- ----------------------------
-- Table structure for `acc_entry_detail`
-- ----------------------------
DROP TABLE IF EXISTS `acc_entry_detail`;
CREATE TABLE `acc_entry_detail` (
  `entry_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `char_of_acc_id` int(4) NOT NULL,
  `entry_amount` double NOT NULL,
  `dr_cr` char(1) NOT NULL,
  `reconcilation_date` date DEFAULT NULL,
  `entry_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`entry_detail_id`),
  KEY `char_of_acc_id` (`char_of_acc_id`),
  KEY `fk_entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_entry_detail
-- ----------------------------
INSERT INTO `acc_entry_detail` VALUES ('1', '27', '100000', 'D', null, '1');
INSERT INTO `acc_entry_detail` VALUES ('2', '97', '100000', 'C', null, '1');
INSERT INTO `acc_entry_detail` VALUES ('3', '26', '1000', 'D', null, '2');
INSERT INTO `acc_entry_detail` VALUES ('4', '29', '1000', 'C', null, '2');
INSERT INTO `acc_entry_detail` VALUES ('5', '25', '1000', 'D', null, '3');
INSERT INTO `acc_entry_detail` VALUES ('6', '28', '1000', 'C', null, '3');
INSERT INTO `acc_entry_detail` VALUES ('7', '26', '200', 'C', null, '4');
INSERT INTO `acc_entry_detail` VALUES ('8', '11', '200', 'D', null, '4');
INSERT INTO `acc_entry_detail` VALUES ('9', '11', '2000', 'C', null, '5');
INSERT INTO `acc_entry_detail` VALUES ('10', '11', '1000', 'D', null, '6');
INSERT INTO `acc_entry_detail` VALUES ('11', '12', '1000', 'C', null, '6');

-- ----------------------------
-- Table structure for `acc_entry_detail_copy`
-- ----------------------------
DROP TABLE IF EXISTS `acc_entry_detail_copy`;
CREATE TABLE `acc_entry_detail_copy` (
  `entry_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `char_of_acc_id` int(4) NOT NULL,
  `entry_amount` double NOT NULL,
  `dr_cr` char(1) NOT NULL,
  `reconcilation_date` date DEFAULT NULL,
  `entry_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`entry_detail_id`),
  KEY `char_of_acc_id` (`char_of_acc_id`),
  KEY `fk_entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_entry_detail_copy
-- ----------------------------
INSERT INTO `acc_entry_detail_copy` VALUES ('94', '44', '12000000', 'D', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('95', '45', '9000000', 'D', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('96', '47', '30000000', 'D', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('97', '46', '7000000', 'D', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('98', '35', '10000000', 'D', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('99', '36', '12000000', 'D', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('100', '26', '8000000', 'D', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('101', '25', '80000', 'D', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('102', '61', '78694000', 'C', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('103', '62', '9386000', 'C', null, '46');
INSERT INTO `acc_entry_detail_copy` VALUES ('143', '26', '150000', 'C', null, '65');
INSERT INTO `acc_entry_detail_copy` VALUES ('144', '35', '150000', 'D', null, '65');
INSERT INTO `acc_entry_detail_copy` VALUES ('145', '26', '8000', 'D', null, '66');
INSERT INTO `acc_entry_detail_copy` VALUES ('146', '56', '5000', 'C', null, '66');
INSERT INTO `acc_entry_detail_copy` VALUES ('147', '39', '1000', 'C', null, '66');
INSERT INTO `acc_entry_detail_copy` VALUES ('148', '38', '2000', 'C', null, '66');
INSERT INTO `acc_entry_detail_copy` VALUES ('149', '26', '15000', 'D', null, '67');
INSERT INTO `acc_entry_detail_copy` VALUES ('150', '39', '15000', 'C', null, '67');
INSERT INTO `acc_entry_detail_copy` VALUES ('151', '26', '15000', 'D', null, '68');
INSERT INTO `acc_entry_detail_copy` VALUES ('152', '55', '15000', 'C', null, '68');
INSERT INTO `acc_entry_detail_copy` VALUES ('153', '26', '15000', 'D', null, '69');
INSERT INTO `acc_entry_detail_copy` VALUES ('154', '32', '15000', 'C', null, '69');
INSERT INTO `acc_entry_detail_copy` VALUES ('155', '26', '15000', 'D', null, '70');
INSERT INTO `acc_entry_detail_copy` VALUES ('156', '55', '15000', 'C', null, '70');
INSERT INTO `acc_entry_detail_copy` VALUES ('157', '26', '17000', 'D', null, '71');
INSERT INTO `acc_entry_detail_copy` VALUES ('158', '55', '15000', 'C', null, '71');
INSERT INTO `acc_entry_detail_copy` VALUES ('159', '39', '2000', 'C', null, '71');
INSERT INTO `acc_entry_detail_copy` VALUES ('160', '26', '15000', 'D', null, '72');
INSERT INTO `acc_entry_detail_copy` VALUES ('161', '56', '15000', 'C', null, '72');
INSERT INTO `acc_entry_detail_copy` VALUES ('162', '26', '25000', 'C', null, '73');
INSERT INTO `acc_entry_detail_copy` VALUES ('163', '1', '15000', 'D', null, '73');
INSERT INTO `acc_entry_detail_copy` VALUES ('164', '10', '10000', 'D', null, '73');
INSERT INTO `acc_entry_detail_copy` VALUES ('165', '26', '25000', 'C', null, '74');
INSERT INTO `acc_entry_detail_copy` VALUES ('166', '1', '15000', 'D', null, '74');
INSERT INTO `acc_entry_detail_copy` VALUES ('167', '10', '10000', 'D', null, '74');
INSERT INTO `acc_entry_detail_copy` VALUES ('168', '26', '5000', 'C', null, '75');
INSERT INTO `acc_entry_detail_copy` VALUES ('169', '10', '5000', 'D', null, '75');
INSERT INTO `acc_entry_detail_copy` VALUES ('170', '26', '5000', 'C', null, '76');
INSERT INTO `acc_entry_detail_copy` VALUES ('171', '10', '5000', 'D', null, '76');
INSERT INTO `acc_entry_detail_copy` VALUES ('172', '26', '5000', 'C', null, '77');
INSERT INTO `acc_entry_detail_copy` VALUES ('173', '10', '5000', 'D', null, '77');
INSERT INTO `acc_entry_detail_copy` VALUES ('174', '26', '10000', 'C', null, '78');
INSERT INTO `acc_entry_detail_copy` VALUES ('175', '10', '10000', 'D', null, '78');
INSERT INTO `acc_entry_detail_copy` VALUES ('176', '26', '40000', 'C', null, '79');
INSERT INTO `acc_entry_detail_copy` VALUES ('177', '1', '40000', 'D', null, '79');
INSERT INTO `acc_entry_detail_copy` VALUES ('178', '26', '5000', 'C', null, '80');
INSERT INTO `acc_entry_detail_copy` VALUES ('179', '1', '5000', 'D', null, '80');
INSERT INTO `acc_entry_detail_copy` VALUES ('180', '1', '86', 'C', null, '81');
INSERT INTO `acc_entry_detail_copy` VALUES ('181', '1', '847', 'C', null, '82');
INSERT INTO `acc_entry_detail_copy` VALUES ('182', '10', '10', 'D', null, '83');
INSERT INTO `acc_entry_detail_copy` VALUES ('183', '9', '4787878444', 'D', null, '84');
INSERT INTO `acc_entry_detail_copy` VALUES ('184', '10', '5465656767', 'D', null, '85');
INSERT INTO `acc_entry_detail_copy` VALUES ('185', '9', '546565.5', 'D', null, '86');
INSERT INTO `acc_entry_detail_copy` VALUES ('186', '9', '126565.5', 'D', null, '87');
INSERT INTO `acc_entry_detail_copy` VALUES ('187', '1', '50000.4', 'C', null, '88');
INSERT INTO `acc_entry_detail_copy` VALUES ('188', '9', '23908.5', 'D', null, '88');
INSERT INTO `acc_entry_detail_copy` VALUES ('189', '10', '10000000', 'C', null, '89');
INSERT INTO `acc_entry_detail_copy` VALUES ('190', '1', '23908.5', 'D', null, '89');
INSERT INTO `acc_entry_detail_copy` VALUES ('191', '10', '5657567', 'D', null, '90');
INSERT INTO `acc_entry_detail_copy` VALUES ('192', '9', '12983.5', 'C', null, '90');

-- ----------------------------
-- Table structure for `acc_entry_main`
-- ----------------------------
DROP TABLE IF EXISTS `acc_entry_main`;
CREATE TABLE `acc_entry_main` (
  `entry_id` int(4) NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(50) DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `dr_total` double DEFAULT NULL,
  `cr_total` double DEFAULT NULL,
  `narration` varchar(150) DEFAULT NULL,
  `business_id` int(4) DEFAULT NULL,
  `entry_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_entry_main
-- ----------------------------
INSERT INTO `acc_entry_main` VALUES ('2', '1', '2021-03-05', '1000', '1000', 'testing', '1', 'RPT-1');
INSERT INTO `acc_entry_main` VALUES ('3', '1', '2021-03-05', '1000', '1000', 'testing', '1', 'RPT-2');
INSERT INTO `acc_entry_main` VALUES ('4', '1', '2021-03-05', '200', '200', 'test', '1', 'PMT-1');
INSERT INTO `acc_entry_main` VALUES ('6', '123', '2022-12-26', '1000', '1000', 'test', '1', 'JE-2');

-- ----------------------------
-- Table structure for `acc_entry_main_copy`
-- ----------------------------
DROP TABLE IF EXISTS `acc_entry_main_copy`;
CREATE TABLE `acc_entry_main_copy` (
  `entry_id` int(4) NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(50) DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `dr_total` double DEFAULT NULL,
  `cr_total` double DEFAULT NULL,
  `narration` varchar(150) DEFAULT NULL,
  `business_id` int(4) DEFAULT NULL,
  `entry_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_entry_main_copy
-- ----------------------------
INSERT INTO `acc_entry_main_copy` VALUES ('46', '', '2019-04-30', '88080000', '88080000', 'Being recording of opening balances', '3', 'JE-8');
INSERT INTO `acc_entry_main_copy` VALUES ('65', '', '2019-05-02', '150000', '150000', '', '2', 'PMT-10');
INSERT INTO `acc_entry_main_copy` VALUES ('66', '456546', '2019-05-02', '8000', '8000', 'ghgj', '1', 'RPT-1');
INSERT INTO `acc_entry_main_copy` VALUES ('67', '', '2019-04-29', '15000', '15000', '', '1', 'RPT-5');
INSERT INTO `acc_entry_main_copy` VALUES ('68', '', '2019-04-29', '15000', '15000', '', '2', 'RPT-6');
INSERT INTO `acc_entry_main_copy` VALUES ('69', '', '2019-04-03', '15000', '15000', '', '1', 'RPT-7');
INSERT INTO `acc_entry_main_copy` VALUES ('70', '', '2019-05-06', '15000', '15000', '', '1', 'RPT-8');
INSERT INTO `acc_entry_main_copy` VALUES ('71', '', '2019-04-29', '17000', '17000', '', '1', 'RPT-9');
INSERT INTO `acc_entry_main_copy` VALUES ('72', '34535', '2019-05-02', '15000', '15000', 'fhgf', '1', 'RPT-10');
INSERT INTO `acc_entry_main_copy` VALUES ('73', 'pmt1', '2019-05-17', '25000', '25000', 'test', '1', 'PMT-11');
INSERT INTO `acc_entry_main_copy` VALUES ('74', 'pmt1', '2019-05-17', '25000', '25000', 'test', '1', 'PMT-12');
INSERT INTO `acc_entry_main_copy` VALUES ('75', '', '2019-05-17', '5000', '5000', '', '1', 'PMT-13');
INSERT INTO `acc_entry_main_copy` VALUES ('76', '', '2019-05-17', '5000', '5000', '', '1', 'PMT-14');
INSERT INTO `acc_entry_main_copy` VALUES ('77', '', '2019-05-17', '5000', '5000', '', '1', 'PMT-15');
INSERT INTO `acc_entry_main_copy` VALUES ('78', '', '2019-05-17', '10000', '10000', '', '1', 'PMT-16');
INSERT INTO `acc_entry_main_copy` VALUES ('79', '', '2019-05-17', '40000', '40000', '', '1', 'PMT-17');
INSERT INTO `acc_entry_main_copy` VALUES ('80', '', '2019-05-17', '5000', '5000', '', '1', 'PMT-18');
INSERT INTO `acc_entry_main_copy` VALUES ('81', '4656', '2019-05-21', '0', '86867575', '', '2', 'JE-10');
INSERT INTO `acc_entry_main_copy` VALUES ('82', '4656', '2019-05-20', '0', '847548764', '', '3', 'JE-13');
INSERT INTO `acc_entry_main_copy` VALUES ('83', '', '2019-05-30', '10000000', '0', '', '3', 'JE-14');
INSERT INTO `acc_entry_main_copy` VALUES ('84', '', '2019-05-21', '4787878444', '0', '', '2', 'JE-15');
INSERT INTO `acc_entry_main_copy` VALUES ('85', '4656', '2019-05-23', '5465656767', '0', '', null, 'JE-16');
INSERT INTO `acc_entry_main_copy` VALUES ('86', '4656', '2019-05-23', '546565.5', '0', '', '3', 'JE-17');
INSERT INTO `acc_entry_main_copy` VALUES ('87', '4656', '2019-05-23', '126565.5', '0', '', '3', 'JE-18');
INSERT INTO `acc_entry_main_copy` VALUES ('88', '4656', '2019-05-30', '23908.5', '50000.4', '', '2', 'JE-19');
INSERT INTO `acc_entry_main_copy` VALUES ('89', '4656', '2019-05-29', '23908.5', '10000000', '', '2', 'JE-20');
INSERT INTO `acc_entry_main_copy` VALUES ('90', '4656', '2019-05-29', '5657567', '12983.5', '', '2', 'JE-21');

-- ----------------------------
-- Table structure for `acc_journal_detail`
-- ----------------------------
DROP TABLE IF EXISTS `acc_journal_detail`;
CREATE TABLE `acc_journal_detail` (
  `journal_detail_id` int(4) NOT NULL AUTO_INCREMENT,
  `chart_of_acc_id` int(4) NOT NULL,
  `journal_detail_desc` varchar(150) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `line_total` double(10,2) NOT NULL,
  `journal_main_id` int(4) DEFAULT NULL,
  `dr_or_cr` char(2) DEFAULT NULL,
  PRIMARY KEY (`journal_detail_id`),
  KEY `chart_of_acc_id` (`chart_of_acc_id`),
  KEY `acc_receipt_detail_ibfk_2` (`journal_main_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_journal_detail
-- ----------------------------
INSERT INTO `acc_journal_detail` VALUES ('1', '11', 'test', null, null, '2000.00', '1', 'C');
INSERT INTO `acc_journal_detail` VALUES ('2', '11', 'test', null, null, '1000.00', '2', 'D');
INSERT INTO `acc_journal_detail` VALUES ('3', '12', '', null, null, '1000.00', '2', 'C');

-- ----------------------------
-- Table structure for `acc_journal_main`
-- ----------------------------
DROP TABLE IF EXISTS `acc_journal_main`;
CREATE TABLE `acc_journal_main` (
  `journal_id` int(4) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `tot_journal_amount` double(10,2) DEFAULT NULL,
  `tot_journal_cr` double(10,2) DEFAULT NULL,
  `tot_journal_dr` double(10,2) DEFAULT NULL,
  `added_by` varchar(50) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `business_id` int(4) DEFAULT NULL,
  `business_duration_id` int(4) DEFAULT NULL,
  `journal_date` date DEFAULT NULL,
  PRIMARY KEY (`journal_id`),
  KEY `acc_receipt_main_ibfk_1` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_journal_main
-- ----------------------------
INSERT INTO `acc_journal_main` VALUES ('2', '123', 'test', '2000.00', '1000.00', '1000.00', null, '2022-12-26 12:10:33', '1', null, '2022-12-26');

-- ----------------------------
-- Table structure for `acc_payer_payee_details`
-- ----------------------------
DROP TABLE IF EXISTS `acc_payer_payee_details`;
CREATE TABLE `acc_payer_payee_details` (
  `payee_id` int(4) NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(150) NOT NULL,
  `payer_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_payer_payee_details
-- ----------------------------
INSERT INTO `acc_payer_payee_details` VALUES ('1', 'Sasnka Chameera', '1');

-- ----------------------------
-- Table structure for `acc_payment_detail`
-- ----------------------------
DROP TABLE IF EXISTS `acc_payment_detail`;
CREATE TABLE `acc_payment_detail` (
  `pmt_detail_id` int(4) NOT NULL AUTO_INCREMENT,
  `chart_of_acc_id` int(4) NOT NULL,
  `pmt_detail_desc` varchar(150) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `line_total` double NOT NULL,
  `pmt_main_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`pmt_detail_id`),
  KEY `chart_of_acc_id` (`chart_of_acc_id`),
  KEY `acc_receipt_detail_ibfk_2` (`pmt_main_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_payment_detail
-- ----------------------------
INSERT INTO `acc_payment_detail` VALUES ('1', '11', 'test', null, null, '200', '1');

-- ----------------------------
-- Table structure for `acc_payment_main`
-- ----------------------------
DROP TABLE IF EXISTS `acc_payment_main`;
CREATE TABLE `acc_payment_main` (
  `pmt_id` int(4) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) DEFAULT NULL,
  `po_reference` varchar(50) DEFAULT NULL,
  `account_id` int(4) DEFAULT NULL,
  `payee_name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `tot_payment_amount` double DEFAULT NULL,
  `added_by` varchar(50) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `business_duration_id` int(4) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `reconciled` int(1) NOT NULL,
  PRIMARY KEY (`pmt_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_payment_main
-- ----------------------------
INSERT INTO `acc_payment_main` VALUES ('1', '1', null, null, 'bimalka', 'test', '200', null, '2021-03-05 20:20:22', null, '2021-03-05', '0');

-- ----------------------------
-- Table structure for `acc_payment_projects`
-- ----------------------------
DROP TABLE IF EXISTS `acc_payment_projects`;
CREATE TABLE `acc_payment_projects` (
  `pay_proj_id` int(4) NOT NULL AUTO_INCREMENT,
  `business_id` int(4) DEFAULT NULL,
  `paid_amount` double NOT NULL,
  `pay_main_id` int(4) NOT NULL,
  PRIMARY KEY (`pay_proj_id`),
  KEY `business_id` (`business_id`),
  KEY `pay_main_id` (`pay_main_id`),
  CONSTRAINT `acc_payment_projects_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `acc_business` (`business_id`),
  CONSTRAINT `acc_payment_projects_ibfk_2` FOREIGN KEY (`pay_main_id`) REFERENCES `acc_payment_main` (`pmt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_payment_projects
-- ----------------------------
INSERT INTO `acc_payment_projects` VALUES ('1', '1', '200', '1');

-- ----------------------------
-- Table structure for `acc_post_dated_cheque`
-- ----------------------------
DROP TABLE IF EXISTS `acc_post_dated_cheque`;
CREATE TABLE `acc_post_dated_cheque` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `cheque_no` varchar(20) NOT NULL,
  `cheque_date` date NOT NULL,
  `received_date` date DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `chq_description` varchar(250) DEFAULT NULL,
  `business_id` int(4) DEFAULT NULL,
  `chq_status` varchar(20) DEFAULT NULL,
  `chq_amount` double DEFAULT NULL,
  `paid_chq_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_post_dated_cheque
-- ----------------------------
INSERT INTO `acc_post_dated_cheque` VALUES ('1', null, '2', '2021-03-05', '2021-03-04', 'bimalka', 'test', '1', 'Not Paid', '200', null);

-- ----------------------------
-- Table structure for `acc_receipt_detail`
-- ----------------------------
DROP TABLE IF EXISTS `acc_receipt_detail`;
CREATE TABLE `acc_receipt_detail` (
  `rpt_detail_id` int(4) NOT NULL AUTO_INCREMENT,
  `chart_of_acc_id` int(4) NOT NULL,
  `rpt_detail_desc` varchar(150) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `line_total` double NOT NULL,
  `rpt_main_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`rpt_detail_id`),
  KEY `chart_of_acc_id` (`chart_of_acc_id`),
  KEY `acc_receipt_detail_ibfk_2` (`rpt_main_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_receipt_detail
-- ----------------------------
INSERT INTO `acc_receipt_detail` VALUES ('1', '29', 'test', null, null, '1000', '1');
INSERT INTO `acc_receipt_detail` VALUES ('2', '28', 'test', null, null, '1000', '2');

-- ----------------------------
-- Table structure for `acc_receipt_main`
-- ----------------------------
DROP TABLE IF EXISTS `acc_receipt_main`;
CREATE TABLE `acc_receipt_main` (
  `rpt_id` int(4) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) DEFAULT NULL,
  `account_id` int(4) DEFAULT NULL,
  `payer_name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `tot_receipt_amount` double DEFAULT NULL,
  `added_by` varchar(50) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `business_id` int(4) DEFAULT NULL,
  `business_duration_id` int(4) DEFAULT NULL,
  `receipt_date` date DEFAULT NULL,
  `receipt_type` varchar(10) DEFAULT NULL,
  `reconciled` int(1) NOT NULL,
  `invoice_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`rpt_id`),
  KEY `account_id` (`account_id`),
  KEY `acc_receipt_main_ibfk_1` (`business_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_receipt_main
-- ----------------------------
INSERT INTO `acc_receipt_main` VALUES ('1', '1', '1', 'bimalka', 'testing', '1000', null, '2021-03-05 20:15:46', '1', null, '2021-03-05', 'bank', '0', null);
INSERT INTO `acc_receipt_main` VALUES ('2', '1', '1', 'bimalka', 'testing', '1000', null, '2021-03-05 20:19:04', '1', null, '2021-03-05', 'cash', '0', null);

-- ----------------------------
-- Table structure for `acc_sub_contractor`
-- ----------------------------
DROP TABLE IF EXISTS `acc_sub_contractor`;
CREATE TABLE `acc_sub_contractor` (
  `Sub_Contractor_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sub_Contractor_Code` int(11) NOT NULL,
  `Sub_Contractor_Name` varchar(100) NOT NULL,
  `Sub_Contractor_Address` varchar(200) NOT NULL,
  `Land_Phone_No` varchar(12) DEFAULT NULL,
  `Mobile` varchar(12) DEFAULT NULL,
  `Fax` varchar(12) DEFAULT NULL,
  `add_by` varchar(50) NOT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_by` varchar(50) NOT NULL,
  `edit_date` datetime DEFAULT NULL,
  `SubCon_Type` int(11) DEFAULT NULL,
  `NBT` int(3) DEFAULT NULL,
  `Is_VAT_Registered` tinyint(1) DEFAULT NULL,
  `Registation_No` varchar(50) DEFAULT NULL,
  `VAT_For_Transport` tinyint(1) DEFAULT NULL,
  `Attn_Person` varchar(100) NOT NULL,
  PRIMARY KEY (`Sub_Contractor_Id`),
  UNIQUE KEY `Sub_Contractor_Code` (`Sub_Contractor_Code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16301 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_sub_contractor
-- ----------------------------

-- ----------------------------
-- Table structure for `api_worker`
-- ----------------------------
DROP TABLE IF EXISTS `api_worker`;
CREATE TABLE `api_worker` (
  `id` int(11) NOT NULL,
  `base_url` varchar(255) NOT NULL,
  `api_username` varchar(50) DEFAULT NULL,
  `api_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of api_worker
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('ACC', '61', '1555915107');
INSERT INTO `auth_assignment` VALUES ('Admin', '6', '1532724772');

-- ----------------------------
-- Table structure for `auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  KEY `fk_auth_item_group_code` (`group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/acc-entry-main/*', '3', null, null, null, '1555914482', '1555914482', null);
INSERT INTO `auth_item` VALUES ('/acc-entry-main/create', '3', null, null, null, '1555914483', '1555914483', null);
INSERT INTO `auth_item` VALUES ('/acc-entry-main/delete', '3', null, null, null, '1555914482', '1555914482', null);
INSERT INTO `auth_item` VALUES ('/acc-entry-main/index', '3', null, null, null, '1555914483', '1555914483', null);
INSERT INTO `auth_item` VALUES ('/acc-entry-main/update', '3', null, null, null, '1555914483', '1555914483', null);
INSERT INTO `auth_item` VALUES ('/acc-entry-main/view', '3', null, null, null, '1555914483', '1555914483', null);
INSERT INTO `auth_item` VALUES ('/accbankaccount/*', '3', null, null, null, '1555914482', '1555914482', null);
INSERT INTO `auth_item` VALUES ('/accbankaccount/create', '3', null, null, null, '1555914482', '1555914482', null);
INSERT INTO `auth_item` VALUES ('/accbankaccount/delete', '3', null, null, null, '1555914482', '1555914482', null);
INSERT INTO `auth_item` VALUES ('/accbankaccount/index', '3', null, null, null, '1555914482', '1555914482', null);
INSERT INTO `auth_item` VALUES ('/accbankaccount/update', '3', null, null, null, '1555914482', '1555914482', null);
INSERT INTO `auth_item` VALUES ('/accbankaccount/view', '3', null, null, null, '1555914482', '1555914482', null);
INSERT INTO `auth_item` VALUES ('/accbusiness/*', '3', null, null, null, '1555914481', '1555914481', null);
INSERT INTO `auth_item` VALUES ('/accbusiness/create', '3', null, null, null, '1555914481', '1555914481', null);
INSERT INTO `auth_item` VALUES ('/accbusiness/delete', '3', null, null, null, '1555914481', '1555914481', null);
INSERT INTO `auth_item` VALUES ('/accbusiness/index', '3', null, null, null, '1555914482', '1555914482', null);
INSERT INTO `auth_item` VALUES ('/accbusiness/update', '3', null, null, null, '1555914481', '1555914481', null);
INSERT INTO `auth_item` VALUES ('/accbusiness/view', '3', null, null, null, '1555914481', '1555914481', null);
INSERT INTO `auth_item` VALUES ('/accbusinessduration/*', '3', null, null, null, '1555914480', '1555914480', null);
INSERT INTO `auth_item` VALUES ('/accbusinessduration/create', '3', null, null, null, '1555914480', '1555914480', null);
INSERT INTO `auth_item` VALUES ('/accbusinessduration/delete', '3', null, null, null, '1555914480', '1555914480', null);
INSERT INTO `auth_item` VALUES ('/accbusinessduration/index', '3', null, null, null, '1555914481', '1555914481', null);
INSERT INTO `auth_item` VALUES ('/accbusinessduration/update', '3', null, null, null, '1555914480', '1555914480', null);
INSERT INTO `auth_item` VALUES ('/accbusinessduration/view', '3', null, null, null, '1555914481', '1555914481', null);
INSERT INTO `auth_item` VALUES ('/acccashaccount/*', '3', null, null, null, '1555914479', '1555914479', null);
INSERT INTO `auth_item` VALUES ('/acccashaccount/create', '3', null, null, null, '1555914480', '1555914480', null);
INSERT INTO `auth_item` VALUES ('/acccashaccount/delete', '3', null, null, null, '1555914479', '1555914479', null);
INSERT INTO `auth_item` VALUES ('/acccashaccount/index', '3', null, null, null, '1555914480', '1555914480', null);
INSERT INTO `auth_item` VALUES ('/acccashaccount/update', '3', null, null, null, '1555914480', '1555914480', null);
INSERT INTO `auth_item` VALUES ('/acccashaccount/view', '3', null, null, null, '1555914480', '1555914480', null);
INSERT INTO `auth_item` VALUES ('/accentrydetail/*', '3', null, null, null, '1555914479', '1555914479', null);
INSERT INTO `auth_item` VALUES ('/accentrydetail/create', '3', null, null, null, '1555914479', '1555914479', null);
INSERT INTO `auth_item` VALUES ('/accentrydetail/delete', '3', null, null, null, '1555914479', '1555914479', null);
INSERT INTO `auth_item` VALUES ('/accentrydetail/index', '3', null, null, null, '1555914479', '1555914479', null);
INSERT INTO `auth_item` VALUES ('/accentrydetail/update', '3', null, null, null, '1555914479', '1555914479', null);
INSERT INTO `auth_item` VALUES ('/accentrydetail/view', '3', null, null, null, '1555914479', '1555914479', null);
INSERT INTO `auth_item` VALUES ('/accpaymentdetail/*', '3', null, null, null, '1555914478', '1555914478', null);
INSERT INTO `auth_item` VALUES ('/accpaymentdetail/create', '3', null, null, null, '1555914478', '1555914478', null);
INSERT INTO `auth_item` VALUES ('/accpaymentdetail/delete', '3', null, null, null, '1555914478', '1555914478', null);
INSERT INTO `auth_item` VALUES ('/accpaymentdetail/index', '3', null, null, null, '1555914479', '1555914479', null);
INSERT INTO `auth_item` VALUES ('/accpaymentdetail/update', '3', null, null, null, '1555914478', '1555914478', null);
INSERT INTO `auth_item` VALUES ('/accpaymentdetail/view', '3', null, null, null, '1555914478', '1555914478', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/*', '3', null, null, null, '1555914476', '1555914476', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/create', '3', null, null, null, '1555914477', '1555914477', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/creditor-details-summary', '3', null, null, null, '1555914477', '1555914477', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/creditor-details-summary-pdf', '3', null, null, null, '1555914476', '1555914476', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/delete', '3', null, null, null, '1555914477', '1555914477', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/index', '3', null, null, null, '1555914478', '1555914478', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/payable-to-creditors', '3', null, null, null, '1555914477', '1555914477', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/payable-to-creditors-pdf', '3', null, null, null, '1555914477', '1555914477', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/payslip', '3', null, null, null, '1555914477', '1555914477', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/select-subcontractor', '3', null, null, null, '1555914477', '1555914477', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/update', '3', null, null, null, '1555914477', '1555914477', null);
INSERT INTO `auth_item` VALUES ('/accpaymentmain/view', '3', null, null, null, '1555914477', '1555914477', null);
INSERT INTO `auth_item` VALUES ('/accreceiptdetail/*', '3', null, null, null, '1555914475', '1555914475', null);
INSERT INTO `auth_item` VALUES ('/accreceiptdetail/create', '3', null, null, null, '1555914476', '1555914476', null);
INSERT INTO `auth_item` VALUES ('/accreceiptdetail/delete', '3', null, null, null, '1555914476', '1555914476', null);
INSERT INTO `auth_item` VALUES ('/accreceiptdetail/index', '3', null, null, null, '1555914476', '1555914476', null);
INSERT INTO `auth_item` VALUES ('/accreceiptdetail/update', '3', null, null, null, '1555914476', '1555914476', null);
INSERT INTO `auth_item` VALUES ('/accreceiptdetail/view', '3', null, null, null, '1555914476', '1555914476', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/*', '3', null, null, null, '1555914473', '1555914473', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/bank-reconcilation', '3', null, null, null, '1555914473', '1555914473', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/business-list', '3', null, null, null, '1555914475', '1555914475', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/create', '3', null, null, null, '1555914475', '1555914475', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/delete', '3', null, null, null, '1555914475', '1555914475', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/get-amount', '3', null, null, null, '1555914473', '1555914473', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/index', '3', null, null, null, '1555914475', '1555914475', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/invoice', '3', null, null, null, '1555914474', '1555914474', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/load-accounts', '3', null, null, null, '1555914475', '1555914475', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/receipt-pdf', '3', null, null, null, '1555914474', '1555914474', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/receivable-from-debtors', '3', null, null, null, '1555914474', '1555914474', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/receivable-from-debtors-pdf', '3', null, null, null, '1555914474', '1555914474', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/select-amount', '3', null, null, null, '1555914473', '1555914473', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/select-subcontractor', '3', null, null, null, '1555914474', '1555914474', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/trial-balance', '3', null, null, null, '1555914474', '1555914474', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/trial-balance-pdf', '3', null, null, null, '1555914474', '1555914474', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/update', '3', null, null, null, '1555914475', '1555914475', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/verify-bankrec-data', '3', null, null, null, '1555914473', '1555914473', null);
INSERT INTO `auth_item` VALUES ('/accreceiptmain/view', '3', null, null, null, '1555914475', '1555914475', null);
INSERT INTO `auth_item` VALUES ('/actionslog/*', '3', null, null, null, '1532085548', '1532085548', null);
INSERT INTO `auth_item` VALUES ('/actionslog/create', '3', null, null, null, '1532085548', '1532085548', null);
INSERT INTO `auth_item` VALUES ('/actionslog/delete', '3', null, null, null, '1532085548', '1532085548', null);
INSERT INTO `auth_item` VALUES ('/actionslog/index', '3', null, null, null, '1532085548', '1532085548', null);
INSERT INTO `auth_item` VALUES ('/actionslog/update', '3', null, null, null, '1532085548', '1532085548', null);
INSERT INTO `auth_item` VALUES ('/actionslog/view', '3', null, null, null, '1532085548', '1532085548', null);
INSERT INTO `auth_item` VALUES ('/cagroup/*', '3', null, null, null, '1555914471', '1555914471', null);
INSERT INTO `auth_item` VALUES ('/cagroup/coa-list', '3', null, null, null, '1555914471', '1555914471', null);
INSERT INTO `auth_item` VALUES ('/cagroup/coa-list-pdf', '3', null, null, null, '1555914471', '1555914471', null);
INSERT INTO `auth_item` VALUES ('/cagroup/create', '3', null, null, null, '1555914473', '1555914473', null);
INSERT INTO `auth_item` VALUES ('/cagroup/dashboard', '3', null, null, null, '1555914472', '1555914472', null);
INSERT INTO `auth_item` VALUES ('/cagroup/delete', '3', null, null, null, '1555914472', '1555914472', null);
INSERT INTO `auth_item` VALUES ('/cagroup/general-ledger', '3', null, null, null, '1555914472', '1555914472', null);
INSERT INTO `auth_item` VALUES ('/cagroup/general-ledger-pdf', '3', null, null, null, '1555914472', '1555914472', null);
INSERT INTO `auth_item` VALUES ('/cagroup/index', '3', null, null, null, '1555914473', '1555914473', null);
INSERT INTO `auth_item` VALUES ('/cagroup/response', '3', null, null, null, '1555914472', '1555914472', null);
INSERT INTO `auth_item` VALUES ('/cagroup/update', '3', null, null, null, '1555914472', '1555914472', null);
INSERT INTO `auth_item` VALUES ('/cagroup/view', '3', null, null, null, '1555914473', '1555914473', null);
INSERT INTO `auth_item` VALUES ('/companymaster/*', '3', null, null, null, '1555914470', '1555914470', null);
INSERT INTO `auth_item` VALUES ('/companymaster/create', '3', null, null, null, '1555914471', '1555914471', null);
INSERT INTO `auth_item` VALUES ('/companymaster/delete', '3', null, null, null, '1555914471', '1555914471', null);
INSERT INTO `auth_item` VALUES ('/companymaster/index', '3', null, null, null, '1555914471', '1555914471', null);
INSERT INTO `auth_item` VALUES ('/companymaster/update', '3', null, null, null, '1555914471', '1555914471', null);
INSERT INTO `auth_item` VALUES ('/companymaster/view', '3', null, null, null, '1555914471', '1555914471', null);
INSERT INTO `auth_item` VALUES ('/debug/*', '3', null, null, null, '1532085548', '1532085548', null);
INSERT INTO `auth_item` VALUES ('/debug/default/*', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/debug/default/index', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/debug/default/view', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/debug/user/*', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/debug/user/reset-identity', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/debug/user/set-identity', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/gii/*', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/gii/default/*', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/gii/default/action', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/gii/default/index', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/gii/default/view', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/invoice/*', '3', null, null, null, '1555914469', '1555914469', null);
INSERT INTO `auth_item` VALUES ('/invoice/create', '3', null, null, null, '1555914470', '1555914470', null);
INSERT INTO `auth_item` VALUES ('/invoice/create-invoice', '3', null, null, null, '1555914470', '1555914470', null);
INSERT INTO `auth_item` VALUES ('/invoice/delete', '3', null, null, null, '1555914470', '1555914470', null);
INSERT INTO `auth_item` VALUES ('/invoice/index', '3', null, null, null, '1555914470', '1555914470', null);
INSERT INTO `auth_item` VALUES ('/invoice/invoice', '3', null, null, null, '1555914470', '1555914470', null);
INSERT INTO `auth_item` VALUES ('/invoice/overdue-invoice-summary', '3', null, null, null, '1555914469', '1555914469', null);
INSERT INTO `auth_item` VALUES ('/invoice/overdue-invoice-summary-pdf', '3', null, null, null, '1555914469', '1555914469', null);
INSERT INTO `auth_item` VALUES ('/invoice/update', '3', null, null, null, '1555914470', '1555914470', null);
INSERT INTO `auth_item` VALUES ('/invoice/view', '3', null, null, null, '1555914470', '1555914470', null);
INSERT INTO `auth_item` VALUES ('/journaldetail/*', '3', null, null, null, '1555914468', '1555914468', null);
INSERT INTO `auth_item` VALUES ('/journaldetail/create', '3', null, null, null, '1555914469', '1555914469', null);
INSERT INTO `auth_item` VALUES ('/journaldetail/delete', '3', null, null, null, '1555914468', '1555914468', null);
INSERT INTO `auth_item` VALUES ('/journaldetail/index', '3', null, null, null, '1555914469', '1555914469', null);
INSERT INTO `auth_item` VALUES ('/journaldetail/update', '3', null, null, null, '1555914468', '1555914468', null);
INSERT INTO `auth_item` VALUES ('/journaldetail/view', '3', null, null, null, '1555914469', '1555914469', null);
INSERT INTO `auth_item` VALUES ('/journalmain/*', '3', null, null, null, '1555914467', '1555914467', null);
INSERT INTO `auth_item` VALUES ('/journalmain/create', '3', null, null, null, '1555914468', '1555914468', null);
INSERT INTO `auth_item` VALUES ('/journalmain/delete', '3', null, null, null, '1555914468', '1555914468', null);
INSERT INTO `auth_item` VALUES ('/journalmain/index', '3', null, null, null, '1555914468', '1555914468', null);
INSERT INTO `auth_item` VALUES ('/journalmain/invoice', '3', null, null, null, '1555914467', '1555914467', null);
INSERT INTO `auth_item` VALUES ('/journalmain/journal', '3', null, null, null, '1555914467', '1555914467', null);
INSERT INTO `auth_item` VALUES ('/journalmain/journal-pdf', '3', null, null, null, '1555914467', '1555914467', null);
INSERT INTO `auth_item` VALUES ('/journalmain/select-subcontractor', '3', null, null, null, '1555914467', '1555914467', null);
INSERT INTO `auth_item` VALUES ('/journalmain/update', '3', null, null, null, '1555914468', '1555914468', null);
INSERT INTO `auth_item` VALUES ('/journalmain/view', '3', null, null, null, '1555914468', '1555914468', null);
INSERT INTO `auth_item` VALUES ('/postdatedcheque/*', '3', null, null, null, '1555914466', '1555914466', null);
INSERT INTO `auth_item` VALUES ('/postdatedcheque/create', '3', null, null, null, '1555914467', '1555914467', null);
INSERT INTO `auth_item` VALUES ('/postdatedcheque/delete', '3', null, null, null, '1555914466', '1555914466', null);
INSERT INTO `auth_item` VALUES ('/postdatedcheque/index', '3', null, null, null, '1555914467', '1555914467', null);
INSERT INTO `auth_item` VALUES ('/postdatedcheque/update', '3', null, null, null, '1555914467', '1555914467', null);
INSERT INTO `auth_item` VALUES ('/postdatedcheque/view', '3', null, null, null, '1555914467', '1555914467', null);
INSERT INTO `auth_item` VALUES ('/site/*', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/about', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/admin-main', '3', null, null, null, '1555914466', '1555914466', null);
INSERT INTO `auth_item` VALUES ('/site/admin-panel', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/business-list', '3', null, null, null, '1555914466', '1555914466', null);
INSERT INTO `auth_item` VALUES ('/site/captcha', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/contact', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/error', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/index', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/load-user-level-values', '3', null, null, null, '1532452178', '1532452178', null);
INSERT INTO `auth_item` VALUES ('/site/login', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/logout', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/reports', '3', null, null, null, '1532085546', '1532085546', null);
INSERT INTO `auth_item` VALUES ('/site/user-permission', '3', null, null, null, '1555914466', '1555914466', null);
INSERT INTO `auth_item` VALUES ('/subcontractor-bills/*', '3', null, null, null, '1555914465', '1555914465', null);
INSERT INTO `auth_item` VALUES ('/subcontractor-bills/create', '3', null, null, null, '1555914465', '1555914465', null);
INSERT INTO `auth_item` VALUES ('/subcontractor-bills/delete', '3', null, null, null, '1555914465', '1555914465', null);
INSERT INTO `auth_item` VALUES ('/subcontractor-bills/index', '3', null, null, null, '1555914466', '1555914466', null);
INSERT INTO `auth_item` VALUES ('/subcontractor-bills/update', '3', null, null, null, '1555914465', '1555914465', null);
INSERT INTO `auth_item` VALUES ('/subcontractor-bills/view', '3', null, null, null, '1555914466', '1555914466', null);
INSERT INTO `auth_item` VALUES ('/user-management/*', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/*', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-activate', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-deactivate', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-delete', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/create', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/delete', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-page-size', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-sort', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/index', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/toggle-attribute', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/update', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/view', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/*', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/captcha', '3', null, null, null, '1532085552', '1532085552', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/change-own-password', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email-receive', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-registration-email', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/login', '3', null, null, null, '1532085552', '1532085552', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/logout', '3', null, null, null, '1532085552', '1532085552', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery-receive', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/registration', '3', null, null, null, '1532085552', '1532085552', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/*', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-activate', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-deactivate', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-delete', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/create', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/delete', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-page-size', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-sort', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/index', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/refresh-routes', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-permissions', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-routes', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/toggle-attribute', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/update', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/permission/view', '3', null, null, null, '1532085551', '1532085551', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/*', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-activate', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-deactivate', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-delete', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/create', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/delete', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-page-size', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-sort', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/index', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-permissions', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-roles', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/toggle-attribute', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/update', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/role/view', '3', null, null, null, '1532085550', '1532085550', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/*', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set-roles', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/*', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-activate', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-deactivate', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-delete', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/create', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/delete', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-page-size', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-sort', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/index', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/toggle-attribute', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/update', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/view', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/*', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-activate', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-deactivate', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-delete', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/change-password', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/create', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/delete', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-page-size', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-sort', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/index', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/toggle-attribute', '3', null, null, null, '1532085549', '1532085549', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/update', '3', null, null, null, '1531826855', '1531826855', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/view', '3', null, null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('ACC', '1', 'Accountant', null, null, '1555913872', '1555913872', null);
INSERT INTO `auth_item` VALUES ('Acc_PERM', '2', 'Accountant_Permission', null, null, '1555914646', '1555914646', 'ACC_GROUP');
INSERT INTO `auth_item` VALUES ('Admin', '1', 'Admin', null, null, '1531826854', '1531826854', null);
INSERT INTO `auth_item` VALUES ('adminpermission', '2', 'Admin Permission', null, null, '1532725268', '1532725331', 'admingroup');
INSERT INTO `auth_item` VALUES ('assignRolesToUsers', '2', 'Assign roles to users', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('bindUserToIp', '2', 'Bind user to IP', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('changeOwnPassword', '2', 'Change own password', null, null, '1531826855', '1531826855', 'userCommonPermissions');
INSERT INTO `auth_item` VALUES ('changeUserPassword', '2', 'Change user password', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('commonPermission', '2', 'Common permission', null, null, '1531826848', '1531826848', null);
INSERT INTO `auth_item` VALUES ('createUsers', '2', 'Create users', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('deleteUsers', '2', 'Delete users', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('editUserEmail', '2', 'Edit user email', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('editUsers', '2', 'Edit users', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewRegistrationIp', '2', 'View registration IP', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserEmail', '2', 'View user email', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserRoles', '2', 'View user roles', null, null, '1531826855', '1531826855', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUsers', '2', 'View users', null, null, '1531826854', '1531826854', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewVisitLog', '2', 'View visit log', null, null, '1531826855', '1531826855', 'userManagement');

-- ----------------------------
-- Table structure for `auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/acc-entry-main/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/accbankaccount/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/accbusiness/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/acccashaccount/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/accentrydetail/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/accpaymentdetail/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/accpaymentmain/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/accreceiptdetail/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/accreceiptmain/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/invoice/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/journaldetail/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/journalmain/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/postdatedcheque/*');
INSERT INTO `auth_item_child` VALUES ('adminpermission', '/site/*');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/about');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/admin-main');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/admin-panel');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/business-list');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/captcha');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/contact');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/error');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/index');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/site/index');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/load-user-level-values');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/login');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/logout');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/site/reports');
INSERT INTO `auth_item_child` VALUES ('Acc_PERM', '/subcontractor-bills/*');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/user-management/user/change-password');
INSERT INTO `auth_item_child` VALUES ('createUsers', '/user-management/user/create');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/delete');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/index');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/update');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/view');
INSERT INTO `auth_item_child` VALUES ('ACC', 'Acc_PERM');
INSERT INTO `auth_item_child` VALUES ('Admin', 'adminpermission');
INSERT INTO `auth_item_child` VALUES ('Admin', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('ACC', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('Admin', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('createUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('editUsers', 'viewUsers');

-- ----------------------------
-- Table structure for `auth_item_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_group`;
CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_group
-- ----------------------------
INSERT INTO `auth_item_group` VALUES ('ACC_GROUP', 'Accountants_group', '1555914007', '1555914007');
INSERT INTO `auth_item_group` VALUES ('admingroup', 'Admin Group', '1532725303', '1532725303');
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions', 'User common permission', '1531826855', '1531826855');
INSERT INTO `auth_item_group` VALUES ('userManagement', 'User management', '1531826854', '1531826854');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `ca_group`
-- ----------------------------
DROP TABLE IF EXISTS `ca_group`;
CREATE TABLE `ca_group` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `parent_id` int(20) DEFAULT NULL,
  `item_name` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `statement_type_id` int(4) DEFAULT NULL,
  `ca_level` int(4) DEFAULT NULL,
  `parent_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_type` (`statement_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ca_group
-- ----------------------------
INSERT INTO `ca_group` VALUES ('1', null, 'Asset', null, '1', '1', 'Asset');
INSERT INTO `ca_group` VALUES ('2', null, 'Liabilities', null, '1', '1', 'Liabilities');
INSERT INTO `ca_group` VALUES ('3', null, 'Equity and Reserves', null, '1', '1', 'Equity and Reserves');
INSERT INTO `ca_group` VALUES ('4', null, 'Income', null, '2', '1', 'Income');
INSERT INTO `ca_group` VALUES ('5', null, 'Expenses', null, '2', '1', 'Expenses');
INSERT INTO `ca_group` VALUES ('10', '1', 'Non Current Assets', '10100', '1', '2', 'Asset');
INSERT INTO `ca_group` VALUES ('11', '10', 'Intangiable Assets', '10105', '1', '3', 'Asset >>Non Current Assets');
INSERT INTO `ca_group` VALUES ('12', '10', 'Property, Plant & Equipment', '10200', '1', '3', 'Asset >>Non Current Assets');
INSERT INTO `ca_group` VALUES ('13', '10', 'Accumulated Depreciation', '11000', '1', '3', 'Asset >>Non Current Assets');
INSERT INTO `ca_group` VALUES ('14', '1', 'Investments', '12000', '1', '2', 'Asset');
INSERT INTO `ca_group` VALUES ('15', '14', 'Investment in FD-Com. Bank', '12005', '1', '3', 'Asset >> Investments');
INSERT INTO `ca_group` VALUES ('16', '14', 'Investment in FD-PABC-Bank', '12015', '1', '3', 'Asset >> Investments');
INSERT INTO `ca_group` VALUES ('17', '14', 'Investment in FD-Sampath Bank', '12020', '1', '3', 'Asset >> Investments');
INSERT INTO `ca_group` VALUES ('18', '14', 'Investmen In FD-Pan Asia Bank', '12040', '1', '3', 'Asset >> Investments');
INSERT INTO `ca_group` VALUES ('19', '14', 'Investment in FD-Union Bank', '12060', '1', '3', 'Asset >> Investments');
INSERT INTO `ca_group` VALUES ('20', '14', 'Investment in FD-NDB Bank', '12080', '1', '3', 'Asset >> Investments');
INSERT INTO `ca_group` VALUES ('21', '14', 'Other Investments', '12094', '1', '3', 'Asset >> Investments');
INSERT INTO `ca_group` VALUES ('22', '14', 'Investment in CSE', '12095', '1', '3', 'Asset >> Investments');
INSERT INTO `ca_group` VALUES ('23', '1', 'Retention Held (Not Invoiced)', '12500', '1', '2', 'Asset');
INSERT INTO `ca_group` VALUES ('24', '1', 'Other Non Current Assets', '13000', '1', '2', 'Asset');
INSERT INTO `ca_group` VALUES ('25', '1', 'Current Assets', '14000', '1', '2', 'Asset');
INSERT INTO `ca_group` VALUES ('26', '25', 'Work In Progress (WIP)', '14050', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('27', '25', 'Inventory Assets', '14100', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('28', '25', 'Prepaid Expenses', '14300', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('29', '25', 'Deposits & Advances', '14500', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('30', '25', 'Other Current Assets', '15000', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('31', '25', 'Sub - Mobilization Advance', '15500', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('32', '25', 'Trade Receivables', '16000', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('33', '25', 'Cash in Hand', '18000', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('34', '25', 'Banks-Current Accounts (CA)', '18100', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('35', '25', 'Banks-Savings Accounts (SA)', '18500', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('36', '25', 'Banks-Money Market Accounts (MM', '18700', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('37', '25', 'Petty Cash Accounts', '19000', '1', '3', 'Asset >> Current Assets');
INSERT INTO `ca_group` VALUES ('38', '2', 'Current Liabilities', '20100', '1', '2', 'Liabilities');
INSERT INTO `ca_group` VALUES ('39', '38', 'Trade Creditors', '20200', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group` VALUES ('40', '38', 'Expense Creditors', '20300', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group` VALUES ('41', '38', 'Sub Contractor Payable', '20400', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group` VALUES ('42', '38', 'Short Term Loan', '21000', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group` VALUES ('43', '38', 'Other Current Liabilities', '23000', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group` VALUES ('44', '38', 'Payroll Liabilities-Salary&Wage', '24000', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group` VALUES ('45', '38', 'Accrued Liabilities-Expenses', '25000', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group` VALUES ('46', '38', 'Taxes Payable', '26000', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group` VALUES ('47', '38', 'Deferred Income', '26550', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group` VALUES ('48', '2', 'Long Term Liabilities', '27000', '1', '2', 'Liabilities');
INSERT INTO `ca_group` VALUES ('49', '48', 'Term Loan - Commercial Bank', '27005', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('50', '48', 'Term Loan - Sampath Bank', '27010', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('51', '48', 'Term Loan - Union Bank', '27013', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('52', '48', 'Term Loan - NDB', '27020', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('53', '48', 'Retention Payable-Sub Contracto', '27030', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('54', '48', 'Retirement Benefit Obligation', '27050', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('55', '48', 'Lease Creditors-LB Finance', '27400', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('56', '48', 'Lease Creditors-Commercial Bank', '27500', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('57', '48', 'Peoples Leasing & Finance PLC', '27600', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('58', '48', 'Lease Creditors-Sampath Bank', '27700', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('59', '48', 'National Development Bank PLC', '27800', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('60', '48', 'Siyapatha Finance PLC', '27900', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('61', '48', 'Mobilization Advance (M/Adv)', '28000', '1', '3', 'Liabilities >> Long Term Liabilities');
INSERT INTO `ca_group` VALUES ('62', '3', 'Stated Capital', '30100', '1', '2', 'Equity and Reserves');
INSERT INTO `ca_group` VALUES ('63', '3', 'General & Development Reserve', '30200', '1', '2', 'Equity and Reserves');
INSERT INTO `ca_group` VALUES ('64', '3', 'Retained Earnings upto 31-03-12', '30300', '1', '2', 'Equity and Reserves');
INSERT INTO `ca_group` VALUES ('65', '3', 'Revaluation Reserve', '30400', '1', '2', 'Equity and Reserves');
INSERT INTO `ca_group` VALUES ('66', '3', 'Opening Balance Control A/c', '30700', '1', '2', 'Equity and Reserves');
INSERT INTO `ca_group` VALUES ('67', '3', 'Retained Earnings', '31000', '1', '2', 'Equity and Reserves');
INSERT INTO `ca_group` VALUES ('68', '4', 'Revenue-Net Work Done', '40100', '2', '2', 'Income');
INSERT INTO `ca_group` VALUES ('69', '4', 'Revenue-Advance Recovered', '40200', '2', '2', 'Income');
INSERT INTO `ca_group` VALUES ('70', '4', 'Revenue-Retention Held', '40300', '2', '2', 'Income');
INSERT INTO `ca_group` VALUES ('71', '4', 'Zero Balance Account', '40400', '2', '2', 'Income');
INSERT INTO `ca_group` VALUES ('72', '4', 'Discount Received', '40500', '2', '2', 'Income');
INSERT INTO `ca_group` VALUES ('73', '4', 'Write Off A/c', '40600', '2', '2', 'Income');
INSERT INTO `ca_group` VALUES ('74', '4', 'Other Income', '48000', '2', '2', 'Income');
INSERT INTO `ca_group` VALUES ('75', '5', 'Cost of Contract (COGS)', '50100', '2', '2', 'Expenses');
INSERT INTO `ca_group` VALUES ('76', '75', 'Direct Material', '52000', '2', '3', 'Expenses >> Cost of Contract (COGS)');
INSERT INTO `ca_group` VALUES ('77', '75', 'Direct Labour Salary', '53000', '2', '3', 'Expenses >> Cost of Contract (COGS)');
INSERT INTO `ca_group` VALUES ('78', '75', 'Sub Contract Expense', '54000', '2', '3', 'Expenses >> Cost of Contract (COGS)');
INSERT INTO `ca_group` VALUES ('79', '75', 'Other Direct Expense', '55000', '2', '3', 'Expenses >> Cost of Contract (COGS)');
INSERT INTO `ca_group` VALUES ('80', '75', 'Staff Salary - Site', '56000', '2', '3', 'Expenses >> Cost of Contract (COGS)');
INSERT INTO `ca_group` VALUES ('81', '75', 'Construction Overhead', '57000', '2', '3', 'Expenses >> Cost of Contract (COGS)');
INSERT INTO `ca_group` VALUES ('82', '5', 'General & Administrative Cost', '60000', '2', '2', 'Expenses');
INSERT INTO `ca_group` VALUES ('83', '82', 'Staff Salary - HO', '61000', '2', '3', 'Expenses >> General & Administrative Cost');
INSERT INTO `ca_group` VALUES ('84', '82', 'Other Administrative Cost', '62000', '2', '3', 'Expenses >> General & Administrative Cost');
INSERT INTO `ca_group` VALUES ('85', '82', 'Reconciliation Discrepancies', '66900', '2', '3', 'Expenses >> General & Administrative Cost');
INSERT INTO `ca_group` VALUES ('86', '5', 'Other Operating Cost', '70000', '2', '2', 'Expenses');
INSERT INTO `ca_group` VALUES ('87', '5', 'Selling & Distribution Cost', '80000', '2', '2', 'Expenses');
INSERT INTO `ca_group` VALUES ('88', '5', 'Finance Cost', '90000', '2', '2', 'Expenses');
INSERT INTO `ca_group` VALUES ('89', '88', 'Bank Charges', '90100', '2', '3', 'Expenses >> Finance Cost');
INSERT INTO `ca_group` VALUES ('90', '88', 'Lease Interest', '90200', '2', '3', 'Expenses >> Finance Cost');
INSERT INTO `ca_group` VALUES ('91', '88', 'Interest - Over Draft (O/D)', '90300', '2', '3', 'Expenses >> Finance Cost');
INSERT INTO `ca_group` VALUES ('92', '88', 'Interest -Term Loan', '90400', '2', '3', 'Expenses >> Finance Cost');
INSERT INTO `ca_group` VALUES ('93', '88', 'Interest - Import Demand Loan', '90450', '2', '3', 'Expenses >> Finance Cost');
INSERT INTO `ca_group` VALUES ('94', '88', 'Interest Paid-Other', '90500', '2', '3', 'Expenses >> Finance Cost');
INSERT INTO `ca_group` VALUES ('95', '88', 'LC Charges & Commissions', '90600', '2', '3', 'Expenses >> Finance Cost');
INSERT INTO `ca_group` VALUES ('96', '88', 'Guarantee & Bond Charges', '90700', '2', '3', 'Expenses >> Finance Cost');
INSERT INTO `ca_group` VALUES ('97', '62', 'Director\'s Share', '30110', '1', '3', 'Equity and Reserves>>Stated Capital');

-- ----------------------------
-- Table structure for `ca_group_copy`
-- ----------------------------
DROP TABLE IF EXISTS `ca_group_copy`;
CREATE TABLE `ca_group_copy` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `parent_id` int(20) DEFAULT NULL,
  `item_name` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `statement_type_id` int(4) DEFAULT NULL,
  `ca_level` int(4) DEFAULT NULL,
  `parent_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_type` (`statement_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ca_group_copy
-- ----------------------------
INSERT INTO `ca_group_copy` VALUES ('1', null, 'Assets', '', '1', '1', 'Assets');
INSERT INTO `ca_group_copy` VALUES ('2', null, 'Liabilities', '', '1', '1', 'Liabilities');
INSERT INTO `ca_group_copy` VALUES ('3', null, 'Equity', '', '1', '1', 'Equity');
INSERT INTO `ca_group_copy` VALUES ('4', null, 'Income', '', '2', '1', 'Income');
INSERT INTO `ca_group_copy` VALUES ('5', null, 'Expenses', '', '2', '1', 'Expenses');
INSERT INTO `ca_group_copy` VALUES ('6', '1', 'Bank', '1000', '1', '2', 'Assets');
INSERT INTO `ca_group_copy` VALUES ('8', '1', 'Other Current Assets', '1200', '1', '2', 'Assets');
INSERT INTO `ca_group_copy` VALUES ('9', '1', 'Current Assets', '1300', '1', '2', 'Assets');
INSERT INTO `ca_group_copy` VALUES ('10', '1', 'Fixed Asset', '1200', '1', '2', 'Assets');
INSERT INTO `ca_group_copy` VALUES ('12', '2', 'Current Liabilities', '2000', '1', '2', 'Liabilities');
INSERT INTO `ca_group_copy` VALUES ('13', '2', 'Other Current Liabilities', '2500', '1', '2', 'Liabilities');
INSERT INTO `ca_group_copy` VALUES ('15', '2', 'Long Term Liabilities', '2700', '1', '2', 'Liabilities');
INSERT INTO `ca_group_copy` VALUES ('17', '3', 'Director Shares', '3000', '1', '2', 'Equity');
INSERT INTO `ca_group_copy` VALUES ('18', '4', 'Operational Income', '4000', '2', '2', 'Income');
INSERT INTO `ca_group_copy` VALUES ('19', '4', 'Other Income', '4500', '2', '2', 'Income');
INSERT INTO `ca_group_copy` VALUES ('20', '5', 'COGS - Cost of Goods & Services', '5000', '2', '2', 'Expenses');
INSERT INTO `ca_group_copy` VALUES ('21', '5', 'Expense', '5500', '2', '2', 'Expenses');
INSERT INTO `ca_group_copy` VALUES ('22', '5', 'Other Expense', '5600', '2', '2', 'Expenses');
INSERT INTO `ca_group_copy` VALUES ('25', '6', 'Cash On Hand', '1000', '1', '3', 'Assets >> Bank ');
INSERT INTO `ca_group_copy` VALUES ('26', '6', 'Cash in Bank:Operating Acct.', '1005', '1', '3', 'Assets >> Bank ');
INSERT INTO `ca_group_copy` VALUES ('27', '6', 'Cash in Bank: Payroll Account', '1010', '1', '3', 'Assets >> Bank ');
INSERT INTO `ca_group_copy` VALUES ('28', '6', 'Cash in Bank: Savings', '1015', '1', '3', 'Assets >> Bank ');
INSERT INTO `ca_group_copy` VALUES ('29', '6', 'Cash in Bank: Petty Account', '1020', '1', '3', 'Assets >> Bank ');
INSERT INTO `ca_group_copy` VALUES ('30', '20', 'Equipment', '5005', '1', '3', 'Expenses >> COGS');
INSERT INTO `ca_group_copy` VALUES ('31', '20', 'Parts and Materials', '5010', '1', '3', 'Expenses >> COGS');
INSERT INTO `ca_group_copy` VALUES ('32', '20', 'Subcontractor Payments', '5015', '2', '3', 'Expenses >> COGS');
INSERT INTO `ca_group_copy` VALUES ('33', '20', 'Labor', '5020', '1', '3', 'Expenses >> COGS');
INSERT INTO `ca_group_copy` VALUES ('34', '20', 'Other Direct Costs', '5025', '1', '3', 'Expenses >> COGS');
INSERT INTO `ca_group_copy` VALUES ('35', '9', 'Inventory', '1310', '1', '3', 'Assets >> Current Assets');
INSERT INTO `ca_group_copy` VALUES ('36', '9', 'Work in Progress', '1330', '1', '3', 'Assets >> Current Assets');
INSERT INTO `ca_group_copy` VALUES ('37', '9', 'Prepaid Expenses', '1390', '1', '3', 'Assets >> Current Assets');
INSERT INTO `ca_group_copy` VALUES ('38', '9', 'Prepaid Expenses: Interest', '1380', '1', '3', 'Assets >> Current Assets');
INSERT INTO `ca_group_copy` VALUES ('39', '9', 'Prepaid Expenses: Insurance', '1320', '1', '3', 'Assets >> Current Assets');
INSERT INTO `ca_group_copy` VALUES ('40', '9', 'Prepaid Expenses: Rent', '1340', '1', '3', 'Assets >> Current Assets');
INSERT INTO `ca_group_copy` VALUES ('41', '9', 'Prepaid Expenses: Commissions', '1350', '1', '3', 'Assets >> Current Assets');
INSERT INTO `ca_group_copy` VALUES ('42', '9', 'Prepaid Expenses: Taxes', '1360', '1', '3', 'Assets >> Current Assets');
INSERT INTO `ca_group_copy` VALUES ('43', '9', 'Prepaid Expenses: Other', '1370', '1', '3', 'Assets >> Current Assets');
INSERT INTO `ca_group_copy` VALUES ('44', '10', 'Building', '1205', '1', '3', 'Assets >> Fixed Assets');
INSERT INTO `ca_group_copy` VALUES ('45', '10', 'Office Furniture & Equipment', '1210', '1', '3', 'Assets >> Fixed Assets');
INSERT INTO `ca_group_copy` VALUES ('46', '10', 'Machinery & Equipment', '1215', '1', '3', 'Assets >> Fixed Assets');
INSERT INTO `ca_group_copy` VALUES ('47', '10', 'Autos & Trucks', '1220', '1', '3', 'Assets >> Fixed Assets');
INSERT INTO `ca_group_copy` VALUES ('48', '10', 'Leasehold Improvements', '1225', '1', '3', 'Assets >> Fixed Assets');
INSERT INTO `ca_group_copy` VALUES ('49', '3', 'Retained Profit', '3100', '1', '2', 'Equity');
INSERT INTO `ca_group_copy` VALUES ('50', '18', 'Hire of Equipment', '4005', '2', '3', 'Income >> Direct Income');
INSERT INTO `ca_group_copy` VALUES ('51', '18', 'Sale of Parts and Materials', '4010', '2', '3', 'Income >> Direct Income');
INSERT INTO `ca_group_copy` VALUES ('52', '7', 'Retention', '1110', '1', null, null);
INSERT INTO `ca_group_copy` VALUES ('55', '53', 'Interest Receivable', '1120', '1', '3', 'Assets >> Accounts receivable');
INSERT INTO `ca_group_copy` VALUES ('56', '53', 'Debtors', '1125', '1', '3', 'Assets >> Accounts receivable');
INSERT INTO `ca_group_copy` VALUES ('57', '21', 'Utilities', '5510', '2', '3', 'Expenses >> Expenses ');
INSERT INTO `ca_group_copy` VALUES ('58', '12', 'Creditors', '2100', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group_copy` VALUES ('59', '12', 'Sales Tax Payable', '2200', '1', '3', 'Liabilities >> Current Liabilities');
INSERT INTO `ca_group_copy` VALUES ('60', '22', 'Interest Expense', '5610', '2', '3', 'Expenses >> Other Expense');
INSERT INTO `ca_group_copy` VALUES ('61', '17', 'Dirctor ABC Shares', '3005', '1', '3', 'Equity >> Director Shares');
INSERT INTO `ca_group_copy` VALUES ('62', '49', 'Retained Profit Cumulative', '3105', '1', '3', 'Equity >> Retained Profit');
INSERT INTO `ca_group_copy` VALUES ('63', '18', 'Direct Projects', '4100', '2', '3', 'Income>>Operational Income');
INSERT INTO `ca_group_copy` VALUES ('64', '18', 'Sub Contract', '4200', '2', '3', 'Income>>Operational Income');
INSERT INTO `ca_group_copy` VALUES ('65', '19', 'Interest Income', '4510', '2', '3', 'Income>>Other Income');
INSERT INTO `ca_group_copy` VALUES ('66', '20', 'Purchase of Materual', '5100', '2', '3', 'Expenses>>COGS');
INSERT INTO `ca_group_copy` VALUES ('67', '20', 'Direct Wages and Consultations', '5200', '2', '3', 'Expenses>>COGS');
INSERT INTO `ca_group_copy` VALUES ('68', '20', 'Hire of Equipment & Machinery', '5300', '2', '3', 'Expenses>>COGS');

-- ----------------------------
-- Table structure for `client_bill`
-- ----------------------------
DROP TABLE IF EXISTS `client_bill`;
CREATE TABLE `client_bill` (
  `bill_id` int(4) NOT NULL AUTO_INCREMENT,
  `bill_date` datetime NOT NULL,
  `Client_Code` int(11) DEFAULT NULL,
  `Client_ID_PMS` int(11) DEFAULT NULL,
  `particulars` varchar(200) DEFAULT NULL,
  `amount` double NOT NULL,
  `retention_amount` double DEFAULT NULL,
  `invoice_status` varchar(20) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `Client_Code` (`Client_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client_bill
-- ----------------------------

-- ----------------------------
-- Table structure for `company_master`
-- ----------------------------
DROP TABLE IF EXISTS `company_master`;
CREATE TABLE `company_master` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `company_legal_name` varchar(150) NOT NULL,
  `company_reg_no` varchar(100) NOT NULL,
  `incorporation_date` date NOT NULL,
  `financial_year` varchar(100) NOT NULL,
  `tin_no` varchar(100) NOT NULL,
  `vat_svat_no` varchar(100) NOT NULL,
  `nbt_reg_no` varchar(100) NOT NULL,
  `epf_etf_reg_no` varchar(100) NOT NULL,
  `payee_tax_no` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company_master
-- ----------------------------
INSERT INTO `company_master` VALUES ('1', 'Squire Mech Engineering (Private) Limited', 'PV 5214', '1985-05-27', '1st April to 31st March', '114018619-0000', '114018619-7000', '114018619-9000', 'B23523', '114018619-0300', 'No. 135/1, Old Kottawa Road, Nawinna,\r\nMaharagama 10280,\r\nSri Lanka.', 'SquireMechlogo.png');

-- ----------------------------
-- Table structure for `expense_master`
-- ----------------------------
DROP TABLE IF EXISTS `expense_master`;
CREATE TABLE `expense_master` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category` varchar(50) NOT NULL,
  `expense_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expense_master
-- ----------------------------
INSERT INTO `expense_master` VALUES ('1', 'Water', '1');
INSERT INTO `expense_master` VALUES ('2', 'Electricity', '1');
INSERT INTO `expense_master` VALUES ('3', 'Rent', '1');
INSERT INTO `expense_master` VALUES ('4', 'Invoice', '1');
INSERT INTO `expense_master` VALUES ('5', 'Vehicle', '1');

-- ----------------------------
-- Table structure for `expense_sub_category`
-- ----------------------------
DROP TABLE IF EXISTS `expense_sub_category`;
CREATE TABLE `expense_sub_category` (
  `exp_sub_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_sub_category` varchar(50) NOT NULL,
  `exp_subcat_status` varchar(20) DEFAULT NULL,
  `exp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`exp_sub_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expense_sub_category
-- ----------------------------
INSERT INTO `expense_sub_category` VALUES ('1', 'Insurance', '1', '5');
INSERT INTO `expense_sub_category` VALUES ('2', 'Fitness', '1', '5');
INSERT INTO `expense_sub_category` VALUES ('3', 'Fuel', '1', '5');
INSERT INTO `expense_sub_category` VALUES ('4', 'Tires', '1', '5');
INSERT INTO `expense_sub_category` VALUES ('5', 'Accident Rate', '1', '5');
INSERT INTO `expense_sub_category` VALUES ('6', 'Maintain Repairs', '1', '5');
INSERT INTO `expense_sub_category` VALUES ('7', 'Lubrication', '1', '5');
INSERT INTO `expense_sub_category` VALUES ('9', 'License', '1', '5');

-- ----------------------------
-- Table structure for `invoice`
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `VAT` double DEFAULT NULL,
  `NBT` double DEFAULT NULL,
  `tot_invoice_amount` double NOT NULL,
  `receipt_balance` double DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `invoice_created_by` varchar(100) DEFAULT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `bill_id` (`bill_id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('20190002', '2019-05-02', '15', '2', '58650', '41650', null, null, null, '2019-05-02');
INSERT INTO `invoice` VALUES ('20220003', '2022-12-26', '15', '2', '1407.6', '1407.6', null, null, null, '2022-12-26');

-- ----------------------------
-- Table structure for `invoice_detail`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail` (
  `invoice_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_application_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`invoice_detail_id`),
  KEY `payment_application_id` (`payment_application_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of invoice_detail
-- ----------------------------
INSERT INTO `invoice_detail` VALUES ('3', '1', '20190002');
INSERT INTO `invoice_detail` VALUES ('4', '1', '20220003');

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) NOT NULL DEFAULT '0',
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', 'Datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:1:\"0\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=1c1a430b7354d372437dbaa9b3e7555dbb8af319\";}', '', '::1', '1553879923', '0.257295', '1', '400', '2019-03-29 22:48:43');
INSERT INTO `logs` VALUES ('2', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"108\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=6181693ab8cc8fe2a4a980186031b69a2e3403fd\";i:0;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";i:1;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";}', '', '::1', '1553880030', '0.380562', '1', '400', '2019-03-29 22:50:31');
INSERT INTO `logs` VALUES ('3', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:19:\"Sub_Contractor_Code\";s:3:\"123\";s:19:\"Sub_Contractor_Name\";s:7:\"Sasanka\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"108\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=6181693ab8cc8fe2a4a980186031b69a2e3403fd\";i:0;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";i:1;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";}', '', '::1', '1553880169', '0.344115', '1', '400', '2019-03-29 22:52:49');
INSERT INTO `logs` VALUES ('4', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"108\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=1948fca327cbcf7a3b8c9d556ca285371e69d59a\";i:0;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";i:1;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";}', '', '::1', '1553880361', '0.299729', '1', '400', '2019-03-29 22:56:01');
INSERT INTO `logs` VALUES ('5', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"108\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=1948fca327cbcf7a3b8c9d556ca285371e69d59a\";i:0;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";i:1;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";}', '', '::1', '1553884190', '0.3181', '1', '400', '2019-03-29 23:59:50');
INSERT INTO `logs` VALUES ('6', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"108\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:221:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D\";i:0;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";i:1;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";}', '', '::1', '1553896972', '0.326451', '1', '400', '2019-03-30 03:32:52');
INSERT INTO `logs` VALUES ('7', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"110\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=9598bfa9863e4955fe034f3c81c4d6e49e6421a9\";i:0;s:110:\"Sub_Contractor_Code=\'SUB001\'&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";i:1;s:110:\"Sub_Contractor_Code=\'SUB001\'&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";}', '', '::1', '1553896991', '0.292035', '1', '400', '2019-03-30 03:33:12');
INSERT INTO `logs` VALUES ('8', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"108\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=9598bfa9863e4955fe034f3c81c4d6e49e6421a9\";i:0;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";i:1;s:108:\"Sub_Contractor_Code=SUB001&Sub_Contractor_Name=Sampath&Sub_Contractor_Address=Colombo%205&Attn_Person=Malaka\";}', '', '::1', '1553897007', '0.326344', '1', '400', '2019-03-30 03:33:27');
INSERT INTO `logs` VALUES ('9', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:14:\"Content-Length\";s:3:\"108\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=9598bfa9863e4955fe034f3c81c4d6e49e6421a9\";s:19:\"Sub_Contractor_Code\";s:6:\"SUB001\";s:19:\"Sub_Contractor_Name\";s:7:\"Sampath\";s:22:\"Sub_Contractor_Address\";s:9:\"Colombo 5\";s:11:\"Attn_Person\";s:6:\"Malaka\";}', '', '::1', '1553897123', '0.352227', '1', '400', '2019-03-30 03:35:23');
INSERT INTO `logs` VALUES ('10', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:14:\"Content-Length\";s:3:\"108\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=9598bfa9863e4955fe034f3c81c4d6e49e6421a9\";s:19:\"Sub_Contractor_Code\";s:6:\"SUB001\";s:19:\"Sub_Contractor_Name\";s:7:\"Sampath\";s:22:\"Sub_Contractor_Address\";s:9:\"Colombo 5\";s:11:\"Attn_Person\";s:6:\"Malaka\";}', '', '::1', '1553897141', '0.326506', '1', '400', '2019-03-30 03:35:41');
INSERT INTO `logs` VALUES ('11', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:14:\"Content-Length\";s:3:\"103\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=9598bfa9863e4955fe034f3c81c4d6e49e6421a9\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:7:\"Sampath\";s:22:\"Sub_Contractor_Address\";s:9:\"Colombo 5\";s:11:\"Attn_Person\";s:6:\"Malaka\";}', '', '::1', '1553897203', '0.30035', '1', '400', '2019-03-30 03:36:43');
INSERT INTO `logs` VALUES ('12', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:14:\"Content-Length\";s:3:\"103\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=9598bfa9863e4955fe034f3c81c4d6e49e6421a9\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:7:\"Sampath\";s:22:\"Sub_Contractor_Address\";s:9:\"Colombo 5\";s:11:\"Attn_Person\";s:6:\"Malaka\";}', '', '::1', '1553897238', '0.296445', '1', '400', '2019-03-30 03:37:18');
INSERT INTO `logs` VALUES ('13', 'Datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"103\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=9598bfa9863e4955fe034f3c81c4d6e49e6421a9\";}', '', '::1', '1553897270', '0.324933', '1', '400', '2019-03-30 03:37:50');
INSERT INTO `logs` VALUES ('14', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:14:\"Content-Length\";s:3:\"103\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=9598bfa9863e4955fe034f3c81c4d6e49e6421a9\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:7:\"Sampath\";s:22:\"Sub_Contractor_Address\";s:9:\"Colombo 5\";s:11:\"Attn_Person\";s:6:\"Malaka\";}', '', '::1', '1553897284', '0.496459', '1', '400', '2019-03-30 03:38:05');
INSERT INTO `logs` VALUES ('15', 'Datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"21\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=4352a02a7ffea222df062563b8ab7f15cb2fd71d\";}', '', '::1', '1553897462', '0.331251', '1', '400', '2019-03-30 03:41:02');
INSERT INTO `logs` VALUES ('16', 'Datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"21\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=4352a02a7ffea222df062563b8ab7f15cb2fd71d\";}', '', '::1', '1553897504', '0.279092', '1', '400', '2019-03-30 03:41:44');
INSERT INTO `logs` VALUES ('17', 'Datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"21\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=4352a02a7ffea222df062563b8ab7f15cb2fd71d\";}', '', '::1', '1553897521', '0.264857', '1', '400', '2019-03-30 03:42:01');
INSERT INTO `logs` VALUES ('18', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"68\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=4352a02a7ffea222df062563b8ab7f15cb2fd71d\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";}', '', '::1', '1553897786', '0.325477', '1', '400', '2019-03-30 03:46:26');
INSERT INTO `logs` VALUES ('19', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"68\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=fb9d9e06d298fad4acb7e61a7219ac069bfc0588\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";}', '', '::1', '1553897851', '0.230668', '1', '0', '2019-03-30 03:47:31');
INSERT INTO `logs` VALUES ('20', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"69\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=fb9d9e06d298fad4acb7e61a7219ac069bfc0588\";s:20:\"Sub_Contractor_Code1\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";}', '', '::1', '1553897897', '0.255472', '1', '400', '2019-03-30 03:48:18');
INSERT INTO `logs` VALUES ('21', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"68\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=fb9d9e06d298fad4acb7e61a7219ac069bfc0588\";s:20:\"Sub_Contractor_Code1\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";}', '', '::1', '1553898044', '0.307083', '1', '400', '2019-03-30 03:50:44');
INSERT INTO `logs` VALUES ('22', 'Datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"64\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=fb9d9e06d298fad4acb7e61a7219ac069bfc0588\";}', '', '::1', '1553898057', '0.221677', '1', '400', '2019-03-30 03:50:58');
INSERT INTO `logs` VALUES ('23', 'Datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"63\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=fb9d9e06d298fad4acb7e61a7219ac069bfc0588\";}', '', '::1', '1553898070', '0.232123', '1', '400', '2019-03-30 03:51:10');
INSERT INTO `logs` VALUES ('24', 'Datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"63\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=fb9d9e06d298fad4acb7e61a7219ac069bfc0588\";}', '', '::1', '1553898096', '0.39178', '1', '400', '2019-03-30 03:51:37');
INSERT INTO `logs` VALUES ('25', 'Datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"65\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=78200b9458bca9fc127473928d8a126f18fdfc25\";}', '', '::1', '1553898151', '0.418533', '1', '400', '2019-03-30 03:52:31');
INSERT INTO `logs` VALUES ('26', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"67\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=78200b9458bca9fc127473928d8a126f18fdfc25\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";}', '', '::1', '1553898215', '0.335742', '1', '0', '2019-03-30 03:53:35');
INSERT INTO `logs` VALUES ('27', 'Datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:2:\"67\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=78200b9458bca9fc127473928d8a126f18fdfc25\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";}', '', '::1', '1553898236', '0.299274', '1', '400', '2019-03-30 03:53:56');
INSERT INTO `logs` VALUES ('28', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=78200b9458bca9fc127473928d8a126f18fdfc25\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553898307', '0.260133', '1', '400', '2019-03-30 03:55:07');
INSERT INTO `logs` VALUES ('29', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=78200b9458bca9fc127473928d8a126f18fdfc25\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553898339', '0.206818', '1', '0', '2019-03-30 03:55:39');
INSERT INTO `logs` VALUES ('30', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=78200b9458bca9fc127473928d8a126f18fdfc25\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553899918', '0.298025', '1', '0', '2019-03-30 04:21:58');
INSERT INTO `logs` VALUES ('31', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=50f388c822b8aab57dc286cd758beb5cf73e81e9\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553899943', '0.27327', '1', '201', '2019-03-30 04:22:23');
INSERT INTO `logs` VALUES ('32', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=50f388c822b8aab57dc286cd758beb5cf73e81e9\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553900053', '0.380232', '1', '201', '2019-03-30 04:24:13');
INSERT INTO `logs` VALUES ('33', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=50f388c822b8aab57dc286cd758beb5cf73e81e9\";s:19:\"Sub_Contractor_Code\";s:1:\"1\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553900312', '0.521683', '1', '400', '2019-03-30 04:28:33');
INSERT INTO `logs` VALUES ('34', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=6a4d4f5683fe5f50dee6fc6bc777707b8b7fb262\";s:19:\"Sub_Contractor_Code\";s:1:\"2\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553900328', '0.334816', '1', '201', '2019-03-30 04:28:48');
INSERT INTO `logs` VALUES ('35', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=6a4d4f5683fe5f50dee6fc6bc777707b8b7fb262\";s:19:\"Sub_Contractor_Code\";s:1:\"2\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553900436', '0.284758', '1', '400', '2019-03-30 04:30:36');
INSERT INTO `logs` VALUES ('36', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0bea9nag23p33g56fs65jsdrc0; _csrf=17903e4f0c5a568e568b9a5c5d95ae034b59c539ba4aa0649b7730e7727ea33ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22l_RRXqFBmDtLG8Ky0V5CMORTeToMHlTD%22%3B%7D; ci_session=6a4d4f5683fe5f50dee6fc6bc777707b8b7fb262\";s:19:\"Sub_Contractor_Code\";s:1:\"2\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553900461', '0.37297', '1', '201', '2019-03-30 04:31:01');
INSERT INTO `logs` VALUES ('37', 'Datalayer/subcontractor', 'post', 'a:14:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"126\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=0srdeh5m2khm9r1pnbdiv185n4; _csrf=31839d2b97be0434564bad72615a81b8081ee3f799c356c4dbc8ca931cb9a47ca%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%225UoeMIHSNa3eBBfgja8QdAL8PwhArpfd%22%3B%7D; ci_session=0a2a8d9f51849443044fdaa28ea4c84fac762fb7\";s:19:\"Sub_Contractor_Code\";s:1:\"2\";s:19:\"Sub_Contractor_Name\";s:15:\"Test Item Title\";s:22:\"Sub_Contractor_Address\";s:8:\"Colombo5\";s:11:\"Attn_Person\";s:6:\"Damith\";}', '', '::1', '1553918288', '0.491542', '1', '400', '2019-03-30 09:28:08');
INSERT INTO `logs` VALUES ('38', 'datalayer/clientreg', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"574\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=a911362ebaa261abb62c27a26801729793d5c364\";i:0;s:574:\"{\'Client_Id\'             = 888 ,\n                \'Client_Name\'           = \'sasanka ,\n                \'Official_Contact_Dtl\'  = \'0785698545\' ,\n                \'Project_Contact_Dtl\'   = \'011256665,\n                \'Contact_Person_Name\'   = \'gayan,\n                \'Contact_Person_Email\'  = \'gayan@gmail.com,\n                \'Contact_Person_Phone\'  = \'0112566987,\n                \'Contact_Person_Mobile\' = \'076652569\',\n                \'Added_By\'              = \'api\'\n                \'Client_Address\'        = \'maharagama,\n                \'Vat_No\'                = \'233655-600}\";i:1;s:574:\"{\'Client_Id\'             = 888 ,\n                \'Client_Name\'           = \'sasanka ,\n                \'Official_Contact_Dtl\'  = \'0785698545\' ,\n                \'Project_Contact_Dtl\'   = \'011256665,\n                \'Contact_Person_Name\'   = \'gayan,\n                \'Contact_Person_Email\'  = \'gayan@gmail.com,\n                \'Contact_Person_Phone\'  = \'0112566987,\n                \'Contact_Person_Mobile\' = \'076652569\',\n                \'Added_By\'              = \'api\'\n                \'Client_Address\'        = \'maharagama,\n                \'Vat_No\'                = \'233655-600}\";}', '', '::1', '1554178209', '1.2407', '1', '400', '2019-04-02 09:40:09');
INSERT INTO `logs` VALUES ('39', 'datalayer/clientreg', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"585\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=a911362ebaa261abb62c27a26801729793d5c364\";i:0;s:585:\"{\'Client_Id\'             => 888 ,\n                \'Client_Name\'           => \'sasanka ,\n                \'Official_Contact_Dtl\'  => \'0785698545\' ,\n                \'Project_Contact_Dtl\'   => \'011256665,\n                \'Contact_Person_Name\'   => \'gayan,\n                \'Contact_Person_Email\'  => \'gayan@gmail.com,\n                \'Contact_Person_Phone\'  => \'0112566987,\n                \'Contact_Person_Mobile\' => \'076652569\',\n                \'Added_By\'              => \'api\'\n                \'Client_Address\'        => \'maharagama,\n                \'Vat_No\'                => \'233655-600}\";i:1;s:585:\"{\'Client_Id\'             => 888 ,\n                \'Client_Name\'           => \'sasanka ,\n                \'Official_Contact_Dtl\'  => \'0785698545\' ,\n                \'Project_Contact_Dtl\'   => \'011256665,\n                \'Contact_Person_Name\'   => \'gayan,\n                \'Contact_Person_Email\'  => \'gayan@gmail.com,\n                \'Contact_Person_Phone\'  => \'0112566987,\n                \'Contact_Person_Mobile\' => \'076652569\',\n                \'Added_By\'              => \'api\'\n                \'Client_Address\'        => \'maharagama,\n                \'Vat_No\'                => \'233655-600}\";}', '', '::1', '1554178337', '0.268431', '1', '400', '2019-04-02 09:42:18');
INSERT INTO `logs` VALUES ('40', 'datalayer/clientreg', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"574\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=a911362ebaa261abb62c27a26801729793d5c364\";i:0;s:574:\"{\'Client_Id\'             : 888 ,\n                \'Client_Name\'           : \'sasanka ,\n                \'Official_Contact_Dtl\'  : \'0785698545\' ,\n                \'Project_Contact_Dtl\'   : \'011256665,\n                \'Contact_Person_Name\'   : \'gayan,\n                \'Contact_Person_Email\'  : \'gayan@gmail.com,\n                \'Contact_Person_Phone\'  : \'0112566987,\n                \'Contact_Person_Mobile\' : \'076652569\',\n                \'Added_By\'              : \'api\'\n                \'Client_Address\'        : \'maharagama,\n                \'Vat_No\'                : \'233655-600}\";i:1;s:574:\"{\'Client_Id\'             : 888 ,\n                \'Client_Name\'           : \'sasanka ,\n                \'Official_Contact_Dtl\'  : \'0785698545\' ,\n                \'Project_Contact_Dtl\'   : \'011256665,\n                \'Contact_Person_Name\'   : \'gayan,\n                \'Contact_Person_Email\'  : \'gayan@gmail.com,\n                \'Contact_Person_Phone\'  : \'0112566987,\n                \'Contact_Person_Mobile\' : \'076652569\',\n                \'Added_By\'              : \'api\'\n                \'Client_Address\'        : \'maharagama,\n                \'Vat_No\'                : \'233655-600}\";}', '', '::1', '1554178794', '0.496156', '1', '400', '2019-04-02 09:49:55');
INSERT INTO `logs` VALUES ('41', 'datalayer/clientreg', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"552\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=b5176086b12680dee4574ab8b1ab8358e3c625f5\";i:0;s:552:\"\'Client_Id             : 888 ,\n                Client_Name           : \'sasanka ,\n                Official_Contact_Dtl  : \'0785698545\' ,\n                Project_Contact_Dtl   : \'011256665,\n                Contact_Person_Name   : \'gayan,\n                Contact_Person_Email  : \'gayan@gmail.com,\n                Contact_Person_Phone  : \'0112566987,\n                Contact_Person_Mobile : \'076652569\',\n                Added_By              : \'api\'\n                Client_Address        : \'maharagama,\n                Vat_No                : \'233655-600}\";i:1;s:552:\"\'Client_Id             : 888 ,\n                Client_Name           : \'sasanka ,\n                Official_Contact_Dtl  : \'0785698545\' ,\n                Project_Contact_Dtl   : \'011256665,\n                Contact_Person_Name   : \'gayan,\n                Contact_Person_Email  : \'gayan@gmail.com,\n                Contact_Person_Phone  : \'0112566987,\n                Contact_Person_Mobile : \'076652569\',\n                Added_By              : \'api\'\n                Client_Address        : \'maharagama,\n                Vat_No                : \'233655-600}\";}', '', '::1', '1554179010', '0.24406', '1', '400', '2019-04-02 09:53:30');
INSERT INTO `logs` VALUES ('42', 'datalayer/clientreg', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"552\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=b5176086b12680dee4574ab8b1ab8358e3c625f5\";i:0;s:552:\"{Client_Id             : 888 ,\n                Client_Name           : \'sasanka ,\n                Official_Contact_Dtl  : \'0785698545\' ,\n                Project_Contact_Dtl   : \'011256665,\n                Contact_Person_Name   : \'gayan,\n                Contact_Person_Email  : \'gayan@gmail.com,\n                Contact_Person_Phone  : \'0112566987,\n                Contact_Person_Mobile : \'076652569\',\n                Added_By              : \'api\'\n                Client_Address        : \'maharagama,\n                Vat_No                : \'233655-600}\";i:1;s:552:\"{Client_Id             : 888 ,\n                Client_Name           : \'sasanka ,\n                Official_Contact_Dtl  : \'0785698545\' ,\n                Project_Contact_Dtl   : \'011256665,\n                Contact_Person_Name   : \'gayan,\n                Contact_Person_Email  : \'gayan@gmail.com,\n                Contact_Person_Phone  : \'0112566987,\n                Contact_Person_Mobile : \'076652569\',\n                Added_By              : \'api\'\n                Client_Address        : \'maharagama,\n                Vat_No                : \'233655-600}\";}', '', '::1', '1554179020', '0.253289', '1', '400', '2019-04-02 09:53:40');
INSERT INTO `logs` VALUES ('43', 'datalayer/clientreg', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"394\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=b5176086b12680dee4574ab8b1ab8358e3c625f5\";i:0;s:394:\"{\nClient_Id             : 888 ,\nClient_Name           : \'sasanka ,\nOfficial_Contact_Dtl  : \'0785698545\' ,\nProject_Contact_Dtl   : \'011256665,\nContact_Person_Name   : \'gayan,\nContact_Person_Email  : \'gayan@gmail.com,\nContact_Person_Phone  : \'0112566987,\nContact_Person_Mobile : \'076652569\',\nAdded_By              : \'api\'\nClient_Address        : \'maharagama,\nVat_No                : \'233655-600\n}\";i:1;s:394:\"{\nClient_Id             : 888 ,\nClient_Name           : \'sasanka ,\nOfficial_Contact_Dtl  : \'0785698545\' ,\nProject_Contact_Dtl   : \'011256665,\nContact_Person_Name   : \'gayan,\nContact_Person_Email  : \'gayan@gmail.com,\nContact_Person_Phone  : \'0112566987,\nContact_Person_Mobile : \'076652569\',\nAdded_By              : \'api\'\nClient_Address        : \'maharagama,\nVat_No                : \'233655-600\n}\";}', '', '::1', '1554179082', '0.224287', '1', '400', '2019-04-02 09:54:42');
INSERT INTO `logs` VALUES ('44', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"394\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=b5176086b12680dee4574ab8b1ab8358e3c625f5\";}', '', '::1', '1554179127', '0.331421', '1', '400', '2019-04-02 09:55:27');
INSERT INTO `logs` VALUES ('45', 'datalayer/clientreg', 'post', 'a:13:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"394\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=260a469f57b8306a43ce6cf6545c9e505ab95ccd\";s:394:\"{\nClient_Id_____________:_888_,\nClient_Name___________:_\'sasanka_,\nOfficial_Contact_Dtl__:_\'0785698545\'_,\nProject_Contact_Dtl___:_\'011256665,\nContact_Person_Name___:_\'gayan,\nContact_Person_Email__:_\'gayan@gmail_com,\nContact_Person_Phone__:_\'0112566987,\nContact_Person_Mobile_:_\'076652569\',\nAdded_By______________:_\'api\'\nClient_Address________:_\'maharagama,\nVat_No________________:_\'233655-600\n}\";s:0:\"\";i:0;s:0:\"\";i:1;s:0:\"\";}', '', '::1', '1554179243', '0.366968', '1', '400', '2019-04-02 09:57:23');
INSERT INTO `logs` VALUES ('46', 'datalayer/clientreg', 'post', 'a:13:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"394\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=260a469f57b8306a43ce6cf6545c9e505ab95ccd\";s:394:\"{\nClient_Id_____________:_888_,\nClient_Name___________:_\'sasanka_,\nOfficial_Contact_Dtl__:_\'0785698545\'_,\nProject_Contact_Dtl___:_\'011256665,\nContact_Person_Name___:_\'gayan,\nContact_Person_Email__:_\'gayan@gmail_com,\nContact_Person_Phone__:_\'0112566987,\nContact_Person_Mobile_:_\'076652569\',\nAdded_By______________:_\'api\'\nClient_Address________:_\'maharagama,\nVat_No________________:_\'233655-600\n}\";s:0:\"\";i:0;s:0:\"\";i:1;s:0:\"\";}', '', '::1', '1554179272', '0.286423', '1', '400', '2019-04-02 09:57:52');
INSERT INTO `logs` VALUES ('47', 'datalayer/clientreg', 'post', 'a:22:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"390\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=260a469f57b8306a43ce6cf6545c9e505ab95ccd\";s:22:\"Client_Id_____________\";s:5:\" 888 \";s:23:\"\nClient_Name___________\";s:10:\" \'sasanka \";s:23:\"\nOfficial_Contact_Dtl__\";s:14:\" \'0785698545\' \";s:23:\"\nProject_Contact_Dtl___\";s:11:\" \'011256665\";s:23:\"\nContact_Person_Name___\";s:7:\" \'gayan\";s:23:\"\nContact_Person_Email__\";s:17:\" \'gayan@gmail.com\";s:23:\"\nContact_Person_Phone__\";s:12:\" \'0112566987\";s:23:\"\nContact_Person_Mobile_\";s:12:\" \'076652569\'\";s:23:\"\nAdded_By______________\";s:42:\" \'api\'\nClient_Address        = \'maharagama\";s:23:\"\nVat_No________________\";s:12:\" \'233655-600\";i:0;s:12:\" \'233655-600\";i:1;s:12:\" \'233655-600\";}', '', '::1', '1554179372', '0.368099', '1', '400', '2019-04-02 09:59:33');
INSERT INTO `logs` VALUES ('48', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"390\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=260a469f57b8306a43ce6cf6545c9e505ab95ccd\";}', '', '::1', '1554179445', '0.280024', '1', '400', '2019-04-02 10:00:45');
INSERT INTO `logs` VALUES ('49', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"364\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=1b7bb16789fc730dabf94dee7a4a36ecd2db0eeb\";}', '', '::1', '1554179521', '0.261408', '1', '400', '2019-04-02 10:02:01');
INSERT INTO `logs` VALUES ('50', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"35\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=1b7bb16789fc730dabf94dee7a4a36ecd2db0eeb\";}', '', '::1', '1554179647', '0.27434', '1', '400', '2019-04-02 10:04:07');
INSERT INTO `logs` VALUES ('51', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"36\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=1b7bb16789fc730dabf94dee7a4a36ecd2db0eeb\";}', '', '::1', '1554179669', '0.27607', '1', '400', '2019-04-02 10:04:29');
INSERT INTO `logs` VALUES ('52', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"34\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=1b7bb16789fc730dabf94dee7a4a36ecd2db0eeb\";}', '', '::1', '1554179678', '0.642119', '1', '400', '2019-04-02 10:04:38');
INSERT INTO `logs` VALUES ('53', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"36\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=1b7bb16789fc730dabf94dee7a4a36ecd2db0eeb\";}', '', '::1', '1554179776', '0.323497', '1', '400', '2019-04-02 10:06:16');
INSERT INTO `logs` VALUES ('54', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"13\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=0dee842a19b19f261750bbfc57512f43a9b26274\";}', '', '::1', '1554179791', '0.307337', '1', '400', '2019-04-02 10:06:31');
INSERT INTO `logs` VALUES ('55', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"13\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=0dee842a19b19f261750bbfc57512f43a9b26274\";}', '', '::1', '1554179804', '0.268678', '1', '400', '2019-04-02 10:06:44');
INSERT INTO `logs` VALUES ('56', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"13\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=0dee842a19b19f261750bbfc57512f43a9b26274\";}', '', '::1', '1554179823', '0.22077', '1', '400', '2019-04-02 10:07:03');
INSERT INTO `logs` VALUES ('57', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"13\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=0dee842a19b19f261750bbfc57512f43a9b26274\";}', '', '::1', '1554179832', '0.295859', '1', '400', '2019-04-02 10:07:12');
INSERT INTO `logs` VALUES ('58', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:1:\"0\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=0dee842a19b19f261750bbfc57512f43a9b26274\";}', '', '::1', '1554180106', '0.310194', '1', '400', '2019-04-02 10:11:46');
INSERT INTO `logs` VALUES ('59', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:1:\"0\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=52a8ba798c0de692dfd0a4cbf5887682887e9f2c\";}', '', '::1', '1554182522', '0.317884', '1', '400', '2019-04-02 10:52:02');
INSERT INTO `logs` VALUES ('60', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"13\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=d5ad46f9062d6e84781f5ca1500ff96b3744d2c1\";}', '', '::1', '1554182593', '0.232547', '1', '400', '2019-04-02 10:53:13');
INSERT INTO `logs` VALUES ('61', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"31\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=d5ad46f9062d6e84781f5ca1500ff96b3744d2c1\";}', '', '::1', '1554182625', '0.233011', '1', '400', '2019-04-02 10:53:45');
INSERT INTO `logs` VALUES ('62', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"31\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=d5ad46f9062d6e84781f5ca1500ff96b3744d2c1\";}', '', '::1', '1554182642', '0.224325', '1', '400', '2019-04-02 10:54:02');
INSERT INTO `logs` VALUES ('63', 'datalayer/clientreg', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"31\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=d5ad46f9062d6e84781f5ca1500ff96b3744d2c1\";s:9:\"Client_Id\";s:3:\"625\";s:11:\"Client_Name\";s:5:\"saman\";}', '', '::1', '1554182655', '0.281927', '1', '400', '2019-04-02 10:54:15');
INSERT INTO `logs` VALUES ('64', 'datalayer/clientreg', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:2:\"31\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=d5ad46f9062d6e84781f5ca1500ff96b3744d2c1\";}', '', '::1', '1554182713', '0.238429', '1', '400', '2019-04-02 10:55:14');
INSERT INTO `logs` VALUES ('65', 'datalayer/subcontractor', 'post', 'a:12:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:12:\"Content-Type\";s:24:\"text/plain;charset=UTF-8\";s:14:\"Content-Length\";s:3:\"141\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=e73c6b90505d88146f97a8df6fd1c887973c4730\";i:0;s:141:\"Sub_Contractor_Code=2565&Sub_Contractor_Name=Sahan&Sub_Contractor_Address=colombo3&Land_Phone_No=01112855695&Mobile=0766582569&Fax=0112299685\";i:1;s:141:\"Sub_Contractor_Code=2565&Sub_Contractor_Name=Sahan&Sub_Contractor_Address=colombo3&Land_Phone_No=01112855695&Mobile=0766582569&Fax=0112299685\";}', '', '::1', '1554193889', '0.280637', '1', '400', '2019-04-02 14:01:29');
INSERT INTO `logs` VALUES ('66', 'datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"141\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=e73c6b90505d88146f97a8df6fd1c887973c4730\";}', '', '::1', '1554193926', '0.280621', '1', '400', '2019-04-02 14:02:06');
INSERT INTO `logs` VALUES ('67', 'datalayer/subcontractor', 'post', 'a:16:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:33:\"application/x-www-form-urlencoded\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"141\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=e73c6b90505d88146f97a8df6fd1c887973c4730\";s:19:\"Sub_Contractor_Code\";s:4:\"2565\";s:19:\"Sub_Contractor_Name\";s:5:\"Sahan\";s:22:\"Sub_Contractor_Address\";s:8:\"colombo3\";s:13:\"Land_Phone_No\";s:11:\"01112855695\";s:6:\"Mobile\";s:10:\"0766582569\";s:3:\"Fax\";s:10:\"0112299685\";}', '', '::1', '1554193942', '0.25144', '1', '400', '2019-04-02 14:02:22');
INSERT INTO `logs` VALUES ('68', 'datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"141\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=e73c6b90505d88146f97a8df6fd1c887973c4730\";}', '', '::1', '1554194007', '0.238777', '1', '400', '2019-04-02 14:03:27');
INSERT INTO `logs` VALUES ('69', 'datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"143\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=e73c6b90505d88146f97a8df6fd1c887973c4730\";}', '', '::1', '1554194058', '0.253631', '1', '400', '2019-04-02 14:04:19');
INSERT INTO `logs` VALUES ('70', 'datalayer/subcontractor', 'post', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:14:\"Content-Length\";s:3:\"141\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=i1f0aud9vo9cs31mof20p7dmb7; _csrf=05952957b950733204eb23b5e1ae8a27a6151692bcc083b0b1c57c07330cb74ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22xRc022i9k0uNJE-pu6zQcetaF03XlcHJ%22%3B%7D; ci_session=e73c6b90505d88146f97a8df6fd1c887973c4730\";}', '', '::1', '1554194067', '0.215136', '1', '400', '2019-04-02 14:04:27');
INSERT INTO `logs` VALUES ('71', 'datalayer/subcontractor', 'post', 'a:11:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"fc7fe043-60ed-43b2-9ce1-f17aab53a27a\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=b29244bdcad310a45ae69b8de256914f066b510e\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"414\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1554197136', '0.363417', '1', '400', '2019-04-02 14:55:36');
INSERT INTO `logs` VALUES ('72', 'datalayer/subcontractor', 'post', 'a:11:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b6169e37-77af-4c3f-a11b-5b7e554b1db1\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=b29244bdcad310a45ae69b8de256914f066b510e\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"424\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1554197183', '0.236171', '1', '400', '2019-04-02 14:56:23');
INSERT INTO `logs` VALUES ('73', 'datalayer/subcontractor', 'post', 'a:22:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e2c53f27-4f7a-4278-8a74-f8ff270647e5\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=b29244bdcad310a45ae69b8de256914f066b510e\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"424\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"Client_Id\";s:3:\"888\";s:11:\"Client_Name\";s:7:\"sasanka\";s:20:\"Official_Contact_Dtl\";s:10:\"0785698545\";s:19:\"Project_Contact_Dtl\";s:9:\"011256665\";s:19:\"Contact_Person_Name\";s:5:\"gayan\";s:20:\"Contact_Person_Email\";s:15:\"gayan@gmail.com\";s:20:\"Contact_Person_Phone\";s:10:\"0112566987\";s:21:\"Contact_Person_Mobile\";s:9:\"076652569\";s:8:\"Added_By\";s:3:\"api\";s:14:\"Client_Address\";s:10:\"maharagama\";s:6:\"Vat_No\";s:10:\"233655-600\";}', '', '::1', '1554197290', '0.194634', '1', '400', '2019-04-02 14:58:10');
INSERT INTO `logs` VALUES ('74', 'datalayer/clientreg', 'post', 'a:22:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"26bd1e79-7380-40ad-9610-195ea8415935\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=b29244bdcad310a45ae69b8de256914f066b510e\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"424\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"Client_Id\";s:3:\"888\";s:11:\"Client_Name\";s:7:\"sasanka\";s:20:\"Official_Contact_Dtl\";s:10:\"0785698545\";s:19:\"Project_Contact_Dtl\";s:9:\"011256665\";s:19:\"Contact_Person_Name\";s:5:\"gayan\";s:20:\"Contact_Person_Email\";s:15:\"gayan@gmail.com\";s:20:\"Contact_Person_Phone\";s:10:\"0112566987\";s:21:\"Contact_Person_Mobile\";s:9:\"076652569\";s:8:\"Added_By\";s:3:\"api\";s:14:\"Client_Address\";s:10:\"maharagama\";s:6:\"Vat_No\";s:10:\"233655-600\";}', '', '::1', '1554197403', '2.66057', '1', '0', '2019-04-02 15:00:03');
INSERT INTO `logs` VALUES ('75', 'datalayer/clientreg', 'post', 'a:22:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"7706e83b-f07f-4dea-8cac-96d9e5a23242\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=b29244bdcad310a45ae69b8de256914f066b510e\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"424\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"Client_Id\";s:3:\"888\";s:11:\"Client_Name\";s:7:\"sasanka\";s:20:\"Official_Contact_Dtl\";s:10:\"0785698545\";s:19:\"Project_Contact_Dtl\";s:9:\"011256665\";s:19:\"Contact_Person_Name\";s:5:\"gayan\";s:20:\"Contact_Person_Email\";s:15:\"gayan@gmail.com\";s:20:\"Contact_Person_Phone\";s:10:\"0112566987\";s:21:\"Contact_Person_Mobile\";s:9:\"076652569\";s:8:\"Added_By\";s:3:\"api\";s:14:\"Client_Address\";s:10:\"maharagama\";s:6:\"Vat_No\";s:10:\"233655-600\";}', '', '::1', '1554197454', '0.200215', '1', '0', '2019-04-02 15:00:54');
INSERT INTO `logs` VALUES ('76', 'datalayer/clientreg', 'post', 'a:22:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"9b8dbb4c-7cb1-4beb-a03f-f5fa9a795e4d\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=378f89bd82a03462d7605fe3bad4de4f973375e3\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"424\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"Client_Id\";s:3:\"888\";s:11:\"Client_Name\";s:7:\"sasanka\";s:20:\"Official_Contact_Dtl\";s:10:\"0785698545\";s:19:\"Project_Contact_Dtl\";s:9:\"011256665\";s:19:\"Contact_Person_Name\";s:5:\"gayan\";s:20:\"Contact_Person_Email\";s:15:\"gayan@gmail.com\";s:20:\"Contact_Person_Phone\";s:10:\"0112566987\";s:21:\"Contact_Person_Mobile\";s:9:\"076652569\";s:8:\"Added_By\";s:3:\"api\";s:14:\"Client_Address\";s:10:\"maharagama\";s:6:\"Vat_No\";s:10:\"233655-600\";}', '', '::1', '1554198136', '0.372045', '1', '201', '2019-04-02 15:12:16');
INSERT INTO `logs` VALUES ('77', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"6b3b9470-fbd6-4df9-a01d-11079eb1aaa1\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=d7409df21b5ad89c6c1619572e6fcfdf0eef5877\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"199\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";s:6:\"250000\";s:16:\"retention_amount\";s:4:\"9000\";}', '', '::1', '1554199186', '0.296857', '1', '400', '2019-04-02 15:29:46');
INSERT INTO `logs` VALUES ('78', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"4d6ce842-ce0e-438a-81e9-3b71cc80778b\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=d7409df21b5ad89c6c1619572e6fcfdf0eef5877\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199208', '0.243209', '1', '400', '2019-04-02 15:30:08');
INSERT INTO `logs` VALUES ('79', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"65b3dbc3-83b3-4dbe-87f3-de25a070eff7\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=d7409df21b5ad89c6c1619572e6fcfdf0eef5877\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199242', '0.323473', '1', '400', '2019-04-02 15:30:42');
INSERT INTO `logs` VALUES ('80', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b300f3e9-8f5a-41eb-bbb8-a6d04c0c05fc\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=d7409df21b5ad89c6c1619572e6fcfdf0eef5877\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199279', '0.369601', '1', '400', '2019-04-02 15:31:19');
INSERT INTO `logs` VALUES ('81', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"5a5e8e48-dc87-4bd4-b92c-b1b18d29cc52\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=d7409df21b5ad89c6c1619572e6fcfdf0eef5877\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199431', '0.276454', '1', '400', '2019-04-02 15:33:51');
INSERT INTO `logs` VALUES ('82', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"cb70d73c-b83d-47e2-8f2f-da36cb6a11ae\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=d7409df21b5ad89c6c1619572e6fcfdf0eef5877\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199499', '0.263857', '1', '400', '2019-04-02 15:34:59');
INSERT INTO `logs` VALUES ('83', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"43db010e-480d-4dfc-b7e9-dc5e548fac4d\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=ab48d59ccca3a997fb7015d6b3b29bca3ee46465\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199524', '0.2417', '1', '400', '2019-04-02 15:35:24');
INSERT INTO `logs` VALUES ('84', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8307f466-242f-4231-aefb-4b69a90810fc\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=ab48d59ccca3a997fb7015d6b3b29bca3ee46465\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199540', '0.403073', '1', '400', '2019-04-02 15:35:41');
INSERT INTO `logs` VALUES ('85', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"31e84a5c-7bfc-478c-8647-e8f040f78e85\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=ab48d59ccca3a997fb7015d6b3b29bca3ee46465\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199550', '0.390193', '1', '0', '2019-04-02 15:35:50');
INSERT INTO `logs` VALUES ('86', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"3ab99573-0b02-4e3f-9ced-0efdd3110045\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=ab48d59ccca3a997fb7015d6b3b29bca3ee46465\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"196\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:100;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199818', '0.311686', '1', '400', '2019-04-02 15:40:18');
INSERT INTO `logs` VALUES ('87', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d366c348-0580-489f-8693-c477026a6e80\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=e71bfa6371f2fda1694f38a97c755e150f6cbfec\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199827', '0.512548', '1', '400', '2019-04-02 15:40:28');
INSERT INTO `logs` VALUES ('88', 'datalayer/clientbill', 'post', 'a:17:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"cache-control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"76df7d28-61eb-44b6-84d9-34f06cda5470\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:20:\"PostmanRuntime/7.6.1\";s:6:\"Accept\";s:3:\"*/*\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=e71bfa6371f2fda1694f38a97c755e150f6cbfec\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"195\";s:10:\"Connection\";s:10:\"keep-alive\";s:9:\"bill_date\";s:10:\"2018-05-20\";s:11:\"Client_Code\";i:10;s:13:\"Client_ID_PMS\";i:29;s:11:\"particulars\";s:20:\"ddsds dfdfdfdfd llll\";s:6:\"amount\";i:250000;s:16:\"retention_amount\";i:9000;}', '', '::1', '1554199854', '0.209832', '1', '400', '2019-04-02 15:40:54');
INSERT INTO `logs` VALUES ('89', 'datalayer/payable', 'post', 'a:20:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"700f011e-6670-4dc5-800a-38fb13df1436\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=09dfe0ab78a73d9aa5db0e9601d4fc0451be0430\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"331\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"due_date\";s:10:\"2019-05-30\";s:14:\"acc_project_id\";i:2;s:10:\"payee_name\";i:1;s:14:\"payable_amount\";i:25000;s:11:\"description\";s:17:\"test payable flet\";s:16:\"expense_category\";i:3;s:11:\"period_from\";s:10:\"2019-01-06\";s:9:\"period_to\";s:10:\"2020-01-05\";s:8:\"added_by\";s:5:\"FLEET\";}', '', '::1', '1559078350', '0.210808', '1', '0', '2019-05-29 02:49:10');
INSERT INTO `logs` VALUES ('90', 'datalayer/payable', 'post', 'a:20:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"31885ee0-6817-4df8-aae4-05568e727a84\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=09dfe0ab78a73d9aa5db0e9601d4fc0451be0430\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"335\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"due_date\";s:10:\"2019-05-30\";s:14:\"acc_project_id\";i:2;s:10:\"payee_name\";s:5:\"Nimal\";s:14:\"payable_amount\";i:25000;s:11:\"description\";s:17:\"test payable flet\";s:16:\"expense_category\";i:3;s:11:\"period_from\";s:10:\"2019-01-06\";s:9:\"period_to\";s:10:\"2020-01-05\";s:8:\"added_by\";s:5:\"FLEET\";}', '', '::1', '1559078512', '0.170196', '1', '0', '2019-05-29 02:51:52');
INSERT INTO `logs` VALUES ('91', 'datalayer/payable', 'post', 'a:20:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"879c1449-ef9f-4d09-8361-23e4e8376174\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=b780d726ee92a682ebd32f8b691f7cfc3f59bf7a\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"335\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"due_date\";s:10:\"2019-05-30\";s:14:\"acc_project_id\";i:2;s:10:\"payee_name\";s:5:\"Nimal\";s:14:\"payable_amount\";i:25000;s:11:\"description\";s:17:\"test payable flet\";s:16:\"expense_category\";i:3;s:11:\"period_from\";s:10:\"2019-01-06\";s:9:\"period_to\";s:10:\"2020-01-05\";s:8:\"added_by\";s:5:\"FLEET\";}', '', '::1', '1559078617', '0.152652', '1', '0', '2019-05-29 02:53:37');
INSERT INTO `logs` VALUES ('92', 'datalayer/payable', 'post', 'a:20:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"37abe53d-572c-49a2-a42b-587a83ee17ea\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=b780d726ee92a682ebd32f8b691f7cfc3f59bf7a\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"335\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"due_date\";s:10:\"2019-05-30\";s:14:\"acc_project_id\";i:2;s:10:\"payee_name\";s:5:\"Nimal\";s:14:\"payable_amount\";i:25000;s:11:\"description\";s:17:\"test payable flet\";s:16:\"expense_category\";i:3;s:11:\"period_from\";s:10:\"2019-01-06\";s:9:\"period_to\";s:10:\"2020-01-05\";s:8:\"added_by\";s:5:\"FLEET\";}', '', '::1', '1559078711', '0.292466', '1', '400', '2019-05-29 02:55:11');
INSERT INTO `logs` VALUES ('93', 'datalayer/payable', 'post', 'a:20:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"05fa785b-c21f-4f28-8039-cd03cb92e3b7\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=b780d726ee92a682ebd32f8b691f7cfc3f59bf7a\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"335\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"due_date\";s:10:\"2019-05-30\";s:14:\"acc_project_id\";i:2;s:10:\"payee_name\";s:5:\"Nimal\";s:14:\"payable_amount\";i:25000;s:11:\"description\";s:17:\"test payable flet\";s:16:\"expense_category\";i:3;s:11:\"period_from\";s:10:\"2019-01-06\";s:9:\"period_to\";s:10:\"2020-01-05\";s:8:\"added_by\";s:5:\"FLEET\";}', '', '::1', '1559078770', '0.188605', '1', '0', '2019-05-29 02:56:11');
INSERT INTO `logs` VALUES ('94', 'datalayer/payable', 'post', 'a:20:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"225c359c-ee67-4790-a159-10c0451d526c\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=b780d726ee92a682ebd32f8b691f7cfc3f59bf7a\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"335\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"due_date\";s:10:\"2019-05-30\";s:14:\"acc_project_id\";i:2;s:10:\"payee_name\";s:5:\"Nimal\";s:14:\"payable_amount\";i:25000;s:11:\"description\";s:17:\"test payable flet\";s:16:\"expense_category\";i:3;s:11:\"period_from\";s:10:\"2019-01-06\";s:9:\"period_to\";s:10:\"2020-01-05\";s:8:\"added_by\";s:5:\"FLEET\";}', '', '::1', '1559078930', '0.213215', '1', '0', '2019-05-29 02:58:50');
INSERT INTO `logs` VALUES ('95', 'datalayer/payable', 'post', 'a:20:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"29aa6d04-0e21-40f1-9725-4fb84f7a4fb3\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=405d4eedff64b9eea3509716d56b3b9dc3c72f7f\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"335\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"due_date\";s:10:\"2019-05-30\";s:14:\"acc_project_id\";i:2;s:10:\"payee_name\";s:5:\"Nimal\";s:14:\"payable_amount\";i:25000;s:11:\"description\";s:17:\"test payable flet\";s:16:\"expense_category\";i:3;s:11:\"period_from\";s:10:\"2019-01-06\";s:9:\"period_to\";s:10:\"2020-01-05\";s:8:\"added_by\";s:5:\"FLEET\";}', '', '::1', '1559078946', '0.357907', '1', '201', '2019-05-29 02:59:06');
INSERT INTO `logs` VALUES ('96', 'datalayer/project_register', 'post', 'a:13:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"de775b3a-c8b8-4392-96f3-f65cf91d6b4a\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=405d4eedff64b9eea3509716d56b3b9dc3c72f7f\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"76\";s:10:\"Connection\";s:10:\"keep-alive\";s:13:\"business_name\";s:10:\"Galle Site\";s:14:\"PMS_project_id\";s:3:\"256\";}', '', '::1', '1559080089', '0.239877', '1', '400', '2019-05-29 03:18:09');
INSERT INTO `logs` VALUES ('97', 'datalayer/project_register', 'post', 'a:13:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"5a32522f-c075-4a04-90f9-7e397bc58298\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=1f9e0afa61d49492037a960bb01381dc07029dd2\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"75\";s:10:\"Connection\";s:10:\"keep-alive\";s:12:\"project_name\";s:10:\"Galle Site\";s:14:\"PMS_project_id\";s:3:\"256\";}', '', '::1', '1559080104', '0.234055', '1', '201', '2019-05-29 03:18:24');
INSERT INTO `logs` VALUES ('98', 'datalayer/payable', 'post', 'a:20:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"29a7fbd5-f637-4b28-9b29-3ee89215f65b\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=1f9e0afa61d49492037a960bb01381dc07029dd2\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:3:\"335\";s:10:\"Connection\";s:10:\"keep-alive\";s:8:\"due_date\";s:10:\"2019-05-30\";s:14:\"pms_project_id\";i:2;s:10:\"payee_name\";s:5:\"Nimal\";s:14:\"payable_amount\";i:25000;s:11:\"description\";s:17:\"test payable flet\";s:16:\"expense_category\";i:3;s:11:\"period_from\";s:10:\"2019-01-06\";s:9:\"period_to\";s:10:\"2020-01-05\";s:8:\"added_by\";s:5:\"FLEET\";}', '', '::1', '1559081466', '0.276912', '1', '400', '2019-05-29 03:41:07');
INSERT INTO `logs` VALUES ('99', 'datalayer/project_register', 'post', 'a:13:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"083738cb-9a01-45b6-b967-bf95bb2a122f\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=4a25b173ca3ad3469682dd1dcf1badda7cdd4555\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"75\";s:10:\"Connection\";s:10:\"keep-alive\";s:12:\"project_name\";s:11:\"Matara Site\";s:14:\"PMS_project_id\";s:2:\"20\";}', '', '::1', '1559081524', '0.307726', '1', '201', '2019-05-29 03:42:05');
INSERT INTO `logs` VALUES ('100', 'datalayer/project_register', 'post', 'a:13:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"e832c7b5-2c58-4483-b8bb-27b674ad0cee\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=4a25b173ca3ad3469682dd1dcf1badda7cdd4555\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"77\";s:10:\"Connection\";s:10:\"keep-alive\";s:12:\"project_name\";s:13:\"Kohuwala Site\";s:14:\"PMS_project_id\";s:2:\"20\";}', '', '::1', '1559081606', '0.227896', '1', '201', '2019-05-29 03:43:26');
INSERT INTO `logs` VALUES ('101', 'datalayer/project_register', 'post', 'a:13:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"5169c04f-9e01-4baa-bccc-287d4c7b56b0\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=4a25b173ca3ad3469682dd1dcf1badda7cdd4555\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"77\";s:10:\"Connection\";s:10:\"keep-alive\";s:12:\"project_name\";s:13:\"Kohuwala Site\";s:14:\"PMS_project_id\";s:2:\"20\";}', '', '::1', '1559081655', '0.244013', '1', '400', '2019-05-29 03:44:15');
INSERT INTO `logs` VALUES ('102', 'datalayer/project_register', 'post', 'a:13:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"58df9889-0b4e-4f05-9811-714b6ddcfa36\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=4a25b173ca3ad3469682dd1dcf1badda7cdd4555\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"77\";s:10:\"Connection\";s:10:\"keep-alive\";s:12:\"project_name\";s:13:\"Kohuwala Site\";s:14:\"PMS_project_id\";s:2:\"20\";}', '', '::1', '1559081687', '0.306038', '1', '201', '2019-05-29 03:44:47');
INSERT INTO `logs` VALUES ('103', 'datalayer/expense_categories', 'get', 'a:10:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"27bdfbc4-81b8-49b6-8c26-93d43afc9f78\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=4a25b173ca3ad3469682dd1dcf1badda7cdd4555\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559084146', '0.224128', '1', '400', '2019-05-29 04:25:46');
INSERT INTO `logs` VALUES ('104', 'datalayer/expense_categories', 'get', 'a:10:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"2660c769-9ee6-4d10-91a7-b0ec6f649dc5\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=d431a7e5e6a28f142e57777a8991db075889ecd7\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559084171', '0.160119', '1', '0', '2019-05-29 04:26:11');
INSERT INTO `logs` VALUES ('105', 'datalayer/expense_categories', 'get', 'a:10:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"eaba6784-b357-43ca-994b-440a48959695\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=d431a7e5e6a28f142e57777a8991db075889ecd7\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559084202', '0.234087', '1', '200', '2019-05-29 04:26:42');
INSERT INTO `logs` VALUES ('106', 'datalayer/expense_sub_categories', 'get', 'a:9:{s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"6d7401aa-8043-4ece-a41b-7fabef930153\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=d431a7e5e6a28f142e57777a8991db075889ecd7\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086431', '0.292302', '1', '400', '2019-05-29 05:03:51');
INSERT INTO `logs` VALUES ('107', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"221b3846-966a-4205-9fcf-7a2361225447\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=0e5df0534444d544dacedca22d70284175d4d499\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"15\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086481', '0.22817', '1', '400', '2019-05-29 05:04:42');
INSERT INTO `logs` VALUES ('108', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:9:\"text/html\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"912744fd-e747-4f5c-948e-f9866de2cc31\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=0e5df0534444d544dacedca22d70284175d4d499\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"15\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086494', '0.243895', '1', '400', '2019-05-29 05:04:55');
INSERT INTO `logs` VALUES ('109', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:9:\"text/html\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d7873009-f18f-49fb-8adc-9f04cd896162\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=0e5df0534444d544dacedca22d70284175d4d499\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"15\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086512', '0.17673', '1', '0', '2019-05-29 05:05:12');
INSERT INTO `logs` VALUES ('110', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:9:\"text/html\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"dd5fe18f-55e0-4bb1-9f2d-3133073afce9\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=0e5df0534444d544dacedca22d70284175d4d499\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"15\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086585', '0.208783', '1', '400', '2019-05-29 05:06:25');
INSERT INTO `logs` VALUES ('111', 'datalayer/expense_sub_categories', 'get', 'a:9:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=afc6a90438b7f9b216ad9a5364d9d3d7f8c9c5b2\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";}', '', '::1', '1559086719', '0.283675', '1', '400', '2019-05-29 05:08:39');
INSERT INTO `logs` VALUES ('112', 'datalayer/expense_sub_categories', 'get', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=afc6a90438b7f9b216ad9a5364d9d3d7f8c9c5b2\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', '1559086764', '0.310806', '1', '0', '2019-05-29 05:09:24');
INSERT INTO `logs` VALUES ('113', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:9:\"text/html\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"09da6c78-c30f-4953-802d-a0aab07ba961\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=0e5df0534444d544dacedca22d70284175d4d499\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"15\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086797', '0.188185', '1', '400', '2019-05-29 05:09:57');
INSERT INTO `logs` VALUES ('114', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:9:\"text/html\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"6e773da3-b4fc-404e-9f42-d1e7f4cb2076\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=52db0dc5e4e47e9bd47174486b5a09c505a11888\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"17\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086821', '0.209926', '1', '400', '2019-05-29 05:10:21');
INSERT INTO `logs` VALUES ('115', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"da1b9fbe-f56c-48af-9b02-ef4f39eba50c\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=52db0dc5e4e47e9bd47174486b5a09c505a11888\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"17\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086837', '0.190579', '1', '400', '2019-05-29 05:10:37');
INSERT INTO `logs` VALUES ('116', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:9:\"text/html\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b6357e8d-d336-4a07-a302-efe5956ee67c\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=52db0dc5e4e47e9bd47174486b5a09c505a11888\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"17\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086859', '0.179019', '1', '400', '2019-05-29 05:10:59');
INSERT INTO `logs` VALUES ('117', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"dc778667-78c4-4201-9a3c-4b27ce7cc51f\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=52db0dc5e4e47e9bd47174486b5a09c505a11888\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"17\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559086866', '0.254862', '1', '400', '2019-05-29 05:11:06');
INSERT INTO `logs` VALUES ('118', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"146e604b-4ca0-468d-928c-c68a556d8360\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=52db0dc5e4e47e9bd47174486b5a09c505a11888\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"17\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559087266', '0.248588', '1', '400', '2019-05-29 05:17:46');
INSERT INTO `logs` VALUES ('119', 'datalayer/expense_sub_categories', 'get', 'a:9:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=afc6a90438b7f9b216ad9a5364d9d3d7f8c9c5b2\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '::1', '1559087283', '0.329407', '1', '400', '2019-05-29 05:18:03');
INSERT INTO `logs` VALUES ('120', 'datalayer/expense_sub_categories', 'get', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=0bfe6661046701adbbd356109af6837212e07942\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', '1559087953', '0.245197', '1', '0', '2019-05-29 05:29:13');
INSERT INTO `logs` VALUES ('121', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"56d7dfc5-d442-4567-9ac7-90b94dafb03e\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=f5a6f9a5f8545a58353a8e218156b1642aa65a89\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"17\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559087960', '0.215668', '1', '0', '2019-05-29 05:29:20');
INSERT INTO `logs` VALUES ('122', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"a37b3368-a254-41b8-a931-80a3b3bf9e8b\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=6b55210f1257aafe62b1053fda0c86777ffeecc8\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"17\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559088076', '0.229332', '1', '400', '2019-05-29 05:31:16');
INSERT INTO `logs` VALUES ('123', 'datalayer/expense_sub_categories', 'get', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=b3e3db39c144320432b09941cbeb92866a17d533\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', '1559088094', '0.301252', '1', '400', '2019-05-29 05:31:34');
INSERT INTO `logs` VALUES ('124', 'datalayer/expense_categories', 'get', 'a:9:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=b3e3db39c144320432b09941cbeb92866a17d533\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '::1', '1559088108', '0.365782', '1', '200', '2019-05-29 05:31:48');
INSERT INTO `logs` VALUES ('125', 'datalayer/expense_sub_categories', 'get', 'a:9:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=b3e3db39c144320432b09941cbeb92866a17d533\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '::1', '1559088113', '0.243799', '1', '400', '2019-05-29 05:31:53');
INSERT INTO `logs` VALUES ('126', 'datalayer/expense_sub_categories', 'get', 'a:11:{s:12:\"Content-Type\";s:16:\"application/json\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.11.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"8e528805-19e5-4ad5-92f5-ec14351af9f1\";s:4:\"Host\";s:12:\"localhost:90\";s:6:\"cookie\";s:51:\"ci_session=6b55210f1257aafe62b1053fda0c86777ffeecc8\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:2:\"17\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '::1', '1559088149', '0.142592', '1', '0', '2019-05-29 05:32:29');
INSERT INTO `logs` VALUES ('127', 'datalayer/expense_sub_categories', 'get', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=b3e3db39c144320432b09941cbeb92866a17d533\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', '1559088164', '0.349615', '1', '0', '2019-05-29 05:32:44');
INSERT INTO `logs` VALUES ('128', 'datalayer/expense_sub_categories', 'get', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=b3e3db39c144320432b09941cbeb92866a17d533\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', '1559088410', '0.195095', '1', '0', '2019-05-29 05:36:51');
INSERT INTO `logs` VALUES ('129', 'datalayer/expense_sub_categories', 'get', 'a:10:{s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=d7684f060e65dc9a99402059e703c2e439654f65\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', '1559088423', '0.426682', '1', '400', '2019-05-29 05:37:03');
INSERT INTO `logs` VALUES ('130', 'datalayer/expense_sub_categories/exp_id', 'get', 'a:10:{s:6:\"exp_id\";N;s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=d7684f060e65dc9a99402059e703c2e439654f65\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '::1', '1559088468', '0.433683', '1', '400', '2019-05-29 05:37:48');
INSERT INTO `logs` VALUES ('131', 'datalayer/expense_sub_categories/exp_id', 'get', 'a:10:{s:6:\"exp_id\";N;s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=d7684f060e65dc9a99402059e703c2e439654f65\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '::1', '1559088646', '0.38267', '1', '400', '2019-05-29 05:40:46');
INSERT INTO `logs` VALUES ('132', 'datalayer/expense_sub_categories/exp_id=5', 'get', 'a:10:{s:8:\"exp_id=5\";N;s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=d7684f060e65dc9a99402059e703c2e439654f65\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '::1', '1559088651', '0.33579', '1', '400', '2019-05-29 05:40:51');
INSERT INTO `logs` VALUES ('133', 'datalayer/expense_sub_categories/exp_id=5', 'get', 'a:10:{s:8:\"exp_id=5\";N;s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=d7684f060e65dc9a99402059e703c2e439654f65\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '::1', '1559088672', '0.294496', '1', '0', '2019-05-29 05:41:12');
INSERT INTO `logs` VALUES ('134', 'datalayer/expense_sub_categories/exp_id=5', 'get', 'a:11:{s:8:\"exp_id=5\";N;s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=d7684f060e65dc9a99402059e703c2e439654f65\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', '1559088704', '0.229556', '1', '0', '2019-05-29 05:41:44');
INSERT INTO `logs` VALUES ('135', 'datalayer/expense_sub_categories/exp_id=5', 'get', 'a:10:{s:8:\"exp_id=5\";N;s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=d7684f060e65dc9a99402059e703c2e439654f65\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";}', '', '::1', '1559088706', '0.202655', '1', '0', '2019-05-29 05:41:46');
INSERT INTO `logs` VALUES ('136', 'datalayer/expense_sub_categories/exp_id=5', 'get', 'a:11:{s:8:\"exp_id=5\";N;s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=d7684f060e65dc9a99402059e703c2e439654f65\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', '1559088716', '0.321918', '1', '400', '2019-05-29 05:41:57');
INSERT INTO `logs` VALUES ('137', 'datalayer/expense_sub_categories/exp_id=5', 'get', 'a:11:{s:8:\"exp_id=5\";N;s:4:\"Host\";s:12:\"localhost:90\";s:10:\"User-Agent\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:14:\"en-US,en;q=0.5\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Cookie\";s:274:\"pnctest=1; PHPSESSID=nqh11r003pbt5ilatpvslmlve2; _csrf=ee2880e7ca2edb68a43543e26683cd0c7a2462b6b3f50b87d3906e299fc025aea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22KA8I94pksbtbdkrtsZxYyatuOMOVOxZI%22%3B%7D; ci_session=ae4289096da81ed57132c62f93a065a19223ec1f\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";s:13:\"Cache-Control\";s:9:\"max-age=0\";}', '', '::1', '1559088727', '0.360628', '1', '400', '2019-05-29 05:42:07');
INSERT INTO `logs` VALUES ('138', 'datalayer/subcontractor', 'post', 'a:17:{s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:4:\"Host\";s:13:\"cirruspms.com\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Encoding\";s:13:\"deflate, gzip\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"252\";s:19:\"Sub_Contractor_Code\";s:3:\"287\";s:19:\"Sub_Contractor_Name\";s:17:\"Indika Wickramage\";s:22:\"Sub_Contractor_Address\";s:7:\"Colombo\";s:13:\"Land_Phone_No\";s:0:\"\";s:6:\"Mobile\";s:0:\"\";s:3:\"Fax\";s:0:\"\";s:3:\"NBT\";s:0:\"\";s:17:\"Is_VAT_Registered\";s:1:\"0\";s:14:\"Registation_No\";s:0:\"\";s:17:\"VAT_For_Transport\";i:0;s:11:\"Attn_Person\";s:14:\"JA Ariyawansha\";}', '', '158.69.200.58', '1559554433', '0.987074', '1', '201', '2019-06-03 15:03:53');
INSERT INTO `logs` VALUES ('139', 'datalayer/clientbill', 'post', 'a:12:{s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:4:\"Host\";s:13:\"cirruspms.com\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Encoding\";s:13:\"deflate, gzip\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"129\";s:9:\"bill_date\";s:10:\"2019-06-03\";s:13:\"Client_ID_PMS\";s:1:\"4\";s:11:\"Particulars\";s:2:\"43\";s:6:\"amount\";s:6:\"100000\";s:16:\"retention_amount\";s:3:\"100\";s:10:\"Project_id\";s:5:\"SR001\";}', '', '158.69.200.58', '1559558384', '1.78014', '1', '400', '2019-06-03 16:09:46');
INSERT INTO `logs` VALUES ('140', 'datalayer/subcontractor', 'post', 'a:17:{s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:4:\"Host\";s:13:\"cirruspms.com\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Encoding\";s:13:\"deflate, gzip\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"246\";s:19:\"Sub_Contractor_Code\";s:3:\"318\";s:19:\"Sub_Contractor_Name\";s:21:\"test & com pvt (Ltd.)\";s:22:\"Sub_Contractor_Address\";s:5:\"sgedg\";s:13:\"Land_Phone_No\";s:0:\"\";s:6:\"Mobile\";s:0:\"\";s:3:\"Fax\";s:0:\"\";s:3:\"NBT\";s:0:\"\";s:17:\"Is_VAT_Registered\";s:1:\"0\";s:14:\"Registation_No\";s:0:\"\";s:17:\"VAT_For_Transport\";i:0;s:11:\"Attn_Person\";s:6:\"dsgdsg\";}', '', '158.69.200.58', '1562059450', '0.86086', '1', '201', '2019-07-02 14:54:10');
INSERT INTO `logs` VALUES ('141', 'datalayer/daily_attendance', 'post', 'a:13:{s:13:\"Authorization\";s:30:\"Basic cG1zX3VzZXI6cG1zdXNlcg==\";s:4:\"Host\";s:13:\"cirruspms.com\";s:6:\"Accept\";s:3:\"*/*\";s:15:\"Accept-Encoding\";s:13:\"deflate, gzip\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Content-Length\";s:3:\"142\";s:12:\"project_code\";s:3:\"190\";s:4:\"date\";s:10:\"2019-07-14\";s:8:\"out_date\";s:10:\"2019-07-14\";s:11:\"employee_no\";i:333;s:7:\"in_time\";s:8:\"07:52:00\";s:8:\"out_time\";s:8:\"19:30:00\";s:10:\"created_by\";i:1;}', '', '158.69.200.58', '1563218241', '0.200904', '1', '201', '2019-07-16 00:47:21');

-- ----------------------------
-- Table structure for `ma_client`
-- ----------------------------
DROP TABLE IF EXISTS `ma_client`;
CREATE TABLE `ma_client` (
  `Client_Code` int(4) NOT NULL AUTO_INCREMENT,
  `Client_Id` int(11) DEFAULT NULL,
  `Client_Name` varchar(100) NOT NULL,
  `Official_Contact_Dtl` varchar(100) DEFAULT NULL,
  `Project_Contact_Dtl` varchar(100) DEFAULT NULL,
  `Contact_Person_Name` varchar(100) DEFAULT NULL,
  `Contact_Person_Email` varchar(100) DEFAULT NULL,
  `Contact_Person_Phone` varchar(15) DEFAULT NULL,
  `Contact_Person_Mobile` varchar(15) DEFAULT NULL,
  `Added_By` varchar(50) NOT NULL,
  `Added_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Edited_By` varchar(50) DEFAULT NULL,
  `Edited_Date` date DEFAULT NULL,
  `Client_Address` varchar(1024) DEFAULT NULL,
  `Vat_No` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Client_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ma_client
-- ----------------------------
INSERT INTO `ma_client` VALUES ('10', '888', 'sasanka', '0785698545', '011256665', 'gayan', 'gayan@gmail.com', '0112566987', '076652569', 'pms_user', '2019-04-02 15:12:16', null, null, 'maharagama', '233655-600');

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1549232751');

-- ----------------------------
-- Table structure for `payee_master`
-- ----------------------------
DROP TABLE IF EXISTS `payee_master`;
CREATE TABLE `payee_master` (
  `payee_id` int(11) NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(50) NOT NULL,
  `payee_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`payee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payee_master
-- ----------------------------
INSERT INTO `payee_master` VALUES ('1', 'bimalka', 'active');

-- ----------------------------
-- Table structure for `payer_master`
-- ----------------------------
DROP TABLE IF EXISTS `payer_master`;
CREATE TABLE `payer_master` (
  `payer_id` int(11) NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(100) NOT NULL,
  `payer_status` varchar(50) NOT NULL,
  PRIMARY KEY (`payer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payer_master
-- ----------------------------
INSERT INTO `payer_master` VALUES ('1', 'bimalka', 'active');

-- ----------------------------
-- Table structure for `payment_application`
-- ----------------------------
DROP TABLE IF EXISTS `payment_application`;
CREATE TABLE `payment_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_date` date DEFAULT NULL,
  `Client_Code` int(11) NOT NULL,
  `Client_ID_PMS` int(11) DEFAULT NULL,
  `client_address` varchar(200) DEFAULT NULL,
  `particulars` varchar(200) DEFAULT NULL,
  `amount` double NOT NULL,
  `invoice_status` varchar(20) NOT NULL,
  `retention_amount` double NOT NULL,
  `business_id` int(4) NOT NULL,
  `added_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment_application
-- ----------------------------
INSERT INTO `payment_application` VALUES ('1', '2022-12-26', '10', '888', '118', null, '1200', 'invoice', '2000', '1', null);

-- ----------------------------
-- Table structure for `receivable_category`
-- ----------------------------
DROP TABLE IF EXISTS `receivable_category`;
CREATE TABLE `receivable_category` (
  `Receivable_Cat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Receivable_Category` varchar(100) NOT NULL,
  `Cat_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Receivable_Cat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receivable_category
-- ----------------------------
INSERT INTO `receivable_category` VALUES ('1', 'Rent Advance', null);
INSERT INTO `receivable_category` VALUES ('2', 'Invoice', null);

-- ----------------------------
-- Table structure for `statement_type`
-- ----------------------------
DROP TABLE IF EXISTS `statement_type`;
CREATE TABLE `statement_type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `statement_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of statement_type
-- ----------------------------
INSERT INTO `statement_type` VALUES ('1', 'Balance Sheet');
INSERT INTO `statement_type` VALUES ('2', 'Profit and Loss');

-- ----------------------------
-- Table structure for `subcontractor_bills`
-- ----------------------------
DROP TABLE IF EXISTS `subcontractor_bills`;
CREATE TABLE `subcontractor_bills` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `payee_name` varchar(100) NOT NULL,
  `bill_amount` double NOT NULL,
  `bill_date` date NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `received_date` date NOT NULL,
  `bill_status` varchar(10) NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `business_id` (`business_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of subcontractor_bills
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_users`
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usename` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name_of_user` varchar(50) NOT NULL,
  `user_status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('90', 'pms_user', 'cG1zdXNlcg==', 'PMS Syncer', '1');

-- ----------------------------
-- Table structure for `tax`
-- ----------------------------
DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(100) NOT NULL,
  `short_name` varchar(20) DEFAULT NULL,
  `tax_ratio` int(11) DEFAULT '0',
  `amount` double DEFAULT '0',
  `effective_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tax
-- ----------------------------
INSERT INTO `tax` VALUES ('1', 'Value-added Tax', 'VAT', '15', null, '2019-03-27', 'active');
INSERT INTO `tax` VALUES ('2', 'Nation Building Tax', 'NBT', '2', null, '2019-03-27', 'active');

-- ----------------------------
-- Table structure for `tbl_payable`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_payable`;
CREATE TABLE `tbl_payable` (
  `payable_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `due_date` date DEFAULT NULL,
  `payee_id` int(11) NOT NULL,
  `payable_amount` double NOT NULL,
  `paid_payable_amount` double DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `expense_category` varchar(50) DEFAULT NULL,
  `period_from` date NOT NULL,
  `period_to` date NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(50) DEFAULT NULL,
  `payable_status` varchar(50) NOT NULL,
  PRIMARY KEY (`payable_id`),
  KEY `payee_id` (`payee_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `tbl_payable_ibfk_1` FOREIGN KEY (`payee_id`) REFERENCES `payee_master` (`payee_id`),
  CONSTRAINT `tbl_payable_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `acc_business` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_payable
-- ----------------------------
INSERT INTO `tbl_payable` VALUES ('1', '1', '2023-03-15', '1', '2000', null, 'test', '1', '2023-03-15', '2023-03-15', '2023-03-15 08:31:43', 'bimalka', 'Not Paid');
INSERT INTO `tbl_payable` VALUES ('2', '1', '2023-03-16', '1', '2000', null, 'test', '1', '2023-03-16', '2023-03-16', '2023-03-16 13:23:57', 'bimalka', 'Not Paid');

-- ----------------------------
-- Table structure for `tbl_receivable`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_receivable`;
CREATE TABLE `tbl_receivable` (
  `receivable_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `payer_id` int(11) NOT NULL,
  `receivable_amount` double NOT NULL,
  `receivable_description` varchar(200) DEFAULT NULL,
  `receivable_category` varchar(50) DEFAULT NULL,
  `period_from` date NOT NULL,
  `period_to` date NOT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(50) DEFAULT NULL,
  `receivable_status` varchar(50) NOT NULL,
  PRIMARY KEY (`receivable_id`),
  KEY `project_id` (`project_id`),
  KEY `payer_id` (`payer_id`),
  CONSTRAINT `tbl_receivable_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `acc_business` (`business_id`),
  CONSTRAINT `tbl_receivable_ibfk_2` FOREIGN KEY (`payer_id`) REFERENCES `payer_master` (`payer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_receivable
-- ----------------------------
INSERT INTO `tbl_receivable` VALUES ('1', '1', '2022-12-25', '1', '3000', 'test', '1', '2022-12-25', '2022-12-26', '2022-12-26 10:30:50', 'byj', 'Receipt');
INSERT INTO `tbl_receivable` VALUES ('2', '5', '2022-12-31', '1', '3000', 'test', '1', '2022-12-27', '2022-12-31', '2022-12-26 10:32:20', 'byj', 'Receipt');
INSERT INTO `tbl_receivable` VALUES ('3', '5', '2022-12-20', '1', '3000', 'test', '2', '2022-12-11', '2022-12-21', '2022-12-26 10:33:04', 'byj', 'Receipt');
INSERT INTO `tbl_receivable` VALUES ('4', '5', '2023-03-21', '1', '3000', 'test', '2', '2022-12-28', '2023-03-23', '2022-12-26 10:34:33', 'byj', 'Not Receipt');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `superadmin` smallint(6) DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) DEFAULT NULL,
  `bind_to_ip` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT '0',
  `user_level` varchar(50) DEFAULT NULL,
  `level_value` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'superadmin', 'J2b4-_EWeWlXFTpPS_CUB8K9Fm7sMKo-', '$2y$13$qQqpzK8MF4wMVd2QoxDhxOSn9n3Ue1e9LqMjNI6ED8nq0FuvA8oue', null, '1', '1', '1531826848', '1536559558', null, '', null, '0', 'superadmin', null);
INSERT INTO `user` VALUES ('61', 'sqmech_account', 'Ix_axrcDSm-F6MJVqZkgGS7lrhu3NSDA', '$2y$13$9tmBp3HrKJNLmIU0ANB7NutwJ7x.wsINz/DuQ/qcn9Wlbyf42CKcy', null, '1', '0', '1555915095', '1555915095', '::1', '', null, '0', '', null);
INSERT INTO `user` VALUES ('62', 'sampath', 'W0gAoTNxsx_2IVEqm_-0sKAwdsZ39pp6', '$2y$13$Vl/uUEfh.ovCZbvvNEhtseQaMDTA59goEK8JRT0yrsiJtNAc9D/ha', '', '1', '1', '1564465359', '1564465359', '112.134.83.89', '', '', '0', '', '');

-- ----------------------------
-- Table structure for `user_visit_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` char(2) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES ('1', '5cc6e365ca86b', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556538213', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('2', '5cc7bd7332cf4', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556594035', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('3', '5cc82af572a50', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556622069', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('4', '5cc8305519b31', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556623445', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('5', '5cc90cc15b647', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556679873', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('6', '5cc93883b98d1', '112.134.82.5', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556691075', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('7', '5cca5df64274b', '112.134.81.192', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556766198', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('8', '5cca629dc6285', '112.134.81.192', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556767389', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('9', '5cca74d6bc99d', '112.134.81.192', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556772054', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('10', '5ccaa10dafd29', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556783373', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('11', '5ccbb31637e7c', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556853526', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('12', '5ccbd8ecbb81b', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '1', '1556863212', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('13', '5cd15c188f868', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '1', '1557224472', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('14', '5cd25d6f0af89', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '1', '1557290351', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('15', '5cd4ee4ab0b3e', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '1', '1557458506', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('16', '5cda39d8a2e4d', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '1', '1557805528', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('17', '5cda715d6f66a', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '1', '1557819741', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('18', '5cdb83ceeb603', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '1', '1557889999', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('19', '5cde2a14a9fca', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '1', '1558063636', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('20', '5ce3bca831101', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '1', '1558428840', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('21', '5ce4c89c0f0a1', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '1', '1558497436', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('22', '5ce641506da3b', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1558593872', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('23', '5ceb55202b5f9', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1558926624', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('24', '5ceca7dd040ac', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1559013341', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('25', '5ced5293365d3', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', '1', '1559057043', 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES ('26', '5cee05da14580', '112.134.83.100', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1559102938', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('27', '5cee0c4395466', '112.134.104.216', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1559104579', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('28', '5cee16aa1279a', '112.134.104.216', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1559107242', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('29', '5cee29df044ef', '112.134.135.110', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', '1', '1559112159', 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES ('30', '5cf0035a2d557', '175.157.36.193', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', '1', '1559233370', 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES ('31', '5cfa091f7b971', '112.134.83.39', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1559890207', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('32', '5cfe2159415bc', '112.134.81.246', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1560158553', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('33', '5d00981160284', '112.134.81.70', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1560320017', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('34', '5d00b89a53c03', '112.134.81.70', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1560328346', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('35', '5d00bbba791df', '112.134.81.70', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1560329146', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('36', '5d00cbe280169', '112.134.81.70', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1560333282', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('37', '5d00d94e3e8dc', '112.134.81.70', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1560336718', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('38', '5d00e2ddb9975', '112.134.85.242', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1560339165', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('39', '5d077a2854a0c', '112.134.87.125', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1', '1560771112', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('40', '5d22be2217392', '112.134.84.125', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1', '1562557986', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('41', '5d22e8ac49193', '123.231.62.39', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1', '1562568876', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('42', '5d35328bb4c00', '112.134.81.219', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', '1', '1563767435', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('43', '5d36b2f36f282', '112.134.85.19', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', '1', '1563865843', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('44', '5d399bfa72be3', '124.43.19.96', 'en', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', '1', '1564056570', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('45', '5d808e5f60877', '123.231.62.39', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1', '1568706143', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('46', '5d821587f2948', '123.231.62.39', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1', '1568806279', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('47', '5dc1252faaa43', '123.231.62.39', 'en', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '1', '1572939055', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('48', '5f8676463fe8d', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '62', '1602647622', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('49', '5f867706a4964', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '62', '1602647814', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('50', '5f8691531ec0d', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '62', '1602654547', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('51', '5f894fd3f09de', '::1', 'en', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '62', '1602834388', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('52', '6041c685404ac', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '62', '1614923397', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('53', '6045e3969cf67', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '62', '1615192982', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('54', '62f480dbe18f2', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '62', '1660190939', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('55', '630228bf13106', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '62', '1661085887', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('56', '638b429e22118', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1670070942', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('57', '638c7d309e12f', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1670151472', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('58', '639aee57d3f79', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1671097943', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('59', '639bf5a2b0807', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1671165346', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('60', '639d633542d74', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1671258933', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('61', '63a7b594d7ea7', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1671935380', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('62', '63aab2544324a', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1672131156', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('63', '63acf72f2b0c8', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1672279855', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('64', '63cfc8cfb0b14', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1674561743', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('65', '63cfcef7584ba', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1674563319', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('66', '63cfd13e60ced', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1674563902', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('67', '63e499706a359', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1675925872', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('68', '63e5178332dd4', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1675958147', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('69', '63f5a91b87dcf', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1677043995', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('70', '63f8bf0698f0a', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1677246214', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('71', '6409332f01271', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1678324527', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('72', '64109dc64e578', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1678810566', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('73', '6410b2e12d100', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1678815969', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('74', '6413e36f58f74', '::1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '62', '1679025007', 'Chrome', 'Windows');

-- ----------------------------
-- Table structure for `vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(20) NOT NULL,
  `added_by` varchar(50) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE KEY `vehicle_number` (`vehicle_number`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES ('1', 'HA-2345', '', '2019-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('6', '1', 'a', '2019-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('7', '2', 'a', '2019-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('9', '3', 'a', '2019-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('11', '4', 'a', '2019-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('12', '5', 'a', '2019-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('13', '6', '6', '2019-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('14', '7', 'a', '2019-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('15', '8', 'a', '2019-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('17', '10', 'a122', '2020-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('18', '11', 'a122', '2020-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('19', '12', 'a122', '2020-05-23 15:00:57');
INSERT INTO `vehicles` VALUES ('20', '13', 'bimalka', '2020-05-23 15:00:57');

-- ----------------------------
-- Table structure for `vehicle_expense_master`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_expense_master`;
CREATE TABLE `vehicle_expense_master` (
  `vehicle_exp_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_expense_category` varchar(50) NOT NULL,
  `expense_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vehicle_exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicle_expense_master
-- ----------------------------
INSERT INTO `vehicle_expense_master` VALUES ('1', 'Insurance', '1');
INSERT INTO `vehicle_expense_master` VALUES ('2', 'Fitness', '1');
INSERT INTO `vehicle_expense_master` VALUES ('3', 'Fuel', '1');
INSERT INTO `vehicle_expense_master` VALUES ('4', 'Tires', '1');
INSERT INTO `vehicle_expense_master` VALUES ('5', 'Accident Rate', '1');
INSERT INTO `vehicle_expense_master` VALUES ('6', 'Maintain Repairs', '1');
INSERT INTO `vehicle_expense_master` VALUES ('7', 'Lubrication', '1');
INSERT INTO `vehicle_expense_master` VALUES ('9', 'License', '1');

-- ----------------------------
-- Table structure for `vehicle_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_transaction`;
CREATE TABLE `vehicle_transaction` (
  `vehicle_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `vehicle_exp_id` int(11) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `payable_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `added_by` varchar(50) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vehicle_transaction_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `vehicle_exp_id` (`vehicle_exp_id`),
  KEY `payable_id` (`payable_id`),
  CONSTRAINT `vehicle_transaction_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`),
  CONSTRAINT `vehicle_transaction_ibfk_2` FOREIGN KEY (`vehicle_exp_id`) REFERENCES `expense_sub_category` (`exp_sub_cat_id`),
  CONSTRAINT `vehicle_transaction_ibfk_3` FOREIGN KEY (`payable_id`) REFERENCES `tbl_payable` (`payable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicle_transaction
-- ----------------------------
