/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.28 : Database - solid
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`solid` /*!40100 DEFAULT CHARACTER SET gb2312 */;

USE `solid`;

/*Table structure for table `fleet` */

DROP TABLE IF EXISTS `fleet`;

CREATE TABLE `fleet` (
  `id` int(44) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `number` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '编号',
  `license` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '车牌号',
  `official` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商负责人',
  `telephone` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商电话',
  `status` int(11) DEFAULT '0' COMMENT '当前状态（0：正常 1：关闭 -1：删除）',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  `indate` date DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fleet` */

insert  into `fleet`(`id`,`number`,`license`,`official`,`telephone`,`status`,`memo`,`indate`) values (1,'2','3','4','5',-1,NULL,NULL),(2,'2222','sdgsg','aada','18209040713',0,'','2018-06-12'),(3,'1111444','22','333','18209040714',0,'d222',NULL),(4,'ads','asdddd','ads','18209040713',0,'',NULL),(5,'ads','asd2','aa','18209040713',0,'a','2018-06-12');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(44) NOT NULL AUTO_INCREMENT COMMENT '货物主键',
  `number` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '编号',
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `address` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商地址',
  `price` float(255,2) DEFAULT NULL COMMENT '价格',
  `indate` date DEFAULT NULL COMMENT '插入日期',
  `status` int(44) DEFAULT '0' COMMENT '//当前状态（0：正常 1：关闭 -1：删除）',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `goods` */

insert  into `goods`(`id`,`number`,`name`,`address`,`price`,`indate`,`status`,`memo`) values (1,'gysn','111','ddd',2.00,'2018-06-12',0,'1111'),(2,'22','aa','dd',12121.10,'2018-06-12',0,'aaa'),(3,'gysn','11','dddd',11.20,'2018-06-12',0,'1'),(4,'33','12','1',12.00,'2018-06-12',0,'2');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `date` date DEFAULT NULL COMMENT '订单日期',
  `fleet_number` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '车队编码',
  `fleet_license` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '车队车牌号',
  `goods_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '货物名称',
  `supplier_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '供货名称',
  `supplier_certify` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '供货单号',
  `goods_count` float(255,2) DEFAULT '0.00' COMMENT '计费数量',
  `goods_price` float(255,2) DEFAULT '0.00' COMMENT '货物单价',
  `goods_money` float(255,2) DEFAULT '0.00' COMMENT '货物金额',
  `receiver_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方',
  `receiver_certify` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方单号',
  `receiver_count` float(255,2) DEFAULT '0.00' COMMENT '收货方数量',
  `receiver_price` float(255,2) DEFAULT '0.00' COMMENT '收货方单价',
  `receiver_money` float(255,2) DEFAULT '0.00' COMMENT '收货方金额',
  `profit` float(255,2) DEFAULT '0.00' COMMENT '利润',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  `indate` date DEFAULT NULL COMMENT '增加日期',
  `status` int(255) DEFAULT '0' COMMENT '状态(0:正常  -1删除 )',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8093 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `order` */

insert  into `order`(`id`,`date`,`fleet_number`,`fleet_license`,`goods_name`,`supplier_name`,`supplier_certify`,`goods_count`,`goods_price`,`goods_money`,`receiver_name`,`receiver_certify`,`receiver_count`,`receiver_price`,`receiver_money`,`profit`,`memo`,`indate`,`status`) values (8090,'2018-06-12','HK02','07068','石','后坑','009123',34.50,100.00,3450.00,'宝丽华','023445534',52.55,35.99,130.00,4678.11,'测试添加一条数据','2018-06-12',0),(8091,'2018-06-15','HK02','07068','石','后坑','009123',0.00,0.00,0.00,'宝丽华','023445531',0.00,0.00,0.00,0.00,'sss','2018-06-12',0),(8092,'2018-06-11','HK02','07068','石','后坑','009123',0.00,0.00,0.00,'宝丽华','2',0.00,0.00,0.00,0.00,NULL,'2018-06-12',0);

/*Table structure for table `receiver` */

DROP TABLE IF EXISTS `receiver`;

CREATE TABLE `receiver` (
  `id` int(44) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `supplier_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商名称',
  `supplier_address` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商地址',
  `supplier_official` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商负责人',
  `telephone` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商电话',
  `status` int(11) DEFAULT '0' COMMENT '当前状态（0：正常 1：关闭 -1：删除）',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  `indate` date DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `receiver` */

insert  into `receiver`(`id`,`supplier_name`,`supplier_address`,`supplier_official`,`telephone`,`status`,`memo`,`indate`) values (11,'222','3333','11','18209040713',1,'ffff',NULL),(12,'ada','asd','asdd','18209040714',-1,'asd','2018-06-12'),(13,'adad','','','',-1,'','2018-06-12'),(14,'asdd','','','',0,'','2018-06-12'),(15,'ddd','adsdddd','das','18209040713',0,'dsaddd','2018-06-12');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` int(44) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `supplier_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商名称',
  `supplier_address` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商地址',
  `supplier_official` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商负责人',
  `telephone` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商电话',
  `status` int(11) DEFAULT '0' COMMENT '当前状态（0：正常 1：关闭 -1：删除）',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  `indate` date DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `supplier` */

insert  into `supplier`(`id`,`supplier_name`,`supplier_address`,`supplier_official`,`telephone`,`status`,`memo`,`indate`) values (1,'1112','','','',0,'','2018-06-12'),(2,'aaaaa','','1','',0,'','2018-06-12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
