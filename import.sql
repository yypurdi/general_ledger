--
--    Copyright 2015-2016 the original author or authors.
--
DROP DATABASE IF EXISTS `general_ledger`;

CREATE DATABASE IF NOT EXISTS `general_ledger`;

USE `general_ledger`;

/*Table structure for table `account_group` */

DROP TABLE IF EXISTS `account_group`;

CREATE TABLE `account_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `parent` varchar(40) default NULL,
  `description` varchar(100) default NULL,
  `acc_section_id` int(11) default NULL,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `ID` (`id`),
  KEY `sectioninaccounts` (`acc_section_id`),
  CONSTRAINT `FK_ref_account_group` FOREIGN KEY (`acc_section_id`) REFERENCES `account_section` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `account_group` */

insert  into `account_group`(`id`,`name`,`parent`,`description`,`acc_section_id`) values (1,'BBQs','Promotions','BBQs',5),(2,'Cost of Goods Sold','','Cost of Goods Sold',2),(3,'Current Assets','','Current Assets',20),(4,'Equity','','Equity',50),(5,'Fixed Assets','','Fixed Assets',10),(6,'Giveaways','Promotions','Giveaways',5),(7,'Income Tax','','Income Tax',5),(8,'Liabilities','','Liabilities',30),(9,'Marketing Expenses','','Marketing Expenses',5),(10,'Operating Expenses','','Operating Expenses',5),(11,'Other Revenue and Expenses','','Other Revenue and Expenses',5),(12,'Outward Freight','Cost of Goods Sold','Outward Freight',2),(13,'Promotions','Marketing Expenses','Promotions',5),(14,'Revenue','','Revenue',1),(15,'Sales','','Sales',1);

/*Table structure for table `account_master` */

DROP TABLE IF EXISTS `account_master`;

CREATE TABLE `account_master` (
  `id` int(12) NOT NULL auto_increment,
  `acc_code` varchar(20) NOT NULL,
  `acc_name` varchar(50) NOT NULL,
  `acc_description` varchar(100) default NULL,
  `acc_group_id` int(12) default NULL,
  PRIMARY KEY  (`acc_code`),
  UNIQUE KEY `ID` (`id`),
  KEY `AccountCode` (`acc_code`),
  KEY `AccountName` (`acc_name`),
  KEY `FK_ref_account_master` (`acc_group_id`),
  CONSTRAINT `FK_ref_account_master` FOREIGN KEY (`acc_group_id`) REFERENCES `account_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;

/*Data for the table `account_master` */

insert  into `account_master`(`id`,`acc_code`,`acc_name`,`acc_description`,`acc_group_id`) values (1,'1000','Default Sales/Discounts','Default Sales/Discounts',15),(2,'1010','Petty Cash','Petty Cash',3),(3,'1020','Cash on Hand','Cash on Hand',3),(4,'1030','Cheque Accounts','Cheque Accounts',3),(5,'1040','Savings Accounts','Savings Accounts',3),(6,'1050','Payroll Accounts','Payroll Accounts',3),(7,'1060','Special Accounts','Special Accounts',3),(8,'1070','Money Market Investments','Money Market Investments',3),(9,'1080','Short-Term Investments (< 90 days)','Short-Term Investments (< 90 days)',3),(10,'1090','Interest Receivable','Interest Receivable',3),(11,'1100','Accounts Receivable','Accounts Receivable',3),(12,'1150','Allowance for Doubtful Accounts','Allowance for Doubtful Accounts',3),(13,'1200','Notes Receivable','Notes Receivable',3),(14,'1250','Income Tax Receivable','Income Tax Receivable',3),(15,'1300','Prepaid Expenses','Prepaid Expenses',3),(16,'1350','Advances','Advances',3),(17,'1400','Supplies Inventory','Supplies Inventory',3),(18,'1420','Raw Material Inventory','Raw Material Inventory',3),(19,'1440','Work in Progress Inventory','Work in Progress Inventory',3),(20,'1460','Finished Goods Inventory','Finished Goods Inventory',3),(21,'1500','Land','Land',5),(22,'1550','Bonds','Bonds',5),(23,'1600','Buildings','Buildings',5),(24,'1620','Accumulated Depreciation of Buildings','Accumulated Depreciation of Buildings',5),(25,'1650','Equipment','Equipment',5),(26,'1670','Accumulated Depreciation of Equipment','Accumulated Depreciation of Equipment',5),(27,'1700','Furniture & Fixtures','Furniture & Fixtures',5),(28,'1710','Accumulated Depreciation of Furniture & Fixtures','Accumulated Depreciation of Furniture & Fixtures',5),(29,'1720','Office Equipment','Office Equipment',5),(30,'1730','Accumulated Depreciation of Office Equipment','Accumulated Depreciation of Office Equipment',5),(31,'1740','Software','Software',5),(32,'1750','Accumulated Depreciation of Software','Accumulated Depreciation of Software',5),(33,'1760','Vehicles','Vehicles',5),(34,'1770','Accumulated Depreciation Vehicles','Accumulated Depreciation Vehicles',5),(35,'1780','Other Depreciable Property','Other Depreciable Property',5),(36,'1790','Accumulated Depreciation of Other Depreciable Prop','Accumulated Depreciation of Other Depreciable Prop',5),(37,'1800','Patents','Patents',5),(38,'1850','Goodwill','Goodwill',5),(39,'1900','Future Income Tax Receivable','Future Income Tax Receivable',3),(40,'2010','Bank Indedebtedness (overdraft)','Bank Indedebtedness (overdraft)',8),(41,'2020','Retainers or Advances on Work','Retainers or Advances on Work',8),(42,'2050','Interest Payable','Interest Payable',8),(43,'2100','Accounts Payable','Accounts Payable',8),(44,'2150','Goods Received Suspense','Goods Received Suspense',8),(45,'2200','Short-Term Loan Payable','Short-Term Loan Payable',8),(46,'2230','Current Portion of Long-Term Debt Payable','Current Portion of Long-Term Debt Payable',8),(47,'2250','Income Tax Payable','Income Tax Payable',8),(48,'2300','GST Payable','GST Payable',8),(49,'2310','GST Recoverable','GST Recoverable',8),(50,'2320','PST Payable','PST Payable',8),(51,'2330','PST Recoverable (commission)','PST Recoverable (commission)',8),(52,'2340','Payroll Tax Payable','Payroll Tax Payable',8),(53,'2350','Withholding Income Tax Payable','Withholding Income Tax Payable',8),(54,'2360','Other Taxes Payable','Other Taxes Payable',8),(55,'2400','Employee Salaries Payable','Employee Salaries Payable',8),(56,'2410','Management Salaries Payable','Management Salaries Payable',8),(57,'2420','Director / Partner Fees Payable','Director / Partner Fees Payable',8),(58,'2450','Health Benefits Payable','Health Benefits Payable',8),(59,'2460','Pension Benefits Payable','Pension Benefits Payable',8),(60,'2470','Canada Pension Plan Payable','Canada Pension Plan Payable',8),(61,'2480','Employment Insurance Premiums Payable','Employment Insurance Premiums Payable',8),(62,'2500','Land Payable','Land Payable',8),(63,'2550','Long-Term Bank Loan','Long-Term Bank Loan',8),(64,'2560','Notes Payable','Notes Payable',8),(65,'2600','Building & Equipment Payable','Building & Equipment Payable',8),(66,'2700','Furnishing & Fixture Payable','Furnishing & Fixture Payable',8),(67,'2720','Office Equipment Payable','Office Equipment Payable',8),(68,'2740','Vehicle Payable','Vehicle Payable',8),(69,'2760','Other Property Payable','Other Property Payable',8),(70,'2800','Shareholder Loans','Shareholder Loans',8),(71,'2900','Suspense','Suspense',8),(72,'3100','Capital Stock','Capital Stock',4),(73,'3200','Capital Surplus / Dividends','Capital Surplus / Dividends',4),(74,'3300','Dividend Taxes Payable','Dividend Taxes Payable',4),(75,'3400','Dividend Taxes Refundable','Dividend Taxes Refundable',4),(76,'3500','Retained Earnings','Retained Earnings',4),(77,'4100','Product / Service Sales','Product / Service Sales',14),(78,'4200','Sales Exchange Gains/Losses','Sales Exchange Gains/Losses',14),(79,'4500','Consulting Services','Consulting Services',14),(80,'4600','Rentals','Rentals',14),(81,'4700','Finance Charge Income','Finance Charge Income',14),(82,'4800','Sales Returns & Allowances','Sales Returns & Allowances',14),(83,'4900','Sales Discounts','Sales Discounts',14),(84,'5000','Cost of Sales','Cost of Sales',2),(85,'5100','Production Expenses','Production Expenses',2),(86,'5200','Purchases Exchange Gains/Losses','Purchases Exchange Gains/Losses',2),(87,'5500','Direct Labour Costs','Direct Labour Costs',2),(88,'5600','Freight Charges','Freight Charges',12),(89,'5700','Inventory Adjustment','Inventory Adjustment',2),(90,'5800','Purchase Returns & Allowances','Purchase Returns & Allowances',2),(91,'5900','Purchase Discounts','Purchase Discounts',2),(92,'6100','Advertising','Advertising',9),(93,'6150','Promotion','Promotion',13),(94,'6200','Communications','Communications',9),(95,'6250','Meeting Expenses','Meeting Expenses',9),(96,'6300','Travelling Expenses','Travelling Expenses',9),(97,'6400','Delivery Expenses','Delivery Expenses',9),(98,'6500','Sales Salaries & Commission','Sales Salaries & Commission',9),(99,'6550','Sales Salaries & Commission Deductions','Sales Salaries & Commission Deductions',9),(100,'6590','Benefits','Benefits',9),(101,'6600','Other Selling Expenses','Other Selling Expenses',9),(102,'6700','Permits, Licenses & License Fees','Permits, Licenses & License Fees',9),(103,'6800','Research & Development','Research & Development',9),(104,'6900','Professional Services','Professional Services',9),(105,'7020','Support Salaries & Wages','Support Salaries & Wages',10),(106,'7030','Support Salary & Wage Deductions','Support Salary & Wage Deductions',10),(107,'7040','Management Salaries','Management Salaries',10),(108,'7050','Management Salary deductions','Management Salary deductions',10),(109,'7060','Director / Partner Fees','Director / Partner Fees',10),(110,'7070','Director / Partner Deductions','Director / Partner Deductions',10),(111,'7080','Payroll Tax','Payroll Tax',10),(112,'7090','Benefits','Benefits',10),(113,'7100','Training & Education Expenses','Training & Education Expenses',10),(114,'7150','Dues & Subscriptions','Dues & Subscriptions',10),(115,'7200','Accounting Fees','Accounting Fees',10),(116,'7210','Audit Fees','Audit Fees',10),(117,'7220','Banking Fees','Banking Fees',10),(118,'7230','Credit Card Fees','Credit Card Fees',10),(119,'7240','Consulting Fees','Consulting Fees',10),(120,'7260','Legal Fees','Legal Fees',10),(121,'7280','Other Professional Fees','Other Professional Fees',10),(122,'7300','Business Tax','Business Tax',10),(123,'7350','Property Tax','Property Tax',10),(124,'7390','Corporation Capital Tax','Corporation Capital Tax',10),(125,'7400','Office Rent','Office Rent',10),(126,'7450','Equipment Rental','Equipment Rental',10),(127,'7500','Office Supplies','Office Supplies',10),(128,'7550','Office Repair & Maintenance','Office Repair & Maintenance',10),(129,'7600','Automotive Expenses','Automotive Expenses',10),(130,'7610','Communication Expenses','Communication Expenses',10),(131,'7620','Insurance Expenses','Insurance Expenses',10),(132,'7630','Postage & Courier Expenses','Postage & Courier Expenses',10),(133,'7640','Miscellaneous Expenses','Miscellaneous Expenses',10),(134,'7650','Travel Expenses','Travel Expenses',10),(135,'7660','Utilities','Utilities',10),(136,'7700','Ammortization Expenses','Ammortization Expenses',10),(137,'7750','Depreciation Expenses','Depreciation Expenses',10),(138,'7800','Interest Expense','Interest Expense',10),(139,'7900','Bad Debt Expense','Bad Debt Expense',10),(140,'8100','Gain on Sale of Assets','Gain on Sale of Assets',11),(141,'8200','Interest Income','Interest Income',11),(142,'8300','Recovery on Bad Debt','Recovery on Bad Debt',11),(143,'8400','Other Revenue','Other Revenue',11),(144,'8500','Loss on Sale of Assets','Loss on Sale of Assets',11),(145,'8600','Charitable Contributions','Charitable Contributions',11),(146,'8900','Other Expenses','Other Expenses',11),(147,'9100','Income Tax Provision','Income Tax Provision',7);

/*Table structure for table `account_section` */

DROP TABLE IF EXISTS `account_section`;

CREATE TABLE `account_section` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `description` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

/*Data for the table `account_section` */

insert  into `account_section`(`id`,`name`,`description`) values (1,'Income','Income'),(2,'Cost Of Sales','Cost Of Sales'),(5,'Overheads','Overheads'),(10,'Fixed Assets','Fixed Assets'),(20,'Amounts Receivable','Amounts Receivable'),(30,'Amounts Payable','Amounts Payable'),(50,'Financed By','Financed By');

/*Table structure for table `app_authorities` */

DROP TABLE IF EXISTS `app_authorities`;

CREATE TABLE `app_authorities` (
  `username` varchar(64) NOT NULL,
  `authority` varchar(64) default NULL,
  PRIMARY KEY  (`username`),
  CONSTRAINT `FK_app_authorities` FOREIGN KEY (`username`) REFERENCES `app_users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_authorities` */

insert  into `app_authorities`(`username`,`authority`) values ('admin','ROLE_ADMIN');

/*Table structure for table `app_contact` */

DROP TABLE IF EXISTS `app_contact`;

CREATE TABLE `app_contact` (
  `username` varchar(64) NOT NULL,
  `subscription` varchar(10) default NULL,
  `jid` varchar(64) NOT NULL,
  `nickname` varchar(64) default NULL,
  `joindate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `show` varchar(20) default NULL,
  `status` varchar(100) default NULL,
  `lastseen` timestamp NOT NULL default '0000-00-00 00:00:00',
  `unread` int(11) default NULL,
  `key` varchar(20) default NULL,
  PRIMARY KEY  (`username`,`jid`),
  KEY `jid` (`jid`),
  CONSTRAINT `FK_app_contact` FOREIGN KEY (`username`) REFERENCES `app_users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_contact` */

insert  into `app_contact`(`username`,`subscription`,`jid`,`nickname`,`joindate`,`show`,`status`,`lastseen`,`unread`,`key`) values ('6210001','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210001','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210002','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210002','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210003','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210003','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210004','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210004','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210005','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210005','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210006','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210006','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210007','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210007','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210008','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210008','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210009','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210009','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210010','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210010','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210011','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210011','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210012','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210012','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210013','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210013','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210014','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210014','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210015','both','admin@domain.com','admin','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('6210015','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210001@domain.com','6210001','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210002@domain.com','6210002','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210003@domain.com','6210003','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210004@domain.com','6210004','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210005@domain.com','6210005','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210006@domain.com','6210006','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210007@domain.com','6210007','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210008@domain.com','6210008','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210009@domain.com','6210009','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210010@domain.com','6210010','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210011@domain.com','6210011','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210012@domain.com','6210012','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210013@domain.com','6210013','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210014@domain.com','6210014','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','6210015@domain.com','6210015','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('admin','both','user@domain.com','user','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210001@domain.com','6210001','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210002@domain.com','6210002','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210003@domain.com','6210003','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210004@domain.com','6210004','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210005@domain.com','6210005','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210006@domain.com','6210006','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210007@domain.com','6210007','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210008@domain.com','6210008','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210009@domain.com','6210009','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210010@domain.com','6210010','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210011@domain.com','6210011','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210012@domain.com','6210012','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210013@domain.com','6210013','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210014@domain.com','6210014','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','6210015@domain.com','6210015','2019-10-01 15:22:04','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL),('user','both','admin@domain.com','admin','2019-10-01 15:22:26','unavailable','Offline','2020-05-01 17:48:40',NULL,NULL);

/*Table structure for table `app_group_authorities` */

DROP TABLE IF EXISTS `app_group_authorities`;

CREATE TABLE `app_group_authorities` (
  `group_id` int(11) NOT NULL,
  `authority` varchar(64) default NULL,
  PRIMARY KEY  (`group_id`),
  CONSTRAINT `FK_app_group_authorities` FOREIGN KEY (`group_id`) REFERENCES `app_groups` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_group_authorities` */

/*Table structure for table `app_group_members` */

DROP TABLE IF EXISTS `app_group_members`;

CREATE TABLE `app_group_members` (
  `group_id` int(11) default NULL,
  `group_member_id` int(11) NOT NULL auto_increment,
  `username` varchar(64) default NULL,
  PRIMARY KEY  (`group_member_id`),
  KEY `FK_app_group_members1` (`group_id`),
  KEY `FK_app_group_members2` (`username`),
  CONSTRAINT `FK_app_group_members1` FOREIGN KEY (`group_id`) REFERENCES `app_groups` (`group_id`),
  CONSTRAINT `FK_app_group_members2` FOREIGN KEY (`username`) REFERENCES `app_users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_group_members` */

/*Table structure for table `app_groups` */

DROP TABLE IF EXISTS `app_groups`;

CREATE TABLE `app_groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` varchar(64) default NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `app_groups` */

insert  into `app_groups`(`group_id`,`group_name`) values (1,'APP_ADMIN'),(2,'APP_USER');

/*Table structure for table `app_menus` */

DROP TABLE IF EXISTS `app_menus`;

CREATE TABLE `app_menus` (
  `name` varchar(64) NOT NULL,
  `link` varchar(64) NOT NULL,
  `display` varchar(64) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_menus` */

insert  into `app_menus`(`name`,`link`,`display`) values ('appContact','searchAppContact','AppContact'),('appGroups','searchAppGroups','AppGroups'),('appUsers','searchAppUsers','AppUsers');

/*Table structure for table `app_message` */

DROP TABLE IF EXISTS `app_message`;

CREATE TABLE `app_message` (
  `username` varchar(64) NOT NULL,
  `jid` varchar(64) NOT NULL,
  `msgtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `msgType` varchar(20) default NULL,
  `msgSubject` varchar(100) default NULL,
  `msgText` text,
  PRIMARY KEY  (`username`,`jid`,`msgtime`),
  KEY `FK_app_inbox` (`jid`),
  CONSTRAINT `FK_app_inbox` FOREIGN KEY (`jid`) REFERENCES `app_contact` (`jid`),
  CONSTRAINT `FK_app_outbox` FOREIGN KEY (`username`) REFERENCES `app_users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_message` */

/*Table structure for table `app_persistent_logins` */

DROP TABLE IF EXISTS `app_persistent_logins`;

CREATE TABLE `app_persistent_logins` (
  `username` varchar(64) default NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) default NULL,
  `last_used` datetime NOT NULL,
  PRIMARY KEY  (`series`,`last_used`),
  KEY `FK_app_persistent_logins` (`username`),
  CONSTRAINT `FK_app_persistent_logins` FOREIGN KEY (`username`) REFERENCES `app_users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_persistent_logins` */

insert  into `app_persistent_logins`(`username`,`series`,`token`,`last_used`) values ('admin','-M9lpqgz1GXpqHCHRI67jlmyl8h9YpCu','OLFPnjq1-8Ap2dU5AAAL','2020-05-03 04:57:53'),('admin','63m_gN1B3K0d4I1eavIEOY52FJOTB00x','0inUDE6rxBo25s08AAAA','2020-05-03 03:53:34'),('admin','7OimhyVH0g9Xc4r3_hXvg_RCfv-bclNq','EP-c_7xT5nEFlCrqAAAW','2020-05-03 04:34:09'),('admin','anznye6TU7enpgEtBusxrIc4rRA_rv-K','jdhn9YO08nPIZVXFAAAB','2020-05-03 04:40:22'),('admin','TyFfTQFN0434LwKJ9DONUibQRr9b0s-h','J9INLKtNdnBM31q0AAAA','2020-05-03 03:21:53'),('admin','xLrLMZ3VYi-uokbIqzRkm8lj6oEisa2Q','2VbuEkU3DmsdQGdzAAAA','2020-05-01 05:49:23'),('admin','y9uC7864JVS9PvNzy4Om6bnHNmBIMMFK','i4jwUos3nSZiybmJAAAA','2020-05-01 07:14:32'),('admin','yqFhAxBgSQSsmrEk1IsujcEzTHi8vz5W','0JJqB9SECwBZtF1BAAAA','2020-05-03 04:44:07');

/*Table structure for table `app_room` */

DROP TABLE IF EXISTS `app_room`;

CREATE TABLE `app_room` (
  `meeting_room` varchar(100) NOT NULL,
  `subject` varchar(100) default NULL,
  `participant` varchar(46) default NULL,
  `start_date` datetime default NULL,
  `end_date` datetime default NULL,
  `status` varchar(46) default NULL,
  `ref_value` text,
  PRIMARY KEY  (`meeting_room`),
  KEY `FK_app_room` (`participant`),
  CONSTRAINT `FK_app_room` FOREIGN KEY (`participant`) REFERENCES `app_users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_room` */

/*Table structure for table `app_users` */

DROP TABLE IF EXISTS `app_users`;

CREATE TABLE `app_users` (
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(64) default NULL,
  `email` varchar(100) default NULL,
  `phone` varchar(64) default NULL,
  `mobile` varchar(64) default NULL,
  `enabled` tinyint(1) default NULL,
  `token` varchar(64) NOT NULL,
  PRIMARY KEY  (`username`),
  KEY `FK_app_users` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_users` */

insert  into `app_users`(`username`,`password`,`name`,`email`,`phone`,`mobile`,`enabled`,`token`) values ('6210001','password','6210001','6210001@domain.com',NULL,NULL,1,'6210001'),('6210002','password','6210002','6210002@domain.com',NULL,NULL,1,'6210002'),('6210003','password','6210003','6210003@domain.com',NULL,NULL,1,'6210003'),('6210004','password','6210004','6210004@domain.com',NULL,NULL,1,'6210004'),('6210005','password','6210005','6210005@domain.com',NULL,NULL,1,'6210005'),('6210006','password','6210006','6210006@domain.com',NULL,NULL,1,'6210006'),('6210007','password','6210007','6210007@domain.com',NULL,NULL,1,'6210007'),('6210008','password','6210008','6210008@domain.com',NULL,NULL,1,'6210008'),('6210009','password','6210009','6210009@domain.com',NULL,NULL,1,'6210009'),('6210010','password','6210010','6210010@domain.com',NULL,NULL,1,'6210010'),('6210011','password','6210011','6210011@domain.com',NULL,NULL,1,'6210011'),('6210012','password','6210012','6210012@domain.com',NULL,NULL,1,'6210012'),('6210013','password','6210013','6210013@domain.com',NULL,NULL,1,'6210013'),('6210014','password','6210014','6210014@domain.com',NULL,NULL,1,'6210014'),('6210015','password','6210015','6210015@domain.com',NULL,NULL,1,'6210015'),('admin','password',NULL,NULL,NULL,NULL,1,'wmQ45QjYpC38W3i'),('user','password','User','user@domain.com','','',1,'wmQ45QjYpC38W3i');

/*Table structure for table `general_ledger` */

DROP TABLE IF EXISTS `general_ledger`;

CREATE TABLE `general_ledger` (
  `id` int(11) NOT NULL auto_increment,
  `acc_code` varchar(20) NOT NULL,
  `create_date` date NOT NULL default '0000-00-00',
  `description` varchar(200) NOT NULL,
  `debit` double NOT NULL default '0',
  `credit` double default '0',
  `posted` int(4) NOT NULL default '0',
  `source` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `Account` (`acc_code`),
  KEY `Posted` (`posted`),
  KEY `TranDate` (`create_date`),
  KEY `JobRef` (`source`),
  CONSTRAINT `FK_acc_general_ledger` FOREIGN KEY (`acc_code`) REFERENCES `account_master` (`acc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

/*Data for the table `general_ledger` */

insert  into `general_ledger`(`id`,`acc_code`,`create_date`,`description`,`debit`,`credit`,`posted`,`source`) values (3,'1460','2007-06-14','3 DVD-DHWV x 2 @ 5.25',0,10.5,1,''),(4,'1460','2007-06-14','3 DVD-DHWV x 2 @ 5.25',-10.5,0,1,''),(5,'1460','2007-06-18','3 DVD-TOPGUN x 1 @ 6.50',0,6.5,1,''),(6,'1460','2007-06-18','3 DVD-TOPGUN x 1 @ 6.50',-6.5,0,1,''),(7,'1460','2007-06-18','3 - DVD_ACTION Component: DVD-DHWV - 10 x 1 @ 5.25',0,52.5,1,''),(8,'1460','2007-06-18','3 - DVD_ACTION -> DVD-DHWV - 10 x 1 @ 5.25',-52.5,0,1,''),(9,'1460','2007-06-18','3 - DVD_ACTION Component: DVD-LTWP - 10 x 1 @ 2.85',0,28.5,1,''),(10,'1460','2007-06-18','3 - DVD_ACTION -> DVD-LTWP - 10 x 1 @ 2.85',-28.5,0,1,''),(11,'1460','2007-06-18','3 - DVD_ACTION Component: DVD-UNSG - 10 x 1 @ 5.00',0,50,1,''),(12,'1460','2007-06-18','3 - DVD_ACTION -> DVD-UNSG - 10 x 1 @ 5.00',-50,0,1,''),(13,'1460','2007-06-18','3 - DVD_ACTION Component: DVD-UNSG2 - 10 x 1 @ 5.00',0,50,1,''),(14,'1460','2007-06-18','3 - DVD_ACTION -> DVD-UNSG2 - 10 x 1 @ 5.00',-50,0,1,''),(15,'1460','2007-06-18','3 DVD_ACTION - Action Series Bundle x 10 @ 18.40',0,184,1,''),(16,'1460','2007-06-18','3 DVD_ACTION - Action Series Bundle x 10 @ 18.40',-184,0,1,''),(17,'1460','2007-06-18','3 - DVD_ACTION share of variance',0,5,1,''),(18,'1460','2007-06-18','3 - DVD_ACTION share of variance',-5,0,1,''),(19,'1440','2007-06-21','5 FLOUR x 4 @ 3.89',0,15.56,1,''),(20,'1460','2007-06-21','5 FLOUR x 4 @ 3.89',-15.56,0,1,''),(21,'5000','2007-06-26','QUARTER - DVD-DHWV x 2 @ 5.2500',0,10.5,1,''),(22,'1460','2007-06-26','QUARTER - DVD-DHWV x 2 @ 5.2500',-10.5,0,1,''),(23,'4100','2007-06-26','QUARTER - DVD-DHWV x 2 @ 15.95',-31.9,0,1,''),(24,'5000','2007-06-26','QUARTER - DVD-LTWP x 1 @ 2.8500',0,2.85,1,''),(25,'1460','2007-06-26','QUARTER - DVD-LTWP x 1 @ 2.8500',-2.85,0,1,''),(26,'4100','2007-06-26','QUARTER - DVD-LTWP x 1 @ 14.5',-14.5,0,1,''),(27,'1100','2007-06-26','QUARTER',0,46.4,1,''),(28,'5000','2007-08-02','QUARTER - DVD-DHWV x 1 @ 5.2500',-5.25,0,1,''),(29,'1460','2007-08-02','QUARTER - DVD-DHWV x 1 @ 5.2500',0,5.25,1,''),(30,'4100','2007-08-02','QUARTER - DVD-DHWV x 1 @ 15.950',0,15.95,1,''),(31,'1100','2007-08-02','QUARTER',-15.95,0,1,''),(32,'5700','2007-08-08','DVD-LTWP cost was 2.85 changed to 2.65 x Quantity on hand of -11',-2.2,0,1,''),(33,'1460','2007-08-08','DVD-LTWP cost was 2.85 changed to 2.65 x Quantity on hand of -11',0,2.2,1,''),(34,'5700','2007-08-08','DVD-LTWP cost was 2.65 changed to 2.66 x Quantity on hand of -11',0,0.11,1,''),(35,'1460','2007-08-08','DVD-LTWP cost was 2.65 changed to 2.66 x Quantity on hand of -11',-0.11,0,1,''),(36,'5700','2007-08-08','DVD-LTWP cost was 2.66 changed to 2.7 x Quantity on hand of -11',0,0.44,1,''),(37,'1460','2007-08-08','DVD-LTWP cost was 2.66 changed to 2.7 x Quantity on hand of -11',-0.44,0,1,''),(38,'5700','2007-08-08','DVD_ACTION cost was 19.3000 changed to 19.15 x Quantity on hand of 10',0,1.5,1,''),(39,'1460','2007-08-08','DVD_ACTION cost was 19.3000 changed to 19.15 x Quantity on hand of 10',-1.5,0,1,''),(40,'5700','2007-08-09','DVD-DHWV cost was 5.25 changed to 5.3 x Quantity on hand of -13',0,0.65,1,''),(41,'1460','2007-08-09','DVD-DHWV cost was 5.25 changed to 5.3 x Quantity on hand of -13',-0.65,0,1,''),(42,'5700','2007-08-09','DVD_ACTION cost was 19.1500 changed to 19.2 x Quantity on hand of 10',-0.50000000000001,0,1,''),(43,'1460','2007-08-09','DVD_ACTION cost was 19.1500 changed to 19.2 x Quantity on hand of 10',0,0.50000000000001,1,''),(44,'5700','2007-08-09','DVD-DHWV cost was 5.3 changed to 5.35 x Quantity on hand of -13',0,0.65,1,''),(45,'1460','2007-08-09','DVD-DHWV cost was 5.3 changed to 5.35 x Quantity on hand of -13',-0.65,0,1,''),(46,'5700','2007-08-09','DVD_ACTION cost was 19.2000 changed to 19.25 x Quantity on hand of 10',-0.50000000000001,0,1,''),(47,'1460','2007-08-09','DVD_ACTION cost was 19.2000 changed to 19.25 x Quantity on hand of 10',0,0.50000000000001,1,''),(48,'5700','2007-08-09','DVD-DHWV cost was 5.35 changed to 5.5 x Quantity on hand of -13',0,1.95,1,''),(49,'1460','2007-08-09','DVD-DHWV cost was 5.35 changed to 5.5 x Quantity on hand of -13',-1.95,0,1,''),(50,'5700','2007-08-09','DVD_ACTION cost was 19.2500 changed to 19.4 x Quantity on hand of 10',-1.5,0,1,''),(51,'1460','2007-08-09','DVD_ACTION cost was 19.2500 changed to 19.4 x Quantity on hand of 10',0,1.5,1,''),(52,'5700','2007-08-09','DVD-DHWV cost was 5.5 changed to 2.32 x Quantity on hand of -13',-41.34,0,1,''),(53,'1460','2007-08-09','DVD-DHWV cost was 5.5 changed to 2.32 x Quantity on hand of -13',0,41.34,1,''),(54,'5700','2007-08-09','DVD_ACTION cost was 19.4000 changed to 16.22 x Quantity on hand of 10',0,31.8,1,''),(55,'1460','2007-08-09','DVD_ACTION cost was 19.4000 changed to 16.22 x Quantity on hand of 10',-31.8,0,1,''),(56,'6100','2007-10-23','test',-150,0,1,''),(57,'1030','2007-10-23','',0,150,1,''),(58,'1440','2008-06-27','5 - BREAD Component: SALT - 12 x 0.025 @ 2.50',0,0.75,1,''),(59,'1350','2008-07-26','testrg',0,500,1,''),(60,'1030','2008-07-26','',-500,0,1,''),(61,'1030','2009-02-04','',0,99,1,''),(62,'1100','2009-02-04','',-99,0,1,''),(63,'1420','2009-02-04','',-299,0,1,''),(64,'1030','2009-02-04','',0,299,1,''),(65,'5700','2009-02-04','DVD_ACTION cost was 16.2200 changed to 16.22 x Quantity on hand of 10',0,0,1,''),(66,'1460','2009-02-04','DVD_ACTION cost was 16.2200 changed to 16.22 x Quantity on hand of 10',0,0,1,''),(67,'5700','2009-02-04','DVD_ACTION cost was 16.2200 changed to 16.22 x Quantity on hand of 10',0,0,1,''),(68,'1460','2009-02-04','DVD_ACTION cost was 16.2200 changed to 16.22 x Quantity on hand of 10',0,0,1,''),(69,'5700','2009-02-04','DVD_ACTION cost was 16.2200 changed to 16.22 x Quantity on hand of 10',0,0,1,''),(70,'1460','2009-02-04','DVD_ACTION cost was 16.2200 changed to 16.22 x Quantity on hand of 10',0,0,1,''),(71,'1460','2009-02-04','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',0,2.7,1,''),(72,'2150','2009-02-04','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',-2.7,0,1,''),(73,'1460','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',0,2.7,1,''),(74,'2150','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',-2.7,0,1,''),(75,'1460','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',0,2.7,1,''),(76,'2150','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',-2.7,0,1,''),(77,'1460','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',0,2.7,1,''),(78,'2150','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',-2.7,0,1,''),(79,'1460','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',0,2.7,1,''),(80,'2150','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',-2.7,0,1,''),(81,'1460','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',0,2.7,1,''),(82,'2150','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',-2.7,0,1,''),(83,'1460','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',0,2.7,1,''),(84,'2150','2009-02-05','PO: 1 CAMPBELL - DVD-LTWP - Lethal Weapon Linked x 1 @ 2.70',-2.7,0,1,''),(85,'1460','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',0,2.5,1,''),(86,'2150','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',-2.5,0,1,''),(87,'1460','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',0,2.5,1,''),(88,'2150','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',-2.5,0,1,''),(89,'1460','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',0,2.5,1,''),(90,'2150','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',-2.5,0,1,''),(91,'1460','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',0,2.5,1,''),(92,'2150','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',-2.5,0,1,''),(93,'1460','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',0,2.5,1,''),(94,'2150','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',-2.5,0,1,''),(95,'1460','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',0,2.5,1,''),(96,'2150','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',-2.5,0,1,''),(97,'1460','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',0,2.5,1,''),(98,'2150','2009-02-05','PO: 2 GOTSTUFF - SALT - Salt x 1 @ 2.50',-2.5,0,1,''),(99,'5700','2009-02-05','BREAD x 100 @ 6.0085 ',-600.85,0,1,''),(100,'1460','2009-02-05','BREAD x 100 @ 6.0085 ',0,600.85,1,''),(101,'5000','2009-05-16','DUMBLE - SLICE x 20 @ 0.6009',-12.018,0,1,''),(102,'1460','2009-05-16','DUMBLE - SLICE x 20 @ 0.6009',0,12.018,1,''),(103,'4100','2009-05-16','DUMBLE - SLICE x 20 @ .12',0,3,1,''),(104,'1100','2009-05-16','DUMBLE',-3,0,1,''),(105,'5000','2009-05-18','DUMBLE - SLICE x 20 @ 0.6009',0,12.018,1,''),(106,'1460','2009-05-18','DUMBLE - SLICE x 20 @ 0.6009',-12.018,0,1,''),(107,'4100','2009-05-18','DUMBLE - SLICE x 20 @ 0.25',-6.25,0,1,''),(108,'1100','2009-05-18','DUMBLE',0,6.25,1,''),(109,'5000','2009-05-16','DUMBLE - SLICE x 20 @ 0.6009',-12.02,0,1,''),(110,'1460','2009-05-16','DUMBLE - SLICE x 20 @ 0.6009',0,12.02,1,''),(111,'4100','2009-05-16','DUMBLE - SLICE x 20 @ 0.25000',0,6.25,1,''),(112,'1100','2009-05-16','DUMBLE',-6.25,0,1,''),(113,'5700','2009-05-17','Cost roll on release of WO: 10 - SLICE cost was 0.6009 changed to 0.60085 x Quantity on hand of 20',0,0.00099999999999989,1,''),(114,'1460','2009-05-17','Cost roll on release of WO: 10 - SLICE cost was 0.6009 changed to 0.60085 x Quantity on hand of 20',-0.00099999999999989,0,1,''),(115,'1440','2009-05-17','10 - SLICE Component: BREAD - 15 x 0.1 @ 6.01',0,9.01275,1,''),(116,'1460','2009-05-17','10 - SLICE -> BREAD - 15 x 0.1 @ 6.01',-9.01275,0,1,''),(117,'5700','2009-05-17','Cost roll on release of WO: 10 - SLICE cost was 0.6009 changed to 0.60085 x Quantity on hand of 35',0,0.0017499999999998,1,''),(118,'1460','2009-05-17','Cost roll on release of WO: 10 - SLICE cost was 0.6009 changed to 0.60085 x Quantity on hand of 35',-0.0017499999999998,0,1,''),(119,'1440','2009-05-17','10 - SLICE Component: BREAD - 3 x 0.1 @ 6.01',0,1.80255,1,''),(120,'1460','2009-05-17','10 - SLICE -> BREAD - 3 x 0.1 @ 6.01',-1.80255,0,1,''),(121,'1460','2009-05-17','10 SLICE - Slice Of Bread x 3 @ 0.60',0,1.80255,1,''),(122,'1440','2009-05-17','10 SLICE - Slice Of Bread x 3 @ 0.60',-1.80255,0,1,'');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(20) NOT NULL,
  `parent` varchar(20) default NULL,
  `name` varchar(40) NOT NULL,
  `description` varchar(40) NOT NULL,
  `discount_category` varchar(2) NOT NULL,
  `tax_id` tinyint(4) NOT NULL default '1',
  `serialised` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`code`),
  UNIQUE KEY `id` (`id`),
  KEY `CategoryID` (`parent`),
  KEY `Description` (`description`),
  KEY `StockID` (`code`,`parent`),
  KEY `DiscountCategory` (`discount_category`),
  KEY `taxcatid` (`tax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`id`,`code`,`parent`,`name`,`description`,`discount_category`,`tax_id`,`serialised`) values (1,'AIRCON',NULL,'Air Conditioning','Air Conditioning','',1,0),(2,'BAKE',NULL,'Baking Ingredients','Baking Ingredients','',1,0),(3,'BREAD','FOOD','Bread','Bread','',1,0),(4,'DVD',NULL,'DVDs','DVDs','',1,0),(5,'DVD-CASE','DVD','webERP Demo DVD Case','webERP Demo DVD Case','',1,1),(6,'DVD-DHWV','DVD','Die Hard With A Vengeance Linked','Die Hard With A Vengeance Linked','',1,0),(7,'DVD-LTWP','AIRCON','Lethal Weapon Linked','Lethal Weapon Linked','',1,0),(8,'DVD-TOPGUN','DVD','Top Gun DVD','Top Gun DVD','',1,0),(9,'DVD-UNSG','DVD','Under Siege Linked','Under Siege Linked','',1,0),(10,'DVD-UNSG2','DVD','Under Siege 2 - Dark Territory','Under Siege 2 - Dark Territory','',1,0),(11,'DVD_ACTION','DVD','Action Series Bundle','Action Series Bundle','',1,0),(12,'FLOUR','AIRCON','High Grade Flour','High Grade Flour','',1,0),(13,'FOOD',NULL,'Food','Food','',1,0),(14,'FUJI990101','AIRCON','Fujitsu 990101 Split type Indoor Unit 3.','Fujitsu 990101 Split type Indoor Unit 3.','',1,0),(15,'FUJI990102','AIRCON','Fujitsu 990102 split type A/C Outdoor un','Fujitsu 990102 split type A/C Outdoor un','',1,0),(16,'FUJI9901ASS','AIRCON','Fujitsu 990101 Split type A/C 3.5kw comp','Fujitsu 990101 Split type A/C 3.5kw comp','',1,0),(17,'HIT3042-4','AIRCON','Hitachi Aircond Rev Cycle Split Type 6.5','Hitachi Aircond Rev Cycle Split Type 6.5','',1,1),(18,'HIT3043-5','AIRCON','Hitachi Aircond Rev Cycle Split Type 6.5','Hitachi Aircond Rev Cycle Split Type 6.5','',1,1),(19,'SALT','BAKE','Salt','Salt','',1,0),(20,'SLICE','FOOD','Slice Of Bread','Slice Of Bread','',1,1),(21,'YEAST','BAKE','Yeast','Yeast','',1,0);

/*Table structure for table `product_account` */

DROP TABLE IF EXISTS `product_account`;

CREATE TABLE `product_account` (
  `id` int(12) NOT NULL auto_increment,
  `code` varchar(20) default NULL,
  `name` varchar(40) default NULL,
  `description` varchar(40) NOT NULL,
  `type` varchar(1) NOT NULL default 'F',
  `acc_stock` varchar(20) NOT NULL,
  `acc_adjgl` varchar(20) NOT NULL,
  `acc_purchase` varchar(20) NOT NULL default '80000',
  `acc_material` varchar(20) NOT NULL default '80000',
  `acc_wip` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `CategoryDescription` (`description`),
  KEY `StockType` (`type`),
  KEY `FK_ref_product_category_1` (`acc_stock`),
  KEY `FK_ref_product_category_2` (`acc_adjgl`),
  KEY `FK_ref_product_category_3` (`acc_material`),
  KEY `FK_ref_product_category_4` (`acc_purchase`),
  KEY `FK_ref_product_category_5` (`acc_wip`),
  KEY `FK_product_account_5` (`code`),
  CONSTRAINT `FK_product_account_5` FOREIGN KEY (`code`) REFERENCES `product` (`code`),
  CONSTRAINT `FK_ref_product_category_1` FOREIGN KEY (`acc_stock`) REFERENCES `account_master` (`ACC_CODE`),
  CONSTRAINT `FK_ref_product_category_2` FOREIGN KEY (`acc_adjgl`) REFERENCES `account_master` (`ACC_CODE`),
  CONSTRAINT `FK_ref_product_category_3` FOREIGN KEY (`acc_material`) REFERENCES `account_master` (`ACC_CODE`),
  CONSTRAINT `FK_ref_product_category_4` FOREIGN KEY (`acc_purchase`) REFERENCES `account_master` (`ACC_CODE`),
  CONSTRAINT `FK_ref_product_category_5` FOREIGN KEY (`acc_wip`) REFERENCES `account_master` (`ACC_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `product_account` */

insert  into `product_account`(`id`,`code`,`name`,`description`,`type`,`acc_stock`,`acc_adjgl`,`acc_purchase`,`acc_material`,`acc_wip`) values (1,'AIRCON','Air Conditioning','Air Conditioning','F','1460','5700','5200','5100','1440'),(2,'BAKE','Baking Ingredients','Baking Ingredients','F','1460','5700','5200','5000','1440'),(3,'DVD','DVDs','DVDs','F','1460','5700','5000','5200','1440'),(4,'FOOD','Food','Food','F','1460','5700','5200','5000','1440');

/*Table structure for table `stock_master` */

DROP TABLE IF EXISTS `stock_master`;

CREATE TABLE `stock_master` (
  `id` int(12) NOT NULL auto_increment,
  `code` varchar(20) NOT NULL,
  `units` varchar(20) NOT NULL default 'each',
  `mbflag` varchar(1) NOT NULL default 'B',
  `lastcurcostdate` date NOT NULL default '1800-01-01',
  `actualcost` decimal(20,4) NOT NULL default '0.0000',
  `lastcost` decimal(20,4) NOT NULL default '0.0000',
  `materialcost` decimal(20,4) NOT NULL default '0.0000',
  `labourcost` decimal(20,4) NOT NULL default '0.0000',
  `overheadcost` decimal(20,4) NOT NULL default '0.0000',
  `lowestlevel` smallint(6) NOT NULL default '0',
  `discontinued` tinyint(4) NOT NULL default '0',
  `controlled` tinyint(4) NOT NULL default '0',
  `eoq` double NOT NULL default '0',
  `volume` decimal(20,4) NOT NULL default '0.0000',
  `kgs` decimal(20,4) NOT NULL default '0.0000',
  `barcode` varchar(50) NOT NULL,
  `discountcategory` varchar(2) NOT NULL,
  `taxcatid` tinyint(4) NOT NULL default '1',
  `serialised` tinyint(4) NOT NULL default '0',
  `appendfile` varchar(40) NOT NULL default 'none',
  `perishable` tinyint(1) NOT NULL default '0',
  `decimalplaces` tinyint(4) NOT NULL default '0',
  `nextserialno` bigint(20) NOT NULL default '0',
  `pansize` double NOT NULL default '0',
  `shrinkfactor` double NOT NULL default '0',
  PRIMARY KEY  (`code`),
  UNIQUE KEY `id` (`id`),
  KEY `LastCurCostDate` (`lastcurcostdate`),
  KEY `MBflag` (`mbflag`),
  KEY `StockID` (`code`),
  KEY `Controlled` (`controlled`),
  KEY `DiscountCategory` (`discountcategory`),
  KEY `taxcatid` (`taxcatid`),
  CONSTRAINT `FK_stock_master` FOREIGN KEY (`code`) REFERENCES `product` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `stock_master` */

insert  into `stock_master`(`id`,`code`,`units`,`mbflag`,`lastcurcostdate`,`actualcost`,`lastcost`,`materialcost`,`labourcost`,`overheadcost`,`lowestlevel`,`discontinued`,`controlled`,`eoq`,`volume`,`kgs`,`barcode`,`discountcategory`,`taxcatid`,`serialised`,`appendfile`,`perishable`,`decimalplaces`,`nextserialno`,`pansize`,`shrinkfactor`) values (1,'BREAD','each','M','1800-01-01','0.0000','8.8785','6.0085','0.0000','0.0000',0,0,0,0,'0.0000','0.0000','','',1,0,'none',0,0,0,0,0),(2,'DVD-CASE','each','M','1800-01-01','0.0000','0.0000','0.3000','0.0000','0.0000',0,0,1,0,'0.0000','0.0000','','',1,1,'0',0,0,25440,0,0),(3,'DVD-DHWV','each','B','1800-01-01','0.0000','5.5000','2.3200','0.0000','0.0000',0,0,0,0,'0.0000','7.0000','','',1,0,'none',0,0,0,0,0),(4,'DVD-LTWP','each','B','1800-01-01','0.0000','2.6600','2.7000','0.0000','0.0000',0,0,0,0,'0.0000','7.0000','','',1,0,'none',0,0,0,0,0),(5,'DVD-TOPGUN','each','B','1800-01-01','0.0000','0.0000','6.5000','0.0000','0.0000',0,0,1,0,'0.0000','0.0000','','',1,0,'none',0,0,0,0,0),(6,'DVD-UNSG','each','B','1800-01-01','0.0000','0.0000','5.0000','0.0000','0.0000',0,0,0,0,'0.0000','7.0000','','',1,0,'none',0,0,0,0,0),(7,'DVD-UNSG2','each','B','1800-01-01','0.0000','0.0000','5.0000','0.0000','0.0000',0,0,0,0,'0.0000','7.0000','','',1,0,'none',0,0,0,0,0),(8,'DVD_ACTION','each','M','1800-01-01','0.0000','0.0000','16.2200','0.0000','0.0000',0,0,0,0,'0.0000','0.0000','','',1,0,'none',0,0,0,0,0),(9,'FLOUR','kgs','B','1800-01-01','0.0000','0.0000','3.8900','0.0000','0.0000',0,0,1,0,'0.0000','0.0000','','',1,0,'none',0,1,0,0,0),(10,'FUJI990101','each','B','1800-01-01','0.0000','995.7138','1015.6105','0.0000','0.0000',0,0,0,0,'0.0000','0.0000','','',1,0,'none',0,4,0,0,0),(11,'FUJI990102','each','B','1800-01-01','0.0000','0.0000','633.0000','0.0000','0.0000',0,0,0,0,'0.0000','0.0000','','',1,0,'none',0,0,0,0,0),(12,'FUJI9901ASS','each','A','1800-01-01','0.0000','0.0000','0.0000','0.0000','0.0000',0,0,0,0,'0.0000','0.0000','','',1,0,'none',0,0,0,0,0),(13,'HIT3042-4','each','M','1800-01-01','0.0000','0.0000','853.0000','0.0000','0.0000',0,0,1,5,'0.4000','7.8000','','',1,1,'none',0,0,0,0,0),(14,'HIT3043-5','each','B','1800-01-01','0.0000','0.0000','1235.0000','0.0000','0.0000',0,0,1,5,'0.8500','16.0000','','',1,1,'none',0,0,0,0,0),(15,'SALT','kgs','B','1800-01-01','0.0000','1.2000','2.5000','0.0000','0.0000',0,0,0,0,'0.0000','0.0000','','',1,0,'none',0,3,0,0,0),(16,'SLICE','each','M','1800-01-01','0.0000','0.6009','0.6009','0.0000','0.0000',0,0,1,0,'0.0000','0.0000','','',1,1,'0',0,0,1000,0,0),(17,'YEAST','kgs','B','1800-01-01','0.0000','3.8500','5.0000','0.0000','0.0000',0,0,1,0,'0.0000','0.0000','','',1,0,'none',0,3,0,0,0);
