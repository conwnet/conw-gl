
DROP TABLE `gl_node`, `gl_user`, `gl_role`, `gl_node_role`;

CREATE TABLE IF NOT EXISTS `gl_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `gl_user` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT '',
  `company` varchar(255) DEFAULT '',
  `info` varchar(2048) DEFAULT '',
  `role` int DEFAULT '9',
  `login_ip` varchar(63) DEFAULT '0.0.0.0',
  `login_time` bigint DEFAULT 0,
  `login_times` int DEFAULT 0,
  `create_time` bigint DEFAULT 0,
  `status` int NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `gl_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `gl_node_role` (
  `node_id` int DEFAULT 0,
  `role_id` mediumint(9) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



INSERT INTO `gl_user` (`username`, `password`, `nickname`, `company`, `role`, `status`) VALUES ('admin', '57ccf1f880259458d29aaf29fdb4d284', 'Admin', '1', 1, 1);
INSERT INTO `gl_role` (`name`, `pid`, `status`, `remark`) VALUES ('管理员', 0, 1, '');
INSERT INTO `gl_node` (`name`, `status`, `remark`) VALUES ('平台录入', 1, '录入平台信息');
INSERT INTO `gl_node` (`name`, `status`, `remark`) VALUES ('平台审核', 1, '审核平台信息');
INSERT INTO `gl_node` (`name`, `status`, `remark`) VALUES ('账户审核', 1, '审核账户信息');
INSERT INTO `gl_role_user` VALUES (1, 1);
INSERT INTO `gl_node_role` VALUES (1, 1), (2, 1), (3, 1);



CREATE TABLE `gl_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(63) NOT NULL DEFAULT '',
  `name` varchar(63) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

INSERT INTO `gl_company` VALUES (1,'','沈阳航空航天大学',1),(2,'','大连交通大学',1),(3,'','辽宁大学',1),(4,'','辽宁石油化工大学',1),(5,'','沈阳师范大学',1),(6,'','沈阳工程学院',1),(7,'','大连大学',1),(8,'','辽宁科技学院',1),(9,'','沈阳工业大学',1),(10,'','辽宁交通专科',1),(11,'','辽宁何氏',1),(12,'','辽宁机电职业技术',1),(13,'','沈阳大学',1),(14,'','辽东学院',1),(15,'','辽宁对外经贸学院',1),(16,'','辽宁工程职业学院',1),(17,'','沈阳药科大学',1),(18,'','渤海大学',1),(19,'','锦州师范专科学校',1),(20,'','东北大学',1),(21,'','大连民族大学',1),(22,'','沈阳化工大学',1),(23,'','辽宁职业学院',1),(24,'','辽宁装备制造职业技术学院',1),(25,'','鲁迅美术学院',1),(26,'','中国医科大学',1),(27,'','沈阳职业技术学院',1),(28,'','大连工业大学',1),(29,'','沈阳建筑大学',1),(30,'','辽宁科技大学',1),(31,'','辽宁警察学院',1),(32,'','辽宁林业职业技术学院',1),(33,'','大连海事大学',1),(34,'','大连民族学院',1),(35,'','大连理工大学',1),(36,'','大连海洋大学',1),(37,'','沈阳理工大学',1),(38,'','辽宁医学院',1),(39,'','辽宁中医药大学',1),(40,'','辽宁工业大学',1),(41,'','辽宁工程技术大学',1),(42,'','大连医科大学',1);








create table gl_platform (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `platform_name` text NOT NULL,
  `school_name` text NOT NULL,
  `platform_type` text NOT NULL,
  `approval_dept` text NOT NULL,
  `platform_positioning` text NOT NULL,
  `platform_respo` text NOT NULL,
  `platform_team` text NOT NULL,
  `approval_time` text NOT NULL,
  `research_direction` text NOT NULL,
  `discipline` text NOT NULL,
  `building_area` text NOT NULL,
  `instrument_quantity` text NOT NULL,
  `equipment_value` text NOT NULL,
  `site_name` text NOT NULL,
  `nation_project` text NOT NULL,
  `business_project` text NOT NULL,
  `index_paper` text NOT NULL,
  `project_authorization` text NOT NULL,
  `nation_award` text NOT NULL,
  `provincial_award` text NOT NULL,
  `transfer_achievement` text NOT NULL,
  `business_incubator` text NOT NULL,
  `approval_project` text NOT NULL,
  `academic_meeting` text NOT NULL,
  `personnel_training` text NOT NULL,
  `research_team` text NOT NULL,
  `platform_respo_info` text NOT NULL,
  `platform_respo_summary` text NOT NULL,
  `platform_respo_pers_nurt` text NOT NULL,
  `platform_respo_prov_achi` text NOT NULL,
  `influence_status` text NOT NULL,
  `hardware_condition` text NOT NULL,
  `dir_person` text NOT NULL,
  `team_info` text NOT NULL,
  `problem` text NOT NULL,
  `study_content` text NOT NULL,
  `years_target` text NOT NULL,
  `target` text NOT NULL,
  `status` int NULL DEFAULT 0,
  `submit_user_id` int NULL NULL,
  `update_time` bigint NOT NULL
) DEFAULT CHARSET=utf8;

INSERT INTO `gl_platform` VALUES (1,'平台名称','学校名称','*平台类型：','*批准部门：','*平台定位：','*研究方向：','*支撑省级以上学科名称：','*实验楼建筑面积（平方米）：','*单价十万元以上的仪器设备数量（台）：','*先进仪器设备原值（万元）：','*网站名称：','[[\"2010863\\u8ba1\\u5212\",\"2011863\\u8ba1\\u5212\",\"2012863\\u8ba1\\u5212\",\"2013863\\u8ba1\\u5212\",\"2014863\\u8ba1\\u5212\",\"\\u5408\\u8ba1863\\u8ba1\\u5212\"],[\"2010973\\u8ba1\\u5212\",\"2011973\\u8ba1\\u5212\",\"2012973\\u8ba1\\u5212\",\"2013973\\u8ba1\\u5212\",\"2014973\\u8ba1\\u5212\",\"\\u5408\\u8ba1973\\u8ba1\\u5212\"],[\"2010\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"2011\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"2012\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"2013\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"2014\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"\\u5408\\u8ba1\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\"],[\"2010\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"2011\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"2012\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"2013\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"2014\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"\\u5408\\u8ba1\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\"],[\"2010\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"2011\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"2012\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"2013\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"2014\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"\\u5408\\u8ba1\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\"]]','[\"2010\",\"2011\",\"2012\",\"2013\",\"2014\",\"\\u5408\\u8ba1\"]','[[\"1\",\"4\",\"7\",\"10\",\"13\",\"16\"],[\"2\",\"5\",\"8\",\"11\",\"14\",\"17\"],[\"3\",\"6\",\"9\",\"12\",\"15\",\"18\"]]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\"]','[\"1\",\"2\"]','[[\"3\",\"4\"],[\"5\",\"6\"],[\"7\",\"8\"]]','[[\"1\",\"0\",\"9\",\"8\",\"u\"],[\"2\",\"1\",\"0\",\"9\",\"i\"],[\"3\",\"2\",\"1\",\"0\",\"o\"],[\"4\",\"3\",\"2\",\"q\",\"p\"],[\"5\",\"4\",\"3\",\"w\",\"a\"],[\"6\",\"5\",\"4\",\"e\",\"s\"],[\"7\",\"6\",\"5\",\"r\",\"d\"],[\"8\",\"7\",\"6\",\"t\",\"f\"],[\"9\",\"8\",\"7\",\"y\",\"g\"]]','h','j','k','l','z','x','c','v','b','[[[\"n\",\",\",\"\\/\",\"2\",\"4\",\"6\",\"8\"],[\"m\",\".\",\"1\",\"3\",\"5\",\"7\",\"9\"]],[[\"1\",\"3\",\"5\",\"7\",\"9\",\"-\",\"q\"],[\"2\",\"4\",\"6\",\"8\",\"0\",\"=\",\"w\"]],[[\"e\",\"t\",\"u\",\"o\",\"a\",\"d\",\"g\"],[\"r\",\"y\",\"i\",\"p\",\"s\",\"f\",\"h\"]],[[\"j\",\"l\",\"x\",\"v\",\"n\",\",\",\"\\/\"],[\"k\",\"z\",\"c\",\"b\",\"m\",\".\",\"\'\"]],[[\";\",\"]\",\"o\",\"u\",\"t\",\"e\",\"q\"],[\"[\",\"p\",\"i\",\"y\",\"r\",\"w\",\"1\"]]]',0,NULL,0);
INSERT INTO `gl_platform` VALUES (2,'平台名称','学校名称','*平台类型：','*批准部门：','*平台定位：','*研究方向：','*支撑省级以上学科名称：','*实验楼建筑面积（平方米）：','*单价十万元以上的仪器设备数量（台）：','*先进仪器设备原值（万元）：','*网站名称：','[[\"2010863\\u8ba1\\u5212\",\"2011863\\u8ba1\\u5212\",\"2012863\\u8ba1\\u5212\",\"2013863\\u8ba1\\u5212\",\"2014863\\u8ba1\\u5212\",\"\\u5408\\u8ba1863\\u8ba1\\u5212\"],[\"2010973\\u8ba1\\u5212\",\"2011973\\u8ba1\\u5212\",\"2012973\\u8ba1\\u5212\",\"2013973\\u8ba1\\u5212\",\"2014973\\u8ba1\\u5212\",\"\\u5408\\u8ba1973\\u8ba1\\u5212\"],[\"2010\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"2011\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"2012\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"2013\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"2014\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\",\"\\u5408\\u8ba1\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u57fa\\u91d1\"],[\"2010\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"2011\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"2012\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"2013\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"2014\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\",\"\\u5408\\u8ba1\\u56fd\\u5bb6\\u79d1\\u6280\\u652f\\u6491\\u8ba1\\u5212\"],[\"2010\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"2011\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"2012\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"2013\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"2014\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\",\"\\u5408\\u8ba1\\u56fd\\u5bb6\\u793e\\u79d1\\u57fa\\u91d1\"]]','[\"2010\",\"2011\",\"2012\",\"2013\",\"2014\",\"\\u5408\\u8ba1\"]','[[\"1\",\"4\",\"7\",\"10\",\"13\",\"16\"],[\"2\",\"5\",\"8\",\"11\",\"14\",\"17\"],[\"3\",\"6\",\"9\",\"12\",\"15\",\"18\"]]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]','[\"1\",\"2\",\"3\"]','[\"1\",\"2\"]','[[\"3\",\"4\"],[\"5\",\"6\"],[\"7\",\"8\"]]','[[\"1\",\"0\",\"9\",\"8\",\"u\"],[\"2\",\"1\",\"0\",\"9\",\"i\"],[\"3\",\"2\",\"1\",\"0\",\"o\"],[\"4\",\"3\",\"2\",\"q\",\"p\"],[\"5\",\"4\",\"3\",\"w\",\"a\"],[\"6\",\"5\",\"4\",\"e\",\"s\"],[\"7\",\"6\",\"5\",\"r\",\"d\"],[\"8\",\"7\",\"6\",\"t\",\"f\"],[\"9\",\"8\",\"7\",\"y\",\"g\"]]','h','j','k','l','z','x','c','v','b','[[[\"n\",\",\",\"\\/\",\"2\",\"4\",\"6\",\"8\"],[\"m\",\".\",\"1\",\"3\",\"5\",\"7\",\"9\"]],[[\"1\",\"3\",\"5\",\"7\",\"9\",\"-\",\"q\"],[\"2\",\"4\",\"6\",\"8\",\"0\",\"=\",\"w\"]],[[\"e\",\"t\",\"u\",\"o\",\"a\",\"d\",\"g\"],[\"r\",\"y\",\"i\",\"p\",\"s\",\"f\",\"h\"]],[[\"j\",\"l\",\"x\",\"v\",\"n\",\",\",\"\\/\"],[\"k\",\"z\",\"c\",\"b\",\"m\",\".\",\"\'\"]],[[\";\",\"]\",\"o\",\"u\",\"t\",\"e\",\"q\"],[\"[\",\"p\",\"i\",\"y\",\"r\",\"w\",\"1\"]]]',0,NULL,0);

