# Host: localhost  (Version: 5.6.17)
# Date: 2016-02-04 11:40:59
# Generator: MySQL-Front 5.3  (Build 4.120)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "a_activities"
#

CREATE TABLE `a_activities` (
  `activeId` int(10) NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `activeName` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `descript` text COMMENT '活动描述',
  `startDate` char(8) NOT NULL DEFAULT '19700101' COMMENT '活动开始日',
  `endDate` char(8) NOT NULL DEFAULT '99991231' COMMENT '活动结束日',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动类型',
  `createTime` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `creator` varchar(64) NOT NULL DEFAULT '' COMMENT '登录者',
  `modifyTime` int(10) DEFAULT NULL COMMENT '修改时间',
  `modifier` varchar(64) DEFAULT NULL COMMENT '修改者',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动状态',
  PRIMARY KEY (`activeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='活动一览';

#
# Structure for table "adminoperation"
#

CREATE TABLE `adminoperation` (
  `operationId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned NOT NULL DEFAULT '0',
  `operationCode` varchar(32) NOT NULL DEFAULT '',
  `operationName` varchar(32) NOT NULL DEFAULT '',
  `isNeedMobileCheck` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationId`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

#
# Structure for table "area"
#

CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '省市名',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=820108 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=240 COMMENT='全国省市表';

#
# Structure for table "b_bankstatement"
#

CREATE TABLE `b_bankstatement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `statementNum` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `beginTime` int(10) NOT NULL DEFAULT '0',
  `endTime` int(10) NOT NULL DEFAULT '0',
  `clearingTime` int(10) NOT NULL DEFAULT '0',
  `createTime` int(10) NOT NULL DEFAULT '0',
  `reMark` varchar(255) NOT NULL,
  `billNum` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospitalId` (`hospitalId`),
  KEY `beginTime` (`beginTime`),
  KEY `endTime` (`endTime`),
  KEY `createTime` (`createTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "b_bill"
#

CREATE TABLE `b_bill` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `orderName` varchar(128) NOT NULL,
  `orderTypeName` varchar(128) NOT NULL,
  `orderDescript` text NOT NULL,
  `clinicCardNum` varchar(32) NOT NULL DEFAULT '',
  `userId` int(10) NOT NULL DEFAULT '0',
  `mobile` varchar(16) NOT NULL DEFAULT '',
  `patientName` varchar(64) NOT NULL,
  `payTime` int(10) NOT NULL DEFAULT '0',
  `bizType` tinyint(1) NOT NULL DEFAULT '0',
  `orderId` bigint(16) NOT NULL DEFAULT '0',
  `thirdId` varchar(64) NOT NULL,
  `serialNum` varchar(64) NOT NULL,
  `successSerialNum` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `payType` tinyint(1) NOT NULL DEFAULT '0',
  `oldMoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `applyTime` int(10) NOT NULL DEFAULT '0',
  `refundTime` int(10) NOT NULL DEFAULT '0',
  `createTime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hospitalId` (`hospitalId`),
  KEY `userId` (`userId`),
  KEY `thirdId` (`thirdId`),
  KEY `orderId` (`orderId`),
  KEY `applyTime` (`applyTime`),
  KEY `refundTime` (`refundTime`),
  KEY `clinicCardNum` (`clinicCardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "b_blacklist"
#

CREATE TABLE `b_blacklist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blackNum` varchar(256) NOT NULL,
  `name` varchar(128) NOT NULL,
  `clinicCardNum` varchar(32) NOT NULL,
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `addTime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `addTime` (`addTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "banks"
#

CREATE TABLE `banks` (
  `bank_id` tinyint(3) NOT NULL AUTO_INCREMENT COMMENT '银行id',
  `bank_code` varchar(255) NOT NULL DEFAULT '' COMMENT '银行代码',
  `bank_name` varchar(255) NOT NULL DEFAULT '' COMMENT '银行名称',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '银行logo的url',
  PRIMARY KEY (`bank_id`),
  UNIQUE KEY `bank_code` (`bank_code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='银行代码表';

#
# Structure for table "c_cliniccard"
#

CREATE TABLE `c_cliniccard` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL DEFAULT '0',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `hospitalName` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `birthDay` char(10) NOT NULL DEFAULT '' COMMENT '出生日期',
  `idCardNum` varchar(32) NOT NULL DEFAULT '',
  `mobile` varchar(16) NOT NULL DEFAULT '',
  `clinicCardNum` varchar(32) NOT NULL DEFAULT '',
  `relationship` tinyint(1) NOT NULL DEFAULT '0',
  `syncStatus` tinyint(1) DEFAULT '0',
  `bidTime` int(10) NOT NULL DEFAULT '0',
  `age` tinyint(3) NOT NULL DEFAULT '0',
  `noteUpdateTime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '健康日志更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '删除状态1 未删除 2 已删除',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `hospitalId` (`hospitalId`),
  KEY `clinicCardNum` (`clinicCardNum`)
) ENGINE=InnoDB AUTO_INCREMENT=1165 DEFAULT CHARSET=utf8;

#
# Structure for table "clinic_laboratory"
#

CREATE TABLE `clinic_laboratory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL DEFAULT '0',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `hospitalName` varchar(64) NOT NULL DEFAULT '',
  `sectionId` int(10) NOT NULL DEFAULT '0',
  `sectionName` varchar(64) NOT NULL DEFAULT '',
  `doctorId` int(10) NOT NULL DEFAULT '0',
  `doctorName` varchar(64) NOT NULL DEFAULT '',
  `clinicCardNum` varchar(64) NOT NULL DEFAULT '',
  `patientId` int(11) NOT NULL DEFAULT '0',
  `patientName` varchar(64) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `age` tinyint(1) NOT NULL DEFAULT '0',
  `clinicLabType` tinyint(1) NOT NULL DEFAULT '0',
  `hospitalClinicLabType` varchar(128) NOT NULL DEFAULT '',
  `requestOrder` int(10) NOT NULL DEFAULT '0',
  `specimenType` varchar(255) NOT NULL DEFAULT '',
  `checkProject` text NOT NULL,
  `checkMethod` text NOT NULL,
  `checkDateTime` int(10) NOT NULL DEFAULT '0',
  `samplingTime` int(10) NOT NULL DEFAULT '0',
  `reportTime` int(10) NOT NULL DEFAULT '0',
  `checkResult` text NOT NULL,
  `checkResultTable` text NOT NULL,
  `createTime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "d_doctor"
#

CREATE TABLE `d_doctor` (
  `doctorId` int(10) NOT NULL AUTO_INCREMENT,
  `doctorKey` varchar(255) NOT NULL DEFAULT '',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `hospitalName` varchar(64) NOT NULL DEFAULT '',
  `sectionId` int(10) NOT NULL DEFAULT '0',
  `sectionName` varchar(64) NOT NULL DEFAULT '',
  `doctorName` varchar(64) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `workTime` varchar(16) NOT NULL DEFAULT '',
  `image` varchar(128) NOT NULL DEFAULT '',
  `goodAspects` text,
  `introduction` text,
  `doctorStatus` tinyint(1) NOT NULL DEFAULT '0',
  `addTime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doctorId`),
  KEY `doctorKey` (`doctorKey`),
  KEY `hospitalId` (`hospitalId`),
  KEY `sectionId` (`sectionId`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=468;

#
# Structure for table "doctor_account"
#

CREATE TABLE `doctor_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `totalMoney` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `revenueTotal` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '收入总计',
  `expenditureTotal` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '支出总计',
  `withdrawTotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `accountStatus` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1、正常，2冻结',
  `openTime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开通日期',
  `lastUpdate` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作时间',
  `remarks` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8;

#
# Structure for table "drug"
#

CREATE TABLE `drug` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `drugCode` varchar(32) NOT NULL DEFAULT '',
  `drugName` varchar(255) NOT NULL DEFAULT '',
  `drugSpec` varchar(32) NOT NULL DEFAULT '',
  `units` varchar(32) NOT NULL DEFAULT '',
  `drugForm` varchar(32) NOT NULL DEFAULT '',
  `toxiProperty` varchar(16) NOT NULL DEFAULT '',
  `dosePerUnit` decimal(10,3) NOT NULL DEFAULT '0.000',
  `doseUnits` varchar(16) NOT NULL DEFAULT '',
  `drugIndicator` tinyint(1) NOT NULL DEFAULT '0',
  `inputCode` varchar(16) NOT NULL DEFAULT '',
  `stopFlag` tinyint(1) NOT NULL DEFAULT '0',
  `contryFlag` varchar(64) NOT NULL DEFAULT '',
  `addTime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `drugCode` (`drugCode`) USING BTREE,
  KEY `inputCode` (`inputCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28953 DEFAULT CHARSET=utf8;

#
# Structure for table "drug_name"
#

CREATE TABLE `drug_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `drugCode` varchar(32) NOT NULL DEFAULT '',
  `drugName` varchar(255) NOT NULL DEFAULT '',
  `stdIndicator` tinyint(1) NOT NULL DEFAULT '0',
  `inputCode` varchar(16) NOT NULL DEFAULT '',
  `inputCodeWb` varchar(16) NOT NULL DEFAULT '',
  `chemicalName` varchar(255) NOT NULL DEFAULT '',
  `addTime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `drugCode` (`drugCode`) USING BTREE,
  KEY `inputCode` (`inputCode`) USING BTREE,
  KEY `inputCodeWb` (`inputCodeWb`) USING BTREE,
  KEY `drugName` (`drugName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4560 DEFAULT CHARSET=utf8;

#
# Structure for table "drug_price"
#

CREATE TABLE `drug_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `drugCode` varchar(32) NOT NULL DEFAULT '',
  `drugSpec` varchar(32) NOT NULL DEFAULT '',
  `firmId` varchar(64) NOT NULL DEFAULT '',
  `units` varchar(16) NOT NULL DEFAULT '',
  `tradePrice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `retailPrice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amountPerPackage` int(10) NOT NULL DEFAULT '0',
  `minSpec` varchar(32) NOT NULL DEFAULT '',
  `minUnits` varchar(16) NOT NULL DEFAULT '',
  `startTime` int(10) NOT NULL DEFAULT '0',
  `addTime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `drugCode` (`drugCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4999 DEFAULT CHARSET=utf8;

#
# Structure for table "electronic_medical"
#

CREATE TABLE `electronic_medical` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL DEFAULT '0',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `hospitalName` varchar(64) NOT NULL DEFAULT '濮阳市油田总医院',
  `netRegnoId` int(10) NOT NULL,
  `sectionId` int(10) NOT NULL DEFAULT '0',
  `sectionName` varchar(64) NOT NULL DEFAULT '',
  `doctorId` int(10) NOT NULL DEFAULT '0',
  `doctorName` varchar(64) NOT NULL DEFAULT '',
  `doctorLevel` tinyint(1) NOT NULL DEFAULT '0',
  `clinicCardNum` varchar(64) DEFAULT NULL,
  `patientName` varchar(64) NOT NULL DEFAULT '',
  `patientId` int(11) NOT NULL DEFAULT '0',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `age` tinyint(1) NOT NULL DEFAULT '0',
  `visitDate` date NOT NULL DEFAULT '0000-00-00',
  `visitId` int(10) NOT NULL DEFAULT '0',
  `mainDescript` text NOT NULL,
  `pastHistory` text NOT NULL,
  `familyHistory` text NOT NULL,
  `marryHistory` text,
  `personHistory` text NOT NULL,
  `menstrualHistory` text,
  `briefHistory` text NOT NULL,
  `checkBody` text,
  `diagnosis` text NOT NULL,
  `suggestions` text,
  `ordinal` tinyint(1) NOT NULL DEFAULT '0',
  `treatmentAdvice` text NOT NULL,
  `courseRecord` text,
  `toothBitmap` text,
  `mark` text,
  `tcmDiagnosis` text,
  `accessoryCheck` text,
  `createTime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `net_regno_id` (`netRegnoId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5212 DEFAULT CHARSET=utf8;

#
# Structure for table "f_fundsdetail"
#

CREATE TABLE `f_fundsdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `clinicCardNum` varchar(32) NOT NULL DEFAULT '',
  `userId` int(10) NOT NULL DEFAULT '0',
  `mobile` varchar(16) NOT NULL DEFAULT '',
  `userName` varchar(128) NOT NULL DEFAULT '',
  `flow` tinyint(1) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payType` tinyint(1) NOT NULL DEFAULT '0',
  `bizType` tinyint(1) NOT NULL DEFAULT '0',
  `orderId` bigint(16) NOT NULL DEFAULT '0',
  `thirdId` varchar(64) NOT NULL,
  `serialNum` varchar(64) NOT NULL,
  `successSerialNum` varchar(64) NOT NULL,
  `statementNum` int(10) NOT NULL DEFAULT '0',
  `tradeTime` int(10) NOT NULL DEFAULT '0',
  `reMark` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hospitalId` (`hospitalId`),
  KEY `clinicCardNum` (`clinicCardNum`),
  KEY `userId` (`userId`),
  KEY `orderId` (`orderId`),
  KEY `thirdId` (`thirdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "h_hospital"
#

CREATE TABLE `h_hospital` (
  `hospitalId` int(10) NOT NULL AUTO_INCREMENT,
  `hospitalKey` varchar(255) NOT NULL DEFAULT '',
  `hospitalName` varchar(64) NOT NULL DEFAULT '',
  `grade` tinyint(1) NOT NULL DEFAULT '0',
  `introduction` text NOT NULL,
  `guide` text NOT NULL,
  `area` bigint(4) NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(128) NOT NULL DEFAULT '',
  `addTime` int(10) NOT NULL DEFAULT '0',
  `updateTime` int(10) NOT NULL DEFAULT '0',
  `order` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`hospitalId`),
  KEY `hospitalKey` (`hospitalKey`)
) ENGINE=InnoDB AUTO_INCREMENT=2785 DEFAULT CHARSET=utf8;

#
# Structure for table "i_importanttaskprocess"
#

CREATE TABLE `i_importanttaskprocess` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `result` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `processCount` smallint(4) unsigned NOT NULL DEFAULT '0',
  `processTime` int(10) unsigned NOT NULL DEFAULT '0',
  `addTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `addTime` (`addTime`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

#
# Structure for table "index_lunbo"
#

CREATE TABLE `index_lunbo` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(64) NOT NULL COMMENT '轮播名称',
  `lbtype` tinyint(4) DEFAULT '0' COMMENT '轮播类型0-仅图片1-专题2-宝贝3-心愿4-URL',
  `width` smallint(6) DEFAULT NULL COMMENT '轮播图宽度',
  `height` smallint(6) DEFAULT NULL COMMENT '轮播图高度',
  `img_url` varchar(255) DEFAULT '' COMMENT '图片路径',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '该字段1.2版本中已不用',
  `goods_id` int(10) unsigned DEFAULT NULL COMMENT '该字段1.2版本中已不用',
  `closed` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否关闭',
  `orderid` int(11) NOT NULL DEFAULT '10' COMMENT '排序号，首页的轮播图按此正序排序',
  `small_img_url` varchar(100) DEFAULT '',
  `http_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='首页轮播图表';

#
# Structure for table "m_message"
#

CREATE TABLE `m_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `category` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-视频预约看诊',
  `userId` int(10) NOT NULL DEFAULT '0',
  `userName` varchar(64) NOT NULL DEFAULT '',
  `clinicCardNum` varchar(64) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `extInfo` varchar(255) NOT NULL DEFAULT '',
  `readStatus` tinyint(1) NOT NULL DEFAULT '0',
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `addTime` int(10) NOT NULL DEFAULT '0',
  `doctorId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hospitalId` (`hospitalId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=101599 DEFAULT CHARSET=utf8;

#
# Structure for table "net_doctor"
#

CREATE TABLE `net_doctor` (
  `phone` varchar(15) DEFAULT '' COMMENT '科室电话,可选',
  `doctorId` int(10) NOT NULL AUTO_INCREMENT,
  `doctorKey` varchar(255) NOT NULL DEFAULT '',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `hospitalName` varchar(64) NOT NULL DEFAULT '',
  `sectionId` int(10) NOT NULL DEFAULT '0',
  `sectionName` varchar(64) NOT NULL DEFAULT '',
  `sectionKey` varchar(255) NOT NULL DEFAULT '',
  `doctorName` varchar(64) NOT NULL DEFAULT '',
  `timeType` tinyint(1) NOT NULL DEFAULT '0',
  `clinicLabel` varchar(64) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `identityCard` char(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `workTime` varchar(16) NOT NULL DEFAULT '',
  `image` varchar(128) NOT NULL DEFAULT '',
  `goodAspects` text,
  `introduction` text,
  `doctorStatus` tinyint(1) NOT NULL DEFAULT '0',
  `addTime` int(10) NOT NULL DEFAULT '0',
  `certificates` text COMMENT '医生工作证,执业证,资格证,医院骋书等',
  `status` int(1) unsigned NOT NULL DEFAULT '2' COMMENT '2待审核 1 审核通过 3 审核未通过 4待完善',
  `sectionTel` varchar(11) NOT NULL DEFAULT '0' COMMENT '科室电话',
  `refuse_info` text COMMENT '拒绝原因',
  `graphicConsultationStatus` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未开通  1 开通',
  `graphicConsultationFee` int(5) NOT NULL DEFAULT '0' COMMENT '1到10000整数 ',
  `videoSeeStatus` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未开通 1 开通',
  `videoSeeFee` int(5) NOT NULL DEFAULT '0' COMMENT '0到10000整数',
  `videoSeeDetailSetting` varchar(1400) DEFAULT '',
  `retinueStatus` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未开通 1 开通',
  `phone_mob` char(11) NOT NULL DEFAULT '0' COMMENT '个人电话',
  `imageNew` varchar(128) NOT NULL DEFAULT '',
  `identityCardNew` char(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `phoneNew` varchar(15) DEFAULT '' COMMENT '科室电话,可选',
  `goodAspectsNew` text,
  `introductionNew` text,
  `statusNew` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '2待审核 1 审核通过3 拒绝',
  `orderFlag` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`doctorId`),
  KEY `hospitalId` (`hospitalId`),
  KEY `sectionId` (`sectionId`),
  KEY `doctorKey` (`doctorKey`)
) ENGINE=InnoDB AUTO_INCREMENT=10779 DEFAULT CHARSET=utf8;

#
# Structure for table "net_doctor_copy"
#

CREATE TABLE `net_doctor_copy` (
  `phone` varchar(15) DEFAULT '' COMMENT '科室电话,可选',
  `doctorId` int(10) NOT NULL AUTO_INCREMENT,
  `doctorKey` varchar(255) NOT NULL DEFAULT '',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `hospitalName` varchar(64) NOT NULL DEFAULT '',
  `sectionId` int(10) NOT NULL DEFAULT '0',
  `sectionName` varchar(64) NOT NULL DEFAULT '',
  `sectionKey` varchar(255) NOT NULL DEFAULT '',
  `doctorName` varchar(64) NOT NULL DEFAULT '',
  `timeType` tinyint(1) NOT NULL DEFAULT '0',
  `clinicLabel` varchar(64) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `identityCard` char(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `workTime` varchar(16) NOT NULL DEFAULT '',
  `image` varchar(128) NOT NULL DEFAULT '',
  `goodAspects` text,
  `introduction` text,
  `doctorStatus` tinyint(1) NOT NULL DEFAULT '0',
  `addTime` int(10) NOT NULL DEFAULT '0',
  `certificates` text COMMENT '医生工作证,执业证,资格证,医院骋书等',
  `status` int(1) unsigned NOT NULL DEFAULT '2' COMMENT '2待审核 1 审核通过 3 审核未通过 4待完善',
  `sectionTel` varchar(11) NOT NULL DEFAULT '0' COMMENT '科室电话',
  `refuse_info` text COMMENT '拒绝原因',
  `graphicConsultationStatus` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未开通  1 开通',
  `graphicConsultationFee` int(5) NOT NULL DEFAULT '0' COMMENT '1到10000整数 ',
  `videoSeeStatus` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未开通 1 开通',
  `videoSeeFee` int(5) NOT NULL DEFAULT '0' COMMENT '0到10000整数',
  `videoSeeDetailSetting` varchar(1400) DEFAULT '',
  `retinueStatus` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未开通 1 开通',
  `phone_mob` char(11) NOT NULL DEFAULT '0' COMMENT '个人电话',
  PRIMARY KEY (`doctorId`),
  KEY `doctorKey` (`doctorKey`),
  KEY `hospitalId` (`hospitalId`),
  KEY `sectionId` (`sectionId`)
) ENGINE=InnoDB AUTO_INCREMENT=10172 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=595;

#
# Structure for table "net_hospital"
#

CREATE TABLE `net_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial` varchar(20) NOT NULL DEFAULT '0' COMMENT '序列号',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_net_hospital_serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=69115 DEFAULT CHARSET=utf8;

#
# Structure for table "net_interrogation"
#

CREATE TABLE `net_interrogation` (
  `interrogationId` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL DEFAULT '0',
  `clinicCardNum` varchar(32) NOT NULL DEFAULT '',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `doctorId` int(10) NOT NULL DEFAULT '0',
  `doctorName` varchar(128) NOT NULL DEFAULT '',
  `doctorLevel` tinyint(1) NOT NULL DEFAULT '0',
  `doctorImage` varchar(128) NOT NULL DEFAULT '',
  `sectionId` int(10) NOT NULL DEFAULT '0',
  `sectionName` varchar(64) NOT NULL DEFAULT '',
  `patientName` varchar(128) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `age` tinyint(4) NOT NULL DEFAULT '0',
  `symptomDescribe` varchar(256) NOT NULL DEFAULT '',
  `addTime` varchar(16) NOT NULL DEFAULT '' COMMENT '症状出现时间',
  `checkReport` text,
  `conditions` text,
  `askTitle` varchar(64) NOT NULL DEFAULT '',
  `askContent` text NOT NULL COMMENT '没有医生的提问',
  `askTime` int(10) NOT NULL DEFAULT '0' COMMENT '添加记录时间',
  `updateTime` int(10) NOT NULL DEFAULT '0' COMMENT '图文咨询更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `patientId` int(11) NOT NULL DEFAULT '0',
  `zdDoctor` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1 需要后台分诊 2 不需要分诊',
  `imgfile` text,
  `requestTime` int(11) NOT NULL DEFAULT '0' COMMENT '回复时间',
  `adminName` varchar(25) NOT NULL DEFAULT '0' COMMENT '管理员名称',
  `adminId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员Id',
  `subsidiesFlag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '补贴标识（0未补1已补）',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`interrogationId`),
  KEY `clinicCardNum` (`clinicCardNum`),
  KEY `doctorId` (`doctorId`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8;

#
# Structure for table "net_regno"
#

CREATE TABLE `net_regno` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` bigint(16) NOT NULL DEFAULT '0',
  `serialNum` varchar(64) DEFAULT NULL,
  `successSerialNum` varchar(64) DEFAULT NULL,
  `userId` int(10) NOT NULL DEFAULT '0',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `visitId` int(10) NOT NULL DEFAULT '0',
  `timeType` tinyint(1) NOT NULL DEFAULT '0',
  `cardNo` varchar(32) NOT NULL DEFAULT '',
  `patientName` varchar(64) DEFAULT '',
  `sectionId` int(10) DEFAULT '0',
  `sectionName` varchar(64) DEFAULT '',
  `doctorId` int(10) NOT NULL DEFAULT '0',
  `doctorName` varchar(64) NOT NULL DEFAULT '',
  `doctorLevel` tinyint(1) NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `oldFee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `noticeText` varchar(64) DEFAULT NULL,
  `cliniclabel` varchar(64) NOT NULL DEFAULT '',
  `clinicType` tinyint(1) NOT NULL DEFAULT '0',
  `registerStatus` tinyint(1) NOT NULL DEFAULT '0',
  `seeDoctorTime` varchar(128) NOT NULL DEFAULT '0000-00-00 00:00',
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `cureTime` int(10) NOT NULL DEFAULT '0',
  `regnoDate` varchar(255) NOT NULL DEFAULT '0000-00-00',
  `addTime` int(10) NOT NULL DEFAULT '0' COMMENT '记录添加时间',
  `sex` tinyint(1) DEFAULT '0',
  `age` tinyint(3) DEFAULT '0',
  `askContent` text,
  `checkReport` text,
  `patientId` int(11) NOT NULL DEFAULT '0',
  `zdDoctor` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1 需要通过后台分诊 2不需要',
  `imgfile` text,
  `adminId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员Id',
  `adminName` varchar(25) NOT NULL DEFAULT '0' COMMENT '管理员名称',
  `subsidiesFlag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '补贴标识（0未补1已补）',
  `seeDoctorBeginTime` datetime DEFAULT NULL COMMENT '就诊开始时间',
  `seeDoctorEndTime` datetime DEFAULT NULL COMMENT '就诊结束时间',
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `userId` (`userId`),
  KEY `hospitalId` (`hospitalId`),
  KEY `cardNo` (`cardNo`),
  KEY `regnoDate` (`regnoDate`)
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=utf8;

#
# Structure for table "net_reversion"
#

CREATE TABLE `net_reversion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `interrogationId` int(10) NOT NULL DEFAULT '0',
  `requestContent` mediumtext,
  `requestTime` int(10) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `checkReport` mediumtext,
  `imgfile` varchar(255) DEFAULT NULL,
  `msgType` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否回复的是文本 1是 2不是',
  PRIMARY KEY (`id`),
  KEY `interrogationId` (`interrogationId`)
) ENGINE=InnoDB AUTO_INCREMENT=765 DEFAULT CHARSET=utf8mb4;

#
# Structure for table "net_section"
#

CREATE TABLE `net_section` (
  `sectionId` int(10) NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(64) NOT NULL DEFAULT '',
  `parentId` int(10) NOT NULL DEFAULT '0',
  `orderNum` smallint(4) NOT NULL DEFAULT '0',
  `introduction` text NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `addTime` int(10) NOT NULL DEFAULT '0',
  `updateTime` int(10) NOT NULL DEFAULT '0',
  `hospitalId` int(11) NOT NULL DEFAULT '0' COMMENT '医院ID',
  PRIMARY KEY (`sectionId`),
  KEY `orderNum` (`orderNum`)
) ENGINE=InnoDB AUTO_INCREMENT=91737 DEFAULT CHARSET=utf8;

#
# Structure for table "net_section_copy"
#

CREATE TABLE `net_section_copy` (
  `sectionId` int(10) NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(64) NOT NULL DEFAULT '',
  `parentId` int(10) NOT NULL DEFAULT '0',
  `orderNum` smallint(4) NOT NULL DEFAULT '0',
  `introduction` text NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `addTime` int(10) NOT NULL DEFAULT '0',
  `updateTime` int(10) NOT NULL DEFAULT '0',
  `hospitalId` int(11) NOT NULL DEFAULT '0' COMMENT '医院ID',
  PRIMARY KEY (`sectionId`),
  KEY `orderNum` (`orderNum`)
) ENGINE=InnoDB AUTO_INCREMENT=7972 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=60;

#
# Structure for table "net_user"
#

CREATE TABLE `net_user` (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `doctorId` int(10) NOT NULL DEFAULT '0',
  `userStatus` tinyint(1) NOT NULL DEFAULT '0',
  `lastIp` varchar(16) NOT NULL DEFAULT '',
  `lastLogin` int(10) NOT NULL DEFAULT '0',
  `regTime` int(10) NOT NULL DEFAULT '0',
  `clientId` varchar(64) DEFAULT '',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`),
  KEY `lastLogin` (`lastLogin`)
) ENGINE=InnoDB AUTO_INCREMENT=762 DEFAULT CHARSET=utf8;

#
# Structure for table "net_videoroom"
#

CREATE TABLE `net_videoroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roomid` varchar(255) NOT NULL DEFAULT '0' COMMENT '会议号',
  `doctorid` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `patientid` int(11) NOT NULL DEFAULT '0' COMMENT '患者ID',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ishangup` tinyint(4) NOT NULL DEFAULT '0' COMMENT '挂断 1-医生，2-患者',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT '挂断时间',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '患者使用的注册用户ID',
  `regnoid` int(11) NOT NULL DEFAULT '0' COMMENT '视频就诊ID',
  PRIMARY KEY (`id`),
  KEY `IDX_net_videoroom_createtime` (`createtime`),
  KEY `IDX_net_videoroom_roomid` (`roomid`)
) ENGINE=MyISAM AUTO_INCREMENT=495 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=793 ROW_FORMAT=FIXED COMMENT='记录会议参与的医生以及患者ID';

#
# Structure for table "net_videoroom_log"
#

CREATE TABLE `net_videoroom_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roomid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会议号',
  `info` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会议详情',
  `addtime` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='删除的会议详情日志记录';

#
# Structure for table "nh_order"
#

CREATE TABLE `nh_order` (
  `orderId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `doctorId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '医生编号',
  `userId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员编号',
  `orderAmount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '咨费金额',
  `payTime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `graceTime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间额度',
  `bizType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '业务类型',
  `payChannel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付渠道1支付宝2银联3快钱4站内转账5微信支付',
  `InterrogationId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '业务编号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `createTime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  PRIMARY KEY (`orderId`),
  KEY `index2` (`doctorId`),
  KEY `index3` (`userId`),
  KEY `InterrogationId` (`InterrogationId`)
) ENGINE=InnoDB AUTO_INCREMENT=10138 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=132;

#
# Structure for table "note_bloodglucose"
#

CREATE TABLE `note_bloodglucose` (
  `recId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '血糖记录id',
  `patientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊人会员Id',
  `patientName` varchar(64) NOT NULL DEFAULT '' COMMENT '就诊人姓名',
  `beforeDinnerBG` decimal(3,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '餐前血糖',
  `afterDinnerBG` decimal(3,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '餐后血糖',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊日期  存日期时间戳',
  `time` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1、早餐；2、午餐；3、晚餐；4、睡前',
  PRIMARY KEY (`recId`)
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=utf8 COMMENT='健康日志-血糖表';

#
# Structure for table "note_bloodpressure"
#

CREATE TABLE `note_bloodpressure` (
  `recId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '血压记录id',
  `patientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊人会员Id',
  `patientName` varchar(64) NOT NULL DEFAULT '' COMMENT '就诊人姓名',
  `systolicBloodPressure` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '收缩压',
  `diastolicBloodPressure` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '舒张压',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊日期  存日期时间戳',
  `time` char(10) NOT NULL DEFAULT '' COMMENT '就诊时辰',
  PRIMARY KEY (`recId`)
) ENGINE=InnoDB AUTO_INCREMENT=669 DEFAULT CHARSET=utf8 COMMENT='健康日志-血压表';

#
# Structure for table "note_bodytemperature"
#

CREATE TABLE `note_bodytemperature` (
  `recId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '体温记录id',
  `patientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊人会员Id',
  `patientName` varchar(64) NOT NULL DEFAULT '' COMMENT '就诊人姓名',
  `bodyTemperature` decimal(3,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '体温',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊日期  存日期时间戳',
  `time` char(10) NOT NULL DEFAULT '' COMMENT '就诊时辰',
  PRIMARY KEY (`recId`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COMMENT='健康日志-体温表';

#
# Structure for table "note_bodyweight"
#

CREATE TABLE `note_bodyweight` (
  `recId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '体重记录id',
  `patientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊人会员Id',
  `patientName` varchar(64) NOT NULL DEFAULT '' COMMENT '就诊人姓名',
  `bodyWeight` decimal(4,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '体温',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊日期  存日期时间戳',
  `time` char(10) NOT NULL DEFAULT '' COMMENT '就诊时辰',
  PRIMARY KEY (`recId`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='健康日志-体重表';

#
# Structure for table "note_heartrate"
#

CREATE TABLE `note_heartrate` (
  `recId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '心率记录id',
  `patientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊人会员Id',
  `patientName` varchar(64) NOT NULL DEFAULT '' COMMENT '就诊人姓名',
  `heartRate` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '心率',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊日期',
  `time` char(5) NOT NULL DEFAULT '' COMMENT '就诊时辰',
  PRIMARY KEY (`recId`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COMMENT='健康日志-心率表';

#
# Structure for table "note_log"
#

CREATE TABLE `note_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patientId` int(10) NOT NULL,
  `date` int(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

#
# Structure for table "note_only"
#

CREATE TABLE `note_only` (
  `recId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `patientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊人会员Id',
  `note` text NOT NULL COMMENT '就诊人姓名',
  `date` char(10) NOT NULL DEFAULT '0' COMMENT '日期',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  `patientName` varchar(64) NOT NULL DEFAULT '' COMMENT '就诊人姓名',
  PRIMARY KEY (`recId`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COMMENT='健康日志-笔记表';

#
# Structure for table "note_sleeping"
#

CREATE TABLE `note_sleeping` (
  `recId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '睡眠记录id',
  `patientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊人会员Id',
  `patientName` varchar(64) NOT NULL DEFAULT '' COMMENT '就诊人姓名',
  `sleepQuality` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '睡眠质量：1、很好；2、还行；3、一般；4、不好；5、很差',
  `sleepDuration` decimal(3,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '睡眠时长',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊日期  存日期时间戳',
  PRIMARY KEY (`recId`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='健康日志-睡眠表';

#
# Structure for table "order"
#

CREATE TABLE `order` (
  `orderId` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `doctorId` int(10) NOT NULL COMMENT '医生编号',
  `doctorLevel` tinyint(1) NOT NULL COMMENT '医生职称',
  `userId` int(10) NOT NULL COMMENT '会员编号',
  `mobile` int(11) NOT NULL,
  `orderAmount` decimal(10,2) NOT NULL COMMENT '咨费金额',
  `payTime` int(10) NOT NULL COMMENT '支付时间',
  `graceTime` int(10) NOT NULL COMMENT '时间额度',
  `bizType` tinyint(1) NOT NULL COMMENT '业务类型',
  `payChannel` tinyint(1) NOT NULL COMMENT '支付渠道',
  `dealId` varchar(20) NOT NULL COMMENT '第三方支付流水号',
  `payResult` tinyint(1) NOT NULL COMMENT '第三方返回的支付结果',
  `payStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  PRIMARY KEY (`orderId`),
  KEY `index2` (`doctorId`),
  KEY `index3` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "order_log"
#

CREATE TABLE `order_log` (
  `logId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` int(10) unsigned NOT NULL DEFAULT '0',
  `operater` char(20) NOT NULL DEFAULT '',
  `olderStatus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `currentStatus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `course` varchar(80) DEFAULT NULL COMMENT '更改原因备注',
  `userType` varchar(10) NOT NULL DEFAULT '' COMMENT '用户类型',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='订单日志表';

#
# Structure for table "p_prescriptiondisposal"
#

CREATE TABLE `p_prescriptiondisposal` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL DEFAULT '0',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `electronicMedicalId` int(10) NOT NULL DEFAULT '0',
  `hospitalName` varchar(64) NOT NULL DEFAULT '',
  `clinicCardNum` varchar(64) DEFAULT '',
  `visitDate` date NOT NULL DEFAULT '0000-00-00',
  `visitId` int(10) NOT NULL DEFAULT '0',
  `serialNum` varchar(64) DEFAULT '',
  `deal` text NOT NULL,
  `addTime` int(10) NOT NULL,
  `prescribe` text,
  `sectionId` int(10) NOT NULL,
  `sectionName` varchar(64) NOT NULL,
  `doctorId` int(10) NOT NULL,
  `doctorName` varchar(64) NOT NULL,
  `doctorLevel` tinyint(1) NOT NULL,
  `patientId` int(11) NOT NULL DEFAULT '0',
  `patientName` varchar(64) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `age` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `electronic_medical_id` (`electronicMedicalId`) USING BTREE,
  KEY `clinicCardNum` (`clinicCardNum`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Structure for table "retinue_doctor"
#

CREATE TABLE `retinue_doctor` (
  `recId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据记录编号',
  `doctorId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '随诊医生编号',
  `doctorName` varchar(64) NOT NULL DEFAULT '' COMMENT '医生姓名',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '水平/职称',
  `hospitalName` varchar(255) DEFAULT NULL COMMENT '医院名称',
  `sectionId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '科室编号',
  `sectionName` varchar(64) NOT NULL DEFAULT '' COMMENT '科室名称',
  `patientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '就诊人编号',
  `patientName` varchar(64) NOT NULL DEFAULT '' COMMENT '就诊人姓名',
  `CCNum` varchar(64) DEFAULT NULL COMMENT 'clinicCardNum 病历卡号',
  `image` text COMMENT '病历照片',
  `applyStatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '申请状态 0、审核中 1、审核通过  2拒绝',
  `visTime` varchar(20) NOT NULL DEFAULT '' COMMENT '就诊时间',
  `idCard` char(18) NOT NULL,
  PRIMARY KEY (`recId`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8 COMMENT='随诊医生';

#
# Structure for table "setfee"
#

CREATE TABLE `setfee` (
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型1图文咨询2视频问诊',
  `type_name` varchar(255) NOT NULL DEFAULT '未命名' COMMENT '类型名',
  `money` int(5) NOT NULL DEFAULT '0' COMMENT '金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='设置医生咨询费用表';

#
# Structure for table "sms_check"
#

CREATE TABLE `sms_check` (
  `smsId` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL DEFAULT '0',
  `mobile` varchar(16) NOT NULL DEFAULT '',
  `countryCode` varchar(10) NOT NULL DEFAULT '0086' COMMENT '国家电话区号',
  `code` int(10) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `pathType` tinyint(1) NOT NULL DEFAULT '0',
  `nums` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sendTime` int(10) NOT NULL DEFAULT '0',
  `verifyData` text NOT NULL COMMENT '短信内容',
  `sendStatus` varchar(120) NOT NULL DEFAULT '0' COMMENT '发送状态(成功显示状态值为2)失败为错误内容',
  PRIMARY KEY (`smsId`)
) ENGINE=InnoDB AUTO_INCREMENT=1633 DEFAULT CHARSET=utf8;

#
# Structure for table "sys_config"
#

CREATE TABLE `sys_config` (
  `configId` int(10) NOT NULL AUTO_INCREMENT COMMENT '配置编号',
  `maxLginLmit` int(10) DEFAULT '0' COMMENT '登录限制的错误次数',
  `accountFrozenDuration` int(10) DEFAULT '0' COMMENT '账号冻结时长',
  `cashWithdrawLimit` int(10) DEFAULT NULL COMMENT '最低提现金额/次',
  `withdrawAvailableAmount` int(10) DEFAULT '100' COMMENT '账户总额最低体现金额',
  `withdrawMonthTimes` int(10) DEFAULT '1' COMMENT '提现次数/月',
  `netInterrogationExpireTime` int(10) DEFAULT '86400' COMMENT '图文咨询关闭时间',
  `videoInterrogationDefaultBeginTime` time DEFAULT NULL COMMENT '医生默认视频看诊开始时间',
  `videoInterrogationDefaultEndTime` time DEFAULT NULL COMMENT '医生默认视频看诊结束时间',
  `maxRequestTimes` int(10) DEFAULT '10' COMMENT '验证码册数文咨询的回复次数限制（也可设为不限制次数）',
  `verifyCodeRetryTimes` int(10) DEFAULT '5' COMMENT '验证码重试次数',
  `verifyCodeExpireTime` int(10) DEFAULT '10' COMMENT '验证码有效期（分钟）',
  `maxLoginTry` int(10) DEFAULT NULL COMMENT '尝试登陆最大次数',
  `lastLoginTry` int(10) DEFAULT '3' COMMENT '小于尝试登陆剩余次数时提醒用户',
  `videoInterrogationNotifyFrequency` varchar(255) DEFAULT NULL COMMENT '预约就诊时间（如为时间段取最早时间）前N分钟发通知）',
  `generalVerifyCode` varchar(255) DEFAULT NULL COMMENT '验证码检验：通用验证码(通过ip校验测试/生产/预生产环境)',
  PRIMARY KEY (`configId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "sysadmin"
#

CREATE TABLE `sysadmin` (
  `adminId` int(10) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `realName` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `allowOperation` text,
  `mobile` varchar(16) DEFAULT NULL,
  `isNeedMobileCheck` tinyint(1) NOT NULL,
  `lastLogin` int(10) NOT NULL,
  `lastIp` varchar(32) DEFAULT NULL,
  `lockTime` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `addTime` int(10) NOT NULL,
  `level` char(1) NOT NULL DEFAULT '0' COMMENT '管理员级别 (0:普通管理员 1:超级管理员)',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for table "szmx"
#

CREATE TABLE `szmx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` tinyint(3) NOT NULL DEFAULT '0' COMMENT '用户类型',
  `userId` int(11) NOT NULL DEFAULT '0',
  `flow` tinyint(3) NOT NULL DEFAULT '0' COMMENT '收入1支出2',
  `orderId` int(11) NOT NULL DEFAULT '0',
  `amount` int(10) NOT NULL DEFAULT '0',
  `bizType` tinyint(3) NOT NULL DEFAULT '0',
  `payType` tinyint(3) NOT NULL DEFAULT '0',
  `dealId` varchar(255) DEFAULT '0' COMMENT '第三方流水号',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

#
# Structure for table "u_user"
#

CREATE TABLE `u_user` (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `clientId` varchar(64) DEFAULT '',
  `mobile` varchar(16) NOT NULL DEFAULT '',
  `interPhoneCode` varchar(10) NOT NULL DEFAULT '0086' COMMENT '国家电话区号',
  `password` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `idCardNum` varchar(32) DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `regTime` int(10) NOT NULL DEFAULT '0',
  `userStatus` tinyint(1) NOT NULL DEFAULT '0',
  `lastLogin` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `lastLogin` (`lastLogin`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

#
# Structure for table "user_electronic_medical"
#

CREATE TABLE `user_electronic_medical` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL DEFAULT '0',
  `hospitalId` int(10) NOT NULL DEFAULT '0',
  `hospitalName` varchar(64) NOT NULL DEFAULT '',
  `netRegnoId` int(10) NOT NULL,
  `sectionId` int(10) NOT NULL DEFAULT '0',
  `sectionName` varchar(64) NOT NULL DEFAULT '',
  `doctorId` int(10) NOT NULL DEFAULT '0',
  `doctorName` varchar(64) NOT NULL DEFAULT '',
  `doctorLevel` tinyint(1) NOT NULL DEFAULT '0',
  `clinicCardNum` varchar(64) NOT NULL DEFAULT '',
  `patientName` varchar(64) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `age` tinyint(1) NOT NULL DEFAULT '0',
  `visitDate` date NOT NULL DEFAULT '0000-00-00',
  `visitId` int(10) NOT NULL DEFAULT '0',
  `createTime` int(10) NOT NULL DEFAULT '0',
  `uploadImg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `net_regno_id` (`netRegnoId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "version"
#

CREATE TABLE `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) DEFAULT NULL COMMENT '1用户苹果端2用户安卓端3医生苹果端4医生安卓端',
  `version` char(5) DEFAULT NULL,
  `updateStatus` tinyint(3) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Structure for table "weixin_info"
#

CREATE TABLE `weixin_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL DEFAULT '0' COMMENT '用户的唯一标识',
  `nickname` varchar(255) NOT NULL DEFAULT ''' ''' COMMENT '用户昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `province` varchar(255) NOT NULL DEFAULT ''' ''' COMMENT '用户个人资料填写的省份',
  `city` varchar(255) NOT NULL DEFAULT ''' ''' COMMENT '普通用户个人资料填写的城市',
  `country` varchar(255) NOT NULL DEFAULT ''' ''' COMMENT '国家，如中国为CN',
  `headimgurl` varchar(255) NOT NULL DEFAULT ''' ''' COMMENT '用户头像，最后一个数值代表正方形头像大小',
  `privilege` varchar(255) NOT NULL DEFAULT ''' ''' COMMENT '用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）',
  `unionid` varchar(255) DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='微信账户信息表';

#
# Structure for table "withdraw"
#

CREATE TABLE `withdraw` (
  `wd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现记录id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '会员id',
  `bank_code` varchar(255) NOT NULL DEFAULT '' COMMENT '银行代码',
  `bankcard_id` char(20) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `true_name` char(15) NOT NULL DEFAULT '' COMMENT '提现者的真实姓名',
  `indentity_id` char(20) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `phone_mob` char(11) NOT NULL DEFAULT '' COMMENT '接受验证码的手机号',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1、申请提现 2、审核通过 3、审核未通过 4、提现成功 5、提现失败',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='1、申请提现 2、审核通过 3、审核未通过 4、提现成功 5、提现失败';

#
# Procedure "sp_addOtherHospitalAndOtherSection"
#

CREATE PROCEDURE `sp_addOtherHospitalAndOtherSection`()
    READS SQL DATA
    SQL SECURITY INVOKER
BEGIN
-- 最新医院和科室编号
DECLARE hospId INT DEFAULT 0;
DECLARE psecId INT DEFAULT 0;
DECLARE secId INT DEFAULT 0;
DECLARE hId INT DEFAULT 0;

DECLARE tmpHospId INT DEFAULT 0;
DECLARE tmpIsExistHospId INT DEFAULT 0;

SELECT hospitalId INTO hospId FROM h_hospital WHERE hospitalName='其他医院';
IF hospId <= 0
THEN
	SELECT max(hospitalId) INTO hospId FROM h_hospital;
	SET hospId = hospId + 1;
	-- 插入其他医院
	INSERT INTO h_hospital VALUES (hospId, '99999', '其他医院', '1', 'nice', 'nice', '0', '其他医院', '', unix_timestamp(now()) , unix_timestamp(now()));
	
	SELECT max(sectionId) INTO psecId FROM net_section;
	SET secId = psecId + 1;
	SET psecId = psecId + 1;
	INSERT INTO `net_section` VALUES (psecId, '内科', '0', '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '消化内科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '呼吸内科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '肾内科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '内分泌科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '神经内科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '风湿免疫科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '心脏内科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '血液科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '急诊科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET psecId = secId + 1;
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (psecId, '外科', '0', '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '神经外科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '肝胆外科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '肛肠科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '整形外科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '乳腺甲状腺外科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '骨关节外科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '胃肠外科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '心脏血管外科・电化疗科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '脊柱外科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '泌尿外科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '胸外科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '创伤骨科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '骨科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET psecId = secId + 1;
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (psecId, '妇儿', '0', '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '妇产科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '儿科', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET psecId = secId + 1;
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (psecId, '其他', '0', '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
	SET secId = secId + 1;
	INSERT INTO `net_section` VALUES (secId, '其他', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), hospId);
 
END IF;

SET psecId = 0;
SET secId = 0;

-- 循环当前医院

/* 循环开始 */  
while tmpHospId <= 2784 DO
	SET tmpHospId = tmpHospId + 1;

	SELECT hospitalId INTO tmpIsExistHospId FROM h_hospital WHERE hospitalId = tmpHospId;
	
	IF tmpIsExistHospId > 0
	THEN 

		SELECT sectionId INTO psecId FROM net_section WHERE sectionName='其他' AND parentId = 0 AND hospitalId = tmpHospId;

		IF psecId <=0
			THEN
				SELECT max(sectionId) INTO psecId FROM net_section;
				SET psecId = psecId + 1;
				/*插入其他一级科室*/
				INSERT INTO `net_section` VALUES (psecId, '其他', '0', '100', '', '', unix_timestamp(now()), unix_timestamp(now()), tmpHospId);
		END IF;

		SELECT sectionId INTO secId FROM net_section WHERE sectionName='其他' AND parentId > 0 AND hospitalId = tmpHospId;
		IF secId <=0
		THEN
				SELECT max(sectionId) INTO secId FROM net_section;
				SET secId = secId + 1;
				/*插入其他二级科室*/
				INSERT INTO `net_section` VALUES (secId, '其他', psecId, '100', '', '', unix_timestamp(now()), unix_timestamp(now()), tmpHospId);
		END IF;

		SET psecId = 0;
		SET secId = 0;
	END IF;
				
/* 循环结束 */  
end while;
END;
