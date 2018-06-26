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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fleet` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(44) NOT NULL AUTO_INCREMENT COMMENT '货物主键',
  `number` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '编号',
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `address` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商地址',
  `conversion` float(255,2) DEFAULT '1.00' COMMENT '换算单位',
  `price` float(255,2) DEFAULT NULL COMMENT '价格',
  `indate` date DEFAULT NULL COMMENT '插入日期',
  `status` int(44) DEFAULT '0' COMMENT '//当前状态（0：正常 1：关闭 -1：删除）',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `goods` */

/*Table structure for table `journal` */

DROP TABLE IF EXISTS `journal`;

CREATE TABLE `journal` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `person` varchar(256) DEFAULT NULL COMMENT '操作人',
  `time` datetime DEFAULT NULL COMMENT '操作时间',
  `type` varchar(256) DEFAULT NULL COMMENT '操作类型',
  `content` text COMMENT '操作详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=gb2312;

/*Data for the table `journal` */

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
  `tonnage` float(255,2) DEFAULT '0.00' COMMENT '收货单位(吨位/方数)',
  `conversion` float(255,2) DEFAULT '1.00' COMMENT '转换单位',
  `goods_count` float(255,2) DEFAULT '0.00' COMMENT '计费数量',
  `goods_price` float(255,2) DEFAULT '0.00' COMMENT '货物单价',
  `goods_money` float(255,2) DEFAULT '0.00' COMMENT '货物金额',
  `receiver_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方',
  `receiver_certify` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方单号',
  `company` float(255,2) DEFAULT '0.00' COMMENT '单位（吨数/方数）',
  `receiver_conversion` float(255,2) DEFAULT '1.00' COMMENT '收货方转换比例',
  `receiver_count` float(255,2) DEFAULT '0.00' COMMENT '收货方数量',
  `receiver_price` float(255,2) DEFAULT '0.00' COMMENT '收货方单价',
  `receiver_money` float(255,2) DEFAULT '0.00' COMMENT '收货方金额',
  `profit` float(255,2) DEFAULT '0.00' COMMENT '利润',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  `indate` date DEFAULT NULL COMMENT '增加日期',
  `status` int(255) DEFAULT '0' COMMENT '状态(0:正常  -1删除 )',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `order` */

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

insert  into `password`(`id`,`node`,`password`,`memo`) values (1,'基本信息管理','21232f297a57a5a743894a0e4a801fc3','供货商基本信息管理删除密码'),(2,'基本信息管理','21232f297a57a5a743894a0e4a801fc3','货物基本信息管理删除密码'),(3,'基本信息管理','21232f297a57a5a743894a0e4a801fc3','车队基本管理删除密码'),(4,'基本信息管理','21232f297a57a5a743894a0e4a801fc3','收货方基本信息管理删除密码'),(5,'订单管理','21232f297a57a5a743894a0e4a801fc3','订单详情删除密码'),(6,'系统管理','21232f297a57a5a743894a0e4a801fc3','用户信息管理删除密码'),(7,'系统管理','21232f297a57a5a743894a0e4a801fc3','用户信息管理重置密码');

/*Table structure for table `receiver` */

DROP TABLE IF EXISTS `receiver`;

CREATE TABLE `receiver` (
  `id` int(44) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `supplier_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商名称',
  `price` float(255,2) DEFAULT '0.00' COMMENT '收货单价',
  `conversion` float(255,2) DEFAULT '1.00' COMMENT '转换比例',
  `supplier_address` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商地址',
  `supplier_official` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商负责人',
  `telephone` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商电话',
  `status` int(11) DEFAULT '0' COMMENT '当前状态（0：正常 1：关闭 -1：删除）',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  `indate` date DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `receiver` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` int(44) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `supplier_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商名称',
  `supplier_address` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供货商地址',
  `conversion` float(255,2) DEFAULT '1.00' COMMENT '换算单位',
  `supplier_official` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商负责人',
  `telephone` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商电话',
  `status` int(11) DEFAULT '0' COMMENT '当前状态（0：正常 1：关闭 -1：删除）',
  `memo` text COLLATE utf8_bin COMMENT '备注',
  `indate` date DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `supplier` */

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`account`,`role`,`status`,`password`,`memo`,`indate`) values (1,'我是管理员','admin',2,0,'21232f297a57a5a743894a0e4a801fc3','我是超级管理员','2018-06-12'),(2,'张三','develop',0,0,'21232f297a57a5a743894a0e4a801fc3','我只能看基本信息1','2018-06-12'),(3,'李四','test',1,0,'21232f297a57a5a743894a0e4a801fc3','我能看订单','2018-06-12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
