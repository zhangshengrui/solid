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
CREATE DATABASE /*!32312 IF NOT EXISTS*/`solid` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fleet` */

insert  into `fleet`(`id`,`number`,`license`,`official`,`telephone`,`status`,`memo`,`indate`) values (1,'DA02','07068','小明','18209040713',0,'~','2018-06-12'),(2,'HK02','07096','小红','18209040714',0,'aa','2018-06-12'),(3,'BC01','07069','小刚','18103065236',0,'aa','2018-06-12');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `goods` */

insert  into `goods`(`id`,`number`,`name`,`address`,`price`,`indate`,`status`,`memo`) values (1,'SS01','沙','四十米场',12.12,'2018-06-12',0,'四十米场'),(2,'TW01','沙','桃围场',80.00,'2018-06-12',0,'四十米场'),(3,'XD01','沙','星都场',0.00,'2018-06-12',0,'星都场');

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
  `company` float(255,2) DEFAULT '0.00' COMMENT '单位（吨数/方数）',
  `receiver_count` float(255,2) DEFAULT '0.00' COMMENT '收货方数量',
  `receiver_price` float(255,2) DEFAULT '0.00' COMMENT '收货方单价',
  `receiver_money` float(255,2) DEFAULT '0.00' COMMENT '收货方金额',
  `profit` float(255,2) DEFAULT '0.00' COMMENT '利润',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  `indate` date DEFAULT NULL COMMENT '增加日期',
  `status` int(255) DEFAULT '0' COMMENT '状态(0:正常  -1删除 )',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `order` */

insert  into `order`(`id`,`date`,`fleet_number`,`fleet_license`,`goods_name`,`supplier_name`,`supplier_certify`,`goods_count`,`goods_price`,`goods_money`,`receiver_name`,`receiver_certify`,`company`,`receiver_count`,`receiver_price`,`receiver_money`,`profit`,`memo`,`indate`,`status`) values (1,'2018-06-04','1','07068','1','1','0009211',34.50,100.00,3450.00,'1','032600003',11.00,52.55,35.99,130.00,100.23,'s','2018-06-12',0);

/*Table structure for table `password` */

DROP TABLE IF EXISTS `password`;

CREATE TABLE `password` (
  `id` int(155) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `node` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '节点名称',
  `password` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `memo` text COLLATE utf8_bin COMMENT '密码信息描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `password` */

insert  into `password`(`id`,`node`,`password`,`memo`) values (1,'基本信息管理',NULL,'供货商基本信息管理删除密码'),(2,'基本信息管理','2be9bd7a3434f7038ca27d1918de58bd','货物基本信息管理删除密码'),(3,'基本信息管理','670da91be64127c92faac35c8300e814','车队基本管理删除密码'),(4,'基本信息管理',NULL,'收货方基本信息管理删除密码'),(5,'订单管理','21232f297a57a5a743894a0e4a801fc3','订单详情删除密码'),(6,'系统管理','21232f297a57a5a743894a0e4a801fc3','用户信息管理删除密码'),(7,'系统管理','21232f297a57a5a743894a0e4a801fc3','用户信息管理重置密码');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `receiver` */

insert  into `receiver`(`id`,`supplier_name`,`supplier_address`,`supplier_official`,`telephone`,`status`,`memo`,`indate`) values (1,'宝丽华','哈尔滨','宝丽华','18236541245',0,'','2018-06-12'),(2,'埔中央','西二旗','德莱尔','18795231452',0,'','2018-06-12');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `supplier` */

insert  into `supplier`(`id`,`supplier_name`,`supplier_address`,`supplier_official`,`telephone`,`status`,`memo`,`indate`) values (1,'四十米场','北京三里屯','张三','18201016030',0,'第一个供货商','2018-06-12'),(2,'桃尾场','上海厂商','李四','18209110713',0,'沙','2018-06-12'),(3,'铁炉','广州','王五','18201016030',0,'备注一下','2018-06-12');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `account` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '账号',
  `role` int(11) DEFAULT '0' COMMENT '角色类型（0：worker 1：viewer 2:admin）',
  `status` int(11) DEFAULT '0' COMMENT '状态（0：正常 1：关闭 -1：删除）',
  `password` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  `indate` date DEFAULT NULL COMMENT '新增日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`account`,`role`,`status`,`password`,`memo`,`indate`) values (1,'admin','admin',2,0,NULL,'我是超级管理员','2018-06-12'),(2,'zhangshengrui2','develop12334',0,0,NULL,'我只能看基本信息1','2018-06-12'),(3,'wangwang','test1234',1,0,NULL,'我能看订单','2018-06-12'),(4,'admin2','test0000',0,0,'21232f297a57a5a743894a0e4a801fc3','1','2018-06-12'),(5,'admin','sss',0,0,'21232f297a57a5a743894a0e4a801fc3','s','2018-06-12'),(6,'adad','asdd',0,0,NULL,'asdd','2018-06-12'),(7,'ads','2323',0,0,'21232f297a57a5a743894a0e4a801fc3','a','2018-06-12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
