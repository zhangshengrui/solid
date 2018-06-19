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

insert  into `goods`(`id`,`number`,`name`,`address`,`price`,`indate`,`status`,`memo`) values (1,'SS01','沙(SS01)','四十米场',12.12,'2018-06-12',0,'四十米场'),(2,'TW01','沙(TW01)','桃尾场',80.00,'2018-06-12',0,'四十米场'),(3,'XD01','沙(XD01)','星都场	',0.00,'2018-06-12',0,'星都场');

/*Table structure for table `journal` */

DROP TABLE IF EXISTS `journal`;

CREATE TABLE `journal` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `person` varchar(256) DEFAULT NULL COMMENT '操作人',
  `time` datetime DEFAULT NULL COMMENT '操作时间',
  `type` varchar(256) DEFAULT NULL COMMENT '操作类型',
  `content` text COMMENT '操作详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gb2312;

/*Data for the table `journal` */

insert  into `journal`(`id`,`person`,`time`,`type`,`content`) values (1,'name','2018-06-13 18:30:49','新增订单','订单ID:-1, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'1\', 计费数量:\'33.0\', 货物单价:\'11.0\', 货物金额:\'33.0\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.0\', 收货方单价:\'11.0\', 收货方金额:\'11.0\', 吨位/方数:\'11.0\', 利润:\'111.0\', 备注:\'11\''),(2,'name','2018-06-13 18:32:01','修改订单','旧订单:订单ID:2, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'1\', 计费数量:\'33.00\', 货物单价:\'11.00\', 货物金额:\'33.00\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.00\', 收货方单价:\'11.00\', 收货方金额:\'11.00\', 吨位/方数:\'11.00\', 利润:\'111.00\', 备注:\'11\'<br>新订单订单ID:2, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'222\', 计费数量:\'33.0\', 货物单价:\'11.0\', 货物金额:\'33.0\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.0\', 收货方单价:\'11.0\', 收货方金额:\'11.0\', 吨位/方数:\'11.0\', 利润:\'111.0\', 备注:\'11\''),(3,'name','2018-06-13 18:35:25','修改订单','旧订单:订单ID:2, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'222\', 计费数量:\'33.00\', 货物单价:\'11.00\', 货物金额:\'33.00\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.00\', 收货方单价:\'11.00\', 收货方金额:\'11.00\', 吨位/方数:\'11.00\', 利润:\'111.00\', 备注:\'11\'<br><br>新订单:订单ID:2, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'222\', 计费数量:\'33.0\', 货物单价:\'11.0\', 货物金额:\'33.0\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.0\', 收货方单价:\'11.0\', 收货方金额:\'11.0\', 吨位/方数:\'11.0\', 利润:\'111.0\', 备注:\'1122\''),(4,'name','2018-06-13 18:37:19','删除订单','订单ID:2, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'222\', 计费数量:\'33.00\', 货物单价:\'11.00\', 货物金额:\'33.00\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.00\', 收货方单价:\'11.00\', 收货方金额:\'11.00\', 吨位/方数:\'11.00\', 利润:\'111.00\', 备注:\'1122\''),(5,'name','2018-06-13 18:37:50','删除订单','订单ID:2, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'222\', 计费数量:\'33.00\', 货物单价:\'11.00\', 货物金额:\'33.00\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.00\', 收货方单价:\'11.00\', 收货方金额:\'11.00\', 吨位/方数:\'11.00\', 利润:\'111.00\', 备注:\'1122\''),(6,'name','2018-06-13 18:38:06','删除订单','订单ID:2, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'222\', 计费数量:\'33.00\', 货物单价:\'11.00\', 货物金额:\'33.00\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.00\', 收货方单价:\'11.00\', 收货方金额:\'11.00\', 吨位/方数:\'11.00\', 利润:\'111.00\', 备注:\'1122\''),(7,'name','2018-06-13 18:38:06','删除订单','订单ID:1, 订单日期:\'2018-06-04\', 车队编码:\'1\', 车队车牌号:\'07068\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'0009211\', 计费数量:\'34.50\', 货物单价:\'100.00\', 货物金额:\'3450.00\', 收货单位:\'1\', 收货方单号:\'032600003\', 收货方数量:\'52.55\', 收货方单价:\'35.99\', 收货方金额:\'130.00\', 吨位/方数:\'11.00\', 利润:\'100.23\', 备注:\'s\''),(8,'name','2018-06-13 18:40:31','删除订单','订单ID:2, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'222\', 计费数量:\'33.00\', 货物单价:\'11.00\', 货物金额:\'33.00\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.00\', 收货方单价:\'11.00\', 收货方金额:\'11.00\', 吨位/方数:\'11.00\', 利润:\'111.00\', 备注:\'1122\''),(9,'name','2018-06-13 18:40:31','删除订单','订单ID:1, 订单日期:\'2018-06-04\', 车队编码:\'1\', 车队车牌号:\'07068\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'0009211\', 计费数量:\'34.50\', 货物单价:\'100.00\', 货物金额:\'3450.00\', 收货单位:\'1\', 收货方单号:\'032600003\', 收货方数量:\'52.55\', 收货方单价:\'35.99\', 收货方金额:\'130.00\', 吨位/方数:\'11.00\', 利润:\'100.23\', 备注:\'s\''),(10,'name','2018-06-13 18:47:41','删除订单','订单ID:2, 订单日期:\'2018-06-13\', 车队编码:\'1\', 车队车牌号:\'test\', 货物名称:\'1\', 供货单位名称:\'1\', 供货单号:\'222\', 计费数量:\'33.00\', 货物单价:\'11.00\', 货物金额:\'33.00\', 收货单位:\'1\', 收货方单号:\'44\', 收货方数量:\'11.00\', 收货方单价:\'11.00\', 收货方金额:\'11.00\', 吨位/方数:\'11.00\', 利润:\'111.00\', 备注:\'1122\''),(11,'name','2018-06-19 14:26:05','新增订单','订单ID:-1, 订单日期:\'2018-06-19\', 车队编码:\'BC01\', 车队车牌号:\'12231\', 货物名称:\'沙(XD01)\', 供货单位名称:\'星都场	\', 供货单号:\'1111\', 计费数量:\'2.0\', 货物单价:\'2.0\', 货物金额:\'2.0\', 收货单位:\'埔中央\', 收货方单号:\'2\', 收货方数量:\'2.0\', 收货方单价:\'2.0\', 收货方金额:\'2.0\', 吨位/方数:\'2.0\', 利润:\'2.0\', 备注:\'2\''),(12,'name','2018-06-19 14:29:19','修改订单','旧订单:订单ID:3, 订单日期:\'2018-06-19\', 车队编码:\'BC01\', 车队车牌号:\'12231\', 货物名称:\'沙(XD01)\', 供货单位名称:\'星都场	\', 供货单号:\'1111\', 计费数量:\'2.00\', 货物单价:\'2.00\', 货物金额:\'2.00\', 收货单位:\'埔中央\', 收货方单号:\'2\', 收货方数量:\'2.00\', 收货方单价:\'2.00\', 收货方金额:\'2.00\', 吨位/方数:\'2.00\', 利润:\'2.00\', 备注:\'2\'<br><br>新订单:订单ID:3, 订单日期:\'2018-06-19\', 车队编码:\'HK02\', 车队车牌号:\'12231\', 货物名称:\'沙(TW01)\', 供货单位名称:\'铁炉\', 供货单号:\'1111\', 计费数量:\'2.0\', 货物单价:\'2.0\', 货物金额:\'2.0\', 收货单位:\'埔中央\', 收货方单号:\'2\', 收货方数量:\'2.0\', 收货方单价:\'2.0\', 收货方金额:\'2.0\', 吨位/方数:\'2.0\', 利润:\'2.0\', 备注:\'2\''),(13,'name','2018-06-19 15:45:38','新增订单','订单ID:-1, 订单日期:\'2018-06-19\', 车队编码:\'HK02\', 车队车牌号:\'07096\', 货物名称:\'沙(SS01)\', 供货单位名称:\'星都场	\', 供货单号:\'111\', 计费数量:\'2.0\', 货物单价:\'3.0\', 货物金额:\'3.0\', 收货单位:\'埔中央\', 收货方单号:\'11\', 收货方数量:\'11.001\', 收货方单价:\'11.0\', 收货方金额:\'1.0\', 吨位/方数:\'111.0\', 利润:\'111.0\', 备注:\'1\''),(14,'name','2018-06-19 15:45:51','删除订单','订单ID:4, 订单日期:\'2018-06-19\', 车队编码:\'HK02\', 车队车牌号:\'07096\', 货物名称:\'沙(SS01)\', 供货单位名称:\'星都场	\', 供货单号:\'111\', 计费数量:\'2.00\', 货物单价:\'3.00\', 货物金额:\'3.00\', 收货单位:\'埔中央\', 收货方单号:\'11\', 收货方数量:\'11.00\', 收货方单价:\'11.00\', 收货方金额:\'1.00\', 吨位/方数:\'111.00\', 利润:\'111.00\', 备注:\'1\'');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `order` */

insert  into `order`(`id`,`date`,`fleet_number`,`fleet_license`,`goods_name`,`supplier_name`,`supplier_certify`,`goods_count`,`goods_price`,`goods_money`,`receiver_name`,`receiver_certify`,`company`,`receiver_count`,`receiver_price`,`receiver_money`,`profit`,`memo`,`indate`,`status`) values (1,'2018-06-04','1','07068','1','1','0009211',34.50,100.00,3450.00,'1','032600003',11.00,52.55,35.99,130.00,100.23,'s','2018-06-12',0),(2,'2018-06-13','1','test','1','1','222',33.00,11.00,33.00,'1','44',11.00,11.00,11.00,11.00,111.00,'1122','2018-06-13',0),(3,'2018-06-19','HK02','12231','沙(TW01)','铁炉','1111',2.00,2.00,2.00,'埔中央','2',2.00,2.00,2.00,2.00,2.00,'2','2018-06-19',0),(4,'2018-06-19','HK02','07096','沙(SS01)','星都场	','111',2.00,3.00,3.00,'埔中央','11',111.00,11.00,11.00,1.00,111.00,'1','2018-06-19',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `supplier` */

insert  into `supplier`(`id`,`supplier_name`,`supplier_address`,`supplier_official`,`telephone`,`status`,`memo`,`indate`) values (1,'四十米场','北京三里屯','张三','18201016030',0,'第一个供货商','2018-06-12'),(2,'桃尾场','上海厂商','李四','18209110713',0,'沙','2018-06-12'),(3,'铁炉','广州','王五','18201016030',0,'备注一下','2018-06-12'),(4,'星都场	','test','aa','18109876754',0,'1','2018-06-15');

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
