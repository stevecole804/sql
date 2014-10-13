-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.10


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema repda_lms.profilequinte.com
--

CREATE DATABASE IF NOT EXISTS repda_lms.profilequinte.com;
USE repda_lms.profilequinte.com;

--
-- Definition of table `c_FR_SHSA_announcement`
--

DROP TABLE IF EXISTS `c_FR_SHSA_announcement`;
CREATE TABLE `c_FR_SHSA_announcement` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `contenu` text COLLATE utf8_bin,
  `visibleFrom` date DEFAULT NULL,
  `visibleUntil` date DEFAULT NULL,
  `temps` date DEFAULT NULL,
  `ordre` mediumint(11) NOT NULL DEFAULT '0',
  `visibility` enum('SHOW','HIDE') COLLATE utf8_bin NOT NULL DEFAULT 'SHOW',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='announcements table';

--
-- Dumping data for table `c_FR_SHSA_announcement`
--

/*!40000 ALTER TABLE `c_FR_SHSA_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_announcement` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_categories`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_categories`;
CREATE TABLE `c_FR_SHSA_bb_categories` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cat_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_categories`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_categories` DISABLE KEYS */;
INSERT INTO `c_FR_SHSA_bb_categories` (`cat_id`,`cat_title`,`cat_order`) VALUES 
 (2,0x47C3A96EC3A972616C,1),
 (1,0x466F72756D73206465732047726F75706573,2);
/*!40000 ALTER TABLE `c_FR_SHSA_bb_categories` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_forums`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_forums`;
CREATE TABLE `c_FR_SHSA_bb_forums` (
  `forum_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `forum_name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `forum_desc` text COLLATE utf8_bin,
  `forum_access` int(10) DEFAULT '1',
  `forum_moderator` int(10) DEFAULT NULL,
  `forum_topics` int(10) NOT NULL DEFAULT '0',
  `forum_posts` int(10) NOT NULL DEFAULT '0',
  `forum_last_post_id` int(10) NOT NULL DEFAULT '0',
  `cat_id` int(10) DEFAULT NULL,
  `forum_type` int(10) DEFAULT '0',
  `forum_order` int(10) DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_forums`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_bb_forums` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_posts`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_posts`;
CREATE TABLE `c_FR_SHSA_bb_posts` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `poster_id` int(10) NOT NULL DEFAULT '0',
  `post_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `poster_ip` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `nom` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_posts`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_bb_posts` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_posts_text`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_posts_text`;
CREATE TABLE `c_FR_SHSA_bb_posts_text` (
  `post_id` int(10) NOT NULL DEFAULT '0',
  `post_text` text COLLATE utf8_bin,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_posts_text`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_posts_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_bb_posts_text` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_priv_msgs`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_priv_msgs`;
CREATE TABLE `c_FR_SHSA_bb_priv_msgs` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `from_userid` int(10) NOT NULL DEFAULT '0',
  `to_userid` int(10) NOT NULL DEFAULT '0',
  `msg_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `poster_ip` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `msg_status` int(10) DEFAULT '0',
  `msg_text` text COLLATE utf8_bin,
  PRIMARY KEY (`msg_id`),
  KEY `to_userid` (`to_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_priv_msgs`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_priv_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_bb_priv_msgs` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_rel_forum_userstonotify`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_rel_forum_userstonotify`;
CREATE TABLE `c_FR_SHSA_bb_rel_forum_userstonotify` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  KEY `SECONDARY` (`user_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_rel_forum_userstonotify`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_rel_forum_userstonotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_bb_rel_forum_userstonotify` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_rel_topic_userstonotify`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_rel_topic_userstonotify`;
CREATE TABLE `c_FR_SHSA_bb_rel_topic_userstonotify` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  KEY `SECONDARY` (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_rel_topic_userstonotify`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_rel_topic_userstonotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_bb_rel_topic_userstonotify` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_topics`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_topics`;
CREATE TABLE `c_FR_SHSA_bb_topics` (
  `topic_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `topic_poster` int(10) DEFAULT NULL,
  `topic_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `topic_views` int(10) NOT NULL DEFAULT '0',
  `topic_replies` int(10) NOT NULL DEFAULT '0',
  `topic_last_post_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `topic_status` int(10) NOT NULL DEFAULT '0',
  `topic_notify` int(2) DEFAULT '0',
  `nom` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_last_post_id` (`topic_last_post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_topics`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_bb_topics` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_users`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_users`;
CREATE TABLE `c_FR_SHSA_bb_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_regdate` varchar(20) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `user_icq` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `user_website` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `user_occ` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `user_from` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `user_intrest` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `user_sig` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_viewemail` tinyint(2) DEFAULT NULL,
  `user_theme` int(10) DEFAULT NULL,
  `user_aim` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `user_yim` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `user_msnm` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `user_posts` int(10) DEFAULT '0',
  `user_attachsig` int(2) DEFAULT '0',
  `user_desmile` int(2) DEFAULT '0',
  `user_html` int(2) DEFAULT '0',
  `user_bbcode` int(2) DEFAULT '0',
  `user_rank` int(10) DEFAULT '0',
  `user_level` int(10) DEFAULT '1',
  `user_lang` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_actkey` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `user_newpasswd` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_users`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_bb_users` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_bb_whosonline`
--

DROP TABLE IF EXISTS `c_FR_SHSA_bb_whosonline`;
CREATE TABLE `c_FR_SHSA_bb_whosonline` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `count` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `forum` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_bb_whosonline`
--

/*!40000 ALTER TABLE `c_FR_SHSA_bb_whosonline` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_bb_whosonline` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_calendar_event`
--

DROP TABLE IF EXISTS `c_FR_SHSA_calendar_event`;
CREATE TABLE `c_FR_SHSA_calendar_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `contenu` text COLLATE utf8_bin,
  `day` date NOT NULL DEFAULT '0000-00-00',
  `hour` time NOT NULL DEFAULT '00:00:00',
  `lasting` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `speakers` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `visibility` enum('SHOW','HIDE') COLLATE utf8_bin NOT NULL DEFAULT 'SHOW',
  `location` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `group_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_calendar_event`
--

/*!40000 ALTER TABLE `c_FR_SHSA_calendar_event` DISABLE KEYS */;
INSERT INTO `c_FR_SHSA_calendar_event` (`id`,`titre`,`contenu`,`day`,`hour`,`lasting`,`speakers`,`visibility`,`location`,`group_id`) VALUES 
 (1,0x456E766F79657A2072C3A973756C74617473,'','2015-07-26','14:24:00',NULL,NULL,0x53484F57,NULL,0);
/*!40000 ALTER TABLE `c_FR_SHSA_calendar_event` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_chat`
--

DROP TABLE IF EXISTS `c_FR_SHSA_chat`;
CREATE TABLE `c_FR_SHSA_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_bin,
  `post_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_chat`
--

/*!40000 ALTER TABLE `c_FR_SHSA_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_chat` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_chat_users`
--

DROP TABLE IF EXISTS `c_FR_SHSA_chat_users`;
CREATE TABLE `c_FR_SHSA_chat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT NULL,
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_chat_users`
--

/*!40000 ALTER TABLE `c_FR_SHSA_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_chat_users` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_course_description`
--

DROP TABLE IF EXISTS `c_FR_SHSA_course_description`;
CREATE TABLE `c_FR_SHSA_course_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '-1',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `lastEditDate` datetime NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') COLLATE utf8_bin NOT NULL DEFAULT 'VISIBLE',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_course_description`
--

/*!40000 ALTER TABLE `c_FR_SHSA_course_description` DISABLE KEYS */;
INSERT INTO `c_FR_SHSA_course_description` (`id`,`category`,`title`,`content`,`lastEditDate`,`visibility`) VALUES 
 (1,0,0x4465736372697074696F6E,0x3C703E496C2065737420666F7274656D656E74207265636F6D6D616E64C3A92071756520766F7573206176657A20756E2070696C6F7465206427696D7072696D616E746520696E7374616C6CC3A920636F6D6D65204355544520504446206166696E2071756520766F757320707569737369657A20656E726567697374726572206C65206365727469666963617420C3A0206C612066696E20647520636F7572732E20496C2073657261206EC3A96365737361697265206465206C652074C3A96CC3A9636861726765722064616E73206C652073797374C3A86D652E3C2F703E0D0A3C212D2D20636F6E74656E743A2068746D6C2074696E795F6D6365202D2D3E,'2014-07-26 18:33:21',0x56495349424C45);
/*!40000 ALTER TABLE `c_FR_SHSA_course_description` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_course_properties`
--

DROP TABLE IF EXISTS `c_FR_SHSA_course_properties`;
CREATE TABLE `c_FR_SHSA_course_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_course_properties`
--

/*!40000 ALTER TABLE `c_FR_SHSA_course_properties` DISABLE KEYS */;
INSERT INTO `c_FR_SHSA_course_properties` (`id`,`name`,`value`,`category`) VALUES 
 (1,0x73656C665F726567697374726174696F6E,0x31,0x47524F5550),
 (2,0x73656C665F756E726567697374726174696F6E,0x30,0x47524F5550),
 (3,0x6E6247726F757050657255736572,0x31,0x47524F5550),
 (4,0x70726976617465,0x31,0x47524F5550),
 (5,0x434C444F43,0x31,0x47524F5550),
 (6,0x434C46524D,0x31,0x47524F5550),
 (7,0x434C57494B49,0x31,0x47524F5550),
 (8,0x434C43484154,0x31,0x47524F5550);
/*!40000 ALTER TABLE `c_FR_SHSA_course_properties` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_document`
--

DROP TABLE IF EXISTS `c_FR_SHSA_document`;
CREATE TABLE `c_FR_SHSA_document` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_bin NOT NULL,
  `visibility` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'v',
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_document`
--

/*!40000 ALTER TABLE `c_FR_SHSA_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_document` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_group_rel_team_user`
--

DROP TABLE IF EXISTS `c_FR_SHSA_group_rel_team_user`;
CREATE TABLE `c_FR_SHSA_group_rel_team_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `team` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_group_rel_team_user`
--

/*!40000 ALTER TABLE `c_FR_SHSA_group_rel_team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_group_rel_team_user` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_group_team`
--

DROP TABLE IF EXISTS `c_FR_SHSA_group_team`;
CREATE TABLE `c_FR_SHSA_group_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `tutor` int(11) DEFAULT NULL,
  `maxStudent` int(11) DEFAULT '0',
  `secretDirectory` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_group_team`
--

/*!40000 ALTER TABLE `c_FR_SHSA_group_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_group_team` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_lnk_links`
--

DROP TABLE IF EXISTS `c_FR_SHSA_lnk_links`;
CREATE TABLE `c_FR_SHSA_lnk_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src_id` int(11) NOT NULL DEFAULT '0',
  `dest_id` int(11) NOT NULL DEFAULT '0',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_lnk_links`
--

/*!40000 ALTER TABLE `c_FR_SHSA_lnk_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_lnk_links` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_lnk_resources`
--

DROP TABLE IF EXISTS `c_FR_SHSA_lnk_resources`;
CREATE TABLE `c_FR_SHSA_lnk_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crl` text COLLATE utf8_bin NOT NULL,
  `title` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_lnk_resources`
--

/*!40000 ALTER TABLE `c_FR_SHSA_lnk_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_lnk_resources` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_lp_asset`
--

DROP TABLE IF EXISTS `c_FR_SHSA_lp_asset`;
CREATE TABLE `c_FR_SHSA_lp_asset` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`asset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='List of resources of module of learning paths';

--
-- Dumping data for table `c_FR_SHSA_lp_asset`
--

/*!40000 ALTER TABLE `c_FR_SHSA_lp_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_lp_asset` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_lp_learnPath`
--

DROP TABLE IF EXISTS `c_FR_SHSA_lp_learnPath`;
CREATE TABLE `c_FR_SHSA_lp_learnPath` (
  `learnPath_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_bin NOT NULL,
  `lock` enum('OPEN','CLOSE') COLLATE utf8_bin NOT NULL DEFAULT 'OPEN',
  `visibility` enum('HIDE','SHOW') COLLATE utf8_bin NOT NULL DEFAULT 'SHOW',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`learnPath_id`),
  UNIQUE KEY `rank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='List of learning Paths';

--
-- Dumping data for table `c_FR_SHSA_lp_learnPath`
--

/*!40000 ALTER TABLE `c_FR_SHSA_lp_learnPath` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_lp_learnPath` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_lp_module`
--

DROP TABLE IF EXISTS `c_FR_SHSA_lp_module`;
CREATE TABLE `c_FR_SHSA_lp_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_bin NOT NULL,
  `accessibility` enum('PRIVATE','PUBLIC') COLLATE utf8_bin NOT NULL DEFAULT 'PRIVATE',
  `startAsset_id` int(11) NOT NULL DEFAULT '0',
  `contentType` enum('CLARODOC','DOCUMENT','EXERCISE','HANDMADE','SCORM','LABEL') COLLATE utf8_bin NOT NULL,
  `launch_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='List of available modules used in learning paths';

--
-- Dumping data for table `c_FR_SHSA_lp_module`
--

/*!40000 ALTER TABLE `c_FR_SHSA_lp_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_lp_module` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_lp_rel_learnPath_module`
--

DROP TABLE IF EXISTS `c_FR_SHSA_lp_rel_learnPath_module`;
CREATE TABLE `c_FR_SHSA_lp_rel_learnPath_module` (
  `learnPath_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `learnPath_id` int(11) NOT NULL DEFAULT '0',
  `module_id` int(11) NOT NULL DEFAULT '0',
  `lock` enum('OPEN','CLOSE') COLLATE utf8_bin NOT NULL DEFAULT 'OPEN',
  `visibility` enum('HIDE','SHOW') COLLATE utf8_bin NOT NULL DEFAULT 'SHOW',
  `specificComment` text COLLATE utf8_bin NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `raw_to_pass` tinyint(4) NOT NULL DEFAULT '50',
  PRIMARY KEY (`learnPath_module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='This table links module to the learning path using them';

--
-- Dumping data for table `c_FR_SHSA_lp_rel_learnPath_module`
--

/*!40000 ALTER TABLE `c_FR_SHSA_lp_rel_learnPath_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_lp_rel_learnPath_module` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_lp_user_module_progress`
--

DROP TABLE IF EXISTS `c_FR_SHSA_lp_user_module_progress`;
CREATE TABLE `c_FR_SHSA_lp_user_module_progress` (
  `user_module_progress_id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL DEFAULT '0',
  `learnPath_module_id` int(11) NOT NULL DEFAULT '0',
  `learnPath_id` int(11) NOT NULL DEFAULT '0',
  `lesson_location` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lesson_status` enum('NOT ATTEMPTED','PASSED','FAILED','COMPLETED','BROWSED','INCOMPLETE','UNKNOWN') COLLATE utf8_bin NOT NULL DEFAULT 'NOT ATTEMPTED',
  `entry` enum('AB-INITIO','RESUME','') COLLATE utf8_bin NOT NULL DEFAULT 'AB-INITIO',
  `raw` tinyint(4) NOT NULL DEFAULT '-1',
  `scoreMin` tinyint(4) NOT NULL DEFAULT '-1',
  `scoreMax` tinyint(4) NOT NULL DEFAULT '-1',
  `total_time` varchar(13) COLLATE utf8_bin NOT NULL DEFAULT '0000:00:00.00',
  `session_time` varchar(13) COLLATE utf8_bin NOT NULL DEFAULT '0000:00:00.00',
  `suspend_data` text COLLATE utf8_bin NOT NULL,
  `credit` enum('CREDIT','NO-CREDIT') COLLATE utf8_bin NOT NULL DEFAULT 'NO-CREDIT',
  PRIMARY KEY (`user_module_progress_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Record the last known status of the user in the course';

--
-- Dumping data for table `c_FR_SHSA_lp_user_module_progress`
--

/*!40000 ALTER TABLE `c_FR_SHSA_lp_user_module_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_lp_user_module_progress` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_answer_fib`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_answer_fib`;
CREATE TABLE `c_FR_SHSA_qwz_answer_fib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text COLLATE utf8_bin NOT NULL,
  `gradeList` text COLLATE utf8_bin NOT NULL,
  `wrongAnswerList` text COLLATE utf8_bin NOT NULL,
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_qwz_answer_fib`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_answer_fib` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_answer_fib` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_answer_matching`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_answer_matching`;
CREATE TABLE `c_FR_SHSA_qwz_answer_matching` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text COLLATE utf8_bin NOT NULL,
  `match` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `grade` float NOT NULL DEFAULT '0',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_qwz_answer_matching`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_answer_matching` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_answer_matching` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_answer_multiple_choice`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_answer_multiple_choice`;
CREATE TABLE `c_FR_SHSA_qwz_answer_multiple_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text COLLATE utf8_bin NOT NULL,
  `correct` tinyint(4) NOT NULL,
  `grade` float NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_qwz_answer_multiple_choice`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_answer_multiple_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_answer_multiple_choice` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_answer_truefalse`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_answer_truefalse`;
CREATE TABLE `c_FR_SHSA_qwz_answer_truefalse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `trueFeedback` text COLLATE utf8_bin NOT NULL,
  `trueGrade` float NOT NULL,
  `falseFeedback` text COLLATE utf8_bin NOT NULL,
  `falseGrade` float NOT NULL,
  `correctAnswer` enum('TRUE','FALSE') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_qwz_answer_truefalse`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_answer_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_answer_truefalse` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_exercise`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_exercise`;
CREATE TABLE `c_FR_SHSA_qwz_exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') COLLATE utf8_bin NOT NULL DEFAULT 'INVISIBLE',
  `displayType` enum('SEQUENTIAL','ONEPAGE') COLLATE utf8_bin NOT NULL DEFAULT 'ONEPAGE',
  `shuffle` smallint(6) NOT NULL DEFAULT '0',
  `useSameShuffle` enum('0','1') COLLATE utf8_bin NOT NULL DEFAULT '0',
  `showAnswers` enum('ALWAYS','NEVER','LASTTRY') COLLATE utf8_bin NOT NULL DEFAULT 'ALWAYS',
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `timeLimit` smallint(6) NOT NULL DEFAULT '0',
  `attempts` tinyint(4) NOT NULL DEFAULT '0',
  `anonymousAttempts` enum('ALLOWED','NOTALLOWED') COLLATE utf8_bin NOT NULL DEFAULT 'NOTALLOWED',
  `quizEndMessage` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_qwz_exercise`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_exercise` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_exercise` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_question`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_question`;
CREATE TABLE `c_FR_SHSA_qwz_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin NOT NULL,
  `attachment` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('MCUA','MCMA','TF','FIB','MATCHING') COLLATE utf8_bin NOT NULL DEFAULT 'MCUA',
  `grade` float NOT NULL DEFAULT '0',
  `id_category` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_qwz_question`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_question` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_questions_categories`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_questions_categories`;
CREATE TABLE `c_FR_SHSA_qwz_questions_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Record the categories of questions';

--
-- Dumping data for table `c_FR_SHSA_qwz_questions_categories`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_questions_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_questions_categories` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_rel_exercise_question`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_rel_exercise_question`;
CREATE TABLE `c_FR_SHSA_qwz_rel_exercise_question` (
  `exerciseId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_qwz_rel_exercise_question`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_rel_exercise_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_rel_exercise_question` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_tracking`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_tracking`;
CREATE TABLE `c_FR_SHSA_qwz_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exo_id` int(11) NOT NULL DEFAULT '0',
  `result` float NOT NULL DEFAULT '0',
  `time` mediumint(8) NOT NULL DEFAULT '0',
  `weighting` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `exo_id` (`exo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Record informations about exercices';

--
-- Dumping data for table `c_FR_SHSA_qwz_tracking`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_tracking` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_tracking_answers`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_tracking_answers`;
CREATE TABLE `c_FR_SHSA_qwz_tracking_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details_id` int(11) NOT NULL DEFAULT '0',
  `answer` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `details_id` (`details_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_qwz_tracking_answers`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_tracking_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_tracking_answers` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_tracking_questions`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_tracking_questions`;
CREATE TABLE `c_FR_SHSA_qwz_tracking_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_track_id` int(11) NOT NULL DEFAULT '0',
  `question_id` int(11) NOT NULL DEFAULT '0',
  `result` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `exercise_track_id` (`exercise_track_id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Record answers of students in exercices';

--
-- Dumping data for table `c_FR_SHSA_qwz_tracking_questions`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_tracking_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_tracking_questions` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_qwz_users_random_questions`
--

DROP TABLE IF EXISTS `c_FR_SHSA_qwz_users_random_questions`;
CREATE TABLE `c_FR_SHSA_qwz_users_random_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `questions` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_exo` (`user_id`,`exercise_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_qwz_users_random_questions`
--

/*!40000 ALTER TABLE `c_FR_SHSA_qwz_users_random_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_qwz_users_random_questions` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_tool_intro`
--

DROP TABLE IF EXISTS `c_FR_SHSA_tool_intro`;
CREATE TABLE `c_FR_SHSA_tool_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `display_date` datetime DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `rank` int(11) DEFAULT '1',
  `visibility` enum('SHOW','HIDE') COLLATE utf8_bin NOT NULL DEFAULT 'SHOW',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_tool_intro`
--

/*!40000 ALTER TABLE `c_FR_SHSA_tool_intro` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_tool_intro` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_tool_list`
--

DROP TABLE IF EXISTS `c_FR_SHSA_tool_list`;
CREATE TABLE `c_FR_SHSA_tool_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(10) unsigned DEFAULT NULL,
  `rank` int(10) unsigned NOT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `script_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `script_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `addedTool` enum('YES','NO') COLLATE utf8_bin DEFAULT 'YES',
  `activated` enum('true','false') COLLATE utf8_bin NOT NULL DEFAULT 'true',
  `installed` enum('true','false') COLLATE utf8_bin NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_tool_list`
--

/*!40000 ALTER TABLE `c_FR_SHSA_tool_list` DISABLE KEYS */;
INSERT INTO `c_FR_SHSA_tool_list` (`id`,`tool_id`,`rank`,`visibility`,`script_url`,`script_name`,`addedTool`,`activated`,`installed`) VALUES 
 (1,1,1,1,NULL,NULL,0x594553,0x74727565,0x74727565),
 (2,2,2,0,NULL,NULL,0x594553,0x74727565,0x74727565),
 (3,3,3,0,NULL,NULL,0x594553,0x74727565,0x74727565),
 (4,4,4,1,NULL,NULL,0x594553,0x74727565,0x74727565),
 (5,5,5,0,NULL,NULL,0x594553,0x74727565,0x74727565),
 (6,6,6,0,NULL,NULL,0x594553,0x74727565,0x74727565),
 (7,7,7,1,NULL,NULL,0x594553,0x74727565,0x74727565),
 (8,8,8,0,NULL,NULL,0x594553,0x74727565,0x74727565),
 (9,9,9,0,NULL,NULL,0x594553,0x74727565,0x74727565),
 (10,10,10,0,NULL,NULL,0x594553,0x74727565,0x74727565),
 (11,11,11,0,NULL,NULL,0x594553,0x74727565,0x74727565),
 (12,12,12,0,NULL,NULL,0x594553,0x74727565,0x74727565);
/*!40000 ALTER TABLE `c_FR_SHSA_tool_list` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_tracking_event`
--

DROP TABLE IF EXISTS `c_FR_SHSA_tracking_event`;
CREATE TABLE `c_FR_SHSA_tracking_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tool` (`tool_id`),
  KEY `user` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_tracking_event`
--

/*!40000 ALTER TABLE `c_FR_SHSA_tracking_event` DISABLE KEYS */;
INSERT INTO `c_FR_SHSA_tracking_event` (`id`,`tool_id`,`user_id`,`group_id`,`date`,`type`,`data`) VALUES 
 (1,NULL,1,NULL,'2014-07-26 14:06:00',0x636F757273655F616363657373,''),
 (2,4,1,NULL,'2014-07-26 14:07:00',0x746F6F6C5F616363657373,''),
 (3,5,1,NULL,'2014-07-26 14:07:00',0x746F6F6C5F616363657373,''),
 (4,NULL,1,NULL,'2014-07-26 14:15:00',0x646F776E6C6F6164,0x613A313A7B733A333A2275726C223B733A36343A222F53757065727669736575725F64655F6C615F73616E74655F65745F64655F6C615F73656375726974655F64655F636F6E736369656E63652E55726C2E75726C223B7D),
 (5,NULL,1,NULL,'2014-07-26 14:20:00',0x646F776E6C6F6164,0x613A313A7B733A333A2275726C223B733A36343A222F53757065727669736575725F64655F6C615F73616E74655F65745F64655F6C615F73656375726974655F64655F636F6E736369656E63652E55726C2E75726C223B7D),
 (6,7,1,NULL,'2014-07-26 14:21:00',0x746F6F6C5F616363657373,''),
 (7,NULL,1,NULL,'2014-07-26 14:26:00',0x646F776E6C6F6164,0x613A313A7B733A333A2275726C223B733A36303A222F53757065727669736575725F64655F6C615F73616E74655F65745F64655F6C615F73656375726974655F64655F636F6E736369656E63652E55726C223B7D),
 (8,NULL,1,NULL,'2014-07-26 18:17:00',0x636F757273655F616363657373,''),
 (9,1,1,NULL,'2014-07-26 18:33:00',0x746F6F6C5F616363657373,''),
 (10,NULL,1,NULL,'2014-08-11 20:05:00',0x636F757273655F616363657373,'');
/*!40000 ALTER TABLE `c_FR_SHSA_tracking_event` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_userinfo_content`
--

DROP TABLE IF EXISTS `c_FR_SHSA_userinfo_content`;
CREATE TABLE `c_FR_SHSA_userinfo_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `def_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ed_ip` varchar(39) COLLATE utf8_bin DEFAULT NULL,
  `ed_date` datetime DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='content of users information';

--
-- Dumping data for table `c_FR_SHSA_userinfo_content`
--

/*!40000 ALTER TABLE `c_FR_SHSA_userinfo_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_userinfo_content` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_userinfo_def`
--

DROP TABLE IF EXISTS `c_FR_SHSA_userinfo_def`;
CREATE TABLE `c_FR_SHSA_userinfo_def` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(160) COLLATE utf8_bin DEFAULT NULL,
  `nbLine` int(10) unsigned NOT NULL DEFAULT '5',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='categories definition for user information of a course';

--
-- Dumping data for table `c_FR_SHSA_userinfo_def`
--

/*!40000 ALTER TABLE `c_FR_SHSA_userinfo_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_userinfo_def` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_wiki_acls`
--

DROP TABLE IF EXISTS `c_FR_SHSA_wiki_acls`;
CREATE TABLE `c_FR_SHSA_wiki_acls` (
  `wiki_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` enum('false','true') COLLATE utf8_bin NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_wiki_acls`
--

/*!40000 ALTER TABLE `c_FR_SHSA_wiki_acls` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_wiki_acls` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_wiki_pages`
--

DROP TABLE IF EXISTS `c_FR_SHSA_wiki_pages`;
CREATE TABLE `c_FR_SHSA_wiki_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_version` int(11) unsigned NOT NULL DEFAULT '0',
  `last_mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_wiki_pages`
--

/*!40000 ALTER TABLE `c_FR_SHSA_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_wiki_pages` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_wiki_pages_content`
--

DROP TABLE IF EXISTS `c_FR_SHSA_wiki_pages_content`;
CREATE TABLE `c_FR_SHSA_wiki_pages_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `editor_id` int(11) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_wiki_pages_content`
--

/*!40000 ALTER TABLE `c_FR_SHSA_wiki_pages_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_wiki_pages_content` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_wiki_properties`
--

DROP TABLE IF EXISTS `c_FR_SHSA_wiki_properties`;
CREATE TABLE `c_FR_SHSA_wiki_properties` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin,
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_wiki_properties`
--

/*!40000 ALTER TABLE `c_FR_SHSA_wiki_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_FR_SHSA_wiki_properties` ENABLE KEYS */;


--
-- Definition of table `c_FR_SHSA_wrk_assignment`
--

DROP TABLE IF EXISTS `c_FR_SHSA_wrk_assignment`;
CREATE TABLE `c_FR_SHSA_wrk_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') COLLATE utf8_bin NOT NULL DEFAULT 'VISIBLE',
  `def_submission_visibility` enum('VISIBLE','INVISIBLE') COLLATE utf8_bin NOT NULL DEFAULT 'VISIBLE',
  `assignment_type` enum('INDIVIDUAL','GROUP') COLLATE utf8_bin NOT NULL DEFAULT 'INDIVIDUAL',
  `authorized_content` enum('TEXT','FILE','TEXTFILE') COLLATE utf8_bin NOT NULL DEFAULT 'FILE',
  `allow_late_upload` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'YES',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `prefill_text` text COLLATE utf8_bin NOT NULL,
  `prefill_doc_path` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `prefill_submit` enum('ENDDATE','AFTERPOST') COLLATE utf8_bin NOT NULL DEFAULT 'ENDDATE',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_FR_SHSA_wrk_assignment`
--

/*!40000 ALTER TABLE `c_FR_SHSA_wrk_assignment` DISABLE KEYS */;
INSERT INTO `c_FR_SHSA_wrk_assignment` (`id`,`title`,`description`,`visibility`,`def_submission_visibility`,`assignment_type`,`authorized_content`,`allow_late_upload`,`start_date`,`end_date`,`prefill_text`,`prefill_doc_path`,`prefill_submit`) VALUES 
 (1,0x456E766F79657A2072C3A973756C74617473,'',0x56495349424C45,0x56495349424C45,0x494E444956494455414C,0x46494C45,0x594553,'2014-07-26 14:24:00','2015-07-26 14:24:00','','',0x454E4444415445);
/*!40000 ALTER TABLE `c_FR_SHSA_wrk_assignment` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_announcement`
--

DROP TABLE IF EXISTS `c_SHSA_announcement`;
CREATE TABLE `c_SHSA_announcement` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `contenu` text,
  `visibleFrom` date DEFAULT NULL,
  `visibleUntil` date DEFAULT NULL,
  `temps` date DEFAULT NULL,
  `ordre` mediumint(11) NOT NULL DEFAULT '0',
  `visibility` enum('SHOW','HIDE') NOT NULL DEFAULT 'SHOW',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='announcements table';

--
-- Dumping data for table `c_SHSA_announcement`
--

/*!40000 ALTER TABLE `c_SHSA_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_announcement` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_categories`
--

DROP TABLE IF EXISTS `c_SHSA_bb_categories`;
CREATE TABLE `c_SHSA_bb_categories` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(100) DEFAULT NULL,
  `cat_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_categories`
--

/*!40000 ALTER TABLE `c_SHSA_bb_categories` DISABLE KEYS */;
INSERT INTO `c_SHSA_bb_categories` (`cat_id`,`cat_title`,`cat_order`) VALUES 
 (2,'Main',1),
 (1,'Group forums',2);
/*!40000 ALTER TABLE `c_SHSA_bb_categories` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_forums`
--

DROP TABLE IF EXISTS `c_SHSA_bb_forums`;
CREATE TABLE `c_SHSA_bb_forums` (
  `forum_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `forum_name` varchar(150) DEFAULT NULL,
  `forum_desc` text,
  `forum_access` int(10) DEFAULT '1',
  `forum_moderator` int(10) DEFAULT NULL,
  `forum_topics` int(10) NOT NULL DEFAULT '0',
  `forum_posts` int(10) NOT NULL DEFAULT '0',
  `forum_last_post_id` int(10) NOT NULL DEFAULT '0',
  `cat_id` int(10) DEFAULT NULL,
  `forum_type` int(10) DEFAULT '0',
  `forum_order` int(10) DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_forums`
--

/*!40000 ALTER TABLE `c_SHSA_bb_forums` DISABLE KEYS */;
INSERT INTO `c_SHSA_bb_forums` (`forum_id`,`group_id`,`forum_name`,`forum_desc`,`forum_access`,`forum_moderator`,`forum_topics`,`forum_posts`,`forum_last_post_id`,`cat_id`,`forum_type`,`forum_order`) VALUES 
 (1,NULL,'Test forum','Remove this through the forum admin tool',2,1,1,1,1,2,0,1);
/*!40000 ALTER TABLE `c_SHSA_bb_forums` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_posts`
--

DROP TABLE IF EXISTS `c_SHSA_bb_posts`;
CREATE TABLE `c_SHSA_bb_posts` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `poster_id` int(10) NOT NULL DEFAULT '0',
  `post_time` varchar(20) DEFAULT NULL,
  `poster_ip` varchar(16) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_posts`
--

/*!40000 ALTER TABLE `c_SHSA_bb_posts` DISABLE KEYS */;
INSERT INTO `c_SHSA_bb_posts` (`post_id`,`topic_id`,`forum_id`,`poster_id`,`post_time`,`poster_ip`,`nom`,`prenom`) VALUES 
 (1,1,1,1,'2014-06-27 09:29:16','127.0.0.1','Cole','Steve');
/*!40000 ALTER TABLE `c_SHSA_bb_posts` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_posts_text`
--

DROP TABLE IF EXISTS `c_SHSA_bb_posts_text`;
CREATE TABLE `c_SHSA_bb_posts_text` (
  `post_id` int(10) NOT NULL DEFAULT '0',
  `post_text` text,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_posts_text`
--

/*!40000 ALTER TABLE `c_SHSA_bb_posts_text` DISABLE KEYS */;
INSERT INTO `c_SHSA_bb_posts_text` (`post_id`,`post_text`) VALUES 
 (1,'Message');
/*!40000 ALTER TABLE `c_SHSA_bb_posts_text` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_priv_msgs`
--

DROP TABLE IF EXISTS `c_SHSA_bb_priv_msgs`;
CREATE TABLE `c_SHSA_bb_priv_msgs` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `from_userid` int(10) NOT NULL DEFAULT '0',
  `to_userid` int(10) NOT NULL DEFAULT '0',
  `msg_time` varchar(20) DEFAULT NULL,
  `poster_ip` varchar(16) DEFAULT NULL,
  `msg_status` int(10) DEFAULT '0',
  `msg_text` text,
  PRIMARY KEY (`msg_id`),
  KEY `to_userid` (`to_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_priv_msgs`
--

/*!40000 ALTER TABLE `c_SHSA_bb_priv_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_bb_priv_msgs` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_rel_forum_userstonotify`
--

DROP TABLE IF EXISTS `c_SHSA_bb_rel_forum_userstonotify`;
CREATE TABLE `c_SHSA_bb_rel_forum_userstonotify` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  KEY `SECONDARY` (`user_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_rel_forum_userstonotify`
--

/*!40000 ALTER TABLE `c_SHSA_bb_rel_forum_userstonotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_bb_rel_forum_userstonotify` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_rel_topic_userstonotify`
--

DROP TABLE IF EXISTS `c_SHSA_bb_rel_topic_userstonotify`;
CREATE TABLE `c_SHSA_bb_rel_topic_userstonotify` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  KEY `SECONDARY` (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_rel_topic_userstonotify`
--

/*!40000 ALTER TABLE `c_SHSA_bb_rel_topic_userstonotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_bb_rel_topic_userstonotify` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_topics`
--

DROP TABLE IF EXISTS `c_SHSA_bb_topics`;
CREATE TABLE `c_SHSA_bb_topics` (
  `topic_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_title` varchar(100) DEFAULT NULL,
  `topic_poster` int(10) DEFAULT NULL,
  `topic_time` varchar(20) DEFAULT NULL,
  `topic_views` int(10) NOT NULL DEFAULT '0',
  `topic_replies` int(10) NOT NULL DEFAULT '0',
  `topic_last_post_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `topic_status` int(10) NOT NULL DEFAULT '0',
  `topic_notify` int(2) DEFAULT '0',
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_last_post_id` (`topic_last_post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_topics`
--

/*!40000 ALTER TABLE `c_SHSA_bb_topics` DISABLE KEYS */;
INSERT INTO `c_SHSA_bb_topics` (`topic_id`,`topic_title`,`topic_poster`,`topic_time`,`topic_views`,`topic_replies`,`topic_last_post_id`,`forum_id`,`topic_status`,`topic_notify`,`nom`,`prenom`) VALUES 
 (1,'Example message',-1,'2014-06-27 09:29:16',1,0,1,1,0,1,'Cole','Steve');
/*!40000 ALTER TABLE `c_SHSA_bb_topics` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_users`
--

DROP TABLE IF EXISTS `c_SHSA_bb_users`;
CREATE TABLE `c_SHSA_bb_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `user_regdate` varchar(20) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_icq` varchar(15) DEFAULT NULL,
  `user_website` varchar(100) DEFAULT NULL,
  `user_occ` varchar(100) DEFAULT NULL,
  `user_from` varchar(100) DEFAULT NULL,
  `user_intrest` varchar(150) DEFAULT NULL,
  `user_sig` varchar(255) DEFAULT NULL,
  `user_viewemail` tinyint(2) DEFAULT NULL,
  `user_theme` int(10) DEFAULT NULL,
  `user_aim` varchar(18) DEFAULT NULL,
  `user_yim` varchar(25) DEFAULT NULL,
  `user_msnm` varchar(25) DEFAULT NULL,
  `user_posts` int(10) DEFAULT '0',
  `user_attachsig` int(2) DEFAULT '0',
  `user_desmile` int(2) DEFAULT '0',
  `user_html` int(2) DEFAULT '0',
  `user_bbcode` int(2) DEFAULT '0',
  `user_rank` int(10) DEFAULT '0',
  `user_level` int(10) DEFAULT '1',
  `user_lang` varchar(255) DEFAULT NULL,
  `user_actkey` varchar(32) DEFAULT NULL,
  `user_newpasswd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_users`
--

/*!40000 ALTER TABLE `c_SHSA_bb_users` DISABLE KEYS */;
INSERT INTO `c_SHSA_bb_users` (`user_id`,`username`,`user_regdate`,`user_password`,`user_email`,`user_icq`,`user_website`,`user_occ`,`user_from`,`user_intrest`,`user_sig`,`user_viewemail`,`user_theme`,`user_aim`,`user_yim`,`user_msnm`,`user_posts`,`user_attachsig`,`user_desmile`,`user_html`,`user_bbcode`,`user_rank`,`user_level`,`user_lang`,`user_actkey`,`user_newpasswd`) VALUES 
 (1,'Cole Steve','2014-06-27 09:29:16','password','steve@profilequinte.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,1,NULL,NULL,NULL),
 (-1,'Anonymous','2014-06-27 09:29:16','password','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `c_SHSA_bb_users` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_bb_whosonline`
--

DROP TABLE IF EXISTS `c_SHSA_bb_whosonline`;
CREATE TABLE `c_SHSA_bb_whosonline` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `count` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `forum` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_bb_whosonline`
--

/*!40000 ALTER TABLE `c_SHSA_bb_whosonline` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_bb_whosonline` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_calendar_event`
--

DROP TABLE IF EXISTS `c_SHSA_calendar_event`;
CREATE TABLE `c_SHSA_calendar_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) DEFAULT NULL,
  `contenu` text,
  `day` date NOT NULL DEFAULT '0000-00-00',
  `hour` time NOT NULL DEFAULT '00:00:00',
  `lasting` varchar(20) DEFAULT NULL,
  `speakers` varchar(150) DEFAULT NULL,
  `visibility` enum('SHOW','HIDE') NOT NULL DEFAULT 'SHOW',
  `location` varchar(150) DEFAULT NULL,
  `group_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_calendar_event`
--

/*!40000 ALTER TABLE `c_SHSA_calendar_event` DISABLE KEYS */;
INSERT INTO `c_SHSA_calendar_event` (`id`,`titre`,`contenu`,`day`,`hour`,`lasting`,`speakers`,`visibility`,`location`,`group_id`) VALUES 
 (1,'Upload Results','','2015-06-27','09:32:00',NULL,NULL,'SHOW',NULL,0);
/*!40000 ALTER TABLE `c_SHSA_calendar_event` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_chat`
--

DROP TABLE IF EXISTS `c_SHSA_chat`;
CREATE TABLE `c_SHSA_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT NULL,
  `message` text,
  `post_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_chat`
--

/*!40000 ALTER TABLE `c_SHSA_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_chat` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_chat_users`
--

DROP TABLE IF EXISTS `c_SHSA_chat_users`;
CREATE TABLE `c_SHSA_chat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT NULL,
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_chat_users`
--

/*!40000 ALTER TABLE `c_SHSA_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_chat_users` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_course_description`
--

DROP TABLE IF EXISTS `c_SHSA_course_description`;
CREATE TABLE `c_SHSA_course_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '-1',
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `lastEditDate` datetime NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'VISIBLE',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_course_description`
--

/*!40000 ALTER TABLE `c_SHSA_course_description` DISABLE KEYS */;
INSERT INTO `c_SHSA_course_description` (`id`,`category`,`title`,`content`,`lastEditDate`,`visibility`) VALUES 
 (1,0,'Description','<p>It is highly recommended that you have a printer driver installed such as CUTE PDF so that you can save the certificate at the end of the course. It will be required to upload it into the system.</p>\r\n<!-- content: html tiny_mce -->','2014-07-26 18:31:47','VISIBLE');
/*!40000 ALTER TABLE `c_SHSA_course_description` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_course_properties`
--

DROP TABLE IF EXISTS `c_SHSA_course_properties`;
CREATE TABLE `c_SHSA_course_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_course_properties`
--

/*!40000 ALTER TABLE `c_SHSA_course_properties` DISABLE KEYS */;
INSERT INTO `c_SHSA_course_properties` (`id`,`name`,`value`,`category`) VALUES 
 (1,'self_registration','1','GROUP'),
 (2,'self_unregistration','0','GROUP'),
 (3,'nbGroupPerUser','1','GROUP'),
 (4,'private','1','GROUP'),
 (5,'CLDOC','1','GROUP'),
 (6,'CLFRM','1','GROUP'),
 (7,'CLWIKI','1','GROUP'),
 (8,'CLCHAT','1','GROUP');
/*!40000 ALTER TABLE `c_SHSA_course_properties` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_document`
--

DROP TABLE IF EXISTS `c_SHSA_document`;
CREATE TABLE `c_SHSA_document` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `visibility` char(1) NOT NULL DEFAULT 'v',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_document`
--

/*!40000 ALTER TABLE `c_SHSA_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_document` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_group_rel_team_user`
--

DROP TABLE IF EXISTS `c_SHSA_group_rel_team_user`;
CREATE TABLE `c_SHSA_group_rel_team_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `team` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_group_rel_team_user`
--

/*!40000 ALTER TABLE `c_SHSA_group_rel_team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_group_rel_team_user` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_group_team`
--

DROP TABLE IF EXISTS `c_SHSA_group_team`;
CREATE TABLE `c_SHSA_group_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `tutor` int(11) DEFAULT NULL,
  `maxStudent` int(11) DEFAULT '0',
  `secretDirectory` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_group_team`
--

/*!40000 ALTER TABLE `c_SHSA_group_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_group_team` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_lnk_links`
--

DROP TABLE IF EXISTS `c_SHSA_lnk_links`;
CREATE TABLE `c_SHSA_lnk_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src_id` int(11) NOT NULL DEFAULT '0',
  `dest_id` int(11) NOT NULL DEFAULT '0',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_lnk_links`
--

/*!40000 ALTER TABLE `c_SHSA_lnk_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_lnk_links` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_lnk_resources`
--

DROP TABLE IF EXISTS `c_SHSA_lnk_resources`;
CREATE TABLE `c_SHSA_lnk_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crl` text NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_lnk_resources`
--

/*!40000 ALTER TABLE `c_SHSA_lnk_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_lnk_resources` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_lp_asset`
--

DROP TABLE IF EXISTS `c_SHSA_lp_asset`;
CREATE TABLE `c_SHSA_lp_asset` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='List of resources of module of learning paths';

--
-- Dumping data for table `c_SHSA_lp_asset`
--

/*!40000 ALTER TABLE `c_SHSA_lp_asset` DISABLE KEYS */;
INSERT INTO `c_SHSA_lp_asset` (`asset_id`,`module_id`,`path`,`comment`) VALUES 
 (2,2,'1','');
/*!40000 ALTER TABLE `c_SHSA_lp_asset` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_lp_learnPath`
--

DROP TABLE IF EXISTS `c_SHSA_lp_learnPath`;
CREATE TABLE `c_SHSA_lp_learnPath` (
  `learnPath_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `lock` enum('OPEN','CLOSE') NOT NULL DEFAULT 'OPEN',
  `visibility` enum('HIDE','SHOW') NOT NULL DEFAULT 'SHOW',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`learnPath_id`),
  UNIQUE KEY `rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='List of learning Paths';

--
-- Dumping data for table `c_SHSA_lp_learnPath`
--

/*!40000 ALTER TABLE `c_SHSA_lp_learnPath` DISABLE KEYS */;
INSERT INTO `c_SHSA_lp_learnPath` (`learnPath_id`,`name`,`comment`,`lock`,`visibility`,`rank`) VALUES 
 (1,'Sample learning path','This is a sample learning path, it uses the sample exercise and the sample document of the exercise tool and the document tool. Click on <b>Modify</b> to change this text.','OPEN','SHOW',1);
/*!40000 ALTER TABLE `c_SHSA_lp_learnPath` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_lp_module`
--

DROP TABLE IF EXISTS `c_SHSA_lp_module`;
CREATE TABLE `c_SHSA_lp_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `accessibility` enum('PRIVATE','PUBLIC') NOT NULL DEFAULT 'PRIVATE',
  `startAsset_id` int(11) NOT NULL DEFAULT '0',
  `contentType` enum('CLARODOC','DOCUMENT','EXERCISE','HANDMADE','SCORM','LABEL') NOT NULL,
  `launch_data` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='List of available modules used in learning paths';

--
-- Dumping data for table `c_SHSA_lp_module`
--

/*!40000 ALTER TABLE `c_SHSA_lp_module` DISABLE KEYS */;
INSERT INTO `c_SHSA_lp_module` (`module_id`,`name`,`comment`,`accessibility`,`startAsset_id`,`contentType`,`launch_data`) VALUES 
 (2,'Sample exercise','You can use any exercise of the exercises tool of your course.','PRIVATE',2,'EXERCISE','');
/*!40000 ALTER TABLE `c_SHSA_lp_module` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_lp_rel_learnPath_module`
--

DROP TABLE IF EXISTS `c_SHSA_lp_rel_learnPath_module`;
CREATE TABLE `c_SHSA_lp_rel_learnPath_module` (
  `learnPath_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `learnPath_id` int(11) NOT NULL DEFAULT '0',
  `module_id` int(11) NOT NULL DEFAULT '0',
  `lock` enum('OPEN','CLOSE') NOT NULL DEFAULT 'OPEN',
  `visibility` enum('HIDE','SHOW') NOT NULL DEFAULT 'SHOW',
  `specificComment` text NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `raw_to_pass` tinyint(4) NOT NULL DEFAULT '50',
  PRIMARY KEY (`learnPath_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='This table links module to the learning path using them';

--
-- Dumping data for table `c_SHSA_lp_rel_learnPath_module`
--

/*!40000 ALTER TABLE `c_SHSA_lp_rel_learnPath_module` DISABLE KEYS */;
INSERT INTO `c_SHSA_lp_rel_learnPath_module` (`learnPath_module_id`,`learnPath_id`,`module_id`,`lock`,`visibility`,`specificComment`,`rank`,`parent`,`raw_to_pass`) VALUES 
 (2,1,2,'OPEN','SHOW','',2,0,50);
/*!40000 ALTER TABLE `c_SHSA_lp_rel_learnPath_module` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_lp_user_module_progress`
--

DROP TABLE IF EXISTS `c_SHSA_lp_user_module_progress`;
CREATE TABLE `c_SHSA_lp_user_module_progress` (
  `user_module_progress_id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL DEFAULT '0',
  `learnPath_module_id` int(11) NOT NULL DEFAULT '0',
  `learnPath_id` int(11) NOT NULL DEFAULT '0',
  `lesson_location` varchar(255) NOT NULL DEFAULT '',
  `lesson_status` enum('NOT ATTEMPTED','PASSED','FAILED','COMPLETED','BROWSED','INCOMPLETE','UNKNOWN') NOT NULL DEFAULT 'NOT ATTEMPTED',
  `entry` enum('AB-INITIO','RESUME','') NOT NULL DEFAULT 'AB-INITIO',
  `raw` tinyint(4) NOT NULL DEFAULT '-1',
  `scoreMin` tinyint(4) NOT NULL DEFAULT '-1',
  `scoreMax` tinyint(4) NOT NULL DEFAULT '-1',
  `total_time` varchar(13) NOT NULL DEFAULT '0000:00:00.00',
  `session_time` varchar(13) NOT NULL DEFAULT '0000:00:00.00',
  `suspend_data` text NOT NULL,
  `credit` enum('CREDIT','NO-CREDIT') NOT NULL DEFAULT 'NO-CREDIT',
  PRIMARY KEY (`user_module_progress_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record the last known status of the user in the course';

--
-- Dumping data for table `c_SHSA_lp_user_module_progress`
--

/*!40000 ALTER TABLE `c_SHSA_lp_user_module_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_lp_user_module_progress` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_answer_fib`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_answer_fib`;
CREATE TABLE `c_SHSA_qwz_answer_fib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text NOT NULL,
  `gradeList` text NOT NULL,
  `wrongAnswerList` text NOT NULL,
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_qwz_answer_fib`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_answer_fib` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_qwz_answer_fib` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_answer_matching`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_answer_matching`;
CREATE TABLE `c_SHSA_qwz_answer_matching` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text NOT NULL,
  `match` varchar(32) DEFAULT NULL,
  `grade` float NOT NULL DEFAULT '0',
  `code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_qwz_answer_matching`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_answer_matching` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_qwz_answer_matching` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_answer_multiple_choice`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_answer_multiple_choice`;
CREATE TABLE `c_SHSA_qwz_answer_multiple_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text NOT NULL,
  `correct` tinyint(4) NOT NULL,
  `grade` float NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_qwz_answer_multiple_choice`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_answer_multiple_choice` DISABLE KEYS */;
INSERT INTO `c_SHSA_qwz_answer_multiple_choice` (`id`,`questionId`,`answer`,`correct`,`grade`,`comment`) VALUES 
 (1,1,'Ridiculise one\'s interlocutor in order to have him concede he is wrong.',0,-5,'No. Socratic irony is not a matter of psychology, it concerns argument.'),
 (2,1,'Admit one\'s own errors to invite one\'s interlocutor to do the same.',0,-5,'No. Socratic irony is not a seduction strategy nor a method based on the example.'),
 (3,1,'Compel one\'s interlocutor, by a series of questions and sub-questions, to admit he doesn\'t know what he claims to know.',1,5,'Indeed. Socratic irony is an interrogative method. The Greek \"eirotao\" means \"ask questions\"'),
 (4,1,'Use the Principle of Non Contradiction to force one\'s interlocutor into a dead end.',1,5,'This answer is not false. It is true that the revelation of the interlocutor\'s ignorance means showing the contradictory conclusions which lead from his premises.');
/*!40000 ALTER TABLE `c_SHSA_qwz_answer_multiple_choice` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_answer_truefalse`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_answer_truefalse`;
CREATE TABLE `c_SHSA_qwz_answer_truefalse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `trueFeedback` text NOT NULL,
  `trueGrade` float NOT NULL,
  `falseFeedback` text NOT NULL,
  `falseGrade` float NOT NULL,
  `correctAnswer` enum('TRUE','FALSE') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_qwz_answer_truefalse`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_answer_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_qwz_answer_truefalse` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_exercise`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_exercise`;
CREATE TABLE `c_SHSA_qwz_exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'INVISIBLE',
  `displayType` enum('SEQUENTIAL','ONEPAGE') NOT NULL DEFAULT 'ONEPAGE',
  `shuffle` smallint(6) NOT NULL DEFAULT '0',
  `useSameShuffle` enum('0','1') NOT NULL DEFAULT '0',
  `showAnswers` enum('ALWAYS','NEVER','LASTTRY') NOT NULL DEFAULT 'ALWAYS',
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `timeLimit` smallint(6) NOT NULL DEFAULT '0',
  `attempts` tinyint(4) NOT NULL DEFAULT '0',
  `anonymousAttempts` enum('ALLOWED','NOTALLOWED') NOT NULL DEFAULT 'NOTALLOWED',
  `quizEndMessage` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_qwz_exercise`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_exercise` DISABLE KEYS */;
INSERT INTO `c_SHSA_qwz_exercise` (`id`,`title`,`description`,`visibility`,`displayType`,`shuffle`,`useSameShuffle`,`showAnswers`,`startDate`,`endDate`,`timeLimit`,`attempts`,`anonymousAttempts`,`quizEndMessage`) VALUES 
 (1,'Sample exercise','History of Ancient Philosophy','INVISIBLE','ONEPAGE',0,'0','ALWAYS','2014-06-27 09:29:15','2015-06-27 09:29:15',0,0,'NOTALLOWED','');
/*!40000 ALTER TABLE `c_SHSA_qwz_exercise` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_question`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_question`;
CREATE TABLE `c_SHSA_qwz_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `type` enum('MCUA','MCMA','TF','FIB','MATCHING') NOT NULL DEFAULT 'MCUA',
  `grade` float NOT NULL DEFAULT '0',
  `id_category` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_qwz_question`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_question` DISABLE KEYS */;
INSERT INTO `c_SHSA_qwz_question` (`id`,`title`,`description`,`attachment`,`type`,`grade`,`id_category`) VALUES 
 (1,'Socratic irony is...','(more than one answer can be true)','','MCMA',10,0);
/*!40000 ALTER TABLE `c_SHSA_qwz_question` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_questions_categories`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_questions_categories`;
CREATE TABLE `c_SHSA_qwz_questions_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record the categories of questions';

--
-- Dumping data for table `c_SHSA_qwz_questions_categories`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_questions_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_qwz_questions_categories` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_rel_exercise_question`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_rel_exercise_question`;
CREATE TABLE `c_SHSA_qwz_rel_exercise_question` (
  `exerciseId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_qwz_rel_exercise_question`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_rel_exercise_question` DISABLE KEYS */;
INSERT INTO `c_SHSA_qwz_rel_exercise_question` (`exerciseId`,`questionId`,`rank`) VALUES 
 (1,1,1);
/*!40000 ALTER TABLE `c_SHSA_qwz_rel_exercise_question` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_tracking`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_tracking`;
CREATE TABLE `c_SHSA_qwz_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exo_id` int(11) NOT NULL DEFAULT '0',
  `result` float NOT NULL DEFAULT '0',
  `time` mediumint(8) NOT NULL DEFAULT '0',
  `weighting` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `exo_id` (`exo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record informations about exercices';

--
-- Dumping data for table `c_SHSA_qwz_tracking`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_qwz_tracking` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_tracking_answers`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_tracking_answers`;
CREATE TABLE `c_SHSA_qwz_tracking_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details_id` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `details_id` (`details_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_qwz_tracking_answers`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_tracking_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_qwz_tracking_answers` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_tracking_questions`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_tracking_questions`;
CREATE TABLE `c_SHSA_qwz_tracking_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_track_id` int(11) NOT NULL DEFAULT '0',
  `question_id` int(11) NOT NULL DEFAULT '0',
  `result` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `exercise_track_id` (`exercise_track_id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record answers of students in exercices';

--
-- Dumping data for table `c_SHSA_qwz_tracking_questions`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_tracking_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_qwz_tracking_questions` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_qwz_users_random_questions`
--

DROP TABLE IF EXISTS `c_SHSA_qwz_users_random_questions`;
CREATE TABLE `c_SHSA_qwz_users_random_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `questions` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_exo` (`user_id`,`exercise_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_qwz_users_random_questions`
--

/*!40000 ALTER TABLE `c_SHSA_qwz_users_random_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_qwz_users_random_questions` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_tool_intro`
--

DROP TABLE IF EXISTS `c_SHSA_tool_intro`;
CREATE TABLE `c_SHSA_tool_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `display_date` datetime DEFAULT NULL,
  `content` text,
  `rank` int(11) DEFAULT '1',
  `visibility` enum('SHOW','HIDE') NOT NULL DEFAULT 'SHOW',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_tool_intro`
--

/*!40000 ALTER TABLE `c_SHSA_tool_intro` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_tool_intro` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_tool_list`
--

DROP TABLE IF EXISTS `c_SHSA_tool_list`;
CREATE TABLE `c_SHSA_tool_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(10) unsigned DEFAULT NULL,
  `rank` int(10) unsigned NOT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `script_url` varchar(255) DEFAULT NULL,
  `script_name` varchar(255) DEFAULT NULL,
  `addedTool` enum('YES','NO') DEFAULT 'YES',
  `activated` enum('true','false') NOT NULL DEFAULT 'true',
  `installed` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_tool_list`
--

/*!40000 ALTER TABLE `c_SHSA_tool_list` DISABLE KEYS */;
INSERT INTO `c_SHSA_tool_list` (`id`,`tool_id`,`rank`,`visibility`,`script_url`,`script_name`,`addedTool`,`activated`,`installed`) VALUES 
 (1,1,1,1,NULL,NULL,'YES','true','true'),
 (2,2,2,0,NULL,NULL,'YES','true','true'),
 (3,3,3,0,NULL,NULL,'YES','true','true'),
 (4,4,4,1,NULL,NULL,'YES','true','true'),
 (5,5,5,0,NULL,NULL,'YES','true','true'),
 (6,6,6,0,NULL,NULL,'YES','true','true'),
 (7,7,7,1,NULL,NULL,'YES','true','true'),
 (8,8,8,0,NULL,NULL,'YES','true','true'),
 (9,9,9,0,NULL,NULL,'YES','true','true'),
 (10,10,10,0,NULL,NULL,'YES','true','true'),
 (11,11,11,0,NULL,NULL,'YES','true','true'),
 (12,12,12,0,NULL,NULL,'YES','true','true');
/*!40000 ALTER TABLE `c_SHSA_tool_list` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_tracking_event`
--

DROP TABLE IF EXISTS `c_SHSA_tracking_event`;
CREATE TABLE `c_SHSA_tracking_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(60) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tool` (`tool_id`),
  KEY `user` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_tracking_event`
--

/*!40000 ALTER TABLE `c_SHSA_tracking_event` DISABLE KEYS */;
INSERT INTO `c_SHSA_tracking_event` (`id`,`tool_id`,`user_id`,`group_id`,`date`,`type`,`data`) VALUES 
 (1,NULL,1,NULL,'2014-06-27 09:30:00','course_access',''),
 (2,4,1,NULL,'2014-06-27 09:30:00','tool_access',''),
 (3,7,1,NULL,'2014-06-27 09:32:00','tool_access',''),
 (4,7,NULL,NULL,'2014-07-25 13:10:00','tool_access',''),
 (5,1,NULL,NULL,'2014-07-25 13:42:00','tool_access',''),
 (6,4,NULL,NULL,'2014-07-25 13:42:00','tool_access',''),
 (7,NULL,1,NULL,'2014-07-26 08:01:00','course_access',''),
 (8,10,1,NULL,'2014-07-26 08:01:00','tool_access',''),
 (9,9,1,NULL,'2014-07-26 08:01:00','tool_access',''),
 (10,1,NULL,NULL,'2014-07-26 08:04:00','tool_access',''),
 (11,4,NULL,NULL,'2014-07-26 08:04:00','tool_access',''),
 (12,7,NULL,NULL,'2014-07-26 08:04:00','tool_access',''),
 (13,7,1,NULL,'2014-07-26 08:18:00','course_access',''),
 (14,7,1,NULL,'2014-07-26 08:18:00','tool_access',''),
 (15,NULL,1,NULL,'2014-07-26 14:10:00','course_access',''),
 (16,4,1,NULL,'2014-07-26 14:10:00','tool_access',''),
 (17,NULL,1,NULL,'2014-07-26 14:14:00','download','a:1:{s:3:\"url\";s:43:\"/Supervisor_Health_and_Safety_Awareness.url\";}'),
 (18,7,1,NULL,'2014-07-26 14:22:00','tool_access',''),
 (19,NULL,1,NULL,'2014-07-26 18:31:00','course_access',''),
 (20,1,1,NULL,'2014-07-26 18:31:00','tool_access','');
/*!40000 ALTER TABLE `c_SHSA_tracking_event` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_userinfo_content`
--

DROP TABLE IF EXISTS `c_SHSA_userinfo_content`;
CREATE TABLE `c_SHSA_userinfo_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `def_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ed_ip` varchar(39) DEFAULT NULL,
  `ed_date` datetime DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='content of users information';

--
-- Dumping data for table `c_SHSA_userinfo_content`
--

/*!40000 ALTER TABLE `c_SHSA_userinfo_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_userinfo_content` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_userinfo_def`
--

DROP TABLE IF EXISTS `c_SHSA_userinfo_def`;
CREATE TABLE `c_SHSA_userinfo_def` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `comment` varchar(160) DEFAULT NULL,
  `nbLine` int(10) unsigned NOT NULL DEFAULT '5',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='categories definition for user information of a course';

--
-- Dumping data for table `c_SHSA_userinfo_def`
--

/*!40000 ALTER TABLE `c_SHSA_userinfo_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_userinfo_def` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_wiki_acls`
--

DROP TABLE IF EXISTS `c_SHSA_wiki_acls`;
CREATE TABLE `c_SHSA_wiki_acls` (
  `wiki_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flag` varchar(255) NOT NULL DEFAULT '',
  `value` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_wiki_acls`
--

/*!40000 ALTER TABLE `c_SHSA_wiki_acls` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_wiki_acls` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_wiki_pages`
--

DROP TABLE IF EXISTS `c_SHSA_wiki_pages`;
CREATE TABLE `c_SHSA_wiki_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_version` int(11) unsigned NOT NULL DEFAULT '0',
  `last_mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_wiki_pages`
--

/*!40000 ALTER TABLE `c_SHSA_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_wiki_pages` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_wiki_pages_content`
--

DROP TABLE IF EXISTS `c_SHSA_wiki_pages_content`;
CREATE TABLE `c_SHSA_wiki_pages_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `editor_id` int(11) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_wiki_pages_content`
--

/*!40000 ALTER TABLE `c_SHSA_wiki_pages_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_wiki_pages_content` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_wiki_properties`
--

DROP TABLE IF EXISTS `c_SHSA_wiki_properties`;
CREATE TABLE `c_SHSA_wiki_properties` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_wiki_properties`
--

/*!40000 ALTER TABLE `c_SHSA_wiki_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_SHSA_wiki_properties` ENABLE KEYS */;


--
-- Definition of table `c_SHSA_wrk_assignment`
--

DROP TABLE IF EXISTS `c_SHSA_wrk_assignment`;
CREATE TABLE `c_SHSA_wrk_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'VISIBLE',
  `def_submission_visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'VISIBLE',
  `assignment_type` enum('INDIVIDUAL','GROUP') NOT NULL DEFAULT 'INDIVIDUAL',
  `authorized_content` enum('TEXT','FILE','TEXTFILE') NOT NULL DEFAULT 'FILE',
  `allow_late_upload` enum('YES','NO') NOT NULL DEFAULT 'YES',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `prefill_text` text NOT NULL,
  `prefill_doc_path` varchar(200) NOT NULL DEFAULT '',
  `prefill_submit` enum('ENDDATE','AFTERPOST') NOT NULL DEFAULT 'ENDDATE',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_SHSA_wrk_assignment`
--

/*!40000 ALTER TABLE `c_SHSA_wrk_assignment` DISABLE KEYS */;
INSERT INTO `c_SHSA_wrk_assignment` (`id`,`title`,`description`,`visibility`,`def_submission_visibility`,`assignment_type`,`authorized_content`,`allow_late_upload`,`start_date`,`end_date`,`prefill_text`,`prefill_doc_path`,`prefill_submit`) VALUES 
 (1,'Upload Results','','VISIBLE','VISIBLE','INDIVIDUAL','FILE','YES','2014-06-27 09:32:00','2015-06-27 09:32:00','','','ENDDATE');
/*!40000 ALTER TABLE `c_SHSA_wrk_assignment` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_announcement`
--

DROP TABLE IF EXISTS `c_WHMIS_announcement`;
CREATE TABLE `c_WHMIS_announcement` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `contenu` text,
  `visibleFrom` date DEFAULT NULL,
  `visibleUntil` date DEFAULT NULL,
  `temps` date DEFAULT NULL,
  `ordre` mediumint(11) NOT NULL DEFAULT '0',
  `visibility` enum('SHOW','HIDE') NOT NULL DEFAULT 'SHOW',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='announcements table';

--
-- Dumping data for table `c_WHMIS_announcement`
--

/*!40000 ALTER TABLE `c_WHMIS_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_announcement` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_categories`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_categories`;
CREATE TABLE `c_WHMIS_bb_categories` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(100) DEFAULT NULL,
  `cat_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_categories`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_categories` DISABLE KEYS */;
INSERT INTO `c_WHMIS_bb_categories` (`cat_id`,`cat_title`,`cat_order`) VALUES 
 (2,'Main',1),
 (1,'Group forums',2);
/*!40000 ALTER TABLE `c_WHMIS_bb_categories` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_forums`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_forums`;
CREATE TABLE `c_WHMIS_bb_forums` (
  `forum_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `forum_name` varchar(150) DEFAULT NULL,
  `forum_desc` text,
  `forum_access` int(10) DEFAULT '1',
  `forum_moderator` int(10) DEFAULT NULL,
  `forum_topics` int(10) NOT NULL DEFAULT '0',
  `forum_posts` int(10) NOT NULL DEFAULT '0',
  `forum_last_post_id` int(10) NOT NULL DEFAULT '0',
  `cat_id` int(10) DEFAULT NULL,
  `forum_type` int(10) DEFAULT '0',
  `forum_order` int(10) DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_forums`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_forums` DISABLE KEYS */;
INSERT INTO `c_WHMIS_bb_forums` (`forum_id`,`group_id`,`forum_name`,`forum_desc`,`forum_access`,`forum_moderator`,`forum_topics`,`forum_posts`,`forum_last_post_id`,`cat_id`,`forum_type`,`forum_order`) VALUES 
 (1,NULL,'Test forum','Remove this through the forum admin tool',2,1,1,1,1,2,0,1);
/*!40000 ALTER TABLE `c_WHMIS_bb_forums` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_posts`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_posts`;
CREATE TABLE `c_WHMIS_bb_posts` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `poster_id` int(10) NOT NULL DEFAULT '0',
  `post_time` varchar(20) DEFAULT NULL,
  `poster_ip` varchar(16) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_posts`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_posts` DISABLE KEYS */;
INSERT INTO `c_WHMIS_bb_posts` (`post_id`,`topic_id`,`forum_id`,`poster_id`,`post_time`,`poster_ip`,`nom`,`prenom`) VALUES 
 (1,1,1,1,'2014-06-23 18:13:40','127.0.0.1','Cole','Steve');
/*!40000 ALTER TABLE `c_WHMIS_bb_posts` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_posts_text`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_posts_text`;
CREATE TABLE `c_WHMIS_bb_posts_text` (
  `post_id` int(10) NOT NULL DEFAULT '0',
  `post_text` text,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_posts_text`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_posts_text` DISABLE KEYS */;
INSERT INTO `c_WHMIS_bb_posts_text` (`post_id`,`post_text`) VALUES 
 (1,'Message');
/*!40000 ALTER TABLE `c_WHMIS_bb_posts_text` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_priv_msgs`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_priv_msgs`;
CREATE TABLE `c_WHMIS_bb_priv_msgs` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `from_userid` int(10) NOT NULL DEFAULT '0',
  `to_userid` int(10) NOT NULL DEFAULT '0',
  `msg_time` varchar(20) DEFAULT NULL,
  `poster_ip` varchar(16) DEFAULT NULL,
  `msg_status` int(10) DEFAULT '0',
  `msg_text` text,
  PRIMARY KEY (`msg_id`),
  KEY `to_userid` (`to_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_priv_msgs`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_priv_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_bb_priv_msgs` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_rel_forum_userstonotify`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_rel_forum_userstonotify`;
CREATE TABLE `c_WHMIS_bb_rel_forum_userstonotify` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  KEY `SECONDARY` (`user_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_rel_forum_userstonotify`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_rel_forum_userstonotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_bb_rel_forum_userstonotify` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_rel_topic_userstonotify`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_rel_topic_userstonotify`;
CREATE TABLE `c_WHMIS_bb_rel_topic_userstonotify` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  KEY `SECONDARY` (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_rel_topic_userstonotify`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_rel_topic_userstonotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_bb_rel_topic_userstonotify` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_topics`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_topics`;
CREATE TABLE `c_WHMIS_bb_topics` (
  `topic_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_title` varchar(100) DEFAULT NULL,
  `topic_poster` int(10) DEFAULT NULL,
  `topic_time` varchar(20) DEFAULT NULL,
  `topic_views` int(10) NOT NULL DEFAULT '0',
  `topic_replies` int(10) NOT NULL DEFAULT '0',
  `topic_last_post_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `topic_status` int(10) NOT NULL DEFAULT '0',
  `topic_notify` int(2) DEFAULT '0',
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_last_post_id` (`topic_last_post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_topics`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_topics` DISABLE KEYS */;
INSERT INTO `c_WHMIS_bb_topics` (`topic_id`,`topic_title`,`topic_poster`,`topic_time`,`topic_views`,`topic_replies`,`topic_last_post_id`,`forum_id`,`topic_status`,`topic_notify`,`nom`,`prenom`) VALUES 
 (1,'Example message',-1,'2014-06-23 18:13:40',1,0,1,1,0,1,'Cole','Steve');
/*!40000 ALTER TABLE `c_WHMIS_bb_topics` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_users`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_users`;
CREATE TABLE `c_WHMIS_bb_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `user_regdate` varchar(20) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_icq` varchar(15) DEFAULT NULL,
  `user_website` varchar(100) DEFAULT NULL,
  `user_occ` varchar(100) DEFAULT NULL,
  `user_from` varchar(100) DEFAULT NULL,
  `user_intrest` varchar(150) DEFAULT NULL,
  `user_sig` varchar(255) DEFAULT NULL,
  `user_viewemail` tinyint(2) DEFAULT NULL,
  `user_theme` int(10) DEFAULT NULL,
  `user_aim` varchar(18) DEFAULT NULL,
  `user_yim` varchar(25) DEFAULT NULL,
  `user_msnm` varchar(25) DEFAULT NULL,
  `user_posts` int(10) DEFAULT '0',
  `user_attachsig` int(2) DEFAULT '0',
  `user_desmile` int(2) DEFAULT '0',
  `user_html` int(2) DEFAULT '0',
  `user_bbcode` int(2) DEFAULT '0',
  `user_rank` int(10) DEFAULT '0',
  `user_level` int(10) DEFAULT '1',
  `user_lang` varchar(255) DEFAULT NULL,
  `user_actkey` varchar(32) DEFAULT NULL,
  `user_newpasswd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_users`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_users` DISABLE KEYS */;
INSERT INTO `c_WHMIS_bb_users` (`user_id`,`username`,`user_regdate`,`user_password`,`user_email`,`user_icq`,`user_website`,`user_occ`,`user_from`,`user_intrest`,`user_sig`,`user_viewemail`,`user_theme`,`user_aim`,`user_yim`,`user_msnm`,`user_posts`,`user_attachsig`,`user_desmile`,`user_html`,`user_bbcode`,`user_rank`,`user_level`,`user_lang`,`user_actkey`,`user_newpasswd`) VALUES 
 (1,'Cole Steve','2014-06-23 18:13:40','password','steve@profilequinte.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,1,NULL,NULL,NULL),
 (-1,'Anonymous','2014-06-23 18:13:40','password','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `c_WHMIS_bb_users` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_bb_whosonline`
--

DROP TABLE IF EXISTS `c_WHMIS_bb_whosonline`;
CREATE TABLE `c_WHMIS_bb_whosonline` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `count` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `forum` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_bb_whosonline`
--

/*!40000 ALTER TABLE `c_WHMIS_bb_whosonline` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_bb_whosonline` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_calendar_event`
--

DROP TABLE IF EXISTS `c_WHMIS_calendar_event`;
CREATE TABLE `c_WHMIS_calendar_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) DEFAULT NULL,
  `contenu` text,
  `day` date NOT NULL DEFAULT '0000-00-00',
  `hour` time NOT NULL DEFAULT '00:00:00',
  `lasting` varchar(20) DEFAULT NULL,
  `speakers` varchar(150) DEFAULT NULL,
  `visibility` enum('SHOW','HIDE') NOT NULL DEFAULT 'SHOW',
  `location` varchar(150) DEFAULT NULL,
  `group_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_calendar_event`
--

/*!40000 ALTER TABLE `c_WHMIS_calendar_event` DISABLE KEYS */;
INSERT INTO `c_WHMIS_calendar_event` (`id`,`titre`,`contenu`,`day`,`hour`,`lasting`,`speakers`,`visibility`,`location`,`group_id`) VALUES 
 (1,'Upload Results','','2015-06-23','18:52:00',NULL,NULL,'SHOW',NULL,0);
/*!40000 ALTER TABLE `c_WHMIS_calendar_event` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_chat`
--

DROP TABLE IF EXISTS `c_WHMIS_chat`;
CREATE TABLE `c_WHMIS_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT NULL,
  `message` text,
  `post_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_chat`
--

/*!40000 ALTER TABLE `c_WHMIS_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_chat` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_chat_users`
--

DROP TABLE IF EXISTS `c_WHMIS_chat_users`;
CREATE TABLE `c_WHMIS_chat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT NULL,
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_chat_users`
--

/*!40000 ALTER TABLE `c_WHMIS_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_chat_users` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_course_description`
--

DROP TABLE IF EXISTS `c_WHMIS_course_description`;
CREATE TABLE `c_WHMIS_course_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '-1',
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `lastEditDate` datetime NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'VISIBLE',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_course_description`
--

/*!40000 ALTER TABLE `c_WHMIS_course_description` DISABLE KEYS */;
INSERT INTO `c_WHMIS_course_description` (`id`,`category`,`title`,`content`,`lastEditDate`,`visibility`) VALUES 
 (1,0,'Description','<p>It is highly recommended that you have a printer driver installed such as CUTE PDF so that you can save the certificate at the end of the course. It will be required to upload it into the system.</p>\r\n<!-- content: html tiny_mce -->','2014-07-26 18:32:29','VISIBLE');
/*!40000 ALTER TABLE `c_WHMIS_course_description` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_course_properties`
--

DROP TABLE IF EXISTS `c_WHMIS_course_properties`;
CREATE TABLE `c_WHMIS_course_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_course_properties`
--

/*!40000 ALTER TABLE `c_WHMIS_course_properties` DISABLE KEYS */;
INSERT INTO `c_WHMIS_course_properties` (`id`,`name`,`value`,`category`) VALUES 
 (1,'self_registration','1','GROUP'),
 (2,'self_unregistration','0','GROUP'),
 (3,'nbGroupPerUser','1','GROUP'),
 (4,'private','1','GROUP'),
 (5,'CLDOC','1','GROUP'),
 (6,'CLFRM','1','GROUP'),
 (7,'CLWIKI','1','GROUP'),
 (8,'CLCHAT','1','GROUP');
/*!40000 ALTER TABLE `c_WHMIS_course_properties` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_document`
--

DROP TABLE IF EXISTS `c_WHMIS_document`;
CREATE TABLE `c_WHMIS_document` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `visibility` char(1) NOT NULL DEFAULT 'v',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_document`
--

/*!40000 ALTER TABLE `c_WHMIS_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_document` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_group_rel_team_user`
--

DROP TABLE IF EXISTS `c_WHMIS_group_rel_team_user`;
CREATE TABLE `c_WHMIS_group_rel_team_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `team` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_group_rel_team_user`
--

/*!40000 ALTER TABLE `c_WHMIS_group_rel_team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_group_rel_team_user` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_group_team`
--

DROP TABLE IF EXISTS `c_WHMIS_group_team`;
CREATE TABLE `c_WHMIS_group_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `tutor` int(11) DEFAULT NULL,
  `maxStudent` int(11) DEFAULT '0',
  `secretDirectory` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_group_team`
--

/*!40000 ALTER TABLE `c_WHMIS_group_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_group_team` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_lnk_links`
--

DROP TABLE IF EXISTS `c_WHMIS_lnk_links`;
CREATE TABLE `c_WHMIS_lnk_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src_id` int(11) NOT NULL DEFAULT '0',
  `dest_id` int(11) NOT NULL DEFAULT '0',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_lnk_links`
--

/*!40000 ALTER TABLE `c_WHMIS_lnk_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_lnk_links` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_lnk_resources`
--

DROP TABLE IF EXISTS `c_WHMIS_lnk_resources`;
CREATE TABLE `c_WHMIS_lnk_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crl` text NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_lnk_resources`
--

/*!40000 ALTER TABLE `c_WHMIS_lnk_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_lnk_resources` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_lp_asset`
--

DROP TABLE IF EXISTS `c_WHMIS_lp_asset`;
CREATE TABLE `c_WHMIS_lp_asset` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='List of resources of module of learning paths';

--
-- Dumping data for table `c_WHMIS_lp_asset`
--

/*!40000 ALTER TABLE `c_WHMIS_lp_asset` DISABLE KEYS */;
INSERT INTO `c_WHMIS_lp_asset` (`asset_id`,`module_id`,`path`,`comment`) VALUES 
 (2,2,'1','');
/*!40000 ALTER TABLE `c_WHMIS_lp_asset` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_lp_learnPath`
--

DROP TABLE IF EXISTS `c_WHMIS_lp_learnPath`;
CREATE TABLE `c_WHMIS_lp_learnPath` (
  `learnPath_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `lock` enum('OPEN','CLOSE') NOT NULL DEFAULT 'OPEN',
  `visibility` enum('HIDE','SHOW') NOT NULL DEFAULT 'SHOW',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`learnPath_id`),
  UNIQUE KEY `rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='List of learning Paths';

--
-- Dumping data for table `c_WHMIS_lp_learnPath`
--

/*!40000 ALTER TABLE `c_WHMIS_lp_learnPath` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_lp_learnPath` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_lp_module`
--

DROP TABLE IF EXISTS `c_WHMIS_lp_module`;
CREATE TABLE `c_WHMIS_lp_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `accessibility` enum('PRIVATE','PUBLIC') NOT NULL DEFAULT 'PRIVATE',
  `startAsset_id` int(11) NOT NULL DEFAULT '0',
  `contentType` enum('CLARODOC','DOCUMENT','EXERCISE','HANDMADE','SCORM','LABEL') NOT NULL,
  `launch_data` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='List of available modules used in learning paths';

--
-- Dumping data for table `c_WHMIS_lp_module`
--

/*!40000 ALTER TABLE `c_WHMIS_lp_module` DISABLE KEYS */;
INSERT INTO `c_WHMIS_lp_module` (`module_id`,`name`,`comment`,`accessibility`,`startAsset_id`,`contentType`,`launch_data`) VALUES 
 (2,'Sample exercise','You can use any exercise of the exercises tool of your course.','PRIVATE',2,'EXERCISE','');
/*!40000 ALTER TABLE `c_WHMIS_lp_module` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_lp_rel_learnPath_module`
--

DROP TABLE IF EXISTS `c_WHMIS_lp_rel_learnPath_module`;
CREATE TABLE `c_WHMIS_lp_rel_learnPath_module` (
  `learnPath_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `learnPath_id` int(11) NOT NULL DEFAULT '0',
  `module_id` int(11) NOT NULL DEFAULT '0',
  `lock` enum('OPEN','CLOSE') NOT NULL DEFAULT 'OPEN',
  `visibility` enum('HIDE','SHOW') NOT NULL DEFAULT 'SHOW',
  `specificComment` text NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `raw_to_pass` tinyint(4) NOT NULL DEFAULT '50',
  PRIMARY KEY (`learnPath_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='This table links module to the learning path using them';

--
-- Dumping data for table `c_WHMIS_lp_rel_learnPath_module`
--

/*!40000 ALTER TABLE `c_WHMIS_lp_rel_learnPath_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_lp_rel_learnPath_module` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_lp_user_module_progress`
--

DROP TABLE IF EXISTS `c_WHMIS_lp_user_module_progress`;
CREATE TABLE `c_WHMIS_lp_user_module_progress` (
  `user_module_progress_id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL DEFAULT '0',
  `learnPath_module_id` int(11) NOT NULL DEFAULT '0',
  `learnPath_id` int(11) NOT NULL DEFAULT '0',
  `lesson_location` varchar(255) NOT NULL DEFAULT '',
  `lesson_status` enum('NOT ATTEMPTED','PASSED','FAILED','COMPLETED','BROWSED','INCOMPLETE','UNKNOWN') NOT NULL DEFAULT 'NOT ATTEMPTED',
  `entry` enum('AB-INITIO','RESUME','') NOT NULL DEFAULT 'AB-INITIO',
  `raw` tinyint(4) NOT NULL DEFAULT '-1',
  `scoreMin` tinyint(4) NOT NULL DEFAULT '-1',
  `scoreMax` tinyint(4) NOT NULL DEFAULT '-1',
  `total_time` varchar(13) NOT NULL DEFAULT '0000:00:00.00',
  `session_time` varchar(13) NOT NULL DEFAULT '0000:00:00.00',
  `suspend_data` text NOT NULL,
  `credit` enum('CREDIT','NO-CREDIT') NOT NULL DEFAULT 'NO-CREDIT',
  PRIMARY KEY (`user_module_progress_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record the last known status of the user in the course';

--
-- Dumping data for table `c_WHMIS_lp_user_module_progress`
--

/*!40000 ALTER TABLE `c_WHMIS_lp_user_module_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_lp_user_module_progress` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_answer_fib`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_answer_fib`;
CREATE TABLE `c_WHMIS_qwz_answer_fib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text NOT NULL,
  `gradeList` text NOT NULL,
  `wrongAnswerList` text NOT NULL,
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_qwz_answer_fib`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_answer_fib` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_qwz_answer_fib` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_answer_matching`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_answer_matching`;
CREATE TABLE `c_WHMIS_qwz_answer_matching` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text NOT NULL,
  `match` varchar(32) DEFAULT NULL,
  `grade` float NOT NULL DEFAULT '0',
  `code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_qwz_answer_matching`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_answer_matching` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_qwz_answer_matching` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_answer_multiple_choice`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_answer_multiple_choice`;
CREATE TABLE `c_WHMIS_qwz_answer_multiple_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text NOT NULL,
  `correct` tinyint(4) NOT NULL,
  `grade` float NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_qwz_answer_multiple_choice`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_answer_multiple_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_qwz_answer_multiple_choice` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_answer_truefalse`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_answer_truefalse`;
CREATE TABLE `c_WHMIS_qwz_answer_truefalse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `trueFeedback` text NOT NULL,
  `trueGrade` float NOT NULL,
  `falseFeedback` text NOT NULL,
  `falseGrade` float NOT NULL,
  `correctAnswer` enum('TRUE','FALSE') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_qwz_answer_truefalse`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_answer_truefalse` DISABLE KEYS */;
INSERT INTO `c_WHMIS_qwz_answer_truefalse` (`id`,`questionId`,`trueFeedback`,`trueGrade`,`falseFeedback`,`falseGrade`,`correctAnswer`) VALUES 
 (1,2,'<!-- content: html tiny_mce -->',0,'<!-- content: html tiny_mce -->',0,'TRUE');
/*!40000 ALTER TABLE `c_WHMIS_qwz_answer_truefalse` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_exercise`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_exercise`;
CREATE TABLE `c_WHMIS_qwz_exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'INVISIBLE',
  `displayType` enum('SEQUENTIAL','ONEPAGE') NOT NULL DEFAULT 'ONEPAGE',
  `shuffle` smallint(6) NOT NULL DEFAULT '0',
  `useSameShuffle` enum('0','1') NOT NULL DEFAULT '0',
  `showAnswers` enum('ALWAYS','NEVER','LASTTRY') NOT NULL DEFAULT 'ALWAYS',
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `timeLimit` smallint(6) NOT NULL DEFAULT '0',
  `attempts` tinyint(4) NOT NULL DEFAULT '0',
  `anonymousAttempts` enum('ALLOWED','NOTALLOWED') NOT NULL DEFAULT 'NOTALLOWED',
  `quizEndMessage` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_qwz_exercise`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_exercise` DISABLE KEYS */;
INSERT INTO `c_WHMIS_qwz_exercise` (`id`,`title`,`description`,`visibility`,`displayType`,`shuffle`,`useSameShuffle`,`showAnswers`,`startDate`,`endDate`,`timeLimit`,`attempts`,`anonymousAttempts`,`quizEndMessage`) VALUES 
 (4,'Course Completion','<p>Please upload the test results through the Assignments menu.</p>\r\n<!-- content: html tiny_mce -->','INVISIBLE','ONEPAGE',0,'0','ALWAYS','2014-06-23 18:50:00','0000-00-00 00:00:00',0,0,'NOTALLOWED','<!-- content: html tiny_mce -->');
/*!40000 ALTER TABLE `c_WHMIS_qwz_exercise` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_question`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_question`;
CREATE TABLE `c_WHMIS_qwz_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `type` enum('MCUA','MCMA','TF','FIB','MATCHING') NOT NULL DEFAULT 'MCUA',
  `grade` float NOT NULL DEFAULT '0',
  `id_category` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_qwz_question`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_question` DISABLE KEYS */;
INSERT INTO `c_WHMIS_qwz_question` (`id`,`title`,`description`,`attachment`,`type`,`grade`,`id_category`) VALUES 
 (2,'WHMIS','<p>Have you completed the course? If so, please upload the results in PDF format.</p>\r\n<!-- content: html tiny_mce -->','','TF',0,0);
/*!40000 ALTER TABLE `c_WHMIS_qwz_question` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_questions_categories`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_questions_categories`;
CREATE TABLE `c_WHMIS_qwz_questions_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record the categories of questions';

--
-- Dumping data for table `c_WHMIS_qwz_questions_categories`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_questions_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_qwz_questions_categories` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_rel_exercise_question`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_rel_exercise_question`;
CREATE TABLE `c_WHMIS_qwz_rel_exercise_question` (
  `exerciseId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_qwz_rel_exercise_question`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_rel_exercise_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_qwz_rel_exercise_question` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_tracking`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_tracking`;
CREATE TABLE `c_WHMIS_qwz_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exo_id` int(11) NOT NULL DEFAULT '0',
  `result` float NOT NULL DEFAULT '0',
  `time` mediumint(8) NOT NULL DEFAULT '0',
  `weighting` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `exo_id` (`exo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record informations about exercices';

--
-- Dumping data for table `c_WHMIS_qwz_tracking`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_qwz_tracking` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_tracking_answers`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_tracking_answers`;
CREATE TABLE `c_WHMIS_qwz_tracking_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details_id` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `details_id` (`details_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_qwz_tracking_answers`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_tracking_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_qwz_tracking_answers` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_tracking_questions`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_tracking_questions`;
CREATE TABLE `c_WHMIS_qwz_tracking_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_track_id` int(11) NOT NULL DEFAULT '0',
  `question_id` int(11) NOT NULL DEFAULT '0',
  `result` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `exercise_track_id` (`exercise_track_id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record answers of students in exercices';

--
-- Dumping data for table `c_WHMIS_qwz_tracking_questions`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_tracking_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_qwz_tracking_questions` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_qwz_users_random_questions`
--

DROP TABLE IF EXISTS `c_WHMIS_qwz_users_random_questions`;
CREATE TABLE `c_WHMIS_qwz_users_random_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `questions` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_exo` (`user_id`,`exercise_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_qwz_users_random_questions`
--

/*!40000 ALTER TABLE `c_WHMIS_qwz_users_random_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_qwz_users_random_questions` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_tool_intro`
--

DROP TABLE IF EXISTS `c_WHMIS_tool_intro`;
CREATE TABLE `c_WHMIS_tool_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `display_date` datetime DEFAULT NULL,
  `content` text,
  `rank` int(11) DEFAULT '1',
  `visibility` enum('SHOW','HIDE') NOT NULL DEFAULT 'SHOW',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_tool_intro`
--

/*!40000 ALTER TABLE `c_WHMIS_tool_intro` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_tool_intro` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_tool_list`
--

DROP TABLE IF EXISTS `c_WHMIS_tool_list`;
CREATE TABLE `c_WHMIS_tool_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(10) unsigned DEFAULT NULL,
  `rank` int(10) unsigned NOT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `script_url` varchar(255) DEFAULT NULL,
  `script_name` varchar(255) DEFAULT NULL,
  `addedTool` enum('YES','NO') DEFAULT 'YES',
  `activated` enum('true','false') NOT NULL DEFAULT 'true',
  `installed` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_tool_list`
--

/*!40000 ALTER TABLE `c_WHMIS_tool_list` DISABLE KEYS */;
INSERT INTO `c_WHMIS_tool_list` (`id`,`tool_id`,`rank`,`visibility`,`script_url`,`script_name`,`addedTool`,`activated`,`installed`) VALUES 
 (1,1,1,0,NULL,NULL,'YES','true','true'),
 (2,2,2,0,NULL,NULL,'YES','true','true'),
 (3,3,3,0,NULL,NULL,'YES','true','true'),
 (4,4,4,1,NULL,NULL,'YES','true','true'),
 (5,5,5,0,NULL,NULL,'YES','true','true'),
 (6,6,6,0,NULL,NULL,'YES','true','true'),
 (7,7,7,1,NULL,NULL,'YES','true','true'),
 (8,8,8,0,NULL,NULL,'YES','true','true'),
 (9,9,9,0,NULL,NULL,'YES','true','true'),
 (10,10,10,0,NULL,NULL,'YES','true','true'),
 (11,11,11,0,NULL,NULL,'YES','true','true'),
 (12,12,12,0,NULL,NULL,'YES','true','true');
/*!40000 ALTER TABLE `c_WHMIS_tool_list` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_tracking_event`
--

DROP TABLE IF EXISTS `c_WHMIS_tracking_event`;
CREATE TABLE `c_WHMIS_tracking_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(60) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tool` (`tool_id`),
  KEY `user` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_tracking_event`
--

/*!40000 ALTER TABLE `c_WHMIS_tracking_event` DISABLE KEYS */;
INSERT INTO `c_WHMIS_tracking_event` (`id`,`tool_id`,`user_id`,`group_id`,`date`,`type`,`data`) VALUES 
 (1,NULL,1,NULL,'2014-06-23 18:14:00','course_access',''),
 (2,6,1,NULL,'2014-06-23 18:15:00','tool_access',''),
 (3,4,1,NULL,'2014-06-23 18:16:00','tool_access',''),
 (4,3,1,NULL,'2014-06-23 18:17:00','tool_access',''),
 (5,NULL,1,NULL,'2014-06-23 18:17:00','download','a:1:{s:3:\"url\";s:10:\"/WHMIS.url\";}'),
 (6,5,1,NULL,'2014-06-23 18:17:00','tool_access',''),
 (7,1,1,NULL,'2014-06-23 18:28:00','tool_access',''),
 (8,7,1,NULL,'2014-06-23 18:32:00','tool_access',''),
 (9,NULL,1,NULL,'2014-06-23 18:35:00','course_access',''),
 (10,9,1,NULL,'2014-06-23 18:36:00','tool_access',''),
 (11,10,1,NULL,'2014-06-23 18:36:00','tool_access',''),
 (12,NULL,1,NULL,'2014-06-23 18:41:00','course_access',''),
 (13,4,1,NULL,'2014-06-23 18:41:00','tool_access',''),
 (14,5,1,NULL,'2014-06-23 18:41:00','tool_access',''),
 (15,8,1,NULL,'2014-06-23 18:42:00','tool_access',''),
 (16,NULL,3,NULL,'2014-06-23 18:43:00','course_access',''),
 (17,10,3,NULL,'2014-06-23 18:43:00','tool_access',''),
 (18,4,3,NULL,'2014-06-23 18:43:00','tool_access',''),
 (19,5,3,NULL,'2014-06-23 18:43:00','tool_access',''),
 (20,NULL,1,NULL,'2014-06-23 18:45:00','course_access',''),
 (21,5,1,NULL,'2014-06-23 18:45:00','tool_access',''),
 (22,7,1,NULL,'2014-06-23 18:52:00','tool_access',''),
 (23,4,1,NULL,'2014-06-23 18:54:00','tool_access',''),
 (24,NULL,3,NULL,'2014-06-23 18:55:00','course_access',''),
 (25,4,3,NULL,'2014-06-23 18:55:00','tool_access',''),
 (26,5,3,NULL,'2014-06-23 18:56:00','tool_access',''),
 (27,7,3,NULL,'2014-06-23 18:56:00','tool_access',''),
 (28,NULL,1,NULL,'2014-06-23 18:56:00','course_access',''),
 (29,NULL,3,NULL,'2014-06-23 18:57:00','course_access',''),
 (30,4,3,NULL,'2014-06-23 18:57:00','tool_access',''),
 (31,NULL,1,NULL,'2014-06-23 18:57:00','course_access',''),
 (32,NULL,3,NULL,'2014-06-23 18:58:00','course_access',''),
 (33,4,3,NULL,'2014-06-23 18:58:00','tool_access',''),
 (34,7,3,NULL,'2014-06-23 18:58:00','tool_access',''),
 (35,NULL,1,NULL,'2014-06-23 18:59:00','course_access',''),
 (36,NULL,3,NULL,'2014-06-23 18:59:00','course_access',''),
 (37,4,3,NULL,'2014-06-23 18:59:00','tool_access',''),
 (38,7,3,NULL,'2014-06-23 18:59:00','tool_access',''),
 (39,4,NULL,NULL,'2014-06-23 19:00:00','tool_access',''),
 (40,7,NULL,NULL,'2014-06-23 19:00:00','tool_access',''),
 (41,NULL,1,NULL,'2014-06-23 20:46:00','course_access',''),
 (42,NULL,3,NULL,'2014-06-23 20:47:00','course_access',''),
 (43,4,3,NULL,'2014-06-23 20:47:00','tool_access',''),
 (44,7,3,NULL,'2014-06-23 20:47:00','tool_access',''),
 (45,NULL,3,NULL,'2014-06-23 21:33:00','course_access',''),
 (46,7,3,NULL,'2014-06-23 21:34:00','tool_access',''),
 (47,4,3,NULL,'2014-06-23 21:39:00','tool_access',''),
 (48,NULL,1,NULL,'2014-06-23 21:44:00','course_access',''),
 (49,NULL,1,NULL,'2014-06-26 13:27:00','course_access',''),
 (50,7,1,NULL,'2014-06-26 13:27:00','tool_access',''),
 (51,NULL,1,NULL,'2014-07-26 08:22:00','course_access',''),
 (52,NULL,1,NULL,'2014-07-26 14:36:00','course_access',''),
 (53,7,1,NULL,'2014-07-26 17:10:00','tool_access',''),
 (54,4,1,NULL,'2014-07-26 17:10:00','tool_access',''),
 (55,NULL,1,NULL,'2014-07-26 17:35:00','download','a:1:{s:3:\"url\";s:10:\"/WHMIS.url\";}'),
 (56,NULL,1,NULL,'2014-07-26 18:32:00','course_access',''),
 (57,1,1,NULL,'2014-07-26 18:32:00','tool_access','');
/*!40000 ALTER TABLE `c_WHMIS_tracking_event` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_userinfo_content`
--

DROP TABLE IF EXISTS `c_WHMIS_userinfo_content`;
CREATE TABLE `c_WHMIS_userinfo_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `def_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ed_ip` varchar(39) DEFAULT NULL,
  `ed_date` datetime DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='content of users information';

--
-- Dumping data for table `c_WHMIS_userinfo_content`
--

/*!40000 ALTER TABLE `c_WHMIS_userinfo_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_userinfo_content` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_userinfo_def`
--

DROP TABLE IF EXISTS `c_WHMIS_userinfo_def`;
CREATE TABLE `c_WHMIS_userinfo_def` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `comment` varchar(160) DEFAULT NULL,
  `nbLine` int(10) unsigned NOT NULL DEFAULT '5',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='categories definition for user information of a course';

--
-- Dumping data for table `c_WHMIS_userinfo_def`
--

/*!40000 ALTER TABLE `c_WHMIS_userinfo_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_userinfo_def` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_wiki_acls`
--

DROP TABLE IF EXISTS `c_WHMIS_wiki_acls`;
CREATE TABLE `c_WHMIS_wiki_acls` (
  `wiki_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flag` varchar(255) NOT NULL DEFAULT '',
  `value` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_wiki_acls`
--

/*!40000 ALTER TABLE `c_WHMIS_wiki_acls` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_wiki_acls` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_wiki_pages`
--

DROP TABLE IF EXISTS `c_WHMIS_wiki_pages`;
CREATE TABLE `c_WHMIS_wiki_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_version` int(11) unsigned NOT NULL DEFAULT '0',
  `last_mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_wiki_pages`
--

/*!40000 ALTER TABLE `c_WHMIS_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_wiki_pages` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_wiki_pages_content`
--

DROP TABLE IF EXISTS `c_WHMIS_wiki_pages_content`;
CREATE TABLE `c_WHMIS_wiki_pages_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `editor_id` int(11) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_wiki_pages_content`
--

/*!40000 ALTER TABLE `c_WHMIS_wiki_pages_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_wiki_pages_content` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_wiki_properties`
--

DROP TABLE IF EXISTS `c_WHMIS_wiki_properties`;
CREATE TABLE `c_WHMIS_wiki_properties` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_wiki_properties`
--

/*!40000 ALTER TABLE `c_WHMIS_wiki_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHMIS_wiki_properties` ENABLE KEYS */;


--
-- Definition of table `c_WHMIS_wrk_assignment`
--

DROP TABLE IF EXISTS `c_WHMIS_wrk_assignment`;
CREATE TABLE `c_WHMIS_wrk_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'VISIBLE',
  `def_submission_visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'VISIBLE',
  `assignment_type` enum('INDIVIDUAL','GROUP') NOT NULL DEFAULT 'INDIVIDUAL',
  `authorized_content` enum('TEXT','FILE','TEXTFILE') NOT NULL DEFAULT 'FILE',
  `allow_late_upload` enum('YES','NO') NOT NULL DEFAULT 'YES',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `prefill_text` text NOT NULL,
  `prefill_doc_path` varchar(200) NOT NULL DEFAULT '',
  `prefill_submit` enum('ENDDATE','AFTERPOST') NOT NULL DEFAULT 'ENDDATE',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHMIS_wrk_assignment`
--

/*!40000 ALTER TABLE `c_WHMIS_wrk_assignment` DISABLE KEYS */;
INSERT INTO `c_WHMIS_wrk_assignment` (`id`,`title`,`description`,`visibility`,`def_submission_visibility`,`assignment_type`,`authorized_content`,`allow_late_upload`,`start_date`,`end_date`,`prefill_text`,`prefill_doc_path`,`prefill_submit`) VALUES 
 (1,'Upload Results','','VISIBLE','VISIBLE','INDIVIDUAL','FILE','YES','2014-06-23 18:52:00','2015-06-23 18:52:00','','','ENDDATE');
/*!40000 ALTER TABLE `c_WHMIS_wrk_assignment` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_announcement`
--

DROP TABLE IF EXISTS `c_WHSA_announcement`;
CREATE TABLE `c_WHSA_announcement` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `contenu` text,
  `visibleFrom` date DEFAULT NULL,
  `visibleUntil` date DEFAULT NULL,
  `temps` date DEFAULT NULL,
  `ordre` mediumint(11) NOT NULL DEFAULT '0',
  `visibility` enum('SHOW','HIDE') NOT NULL DEFAULT 'SHOW',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='announcements table';

--
-- Dumping data for table `c_WHSA_announcement`
--

/*!40000 ALTER TABLE `c_WHSA_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_announcement` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_categories`
--

DROP TABLE IF EXISTS `c_WHSA_bb_categories`;
CREATE TABLE `c_WHSA_bb_categories` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(100) DEFAULT NULL,
  `cat_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_categories`
--

/*!40000 ALTER TABLE `c_WHSA_bb_categories` DISABLE KEYS */;
INSERT INTO `c_WHSA_bb_categories` (`cat_id`,`cat_title`,`cat_order`) VALUES 
 (2,'Main',1),
 (1,'Group forums',2);
/*!40000 ALTER TABLE `c_WHSA_bb_categories` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_forums`
--

DROP TABLE IF EXISTS `c_WHSA_bb_forums`;
CREATE TABLE `c_WHSA_bb_forums` (
  `forum_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `forum_name` varchar(150) DEFAULT NULL,
  `forum_desc` text,
  `forum_access` int(10) DEFAULT '1',
  `forum_moderator` int(10) DEFAULT NULL,
  `forum_topics` int(10) NOT NULL DEFAULT '0',
  `forum_posts` int(10) NOT NULL DEFAULT '0',
  `forum_last_post_id` int(10) NOT NULL DEFAULT '0',
  `cat_id` int(10) DEFAULT NULL,
  `forum_type` int(10) DEFAULT '0',
  `forum_order` int(10) DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_forums`
--

/*!40000 ALTER TABLE `c_WHSA_bb_forums` DISABLE KEYS */;
INSERT INTO `c_WHSA_bb_forums` (`forum_id`,`group_id`,`forum_name`,`forum_desc`,`forum_access`,`forum_moderator`,`forum_topics`,`forum_posts`,`forum_last_post_id`,`cat_id`,`forum_type`,`forum_order`) VALUES 
 (1,NULL,'Test forum','Remove this through the forum admin tool',2,1,1,1,1,2,0,1);
/*!40000 ALTER TABLE `c_WHSA_bb_forums` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_posts`
--

DROP TABLE IF EXISTS `c_WHSA_bb_posts`;
CREATE TABLE `c_WHSA_bb_posts` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `poster_id` int(10) NOT NULL DEFAULT '0',
  `post_time` varchar(20) DEFAULT NULL,
  `poster_ip` varchar(16) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_posts`
--

/*!40000 ALTER TABLE `c_WHSA_bb_posts` DISABLE KEYS */;
INSERT INTO `c_WHSA_bb_posts` (`post_id`,`topic_id`,`forum_id`,`poster_id`,`post_time`,`poster_ip`,`nom`,`prenom`) VALUES 
 (1,1,1,1,'2014-06-26 13:18:57','127.0.0.1','Cole','Steve');
/*!40000 ALTER TABLE `c_WHSA_bb_posts` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_posts_text`
--

DROP TABLE IF EXISTS `c_WHSA_bb_posts_text`;
CREATE TABLE `c_WHSA_bb_posts_text` (
  `post_id` int(10) NOT NULL DEFAULT '0',
  `post_text` text,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_posts_text`
--

/*!40000 ALTER TABLE `c_WHSA_bb_posts_text` DISABLE KEYS */;
INSERT INTO `c_WHSA_bb_posts_text` (`post_id`,`post_text`) VALUES 
 (1,'Message');
/*!40000 ALTER TABLE `c_WHSA_bb_posts_text` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_priv_msgs`
--

DROP TABLE IF EXISTS `c_WHSA_bb_priv_msgs`;
CREATE TABLE `c_WHSA_bb_priv_msgs` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `from_userid` int(10) NOT NULL DEFAULT '0',
  `to_userid` int(10) NOT NULL DEFAULT '0',
  `msg_time` varchar(20) DEFAULT NULL,
  `poster_ip` varchar(16) DEFAULT NULL,
  `msg_status` int(10) DEFAULT '0',
  `msg_text` text,
  PRIMARY KEY (`msg_id`),
  KEY `to_userid` (`to_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_priv_msgs`
--

/*!40000 ALTER TABLE `c_WHSA_bb_priv_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_bb_priv_msgs` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_rel_forum_userstonotify`
--

DROP TABLE IF EXISTS `c_WHSA_bb_rel_forum_userstonotify`;
CREATE TABLE `c_WHSA_bb_rel_forum_userstonotify` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  KEY `SECONDARY` (`user_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_rel_forum_userstonotify`
--

/*!40000 ALTER TABLE `c_WHSA_bb_rel_forum_userstonotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_bb_rel_forum_userstonotify` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_rel_topic_userstonotify`
--

DROP TABLE IF EXISTS `c_WHSA_bb_rel_topic_userstonotify`;
CREATE TABLE `c_WHSA_bb_rel_topic_userstonotify` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  KEY `SECONDARY` (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_rel_topic_userstonotify`
--

/*!40000 ALTER TABLE `c_WHSA_bb_rel_topic_userstonotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_bb_rel_topic_userstonotify` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_topics`
--

DROP TABLE IF EXISTS `c_WHSA_bb_topics`;
CREATE TABLE `c_WHSA_bb_topics` (
  `topic_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_title` varchar(100) DEFAULT NULL,
  `topic_poster` int(10) DEFAULT NULL,
  `topic_time` varchar(20) DEFAULT NULL,
  `topic_views` int(10) NOT NULL DEFAULT '0',
  `topic_replies` int(10) NOT NULL DEFAULT '0',
  `topic_last_post_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `topic_status` int(10) NOT NULL DEFAULT '0',
  `topic_notify` int(2) DEFAULT '0',
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_last_post_id` (`topic_last_post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_topics`
--

/*!40000 ALTER TABLE `c_WHSA_bb_topics` DISABLE KEYS */;
INSERT INTO `c_WHSA_bb_topics` (`topic_id`,`topic_title`,`topic_poster`,`topic_time`,`topic_views`,`topic_replies`,`topic_last_post_id`,`forum_id`,`topic_status`,`topic_notify`,`nom`,`prenom`) VALUES 
 (1,'Example message',-1,'2014-06-26 13:18:57',1,0,1,1,0,1,'Cole','Steve');
/*!40000 ALTER TABLE `c_WHSA_bb_topics` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_users`
--

DROP TABLE IF EXISTS `c_WHSA_bb_users`;
CREATE TABLE `c_WHSA_bb_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `user_regdate` varchar(20) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_icq` varchar(15) DEFAULT NULL,
  `user_website` varchar(100) DEFAULT NULL,
  `user_occ` varchar(100) DEFAULT NULL,
  `user_from` varchar(100) DEFAULT NULL,
  `user_intrest` varchar(150) DEFAULT NULL,
  `user_sig` varchar(255) DEFAULT NULL,
  `user_viewemail` tinyint(2) DEFAULT NULL,
  `user_theme` int(10) DEFAULT NULL,
  `user_aim` varchar(18) DEFAULT NULL,
  `user_yim` varchar(25) DEFAULT NULL,
  `user_msnm` varchar(25) DEFAULT NULL,
  `user_posts` int(10) DEFAULT '0',
  `user_attachsig` int(2) DEFAULT '0',
  `user_desmile` int(2) DEFAULT '0',
  `user_html` int(2) DEFAULT '0',
  `user_bbcode` int(2) DEFAULT '0',
  `user_rank` int(10) DEFAULT '0',
  `user_level` int(10) DEFAULT '1',
  `user_lang` varchar(255) DEFAULT NULL,
  `user_actkey` varchar(32) DEFAULT NULL,
  `user_newpasswd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_users`
--

/*!40000 ALTER TABLE `c_WHSA_bb_users` DISABLE KEYS */;
INSERT INTO `c_WHSA_bb_users` (`user_id`,`username`,`user_regdate`,`user_password`,`user_email`,`user_icq`,`user_website`,`user_occ`,`user_from`,`user_intrest`,`user_sig`,`user_viewemail`,`user_theme`,`user_aim`,`user_yim`,`user_msnm`,`user_posts`,`user_attachsig`,`user_desmile`,`user_html`,`user_bbcode`,`user_rank`,`user_level`,`user_lang`,`user_actkey`,`user_newpasswd`) VALUES 
 (1,'Cole Steve','2014-06-26 13:18:57','password','steve@profilequinte.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,1,NULL,NULL,NULL),
 (-1,'Anonymous','2014-06-26 13:18:57','password','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `c_WHSA_bb_users` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_bb_whosonline`
--

DROP TABLE IF EXISTS `c_WHSA_bb_whosonline`;
CREATE TABLE `c_WHSA_bb_whosonline` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `count` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `forum` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_bb_whosonline`
--

/*!40000 ALTER TABLE `c_WHSA_bb_whosonline` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_bb_whosonline` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_calendar_event`
--

DROP TABLE IF EXISTS `c_WHSA_calendar_event`;
CREATE TABLE `c_WHSA_calendar_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) DEFAULT NULL,
  `contenu` text,
  `day` date NOT NULL DEFAULT '0000-00-00',
  `hour` time NOT NULL DEFAULT '00:00:00',
  `lasting` varchar(20) DEFAULT NULL,
  `speakers` varchar(150) DEFAULT NULL,
  `visibility` enum('SHOW','HIDE') NOT NULL DEFAULT 'SHOW',
  `location` varchar(150) DEFAULT NULL,
  `group_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_calendar_event`
--

/*!40000 ALTER TABLE `c_WHSA_calendar_event` DISABLE KEYS */;
INSERT INTO `c_WHSA_calendar_event` (`id`,`titre`,`contenu`,`day`,`hour`,`lasting`,`speakers`,`visibility`,`location`,`group_id`) VALUES 
 (1,'Upload Results','<!-- content: html tiny_mce -->','2015-06-26','13:28:00','',NULL,'SHOW','',0),
 (2,'WHMIS Training','<p>This must be done before August 1st, 2014</p>\r\n<!-- content: html tiny_mce -->','2014-07-26','18:52:00','',NULL,'SHOW','Online',0);
/*!40000 ALTER TABLE `c_WHSA_calendar_event` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_chat`
--

DROP TABLE IF EXISTS `c_WHSA_chat`;
CREATE TABLE `c_WHSA_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT NULL,
  `message` text,
  `post_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_chat`
--

/*!40000 ALTER TABLE `c_WHSA_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_chat` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_chat_users`
--

DROP TABLE IF EXISTS `c_WHSA_chat_users`;
CREATE TABLE `c_WHSA_chat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT NULL,
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_chat_users`
--

/*!40000 ALTER TABLE `c_WHSA_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_chat_users` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_course_description`
--

DROP TABLE IF EXISTS `c_WHSA_course_description`;
CREATE TABLE `c_WHSA_course_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '-1',
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `lastEditDate` datetime NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'VISIBLE',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_course_description`
--

/*!40000 ALTER TABLE `c_WHSA_course_description` DISABLE KEYS */;
INSERT INTO `c_WHSA_course_description` (`id`,`category`,`title`,`content`,`lastEditDate`,`visibility`) VALUES 
 (1,0,'Description','<p>It is highly recommended that you have a printer driver installed such as CUTE PDF so that you can save the certificate at the end of the course. It will be required to upload it into the system.</p>\r\n<!-- content: html tiny_mce -->','2014-07-26 18:31:20','VISIBLE');
/*!40000 ALTER TABLE `c_WHSA_course_description` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_course_properties`
--

DROP TABLE IF EXISTS `c_WHSA_course_properties`;
CREATE TABLE `c_WHSA_course_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_course_properties`
--

/*!40000 ALTER TABLE `c_WHSA_course_properties` DISABLE KEYS */;
INSERT INTO `c_WHSA_course_properties` (`id`,`name`,`value`,`category`) VALUES 
 (1,'self_registration','1','GROUP'),
 (2,'self_unregistration','0','GROUP'),
 (3,'nbGroupPerUser','1','GROUP'),
 (4,'private','1','GROUP'),
 (5,'CLDOC','1','GROUP'),
 (6,'CLFRM','1','GROUP'),
 (7,'CLWIKI','1','GROUP'),
 (8,'CLCHAT','1','GROUP');
/*!40000 ALTER TABLE `c_WHSA_course_properties` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_document`
--

DROP TABLE IF EXISTS `c_WHSA_document`;
CREATE TABLE `c_WHSA_document` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `visibility` char(1) NOT NULL DEFAULT 'v',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_document`
--

/*!40000 ALTER TABLE `c_WHSA_document` DISABLE KEYS */;
INSERT INTO `c_WHSA_document` (`id`,`path`,`visibility`,`comment`) VALUES 
 (1,'/Ministry_of_Labour.url','v','Required');
/*!40000 ALTER TABLE `c_WHSA_document` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_group_rel_team_user`
--

DROP TABLE IF EXISTS `c_WHSA_group_rel_team_user`;
CREATE TABLE `c_WHSA_group_rel_team_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `team` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_group_rel_team_user`
--

/*!40000 ALTER TABLE `c_WHSA_group_rel_team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_group_rel_team_user` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_group_team`
--

DROP TABLE IF EXISTS `c_WHSA_group_team`;
CREATE TABLE `c_WHSA_group_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `tutor` int(11) DEFAULT NULL,
  `maxStudent` int(11) DEFAULT '0',
  `secretDirectory` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_group_team`
--

/*!40000 ALTER TABLE `c_WHSA_group_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_group_team` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_lnk_links`
--

DROP TABLE IF EXISTS `c_WHSA_lnk_links`;
CREATE TABLE `c_WHSA_lnk_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src_id` int(11) NOT NULL DEFAULT '0',
  `dest_id` int(11) NOT NULL DEFAULT '0',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_lnk_links`
--

/*!40000 ALTER TABLE `c_WHSA_lnk_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_lnk_links` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_lnk_resources`
--

DROP TABLE IF EXISTS `c_WHSA_lnk_resources`;
CREATE TABLE `c_WHSA_lnk_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crl` text NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_lnk_resources`
--

/*!40000 ALTER TABLE `c_WHSA_lnk_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_lnk_resources` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_lp_asset`
--

DROP TABLE IF EXISTS `c_WHSA_lp_asset`;
CREATE TABLE `c_WHSA_lp_asset` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='List of resources of module of learning paths';

--
-- Dumping data for table `c_WHSA_lp_asset`
--

/*!40000 ALTER TABLE `c_WHSA_lp_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_lp_asset` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_lp_learnPath`
--

DROP TABLE IF EXISTS `c_WHSA_lp_learnPath`;
CREATE TABLE `c_WHSA_lp_learnPath` (
  `learnPath_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `lock` enum('OPEN','CLOSE') NOT NULL DEFAULT 'OPEN',
  `visibility` enum('HIDE','SHOW') NOT NULL DEFAULT 'SHOW',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`learnPath_id`),
  UNIQUE KEY `rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='List of learning Paths';

--
-- Dumping data for table `c_WHSA_lp_learnPath`
--

/*!40000 ALTER TABLE `c_WHSA_lp_learnPath` DISABLE KEYS */;
INSERT INTO `c_WHSA_lp_learnPath` (`learnPath_id`,`name`,`comment`,`lock`,`visibility`,`rank`) VALUES 
 (1,'Sample learning path','This is a sample learning path, it uses the sample exercise and the sample document of the exercise tool and the document tool. Click on <b>Modify</b> to change this text.','OPEN','SHOW',1);
/*!40000 ALTER TABLE `c_WHSA_lp_learnPath` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_lp_module`
--

DROP TABLE IF EXISTS `c_WHSA_lp_module`;
CREATE TABLE `c_WHSA_lp_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `accessibility` enum('PRIVATE','PUBLIC') NOT NULL DEFAULT 'PRIVATE',
  `startAsset_id` int(11) NOT NULL DEFAULT '0',
  `contentType` enum('CLARODOC','DOCUMENT','EXERCISE','HANDMADE','SCORM','LABEL') NOT NULL,
  `launch_data` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='List of available modules used in learning paths';

--
-- Dumping data for table `c_WHSA_lp_module`
--

/*!40000 ALTER TABLE `c_WHSA_lp_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_lp_module` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_lp_rel_learnPath_module`
--

DROP TABLE IF EXISTS `c_WHSA_lp_rel_learnPath_module`;
CREATE TABLE `c_WHSA_lp_rel_learnPath_module` (
  `learnPath_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `learnPath_id` int(11) NOT NULL DEFAULT '0',
  `module_id` int(11) NOT NULL DEFAULT '0',
  `lock` enum('OPEN','CLOSE') NOT NULL DEFAULT 'OPEN',
  `visibility` enum('HIDE','SHOW') NOT NULL DEFAULT 'SHOW',
  `specificComment` text NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `raw_to_pass` tinyint(4) NOT NULL DEFAULT '50',
  PRIMARY KEY (`learnPath_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='This table links module to the learning path using them';

--
-- Dumping data for table `c_WHSA_lp_rel_learnPath_module`
--

/*!40000 ALTER TABLE `c_WHSA_lp_rel_learnPath_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_lp_rel_learnPath_module` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_lp_user_module_progress`
--

DROP TABLE IF EXISTS `c_WHSA_lp_user_module_progress`;
CREATE TABLE `c_WHSA_lp_user_module_progress` (
  `user_module_progress_id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL DEFAULT '0',
  `learnPath_module_id` int(11) NOT NULL DEFAULT '0',
  `learnPath_id` int(11) NOT NULL DEFAULT '0',
  `lesson_location` varchar(255) NOT NULL DEFAULT '',
  `lesson_status` enum('NOT ATTEMPTED','PASSED','FAILED','COMPLETED','BROWSED','INCOMPLETE','UNKNOWN') NOT NULL DEFAULT 'NOT ATTEMPTED',
  `entry` enum('AB-INITIO','RESUME','') NOT NULL DEFAULT 'AB-INITIO',
  `raw` tinyint(4) NOT NULL DEFAULT '-1',
  `scoreMin` tinyint(4) NOT NULL DEFAULT '-1',
  `scoreMax` tinyint(4) NOT NULL DEFAULT '-1',
  `total_time` varchar(13) NOT NULL DEFAULT '0000:00:00.00',
  `session_time` varchar(13) NOT NULL DEFAULT '0000:00:00.00',
  `suspend_data` text NOT NULL,
  `credit` enum('CREDIT','NO-CREDIT') NOT NULL DEFAULT 'NO-CREDIT',
  PRIMARY KEY (`user_module_progress_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record the last known status of the user in the course';

--
-- Dumping data for table `c_WHSA_lp_user_module_progress`
--

/*!40000 ALTER TABLE `c_WHSA_lp_user_module_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_lp_user_module_progress` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_answer_fib`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_answer_fib`;
CREATE TABLE `c_WHSA_qwz_answer_fib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text NOT NULL,
  `gradeList` text NOT NULL,
  `wrongAnswerList` text NOT NULL,
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_qwz_answer_fib`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_answer_fib` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_answer_fib` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_answer_matching`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_answer_matching`;
CREATE TABLE `c_WHSA_qwz_answer_matching` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text NOT NULL,
  `match` varchar(32) DEFAULT NULL,
  `grade` float NOT NULL DEFAULT '0',
  `code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_qwz_answer_matching`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_answer_matching` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_answer_matching` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_answer_multiple_choice`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_answer_multiple_choice`;
CREATE TABLE `c_WHSA_qwz_answer_multiple_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text NOT NULL,
  `correct` tinyint(4) NOT NULL,
  `grade` float NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_qwz_answer_multiple_choice`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_answer_multiple_choice` DISABLE KEYS */;
INSERT INTO `c_WHSA_qwz_answer_multiple_choice` (`id`,`questionId`,`answer`,`correct`,`grade`,`comment`) VALUES 
 (1,1,'Ridiculise one\'s interlocutor in order to have him concede he is wrong.',0,-5,'No. Socratic irony is not a matter of psychology, it concerns argument.'),
 (2,1,'Admit one\'s own errors to invite one\'s interlocutor to do the same.',0,-5,'No. Socratic irony is not a seduction strategy nor a method based on the example.'),
 (3,1,'Compel one\'s interlocutor, by a series of questions and sub-questions, to admit he doesn\'t know what he claims to know.',1,5,'Indeed. Socratic irony is an interrogative method. The Greek \"eirotao\" means \"ask questions\"'),
 (4,1,'Use the Principle of Non Contradiction to force one\'s interlocutor into a dead end.',1,5,'This answer is not false. It is true that the revelation of the interlocutor\'s ignorance means showing the contradictory conclusions which lead from his premises.');
/*!40000 ALTER TABLE `c_WHSA_qwz_answer_multiple_choice` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_answer_truefalse`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_answer_truefalse`;
CREATE TABLE `c_WHSA_qwz_answer_truefalse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `trueFeedback` text NOT NULL,
  `trueGrade` float NOT NULL,
  `falseFeedback` text NOT NULL,
  `falseGrade` float NOT NULL,
  `correctAnswer` enum('TRUE','FALSE') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_qwz_answer_truefalse`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_answer_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_answer_truefalse` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_exercise`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_exercise`;
CREATE TABLE `c_WHSA_qwz_exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'INVISIBLE',
  `displayType` enum('SEQUENTIAL','ONEPAGE') NOT NULL DEFAULT 'ONEPAGE',
  `shuffle` smallint(6) NOT NULL DEFAULT '0',
  `useSameShuffle` enum('0','1') NOT NULL DEFAULT '0',
  `showAnswers` enum('ALWAYS','NEVER','LASTTRY') NOT NULL DEFAULT 'ALWAYS',
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `timeLimit` smallint(6) NOT NULL DEFAULT '0',
  `attempts` tinyint(4) NOT NULL DEFAULT '0',
  `anonymousAttempts` enum('ALLOWED','NOTALLOWED') NOT NULL DEFAULT 'NOTALLOWED',
  `quizEndMessage` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_qwz_exercise`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_exercise` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_exercise` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_question`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_question`;
CREATE TABLE `c_WHSA_qwz_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `type` enum('MCUA','MCMA','TF','FIB','MATCHING') NOT NULL DEFAULT 'MCUA',
  `grade` float NOT NULL DEFAULT '0',
  `id_category` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_qwz_question`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_question` DISABLE KEYS */;
INSERT INTO `c_WHSA_qwz_question` (`id`,`title`,`description`,`attachment`,`type`,`grade`,`id_category`) VALUES 
 (1,'Socratic irony is...','(more than one answer can be true)','','MCMA',10,0);
/*!40000 ALTER TABLE `c_WHSA_qwz_question` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_questions_categories`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_questions_categories`;
CREATE TABLE `c_WHSA_qwz_questions_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record the categories of questions';

--
-- Dumping data for table `c_WHSA_qwz_questions_categories`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_questions_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_questions_categories` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_rel_exercise_question`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_rel_exercise_question`;
CREATE TABLE `c_WHSA_qwz_rel_exercise_question` (
  `exerciseId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_qwz_rel_exercise_question`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_rel_exercise_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_rel_exercise_question` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_tracking`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_tracking`;
CREATE TABLE `c_WHSA_qwz_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exo_id` int(11) NOT NULL DEFAULT '0',
  `result` float NOT NULL DEFAULT '0',
  `time` mediumint(8) NOT NULL DEFAULT '0',
  `weighting` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `exo_id` (`exo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record informations about exercices';

--
-- Dumping data for table `c_WHSA_qwz_tracking`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_tracking` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_tracking_answers`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_tracking_answers`;
CREATE TABLE `c_WHSA_qwz_tracking_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details_id` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `details_id` (`details_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_qwz_tracking_answers`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_tracking_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_tracking_answers` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_tracking_questions`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_tracking_questions`;
CREATE TABLE `c_WHSA_qwz_tracking_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_track_id` int(11) NOT NULL DEFAULT '0',
  `question_id` int(11) NOT NULL DEFAULT '0',
  `result` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `exercise_track_id` (`exercise_track_id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record answers of students in exercices';

--
-- Dumping data for table `c_WHSA_qwz_tracking_questions`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_tracking_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_tracking_questions` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_qwz_users_random_questions`
--

DROP TABLE IF EXISTS `c_WHSA_qwz_users_random_questions`;
CREATE TABLE `c_WHSA_qwz_users_random_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `questions` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_exo` (`user_id`,`exercise_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_qwz_users_random_questions`
--

/*!40000 ALTER TABLE `c_WHSA_qwz_users_random_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_qwz_users_random_questions` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_tool_intro`
--

DROP TABLE IF EXISTS `c_WHSA_tool_intro`;
CREATE TABLE `c_WHSA_tool_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `display_date` datetime DEFAULT NULL,
  `content` text,
  `rank` int(11) DEFAULT '1',
  `visibility` enum('SHOW','HIDE') NOT NULL DEFAULT 'SHOW',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_tool_intro`
--

/*!40000 ALTER TABLE `c_WHSA_tool_intro` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_tool_intro` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_tool_list`
--

DROP TABLE IF EXISTS `c_WHSA_tool_list`;
CREATE TABLE `c_WHSA_tool_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(10) unsigned DEFAULT NULL,
  `rank` int(10) unsigned NOT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `script_url` varchar(255) DEFAULT NULL,
  `script_name` varchar(255) DEFAULT NULL,
  `addedTool` enum('YES','NO') DEFAULT 'YES',
  `activated` enum('true','false') NOT NULL DEFAULT 'true',
  `installed` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_tool_list`
--

/*!40000 ALTER TABLE `c_WHSA_tool_list` DISABLE KEYS */;
INSERT INTO `c_WHSA_tool_list` (`id`,`tool_id`,`rank`,`visibility`,`script_url`,`script_name`,`addedTool`,`activated`,`installed`) VALUES 
 (1,1,1,1,NULL,NULL,'YES','true','true'),
 (2,2,2,0,NULL,NULL,'YES','true','true'),
 (3,3,3,0,NULL,NULL,'YES','true','true'),
 (4,4,4,1,NULL,NULL,'YES','true','true'),
 (5,5,5,0,NULL,NULL,'YES','true','true'),
 (6,6,6,0,NULL,NULL,'YES','true','true'),
 (7,7,7,1,NULL,NULL,'YES','true','true'),
 (8,8,8,0,NULL,NULL,'YES','true','true'),
 (9,9,9,0,NULL,NULL,'YES','true','true'),
 (10,10,10,0,NULL,NULL,'YES','true','true'),
 (11,11,11,0,NULL,NULL,'YES','true','true'),
 (12,12,12,0,NULL,NULL,'YES','true','true');
/*!40000 ALTER TABLE `c_WHSA_tool_list` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_tracking_event`
--

DROP TABLE IF EXISTS `c_WHSA_tracking_event`;
CREATE TABLE `c_WHSA_tracking_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(60) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tool` (`tool_id`),
  KEY `user` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_tracking_event`
--

/*!40000 ALTER TABLE `c_WHSA_tracking_event` DISABLE KEYS */;
INSERT INTO `c_WHSA_tracking_event` (`id`,`tool_id`,`user_id`,`group_id`,`date`,`type`,`data`) VALUES 
 (1,NULL,1,NULL,'2014-06-26 13:19:00','course_access',''),
 (2,4,1,NULL,'2014-06-26 13:21:00','tool_access',''),
 (3,7,1,NULL,'2014-06-26 13:23:00','tool_access',''),
 (4,NULL,1,NULL,'2014-06-26 13:36:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (5,NULL,1,NULL,'2014-06-26 13:51:00','course_access',''),
 (6,NULL,1,NULL,'2014-06-26 13:53:00','course_access',''),
 (7,10,1,NULL,'2014-06-26 13:53:00','tool_access',''),
 (8,NULL,1,NULL,'2014-06-27 09:50:00','course_access',''),
 (9,7,1,NULL,'2014-06-27 09:50:00','tool_access',''),
 (10,NULL,1,NULL,'2014-07-24 12:57:00','course_access',''),
 (11,7,1,NULL,'2014-07-24 12:57:00','tool_access',''),
 (12,4,1,NULL,'2014-07-24 13:01:00','tool_access',''),
 (13,NULL,1,NULL,'2014-07-24 13:01:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (14,NULL,1,NULL,'2014-07-24 13:21:00','course_access',''),
 (15,7,1,NULL,'2014-07-24 13:21:00','tool_access',''),
 (16,4,1,NULL,'2014-07-24 13:22:00','tool_access',''),
 (17,1,1,NULL,'2014-07-24 13:22:00','tool_access',''),
 (18,5,1,NULL,'2014-07-24 13:23:00','tool_access',''),
 (19,NULL,1,NULL,'2014-07-25 08:48:00','course_access',''),
 (20,7,1,NULL,'2014-07-25 08:48:00','tool_access',''),
 (21,NULL,1,NULL,'2014-07-25 08:59:00','course_access',''),
 (22,7,1,NULL,'2014-07-25 08:59:00','tool_access',''),
 (23,NULL,1,NULL,'2014-07-25 09:01:00','course_access',''),
 (24,7,1,NULL,'2014-07-25 09:02:00','tool_access',''),
 (25,NULL,1,NULL,'2014-07-25 09:52:00','course_access',''),
 (26,NULL,1,NULL,'2014-07-26 08:20:00','course_access',''),
 (27,NULL,1,NULL,'2014-07-26 14:37:00','course_access',''),
 (28,7,1,NULL,'2014-07-26 14:38:00','tool_access',''),
 (29,4,1,NULL,'2014-07-26 15:05:00','tool_access',''),
 (30,NULL,1,NULL,'2014-07-26 15:42:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (31,NULL,1,NULL,'2014-07-26 16:33:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (32,NULL,1,NULL,'2014-07-26 17:44:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (33,NULL,1,NULL,'2014-07-26 17:46:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (34,NULL,1,NULL,'2014-07-26 17:48:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (35,NULL,1,NULL,'2014-07-26 17:49:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (36,NULL,1,NULL,'2014-07-26 17:57:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (37,NULL,1,NULL,'2014-07-26 18:09:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (38,NULL,1,NULL,'2014-07-26 18:13:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (39,NULL,1,NULL,'2014-07-26 18:22:00','course_access',''),
 (40,7,1,NULL,'2014-07-26 18:22:00','tool_access',''),
 (41,1,1,NULL,'2014-07-26 18:23:00','tool_access',''),
 (42,2,1,NULL,'2014-07-26 18:52:00','tool_access',''),
 (43,1,NULL,NULL,'2014-07-26 20:53:00','tool_access',''),
 (44,4,NULL,NULL,'2014-07-26 20:53:00','tool_access',''),
 (45,7,NULL,NULL,'2014-07-26 20:53:00','tool_access',''),
 (46,NULL,1,NULL,'2014-07-29 10:08:00','course_access',''),
 (47,1,1,NULL,'2014-07-29 10:08:00','tool_access',''),
 (48,4,1,NULL,'2014-07-29 10:09:00','tool_access',''),
 (49,NULL,1,NULL,'2014-07-29 10:09:00','download','a:1:{s:3:\"url\";s:23:\"/Ministry_of_Labour.url\";}'),
 (50,7,1,NULL,'2014-07-29 10:10:00','tool_access','');
/*!40000 ALTER TABLE `c_WHSA_tracking_event` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_userinfo_content`
--

DROP TABLE IF EXISTS `c_WHSA_userinfo_content`;
CREATE TABLE `c_WHSA_userinfo_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `def_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ed_ip` varchar(39) DEFAULT NULL,
  `ed_date` datetime DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='content of users information';

--
-- Dumping data for table `c_WHSA_userinfo_content`
--

/*!40000 ALTER TABLE `c_WHSA_userinfo_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_userinfo_content` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_userinfo_def`
--

DROP TABLE IF EXISTS `c_WHSA_userinfo_def`;
CREATE TABLE `c_WHSA_userinfo_def` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `comment` varchar(160) DEFAULT NULL,
  `nbLine` int(10) unsigned NOT NULL DEFAULT '5',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='categories definition for user information of a course';

--
-- Dumping data for table `c_WHSA_userinfo_def`
--

/*!40000 ALTER TABLE `c_WHSA_userinfo_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_userinfo_def` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_wiki_acls`
--

DROP TABLE IF EXISTS `c_WHSA_wiki_acls`;
CREATE TABLE `c_WHSA_wiki_acls` (
  `wiki_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flag` varchar(255) NOT NULL DEFAULT '',
  `value` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_wiki_acls`
--

/*!40000 ALTER TABLE `c_WHSA_wiki_acls` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_wiki_acls` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_wiki_pages`
--

DROP TABLE IF EXISTS `c_WHSA_wiki_pages`;
CREATE TABLE `c_WHSA_wiki_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_version` int(11) unsigned NOT NULL DEFAULT '0',
  `last_mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_wiki_pages`
--

/*!40000 ALTER TABLE `c_WHSA_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_wiki_pages` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_wiki_pages_content`
--

DROP TABLE IF EXISTS `c_WHSA_wiki_pages_content`;
CREATE TABLE `c_WHSA_wiki_pages_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `editor_id` int(11) NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_wiki_pages_content`
--

/*!40000 ALTER TABLE `c_WHSA_wiki_pages_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_wiki_pages_content` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_wiki_properties`
--

DROP TABLE IF EXISTS `c_WHSA_wiki_properties`;
CREATE TABLE `c_WHSA_wiki_properties` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_wiki_properties`
--

/*!40000 ALTER TABLE `c_WHSA_wiki_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_WHSA_wiki_properties` ENABLE KEYS */;


--
-- Definition of table `c_WHSA_wrk_assignment`
--

DROP TABLE IF EXISTS `c_WHSA_wrk_assignment`;
CREATE TABLE `c_WHSA_wrk_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'VISIBLE',
  `def_submission_visibility` enum('VISIBLE','INVISIBLE') NOT NULL DEFAULT 'VISIBLE',
  `assignment_type` enum('INDIVIDUAL','GROUP') NOT NULL DEFAULT 'INDIVIDUAL',
  `authorized_content` enum('TEXT','FILE','TEXTFILE') NOT NULL DEFAULT 'FILE',
  `allow_late_upload` enum('YES','NO') NOT NULL DEFAULT 'YES',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `prefill_text` text NOT NULL,
  `prefill_doc_path` varchar(200) NOT NULL DEFAULT '',
  `prefill_submit` enum('ENDDATE','AFTERPOST') NOT NULL DEFAULT 'ENDDATE',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_WHSA_wrk_assignment`
--

/*!40000 ALTER TABLE `c_WHSA_wrk_assignment` DISABLE KEYS */;
INSERT INTO `c_WHSA_wrk_assignment` (`id`,`title`,`description`,`visibility`,`def_submission_visibility`,`assignment_type`,`authorized_content`,`allow_late_upload`,`start_date`,`end_date`,`prefill_text`,`prefill_doc_path`,`prefill_submit`) VALUES 
 (1,'Upload Results','','VISIBLE','VISIBLE','INDIVIDUAL','FILE','YES','2014-06-26 13:28:00','2015-06-26 13:28:00','','','ENDDATE');
/*!40000 ALTER TABLE `c_WHSA_wrk_assignment` ENABLE KEYS */;


--
-- Definition of table `c_fr_shsa_wrk_submission`
--

DROP TABLE IF EXISTS `c_fr_shsa_wrk_submission`;
CREATE TABLE `c_fr_shsa_wrk_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `visibility` enum('VISIBLE','INVISIBLE') COLLATE utf8_bin DEFAULT 'VISIBLE',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_edit_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authors` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `submitted_text` text COLLATE utf8_bin NOT NULL,
  `submitted_doc_path` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `private_feedback` text COLLATE utf8_bin,
  `original_id` int(11) DEFAULT NULL,
  `score` smallint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  KEY `original` (`original_id`),
  KEY `visible` (`visibility`),
  KEY `parent` (`parent_id`),
  KEY `group` (`group_id`),
  KEY `last_edit` (`last_edit_date`),
  KEY `assigid` (`assignment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `c_fr_shsa_wrk_submission`
--

/*!40000 ALTER TABLE `c_fr_shsa_wrk_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_fr_shsa_wrk_submission` ENABLE KEYS */;


--
-- Definition of table `c_shsa_wrk_submission`
--

DROP TABLE IF EXISTS `c_shsa_wrk_submission`;
CREATE TABLE `c_shsa_wrk_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `visibility` enum('VISIBLE','INVISIBLE') DEFAULT 'VISIBLE',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_edit_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authors` varchar(200) NOT NULL DEFAULT '',
  `submitted_text` text NOT NULL,
  `submitted_doc_path` varchar(200) NOT NULL DEFAULT '',
  `private_feedback` text,
  `original_id` int(11) DEFAULT NULL,
  `score` smallint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  KEY `original` (`original_id`),
  KEY `visible` (`visibility`),
  KEY `parent` (`parent_id`),
  KEY `group` (`group_id`),
  KEY `last_edit` (`last_edit_date`),
  KEY `assigid` (`assignment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_shsa_wrk_submission`
--

/*!40000 ALTER TABLE `c_shsa_wrk_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_shsa_wrk_submission` ENABLE KEYS */;


--
-- Definition of table `c_whmis_wrk_submission`
--

DROP TABLE IF EXISTS `c_whmis_wrk_submission`;
CREATE TABLE `c_whmis_wrk_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `visibility` enum('VISIBLE','INVISIBLE') DEFAULT 'VISIBLE',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_edit_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authors` varchar(200) NOT NULL DEFAULT '',
  `submitted_text` text NOT NULL,
  `submitted_doc_path` varchar(200) NOT NULL DEFAULT '',
  `private_feedback` text,
  `original_id` int(11) DEFAULT NULL,
  `score` smallint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  KEY `original` (`original_id`),
  KEY `visible` (`visibility`),
  KEY `parent` (`parent_id`),
  KEY `group` (`group_id`),
  KEY `last_edit` (`last_edit_date`),
  KEY `assigid` (`assignment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_whmis_wrk_submission`
--

/*!40000 ALTER TABLE `c_whmis_wrk_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_whmis_wrk_submission` ENABLE KEYS */;


--
-- Definition of table `c_whsa_wrk_submission`
--

DROP TABLE IF EXISTS `c_whsa_wrk_submission`;
CREATE TABLE `c_whsa_wrk_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `visibility` enum('VISIBLE','INVISIBLE') DEFAULT 'VISIBLE',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_edit_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authors` varchar(200) NOT NULL DEFAULT '',
  `submitted_text` text NOT NULL,
  `submitted_doc_path` varchar(200) NOT NULL DEFAULT '',
  `private_feedback` text,
  `original_id` int(11) DEFAULT NULL,
  `score` smallint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  KEY `original` (`original_id`),
  KEY `visible` (`visibility`),
  KEY `parent` (`parent_id`),
  KEY `group` (`group_id`),
  KEY `last_edit` (`last_edit_date`),
  KEY `assigid` (`assignment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_whsa_wrk_submission`
--

/*!40000 ALTER TABLE `c_whsa_wrk_submission` DISABLE KEYS */;
INSERT INTO `c_whsa_wrk_submission` (`id`,`assignment_id`,`parent_id`,`user_id`,`group_id`,`title`,`visibility`,`creation_date`,`last_edit_date`,`authors`,`submitted_text`,`submitted_doc_path`,`private_feedback`,`original_id`,`score`) VALUES 
 (1,1,NULL,1,NULL,'WHSA Certificate','VISIBLE','2014-06-27 09:51:02','2014-06-27 09:51:02','Cole Steve','','www.labour.gov.on.ca_scripts_mpdf_certificate_1.pdf','',NULL,NULL);
/*!40000 ALTER TABLE `c_whsa_wrk_submission` ENABLE KEYS */;


--
-- Definition of table `cl_category`
--

DROP TABLE IF EXISTS `cl_category`;
CREATE TABLE `cl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `code` varchar(12) NOT NULL DEFAULT '',
  `idParent` int(11) DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `canHaveCoursesChild` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_category`
--

/*!40000 ALTER TABLE `cl_category` DISABLE KEYS */;
INSERT INTO `cl_category` (`id`,`name`,`code`,`idParent`,`rank`,`visible`,`canHaveCoursesChild`) VALUES 
 (0,'Root','ROOT',NULL,0,0,0),
 (5,'Community Living Quinte West','1',6,8,1,1),
 (6,'REPDA','REPDA',0,5,1,0),
 (7,'Community Living Belleville & Area','3',6,2,1,1),
 (12,'Dual Diagnosis Consultation Outreach Team','6',6,11,1,1),
 (9,'Community Living Prince Edward','2',6,7,1,1),
 (10,'Community Visions & Networking','4',6,9,1,1),
 (11,'Counselling Services of Belleville & District','5',6,10,1,1),
 (13,'Kerry\'s Place Autism Services','7',6,12,1,1),
 (14,'Madoc COPE','8',6,13,1,1),
 (15,'North Hastings Community Integration Association','9',6,14,1,1),
 (16,'Pathways to Independence','10',6,15,1,1),
 (17,'Quinte Vocational Support Services','11',6,16,1,1),
 (18,'Community Living Campbellford/Brighton','12',6,3,1,1),
 (19,'Community Living Kawartha Lakes','13',6,4,1,1),
 (20,'Community Living Kingston & District','14',6,5,1,1),
 (21,'Community Living Peterborough','15',6,6,1,1);
/*!40000 ALTER TABLE `cl_category` ENABLE KEYS */;


--
-- Definition of table `cl_class`
--

DROP TABLE IF EXISTS `cl_class`;
CREATE TABLE `cl_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `class_parent_id` int(11) DEFAULT NULL,
  `class_level` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='classe_id, name, classe_parent_id, classe_level';

--
-- Dumping data for table `cl_class`
--

/*!40000 ALTER TABLE `cl_class` DISABLE KEYS */;
INSERT INTO `cl_class` (`id`,`name`,`class_parent_id`,`class_level`) VALUES 
 (1,'Community Living Quinte West',NULL,1);
/*!40000 ALTER TABLE `cl_class` ENABLE KEYS */;


--
-- Definition of table `cl_config_file`
--

DROP TABLE IF EXISTS `cl_config_file`;
CREATE TABLE `cl_config_file` (
  `config_code` varchar(30) NOT NULL DEFAULT '',
  `config_hash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`config_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=48;

--
-- Dumping data for table `cl_config_file`
--

/*!40000 ALTER TABLE `cl_config_file` DISABLE KEYS */;
INSERT INTO `cl_config_file` (`config_code`,`config_hash`) VALUES 
 ('CLAUTH','58f361b1d278c14f25cd7d1fddf72d8e'),
 ('CLCAS','b477715a7576732513eab8270665d879'),
 ('CLCRS','2fe8a95913f76b9a2fe6adce87459a7c'),
 ('CLGRP','ac64457c23480d8da44844bf24115eda'),
 ('CLHOME','317ece683932650c164abe2d9995f8b9'),
 ('CLICAL','50fa7fbd9785a617d1f7e7707bff1018'),
 ('CLKCACHE','2860f61d87e74b174599795bd4a16b69'),
 ('CLMAIN','695bfe58675cec700312770e9be68ffa'),
 ('CLMSG','9d5496868faf1a942ceaecd3edb7b59c'),
 ('CLPROFIL','ed913e7656a0285b4aa0cb0f2fbc7e48'),
 ('CLRSS','81cb1bb110b0df76306ce1c5be1c6428'),
 ('CLSSO','24564bd26f4ee62921aa13120c7f0dbb'),
 ('CLDSC','94895639ad1849627344e9c6fd58d4a3'),
 ('CLANN','711fa5b24948665884b2ec13c9d1be9a'),
 ('CLDOC','539c4de5ffcdb6b7ac2392447a36f417'),
 ('CLQWZ','3402a7466e2b120876fad7580f2373e9'),
 ('CLLNP','3f15092ed49dbcf890c6dda7bd1291cf'),
 ('CLWRK','9dd312755357972f832c825b322680e8'),
 ('CLFRM','75ecda0ebb6d4e8336175986cfaaeb06'),
 ('CLUSR','fec4caa6d4a3e72babf6ff0aefb3732a'),
 ('CLWIKI','7f5663ffd56b06f57ee19446a4f196ec'),
 ('CLCHAT','76321c7cec80603e8118c55980ebd2c7');
/*!40000 ALTER TABLE `cl_config_file` ENABLE KEYS */;


--
-- Definition of table `cl_cours`
--

DROP TABLE IF EXISTS `cl_cours`;
CREATE TABLE `cl_cours` (
  `cours_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) DEFAULT NULL,
  `isSourceCourse` tinyint(4) NOT NULL DEFAULT '0',
  `sourceCourseId` int(11) DEFAULT NULL,
  `administrativeNumber` varchar(40) DEFAULT NULL,
  `directory` varchar(20) DEFAULT NULL,
  `dbName` varchar(40) DEFAULT NULL,
  `language` varchar(15) DEFAULT NULL,
  `intitule` varchar(250) DEFAULT NULL,
  `titulaires` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `extLinkName` varchar(30) DEFAULT NULL,
  `extLinkUrl` varchar(180) DEFAULT NULL,
  `visibility` enum('visible','invisible') NOT NULL DEFAULT 'visible',
  `access` enum('public','private','platform') NOT NULL DEFAULT 'public',
  `registration` enum('open','close','validation') NOT NULL DEFAULT 'open',
  `registrationKey` varchar(255) DEFAULT NULL,
  `diskQuota` int(10) unsigned DEFAULT NULL,
  `versionDb` varchar(250) NOT NULL DEFAULT 'NEVER SET',
  `versionClaro` varchar(250) NOT NULL DEFAULT 'NEVER SET',
  `lastVisit` datetime DEFAULT NULL,
  `lastEdit` datetime DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `defaultProfileId` int(11) NOT NULL,
  `status` enum('enable','pending','disable','trash','date') NOT NULL DEFAULT 'enable',
  `userLimit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cours_id`),
  KEY `administrativeNumber` (`administrativeNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='data of courses';

--
-- Dumping data for table `cl_cours`
--

/*!40000 ALTER TABLE `cl_cours` DISABLE KEYS */;
INSERT INTO `cl_cours` (`cours_id`,`code`,`isSourceCourse`,`sourceCourseId`,`administrativeNumber`,`directory`,`dbName`,`language`,`intitule`,`titulaires`,`email`,`extLinkName`,`extLinkUrl`,`visibility`,`access`,`registration`,`registrationKey`,`diskQuota`,`versionDb`,`versionClaro`,`lastVisit`,`lastEdit`,`creationDate`,`expirationDate`,`defaultProfileId`,`status`,`userLimit`) VALUES 
 (2,'WHMIS',0,NULL,'CLQW_WHMIS','WHMIS','c_WHMIS','english','WHMIS','Online','steve@profilequinte.com','','http://aixsafety.com/wp-content/uploads/2011/11/IntroWHMISaix.htm','visible','platform','open','',NULL,'1.11.10','1.11.10',NULL,'2014-07-26 14:36:51','2014-06-23 18:13:57',NULL,3,'enable',0),
 (3,'WHSA',0,NULL,'CLQW_WHSA','WHSA','c_WHSA','english','Worker Health & Safety Awareness','Online','steve@profilequinte.com','','','visible','platform','open','',NULL,'1.11.10','1.11.10',NULL,'2014-07-26 14:37:24','2014-06-26 13:19:22',NULL,3,'enable',0),
 (4,'SHSA',0,NULL,'CLQW_SHSA','SHSA','c_SHSA','english','Supervisor Health & Safety Awareness','Online','steve@profilequinte.com','','','visible','platform','open','',NULL,'1.11.10','1.11.10',NULL,'2014-07-26 14:36:07','2014-06-27 09:29:40',NULL,3,'enable',0),
 (7,'FR_SHSA',0,NULL,'CLQW_FR_SHSA','FR_SHSA','c_FR_SHSA','french','Superviseur de la santé et de la sécurité de conscience','Online','steve@profilequinte.com','','','visible','platform','close','',NULL,'1.11.10','1.11.10',NULL,'2014-07-26 14:28:35','2014-07-26 14:04:08',NULL,3,'enable',0);
/*!40000 ALTER TABLE `cl_cours` ENABLE KEYS */;


--
-- Definition of table `cl_course_tool`
--

DROP TABLE IF EXISTS `cl_course_tool`;
CREATE TABLE `cl_course_tool` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `claro_label` varchar(8) NOT NULL DEFAULT '',
  `script_url` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) DEFAULT NULL,
  `def_access` enum('ALL','COURSE_MEMBER','GROUP_MEMBER','GROUP_TUTOR','COURSE_ADMIN','PLATFORM_ADMIN') NOT NULL DEFAULT 'ALL',
  `def_rank` int(10) unsigned DEFAULT NULL,
  `add_in_course` enum('MANUAL','AUTOMATIC') NOT NULL DEFAULT 'AUTOMATIC',
  `access_manager` enum('PLATFORM_ADMIN','COURSE_ADMIN') NOT NULL DEFAULT 'COURSE_ADMIN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `claro_label` (`claro_label`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='based definiton of the claroline tool used in each course';

--
-- Dumping data for table `cl_course_tool`
--

/*!40000 ALTER TABLE `cl_course_tool` DISABLE KEYS */;
INSERT INTO `cl_course_tool` (`id`,`claro_label`,`script_url`,`icon`,`def_access`,`def_rank`,`add_in_course`,`access_manager`) VALUES 
 (1,'CLDSC','index.php','icon.png','ALL',1,'AUTOMATIC','COURSE_ADMIN'),
 (2,'CLCAL','agenda.php','icon.png','COURSE_ADMIN',2,'AUTOMATIC','COURSE_ADMIN'),
 (3,'CLANN','announcements.php','icon.png','COURSE_ADMIN',3,'AUTOMATIC','COURSE_ADMIN'),
 (4,'CLDOC','document.php','icon.png','ALL',4,'AUTOMATIC','COURSE_ADMIN'),
 (5,'CLQWZ','exercise.php','icon.png','COURSE_ADMIN',5,'AUTOMATIC','COURSE_ADMIN'),
 (6,'CLLNP','learningPathList.php','icon.png','COURSE_ADMIN',6,'AUTOMATIC','COURSE_ADMIN'),
 (7,'CLWRK','work.php','icon.png','ALL',7,'AUTOMATIC','COURSE_ADMIN'),
 (8,'CLFRM','index.php','icon.png','COURSE_ADMIN',8,'AUTOMATIC','COURSE_ADMIN'),
 (9,'CLGRP','group.php','icon.png','COURSE_ADMIN',9,'AUTOMATIC','COURSE_ADMIN'),
 (10,'CLUSR','user.php','icon.png','COURSE_ADMIN',10,'AUTOMATIC','COURSE_ADMIN'),
 (11,'CLWIKI','wiki.php','icon.png','COURSE_ADMIN',11,'AUTOMATIC','COURSE_ADMIN'),
 (12,'CLCHAT','index.php','icon.png','COURSE_ADMIN',12,'AUTOMATIC','COURSE_ADMIN');
/*!40000 ALTER TABLE `cl_course_tool` ENABLE KEYS */;


--
-- Definition of table `cl_coursehomepage_portlet`
--

DROP TABLE IF EXISTS `cl_coursehomepage_portlet`;
CREATE TABLE `cl_coursehomepage_portlet` (
  `label` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_coursehomepage_portlet`
--

/*!40000 ALTER TABLE `cl_coursehomepage_portlet` DISABLE KEYS */;
INSERT INTO `cl_coursehomepage_portlet` (`label`,`name`) VALUES 
 ('CLTI','Headlines'),
 ('CLCAL','Calendar'),
 ('CLANN','Announcements');
/*!40000 ALTER TABLE `cl_coursehomepage_portlet` ENABLE KEYS */;


--
-- Definition of table `cl_desktop_portlet`
--

DROP TABLE IF EXISTS `cl_desktop_portlet`;
CREATE TABLE `cl_desktop_portlet` (
  `label` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `visibility` enum('visible','invisible') NOT NULL DEFAULT 'visible',
  `activated` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_desktop_portlet`
--

/*!40000 ALTER TABLE `cl_desktop_portlet` DISABLE KEYS */;
INSERT INTO `cl_desktop_portlet` (`label`,`name`,`rank`,`visibility`,`activated`) VALUES 
 ('mycourselist','My course list',1,'visible',1),
 ('mymessages','My last messages',2,'visible',1),
 ('CLCAL_Portlet','My calendar',3,'visible',1),
 ('CLANN_Portlet','Latest announcements',4,'visible',1);
/*!40000 ALTER TABLE `cl_desktop_portlet` ENABLE KEYS */;


--
-- Definition of table `cl_desktop_portlet_data`
--

DROP TABLE IF EXISTS `cl_desktop_portlet_data`;
CREATE TABLE `cl_desktop_portlet_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `idUser` int(11) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_desktop_portlet_data`
--

/*!40000 ALTER TABLE `cl_desktop_portlet_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cl_desktop_portlet_data` ENABLE KEYS */;


--
-- Definition of table `cl_dock`
--

DROP TABLE IF EXISTS `cl_dock`;
CREATE TABLE `cl_dock` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_dock`
--

/*!40000 ALTER TABLE `cl_dock` DISABLE KEYS */;
/*!40000 ALTER TABLE `cl_dock` ENABLE KEYS */;


--
-- Definition of table `cl_event_resource`
--

DROP TABLE IF EXISTS `cl_event_resource`;
CREATE TABLE `cl_event_resource` (
  `event_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `course_code` varchar(40) NOT NULL,
  PRIMARY KEY (`event_id`,`resource_id`,`tool_id`,`course_code`),
  UNIQUE KEY `event_id` (`event_id`,`course_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_event_resource`
--

/*!40000 ALTER TABLE `cl_event_resource` DISABLE KEYS */;
INSERT INTO `cl_event_resource` (`event_id`,`resource_id`,`tool_id`,`course_code`) VALUES 
 (1,1,7,'FR_SHSA'),
 (1,1,7,'SHSA'),
 (1,1,7,'WHMIS'),
 (1,1,7,'WHSA');
/*!40000 ALTER TABLE `cl_event_resource` ENABLE KEYS */;


--
-- Definition of table `cl_im_message`
--

DROP TABLE IF EXISTS `cl_im_message`;
CREATE TABLE `cl_im_message` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `send_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `course` varchar(40) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `tools` char(8) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_im_message`
--

/*!40000 ALTER TABLE `cl_im_message` DISABLE KEYS */;
INSERT INTO `cl_im_message` (`message_id`,`sender`,`subject`,`message`,`send_time`,`course`,`group`,`tools`) VALUES 
 (1,1,'Course created : WHMIS','May 27, 2014 at 04:05 PM<br />\n<br />\nCourse creation on  Region East Professional Development Association by the user Steve Cole ( steve@profilequinte.com )<br />\n<br />\nCourse code : CLQWWHMIS<br />\nCourse title : WHMIS<br />\nLecturer(s) : Steve Cole<br />\nEmail : steve@profilequinte.com<br />\nCategory : Community Living Quinte West<br />\nLanguage : english<br />\nUrl : http://lms.profilequinte.com/claroline/course/index.php?cid=CLQWWHMIS','2014-05-27 16:05:17',NULL,NULL,NULL),
 (2,1,'Course created : WHMIS','June 23, 2014 at 06:14 PM<br />\n<br />\nCourse creation on  REPDA by the user Steve Cole ( steve@profilequinte.com )<br />\n<br />\nCourse code : WHMIS<br />\nCourse title : WHMIS<br />\nLecturer(s) : Online<br />\nEmail : steve@profilequinte.com<br />\nCategory : Online Training For All Agencies<br />\nLanguage : english<br />\nUrl : http://lms.regioneastpda.ca/claroline/course/index.php?cid=WHMIS','2014-06-23 18:14:02',NULL,NULL,NULL),
 (3,1,'Your registration','\n\nDear clqw clqwtestuser,\n\nOne of the administrators of the course \"WHMIS\" has registered you on this course.\n\nThe address of  the course is :\n\nhttp://lms.regioneastpda.ca/claroline/course/index.php?cid=WHMIS\n\nIn case of problems, contact us.\n\nYours sincerely,\n\nManager : Steve Cole\nPhone : 613-475-0428\nEmail : steve@profilequinte.com\n','2014-06-23 18:38:13','WHMIS',NULL,NULL),
 (4,1,'Course created : Worker Health & Safety Awareness','June 26, 2014 at 01:19 PM<br />\n<br />\nCourse creation on  REPDA by the user Steve Cole ( steve@profilequinte.com )<br />\n<br />\nCourse code : WHSA<br />\nCourse title : Worker Health & Safety Awareness<br />\nLecturer(s) : Steve Cole<br />\nEmail : steve@profilequinte.com<br />\nCategory : Region East Professional Development Association Mandatory Training, Online Training For All Agencies, Community Living Belleville & Area, Community Living Campbellford/Brighton, Community Living Kawartha Lakes, Community Living Kingston & District, Community Living Peterborough, Community Living Prince Edward, Community Living Quinte West, Community Visions & Networking, Counselling Services of Belleville & District, Dual Diagnosis Consultation Outreach Team, Kerry\'s Place Autism Services, Madoc COPE, North Hastings Community Integration Association, Pathways to Independence, Quinte Vocational Support Services<br />\nLanguage : english<br />\nUrl : http://lms.regioneastpda.ca/claroline/course/index.php?cid=WHSA','2014-06-26 13:19:27',NULL,NULL,NULL),
 (5,1,'Your registration','\n\nDear clqw clqwtestuser,\n\nOne of the administrators of the course \"Worker Health & Safety Awareness\" has registered you on this course.\n\nThe address of  the course is :\n\nhttp://lms.regioneastpda.ca/claroline/course/index.php?cid=WHSA\n\nIn case of problems, contact us.\n\nYours sincerely,\n\nManager : Steve Cole\nPhone : 613-475-0428\nEmail : steve@profilequinte.com\n','2014-06-26 13:53:56','WHSA',NULL,NULL),
 (6,1,'Course created : Supervisor Health & Safety Awareness','June 27, 2014 at 09:29 AM<br />\n<br />\nCourse creation on  REPDA by the user Steve Cole ( steve@profilequinte.com )<br />\n<br />\nCourse code : SHSA<br />\nCourse title : Supervisor Health & Safety Awareness<br />\nLecturer(s) : Steve Cole<br />\nEmail : steve@profilequinte.com<br />\nCategory : Region East Professional Development Association Mandatory Training, Online Training For All Agencies, Community Living Belleville & Area, Community Living Campbellford/Brighton, Community Living Kawartha Lakes, Community Living Kingston & District, Community Living Peterborough, Community Living Prince Edward, Community Living Quinte West, Community Visions & Networking, Counselling Services of Belleville & District, Dual Diagnosis Consultation Outreach Team, Kerry\'s Place Autism Services, Madoc COPE, North Hastings Community Integration Association, Pathways to Independence, Quinte Vocational Support Services<br />\nLanguage : english<br />\nUrl : http://lms.regioneastpda.ca/claroline/course/index.php?cid=SHSA','2014-06-27 09:29:45',NULL,NULL,NULL),
 (7,1,'Course created : test','July 26, 2014 at 11:49 AM<br />\n<br />\nCourse creation on  REPDA by the user Steve Cole ( steve@profilequinte.com )<br />\n<br />\nCourse code : TEST<br />\nCourse title : test<br />\nLecturer(s) : Online<br />\nEmail : steve@profilequinte.com<br />\nCategory : Online Training For All Agencies<br />\nLanguage : english<br />\nUrl : http://repda_lms.profilequinte.com/claroline/course/index.php?cid=TEST','2014-07-26 11:49:26',NULL,NULL,NULL),
 (8,1,'Course created : xxx','July 26, 2014 at 01:20 PM<br />\n<br />\nCourse creation on  REPDA by the user Steve Cole ( steve@profilequinte.com )<br />\n<br />\nCourse code : XXX<br />\nCourse title : xxx<br />\nLecturer(s) : Steve Cole<br />\nEmail : steve@profilequinte.com<br />\nCategory : Online Training For All Agencies<br />\nLanguage : french<br />\nUrl : http://repda_lms.profilequinte.com/claroline/course/index.php?cid=XXX','2014-07-26 13:20:40',NULL,NULL,NULL),
 (9,1,'Course created : FR_SHSA','July 26, 2014 at 02:04 PM<br />\n<br />\nCourse creation on  REPDA by the user Steve Cole ( steve@profilequinte.com )<br />\n<br />\nCourse code : FR_SHSA<br />\nCourse title : FR_SHSA<br />\nLecturer(s) : Online<br />\nEmail : steve@profilequinte.com<br />\nCategory : Online Training For All Agencies<br />\nLanguage : french<br />\nUrl : http://repda_lms.profilequinte.com/claroline/course/index.php?cid=FR_SHSA','2014-07-26 14:04:13',NULL,NULL,NULL),
 (10,1,'Course created : a course','July 29, 2014 at 10:30 AM<br />\n<br />\nCourse creation on  REPDA by the user Steve Cole ( steve@regioneastpda.ca )<br />\n<br />\nCourse code : PICTON_C1<br />\nCourse title : a course<br />\nLecturer(s) : Online<br />\nEmail : steve@regioneastpda.ca<br />\nCategory : Community Living Prince Edward<br />\nLanguage : english<br />\nUrl : http://repda_lms.profilequinte.com/claroline/course/index.php?cid=PICTON_C1','2014-07-29 10:30:02',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cl_im_message` ENABLE KEYS */;


--
-- Definition of table `cl_im_message_status`
--

DROP TABLE IF EXISTS `cl_im_message_status`;
CREATE TABLE `cl_im_message_status` (
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_im_message_status`
--

/*!40000 ALTER TABLE `cl_im_message_status` DISABLE KEYS */;
INSERT INTO `cl_im_message_status` (`user_id`,`message_id`,`is_read`,`is_deleted`) VALUES 
 (1,1,1,1),
 (1,2,0,0),
 (3,3,0,0),
 (1,4,1,0),
 (3,5,0,0),
 (1,6,0,0),
 (1,7,1,0),
 (1,8,1,0),
 (1,9,0,0),
 (1,10,0,0),
 (2,10,0,0),
 (4,10,0,0),
 (5,10,0,0);
/*!40000 ALTER TABLE `cl_im_message_status` ENABLE KEYS */;


--
-- Definition of table `cl_im_recipient`
--

DROP TABLE IF EXISTS `cl_im_recipient`;
CREATE TABLE `cl_im_recipient` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sent_to` enum('toUser','toGroup','toCourse','toAll') NOT NULL,
  PRIMARY KEY (`message_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_im_recipient`
--

/*!40000 ALTER TABLE `cl_im_recipient` DISABLE KEYS */;
INSERT INTO `cl_im_recipient` (`message_id`,`user_id`,`sent_to`) VALUES 
 (1,1,'toUser'),
 (2,1,'toUser'),
 (3,3,'toUser'),
 (4,1,'toUser'),
 (5,3,'toUser'),
 (6,1,'toUser'),
 (7,1,'toUser'),
 (8,1,'toUser'),
 (9,1,'toUser'),
 (10,1,'toUser'),
 (10,2,'toUser'),
 (10,4,'toUser'),
 (10,5,'toUser');
/*!40000 ALTER TABLE `cl_im_recipient` ENABLE KEYS */;


--
-- Definition of table `cl_log`
--

DROP TABLE IF EXISTS `cl_log`;
CREATE TABLE `cl_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(40) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(60) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_code`),
  KEY `user_log` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_log`
--

/*!40000 ALTER TABLE `cl_log` DISABLE KEYS */;
INSERT INTO `cl_log` (`id`,`course_code`,`tool_id`,`user_id`,`ip`,`date`,`type`,`data`) VALUES 
 (1,'CLQWWHMIS',4,1,'72.38.52.78','2014-05-27 16:19:48','warning','s:103:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/CLQWWHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (2,'CLQWWHMIS',4,1,'72.38.52.78','2014-05-27 16:20:08','warning','s:103:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/CLQWWHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (3,'CLQWWHMIS',4,1,'72.38.52.78','2014-05-27 16:20:32','warning','s:103:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/CLQWWHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (4,'CLQWWHMIS',4,1,'72.38.52.78','2014-05-27 16:20:38','warning','s:103:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/CLQWWHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (5,'CLQWWHMIS',4,1,'72.38.52.78','2014-05-27 16:21:40','warning','s:103:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/CLQWWHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (6,'CLQWWHMIS',4,1,'72.38.52.78','2014-05-27 16:22:51','warning','s:103:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/CLQWWHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (7,'CLQWWHMIS',4,1,'72.38.52.78','2014-05-27 16:25:40','warning','s:104:\"GC directory C:\\wamp\\www\\lms.profilequinte.com/courses/CLQWWHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (8,'CLQWWHMIS',4,1,'72.38.52.78','2014-05-27 16:41:51','warning','s:104:\"GC directory C:\\wamp\\www\\lms.profilequinte.com/courses/CLQWWHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (9,'CLQWWHMIS',NULL,1,'72.38.52.78','2014-05-28 08:50:12','warning','s:73:\"DELETE_COURSE : Course directory not found CLQWWHMIS for course CLQWWHMIS\";'),
 (10,'CLQWWHMIS',NULL,1,'72.38.52.78','2014-05-28 08:50:12','COURSE_DELETED','a:4:{s:10:\"courseCode\";s:9:\"CLQWWHMIS\";s:12:\"courseDbName\";s:11:\"c_CLQWWHMIS\";s:15:\"courseDbNameGlu\";s:12:\"c_CLQWWHMIS_\";s:10:\"coursePath\";s:9:\"CLQWWHMIS\";}'),
 (11,'CLQWWHMIS',NULL,1,'72.38.52.78','2014-05-28 08:50:12','DELETION COURSE','a:2:{s:10:\"courseName\";s:5:\"WHMIS\";s:3:\"uid\";i:1;}'),
 (12,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:16:09','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (13,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:16:25','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (14,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:16:40','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (15,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:16:46','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (16,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:17:11','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (17,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:17:27','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (18,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:24:15','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (19,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:26:08','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (20,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:30:09','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (21,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:30:28','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (22,'WHMIS',9,1,'192.168.99.1','2014-06-23 18:36:26','GROUPMANAGING','a:1:{s:10:\"FILL_GROUP\";b:1;}'),
 (23,'WHMIS',10,1,'192.168.99.1','2014-06-23 18:38:13','COURSE_SUBSCRIBE','s:30:\"3 enroled to course WHMIS by 1\";'),
 (24,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:41:32','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (25,'WHMIS',4,3,'192.168.99.1','2014-06-23 18:43:38','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (26,'WHMIS',4,3,'192.168.99.1','2014-06-23 18:43:55','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (27,'WHMIS',4,3,'192.168.99.1','2014-06-23 18:44:51','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (28,'WHMIS',4,3,'192.168.99.1','2014-06-23 18:45:01','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (29,'WHMIS',4,1,'192.168.99.1','2014-06-23 18:54:01','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (30,'WHMIS',4,3,'192.168.99.1','2014-06-23 18:55:57','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (31,'WHMIS',4,3,'192.168.99.1','2014-06-23 18:57:07','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (32,'WHMIS',4,3,'192.168.99.1','2014-06-23 18:58:23','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (33,'WHMIS',4,3,'192.168.99.1','2014-06-23 18:59:26','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (34,'WHMIS',4,3,'192.168.99.1','2014-06-23 20:47:18','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (35,'WHMIS',4,3,'192.168.99.1','2014-06-23 21:39:12','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (36,'WHMIS',4,3,'192.168.99.1','2014-06-23 21:39:17','warning','s:99:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (37,'WHSA',4,1,'72.38.52.78','2014-06-26 13:21:37','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (38,'WHSA',4,1,'72.38.52.78','2014-06-26 13:21:48','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (39,'WHSA',4,1,'72.38.52.78','2014-06-26 13:21:52','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (40,'WHSA',4,1,'72.38.52.78','2014-06-26 13:23:34','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (41,'WHSA',4,1,'72.38.52.78','2014-06-26 13:36:31','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (42,'WHSA',10,1,'72.38.52.78','2014-06-26 13:53:56','COURSE_SUBSCRIBE','s:29:\"3 enroled to course WHSA by 1\";'),
 (43,'SHSA',4,1,'72.38.52.78','2014-06-27 09:30:58','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (44,'SHSA',4,1,'72.38.52.78','2014-06-27 09:31:08','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (45,'SHSA',4,1,'72.38.52.78','2014-06-27 09:31:30','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (46,'SHSA',4,1,'72.38.52.78','2014-06-27 09:31:31','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (47,'SHSA',4,1,'72.38.52.78','2014-06-27 09:32:09','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (48,'SHSA',4,1,'72.38.52.78','2014-06-27 09:32:17','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (49,'SHSA',4,1,'72.38.52.78','2014-06-27 09:32:34','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (50,'WHSA',4,1,'72.38.52.78','2014-07-24 13:01:35','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (51,'WHSA',4,1,'72.38.52.78','2014-07-24 13:16:41','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (52,'WHSA',4,1,'72.38.52.78','2014-07-24 13:22:18','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (53,'WHSA',4,1,'72.38.52.78','2014-07-24 13:22:25','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (54,'WHSA',4,1,'72.38.52.78','2014-07-24 13:22:40','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (55,'WHSA',4,1,'72.38.52.78','2014-07-24 13:24:03','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (56,'WHSA',4,1,'72.38.52.78','2014-07-24 13:24:10','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (57,'WHSA',4,1,'72.38.52.78','2014-07-24 13:24:32','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (58,'SHSA',4,NULL,'72.38.52.78','2014-07-25 13:42:28','warning','s:98:\"GC directory C:\\wamp\\www\\lms.regioneastpda.ca/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (59,NULL,NULL,1,'192.168.99.1','2014-07-26 13:18:52','COURSE_DELETED','a:4:{s:10:\"courseCode\";s:4:\"TEST\";s:12:\"courseDbName\";s:6:\"c_TEST\";s:15:\"courseDbNameGlu\";s:7:\"c_TEST_\";s:10:\"coursePath\";s:4:\"TEST\";}'),
 (60,NULL,NULL,1,'192.168.99.1','2014-07-26 13:37:29','COURSE_DELETED','a:4:{s:10:\"courseCode\";s:3:\"XXX\";s:12:\"courseDbName\";s:5:\"c_XXX\";s:15:\"courseDbNameGlu\";s:6:\"c_XXX_\";s:10:\"coursePath\";s:3:\"XXX\";}'),
 (61,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:07:11','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (62,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:10:14','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (63,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:10:18','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (64,'SHSA',4,1,'192.168.99.1','2014-07-26 14:10:58','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (65,'SHSA',4,1,'192.168.99.1','2014-07-26 14:11:07','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (66,'SHSA',4,1,'192.168.99.1','2014-07-26 14:13:01','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (67,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:13:18','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (68,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:13:33','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (69,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:14:08','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (70,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:14:15','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (71,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:14:31','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (72,'SHSA',4,1,'192.168.99.1','2014-07-26 14:14:45','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (73,'SHSA',4,1,'192.168.99.1','2014-07-26 14:15:01','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (74,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:15:14','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (75,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:15:27','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (76,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:15:31','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (77,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:15:39','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (78,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:20:14','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (79,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:20:22','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (80,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:21:01','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (81,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:26:29','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (82,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:26:38','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (83,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:26:50','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (84,'FR_SHSA',4,1,'192.168.99.1','2014-07-26 14:27:11','warning','s:108:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/FR_SHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (85,'WHSA',4,1,'192.168.99.1','2014-07-26 15:05:50','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (86,'WHSA',4,1,'192.168.99.1','2014-07-26 15:30:00','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (87,'WHSA',4,1,'192.168.99.1','2014-07-26 15:42:42','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (88,'WHSA',4,1,'192.168.99.1','2014-07-26 15:44:02','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (89,'WHSA',4,1,'192.168.99.1','2014-07-26 16:33:14','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (90,'WHSA',4,1,'192.168.99.1','2014-07-26 16:37:36','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (91,'WHSA',4,1,'192.168.99.1','2014-07-26 16:37:56','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (92,'WHMIS',4,1,'192.168.99.1','2014-07-26 17:10:59','warning','s:106:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (93,'WHMIS',4,1,'192.168.99.1','2014-07-26 17:34:57','warning','s:106:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (94,'WHMIS',4,1,'192.168.99.1','2014-07-26 17:35:13','warning','s:106:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (95,'WHMIS',4,1,'192.168.99.1','2014-07-26 17:43:58','warning','s:106:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHMIS/tmp/zip is not a folder folder : ABORT!\";'),
 (96,'WHSA',4,1,'192.168.99.1','2014-07-26 17:44:16','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (97,'WHSA',4,1,'192.168.99.1','2014-07-26 17:44:40','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (98,'WHSA',4,1,'192.168.99.1','2014-07-26 17:46:40','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (99,'WHSA',4,1,'192.168.99.1','2014-07-26 17:46:45','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (100,'WHSA',4,1,'192.168.99.1','2014-07-26 17:47:18','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (101,'WHSA',4,1,'192.168.99.1','2014-07-26 17:48:34','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (102,'WHSA',4,1,'192.168.99.1','2014-07-26 17:48:36','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (103,'WHSA',4,1,'192.168.99.1','2014-07-26 17:48:47','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (104,'WHSA',4,1,'192.168.99.1','2014-07-26 17:49:54','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (105,'WHSA',4,1,'192.168.99.1','2014-07-26 17:50:29','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (106,'WHSA',4,1,'192.168.99.1','2014-07-26 17:55:27','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (107,'WHSA',4,1,'192.168.99.1','2014-07-26 17:57:58','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (108,'WHSA',4,1,'192.168.99.1','2014-07-26 17:58:01','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (109,'WHSA',4,1,'192.168.99.1','2014-07-26 17:58:10','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (110,'WHSA',4,1,'192.168.99.1','2014-07-26 18:01:57','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (111,'WHSA',4,1,'192.168.99.1','2014-07-26 18:09:36','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (112,'WHSA',4,1,'192.168.99.1','2014-07-26 18:09:44','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (113,'WHSA',4,1,'192.168.99.1','2014-07-26 18:11:34','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (114,'WHSA',4,1,'192.168.99.1','2014-07-26 18:12:23','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (115,'WHSA',4,1,'192.168.99.1','2014-07-26 18:13:24','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (116,'WHSA',4,1,'192.168.99.1','2014-07-26 18:14:14','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (117,'WHSA',4,1,'72.38.52.78','2014-07-29 10:09:02','warning','s:105:\"GC directory C:\\wamp\\www\\repda_lms.profilequinte.com/courses/WHSA/tmp/zip is not a folder folder : ABORT!\";'),
 (118,NULL,NULL,1,'72.38.52.78','2014-07-30 13:16:34','COURSE_DELETED','a:4:{s:10:\"courseCode\";s:9:\"PICTON_C1\";s:12:\"courseDbName\";s:11:\"c_PICTON_C1\";s:15:\"courseDbNameGlu\";s:12:\"c_PICTON_C1_\";s:10:\"coursePath\";s:9:\"PICTON_C1\";}');
/*!40000 ALTER TABLE `cl_log` ENABLE KEYS */;


--
-- Definition of table `cl_module`
--

DROP TABLE IF EXISTS `cl_module`;
CREATE TABLE `cl_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(8) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `activation` enum('activated','desactivated') NOT NULL DEFAULT 'desactivated',
  `type` varchar(10) NOT NULL DEFAULT 'applet',
  `script_url` char(255) NOT NULL DEFAULT 'entry.php',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_module`
--

/*!40000 ALTER TABLE `cl_module` DISABLE KEYS */;
INSERT INTO `cl_module` (`id`,`label`,`name`,`activation`,`type`,`script_url`) VALUES 
 (1,'CLDSC','Course description','activated','tool','index.php'),
 (2,'CLCAL','Agenda','activated','tool','agenda.php'),
 (3,'CLANN','Announcements','activated','tool','announcements.php'),
 (4,'CLDOC','Documents and Links','activated','tool','document.php'),
 (5,'CLQWZ','Exercises','activated','tool','exercise.php'),
 (6,'CLLNP','Learning path','activated','tool','learningPathList.php'),
 (7,'CLWRK','Assignments and Uploads','activated','tool','work.php'),
 (8,'CLFRM','Forums','activated','tool','index.php'),
 (9,'CLGRP','Groups','activated','tool','group.php'),
 (10,'CLUSR','Users','activated','tool','user.php'),
 (11,'CLWIKI','Wiki','activated','tool','wiki.php'),
 (12,'CLCHAT','Chat','activated','tool','index.php');
/*!40000 ALTER TABLE `cl_module` ENABLE KEYS */;


--
-- Definition of table `cl_module_contexts`
--

DROP TABLE IF EXISTS `cl_module_contexts`;
CREATE TABLE `cl_module_contexts` (
  `module_id` int(10) unsigned NOT NULL,
  `context` varchar(60) NOT NULL DEFAULT 'course',
  PRIMARY KEY (`module_id`,`context`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_module_contexts`
--

/*!40000 ALTER TABLE `cl_module_contexts` DISABLE KEYS */;
INSERT INTO `cl_module_contexts` (`module_id`,`context`) VALUES 
 (1,'course'),
 (2,'course'),
 (3,'course'),
 (4,'course'),
 (4,'group'),
 (5,'course'),
 (6,'course'),
 (7,'course'),
 (8,'course'),
 (8,'group'),
 (9,'course'),
 (10,'course'),
 (11,'course'),
 (11,'group'),
 (12,'course'),
 (12,'group');
/*!40000 ALTER TABLE `cl_module_contexts` ENABLE KEYS */;


--
-- Definition of table `cl_module_info`
--

DROP TABLE IF EXISTS `cl_module_info`;
CREATE TABLE `cl_module_info` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `module_id` smallint(6) NOT NULL DEFAULT '0',
  `version` varchar(10) NOT NULL DEFAULT '',
  `author` varchar(50) DEFAULT NULL,
  `author_email` varchar(100) DEFAULT NULL,
  `author_website` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_module_info`
--

/*!40000 ALTER TABLE `cl_module_info` DISABLE KEYS */;
INSERT INTO `cl_module_info` (`id`,`module_id`,`version`,`author`,`author_email`,`author_website`,`description`,`website`,`license`) VALUES 
 (1,1,'1.9','Claro team','devteam@claroline.net','http://www.claroline.net/','\n  ','http://wiki.claroline.net/index.php/CLDSC','GPL'),
 (2,2,'3.0','Claro team','devteam@claroline.net','http://www.claroline.net/','\n  ','http://wiki.claroline.net/index.php/CLCAL','GPL'),
 (3,3,'3.0','Claro team','devteam@claroline.net','http://www.claroline.net/','\n  ','http://wiki.claroline.net/index.php/CLANN','GPL'),
 (4,4,'4.0','Claro team','devteam@claroline.net','http://www.claroline.net/','\n     This tool is an original tool of claroline\n     It\'s able to store and manage local ressoures like file, url.\n     Can  manage upload, zip, images, url, subdirectory\n     Ca edit html files\n  ','http://wiki.claroline.net/index.php/CLDOC','GPL'),
 (5,5,'1.8','Claro team','devteam@claroline.net','http://www.claroline.net/','\n  ','http://wiki.claroline.net/index.php/CLQWZ','GPL'),
 (6,6,'1.0','Claro team','devteam@claroline.net','http://www.claroline.net/','\n  ','http://www.claroline.net/wiki/CLLNP/','GPL'),
 (7,7,'1.8','Claro team','devteam@claroline.net','http://www.claroline.net/','\n  ','','GPL'),
 (8,8,'1.8','Claro team','devteam@claroline.net','http://www.claroline.net/','\n  ','http://wiki.claroline.net/index.php/CLFRM','GPL'),
 (9,9,'1.8','Claro team','devteam@claroline.net','http://www.claroline.net/','\n        This tool allows group-based activities and group management in Claroline\n    ','http://wiki.claroline.net/index.php/CLGRP','GPL'),
 (10,10,'4.0','Claro team','devteam@claroline.net','http://www.claroline.net/','\n  ','http://wiki.claroline.net/index.php/CLUSR','GPL'),
 (11,11,'2.0','Frederic Minne','zefredz@claroline.net','http://wiki.claroline.net/index.php/CLWIKI','\n     This is the original Wiki tool for the Claroline platform. It allows\n     online collaborative edition of web pages using a simplified Wiki\n     syntax based on Olivier Meunier\'s wiki2xhtml renderer from the\n     Dotclear blog project.\n  ','http://wiki.claroline.net/index.php/CLWIKI','GPL'),
 (12,12,'1.0','Sebastien Piraux','seb@claroline.net','http://www.claroline.net','\n    \n  ','','GPL');
/*!40000 ALTER TABLE `cl_module_info` ENABLE KEYS */;


--
-- Definition of table `cl_notify`
--

DROP TABLE IF EXISTS `cl_notify`;
CREATE TABLE `cl_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(40) NOT NULL DEFAULT '0',
  `tool_id` int(11) NOT NULL DEFAULT '0',
  `ressource_id` varchar(255) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_code`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_notify`
--

/*!40000 ALTER TABLE `cl_notify` DISABLE KEYS */;
INSERT INTO `cl_notify` (`id`,`course_code`,`tool_id`,`ressource_id`,`group_id`,`user_id`,`date`) VALUES 
 (1,'WHMIS',0,'0',0,0,'2014-06-23 18:59:06'),
 (4,'WHMIS',7,'1',0,0,'2014-06-23 18:52:53'),
 (3,'WHMIS',1,'',0,0,'2014-07-26 18:32:22'),
 (5,'WHSA',0,'0',0,0,'2014-06-26 13:20:40'),
 (6,'WHSA',7,'1',0,0,'2014-06-27 09:51:30'),
 (7,'SHSA',0,'0',0,0,'2014-06-27 09:30:43'),
 (8,'SHSA',7,'1',0,0,'2014-06-27 09:33:02'),
 (9,'FR_SHSA',0,'0',0,0,'2014-07-26 14:19:56'),
 (10,'FR_SHSA',7,'1',0,0,'2014-07-26 14:25:09'),
 (11,'WHSA',1,'',0,0,'2014-07-26 18:27:45'),
 (12,'WHSA',1,'1',0,0,'2014-07-26 18:31:33'),
 (13,'SHSA',1,'',0,0,'2014-07-26 18:32:00'),
 (14,'WHMIS',1,'1',0,0,'2014-07-26 18:32:42'),
 (15,'FR_SHSA',1,'',0,0,'2014-07-26 18:33:34'),
 (16,'WHSA',2,'2',0,0,'2014-07-26 18:54:31'),
 (17,'WHSA',2,'1',0,0,'2014-07-26 18:55:10');
/*!40000 ALTER TABLE `cl_notify` ENABLE KEYS */;


--
-- Definition of table `cl_property_definition`
--

DROP TABLE IF EXISTS `cl_property_definition`;
CREATE TABLE `cl_property_definition` (
  `propertyId` varchar(50) NOT NULL DEFAULT '',
  `contextScope` varchar(10) NOT NULL DEFAULT '',
  `label` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT '',
  `defaultValue` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `acceptedValue` text NOT NULL,
  PRIMARY KEY (`contextScope`,`propertyId`),
  KEY `rank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_property_definition`
--

/*!40000 ALTER TABLE `cl_property_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `cl_property_definition` ENABLE KEYS */;


--
-- Definition of table `cl_rel_class_user`
--

DROP TABLE IF EXISTS `cl_rel_class_user`;
CREATE TABLE `cl_rel_class_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `class_id` (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_rel_class_user`
--

/*!40000 ALTER TABLE `cl_rel_class_user` DISABLE KEYS */;
INSERT INTO `cl_rel_class_user` (`id`,`user_id`,`class_id`) VALUES 
 (1,3,1),
 (2,1,1),
 (3,2,1);
/*!40000 ALTER TABLE `cl_rel_class_user` ENABLE KEYS */;


--
-- Definition of table `cl_rel_course_category`
--

DROP TABLE IF EXISTS `cl_rel_course_category`;
CREATE TABLE `cl_rel_course_category` (
  `courseId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `rootCourse` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`courseId`,`categoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_rel_course_category`
--

/*!40000 ALTER TABLE `cl_rel_course_category` DISABLE KEYS */;
INSERT INTO `cl_rel_course_category` (`courseId`,`categoryId`,`rootCourse`) VALUES 
 (2,5,0),
 (7,5,0),
 (3,5,0),
 (4,5,0);
/*!40000 ALTER TABLE `cl_rel_course_category` ENABLE KEYS */;


--
-- Definition of table `cl_rel_course_class`
--

DROP TABLE IF EXISTS `cl_rel_course_class`;
CREATE TABLE `cl_rel_course_class` (
  `courseId` varchar(40) NOT NULL,
  `classId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`courseId`,`classId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_rel_course_class`
--

/*!40000 ALTER TABLE `cl_rel_course_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `cl_rel_course_class` ENABLE KEYS */;


--
-- Definition of table `cl_rel_course_portlet`
--

DROP TABLE IF EXISTS `cl_rel_course_portlet`;
CREATE TABLE `cl_rel_course_portlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseId` (`courseId`,`label`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_rel_course_portlet`
--

/*!40000 ALTER TABLE `cl_rel_course_portlet` DISABLE KEYS */;
INSERT INTO `cl_rel_course_portlet` (`id`,`courseId`,`rank`,`label`,`visible`) VALUES 
 (1,3,1,'CLCAL',1);
/*!40000 ALTER TABLE `cl_rel_course_portlet` ENABLE KEYS */;


--
-- Definition of table `cl_rel_course_user`
--

DROP TABLE IF EXISTS `cl_rel_course_user`;
CREATE TABLE `cl_rel_course_user` (
  `code_cours` varchar(40) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `profile_id` int(11) NOT NULL,
  `role` varchar(60) DEFAULT NULL,
  `team` int(11) NOT NULL DEFAULT '0',
  `tutor` int(11) NOT NULL DEFAULT '0',
  `count_user_enrol` int(11) NOT NULL DEFAULT '0',
  `count_class_enrol` int(11) NOT NULL DEFAULT '0',
  `isPending` tinyint(4) NOT NULL DEFAULT '0',
  `isCourseManager` tinyint(4) NOT NULL DEFAULT '0',
  `enrollment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`code_cours`,`user_id`),
  KEY `isCourseManager` (`isCourseManager`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_rel_course_user`
--

/*!40000 ALTER TABLE `cl_rel_course_user` DISABLE KEYS */;
INSERT INTO `cl_rel_course_user` (`code_cours`,`user_id`,`profile_id`,`role`,`team`,`tutor`,`count_user_enrol`,`count_class_enrol`,`isPending`,`isCourseManager`,`enrollment_date`) VALUES 
 ('WHMIS',1,4,NULL,0,1,1,0,0,1,'2014-06-23 18:13:40'),
 ('WHMIS',3,3,NULL,0,0,1,0,0,0,'2014-06-23 18:37:51'),
 ('WHSA',1,4,NULL,0,1,1,0,0,1,'2014-06-26 13:18:57'),
 ('WHSA',3,3,NULL,0,0,1,0,0,0,'2014-06-26 13:53:27'),
 ('SHSA',1,4,NULL,0,1,1,0,0,1,'2014-06-27 09:29:17'),
 ('FR_SHSA',1,4,NULL,0,1,1,0,0,1,'2014-07-26 14:04:00');
/*!40000 ALTER TABLE `cl_rel_course_user` ENABLE KEYS */;


--
-- Definition of table `cl_right_action`
--

DROP TABLE IF EXISTS `cl_right_action`;
CREATE TABLE `cl_right_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `tool_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  `type` enum('COURSE','PLATFORM') NOT NULL DEFAULT 'COURSE',
  PRIMARY KEY (`id`),
  KEY `tool_id` (`tool_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_right_action`
--

/*!40000 ALTER TABLE `cl_right_action` DISABLE KEYS */;
INSERT INTO `cl_right_action` (`id`,`name`,`description`,`tool_id`,`rank`,`type`) VALUES 
 (1,'read','',1,0,'COURSE'),
 (2,'edit','',1,0,'COURSE'),
 (3,'read','',2,0,'COURSE'),
 (4,'edit','',2,0,'COURSE'),
 (5,'read','',3,0,'COURSE'),
 (6,'edit','',3,0,'COURSE'),
 (7,'read','',4,0,'COURSE'),
 (8,'edit','',4,0,'COURSE'),
 (9,'read','',5,0,'COURSE'),
 (10,'edit','',5,0,'COURSE'),
 (11,'read','',6,0,'COURSE'),
 (12,'edit','',6,0,'COURSE'),
 (13,'read','',7,0,'COURSE'),
 (14,'edit','',7,0,'COURSE'),
 (15,'read','',8,0,'COURSE'),
 (16,'edit','',8,0,'COURSE'),
 (17,'read','',9,0,'COURSE'),
 (18,'edit','',9,0,'COURSE'),
 (19,'read','',10,0,'COURSE'),
 (20,'edit','',10,0,'COURSE'),
 (21,'read','',11,0,'COURSE'),
 (22,'edit','',11,0,'COURSE'),
 (23,'read','',12,0,'COURSE'),
 (24,'edit','',12,0,'COURSE');
/*!40000 ALTER TABLE `cl_right_action` ENABLE KEYS */;


--
-- Definition of table `cl_right_profile`
--

DROP TABLE IF EXISTS `cl_right_profile`;
CREATE TABLE `cl_right_profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('COURSE','PLATFORM') NOT NULL DEFAULT 'COURSE',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `courseManager` tinyint(4) DEFAULT '0',
  `mailingList` tinyint(4) DEFAULT '0',
  `userlistPublic` tinyint(4) DEFAULT '0',
  `groupTutor` tinyint(4) DEFAULT '0',
  `locked` tinyint(4) DEFAULT '0',
  `required` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`profile_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_right_profile`
--

/*!40000 ALTER TABLE `cl_right_profile` DISABLE KEYS */;
INSERT INTO `cl_right_profile` (`profile_id`,`type`,`name`,`label`,`description`,`courseManager`,`mailingList`,`userlistPublic`,`groupTutor`,`locked`,`required`) VALUES 
 (1,'COURSE','Anonymous','anonymous','Course visitor (the user has no account on the platform)',0,1,1,0,0,1),
 (2,'COURSE','Guest','guest','Course visitor (the user has an account on the platform, but is not enrolled in the course)',0,1,1,0,0,1),
 (3,'COURSE','User','user','Course member (the user is actually enrolled in the course)',0,1,1,0,0,1),
 (4,'COURSE','Manager','manager','Course Administrator',1,1,1,0,1,1);
/*!40000 ALTER TABLE `cl_right_profile` ENABLE KEYS */;


--
-- Definition of table `cl_right_rel_profile_action`
--

DROP TABLE IF EXISTS `cl_right_rel_profile_action`;
CREATE TABLE `cl_right_rel_profile_action` (
  `profile_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `courseId` varchar(40) NOT NULL DEFAULT '',
  `value` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`profile_id`,`action_id`,`courseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_right_rel_profile_action`
--

/*!40000 ALTER TABLE `cl_right_rel_profile_action` DISABLE KEYS */;
INSERT INTO `cl_right_rel_profile_action` (`profile_id`,`action_id`,`courseId`,`value`) VALUES 
 (1,24,'',0),
 (2,24,'',0),
 (3,24,'',0),
 (4,24,'',1),
 (1,23,'',1),
 (2,23,'',1),
 (3,23,'',1),
 (4,23,'',1),
 (1,22,'',0),
 (1,21,'',1),
 (2,22,'',0),
 (2,21,'',1),
 (3,22,'',0),
 (3,21,'',1),
 (4,22,'',1),
 (1,20,'',0),
 (1,19,'',1),
 (2,20,'',0),
 (2,19,'',1),
 (3,20,'',0),
 (3,19,'',1),
 (4,21,'',1),
 (1,18,'',0),
 (1,17,'',1),
 (1,16,'',0),
 (1,15,'',1),
 (1,13,'',1),
 (2,18,'',0),
 (2,17,'',1),
 (2,16,'',0),
 (3,18,'',0),
 (3,17,'',1),
 (3,16,'',0),
 (3,15,'',1),
 (4,20,'',1),
 (4,19,'',1),
 (4,18,'',1),
 (4,17,'',1),
 (1,14,'',0),
 (1,12,'',0),
 (2,15,'',1),
 (2,13,'',1),
 (2,14,'',0),
 (2,12,'',0),
 (3,13,'',1),
 (3,14,'',0),
 (3,12,'',0),
 (3,11,'',1),
 (4,16,'',1),
 (4,15,'',1),
 (4,13,'',1),
 (4,14,'',1),
 (1,11,'',1),
 (2,11,'',1),
 (2,10,'',0),
 (3,10,'',0),
 (4,12,'',1),
 (4,11,'',1),
 (1,10,'',0),
 (1,9,'',1),
 (2,9,'',1),
 (3,9,'',1),
 (4,10,'',1),
 (4,9,'',1),
 (1,7,'',1),
 (1,8,'',0),
 (2,7,'',1),
 (2,8,'',0),
 (3,7,'',1),
 (3,8,'',0),
 (4,7,'',1),
 (4,8,'',1),
 (1,6,'',0),
 (1,5,'',1),
 (2,6,'',0),
 (2,5,'',1),
 (3,6,'',0),
 (3,5,'',1),
 (4,6,'',1),
 (4,5,'',1),
 (1,4,'',0),
 (1,3,'',1),
 (2,4,'',0),
 (2,3,'',1),
 (3,4,'',0),
 (3,3,'',1),
 (4,4,'',1),
 (4,3,'',1),
 (1,2,'',0),
 (1,1,'',1),
 (2,2,'',0),
 (2,1,'',1),
 (3,2,'',0),
 (3,1,'',1),
 (4,2,'',1),
 (4,1,'',1);
/*!40000 ALTER TABLE `cl_right_rel_profile_action` ENABLE KEYS */;


--
-- Definition of table `cl_sso`
--

DROP TABLE IF EXISTS `cl_sso`;
CREATE TABLE `cl_sso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cookie` varchar(255) NOT NULL DEFAULT '',
  `rec_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_sso`
--

/*!40000 ALTER TABLE `cl_sso` DISABLE KEYS */;
/*!40000 ALTER TABLE `cl_sso` ENABLE KEYS */;


--
-- Definition of table `cl_tracking_event`
--

DROP TABLE IF EXISTS `cl_tracking_event`;
CREATE TABLE `cl_tracking_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(40) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(60) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_code`),
  KEY `user_tracking` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_tracking_event`
--

/*!40000 ALTER TABLE `cl_tracking_event` DISABLE KEYS */;
INSERT INTO `cl_tracking_event` (`id`,`course_code`,`tool_id`,`user_id`,`date`,`type`,`data`) VALUES 
 (1,NULL,NULL,1,'2014-04-13 07:55:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (2,NULL,NULL,NULL,'2014-04-16 06:18:00','platform_access',''),
 (3,NULL,NULL,1,'2014-04-16 06:25:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (4,NULL,NULL,NULL,'2014-05-26 08:16:00','platform_access',''),
 (5,NULL,NULL,1,'2014-05-26 10:07:00','platform_access',''),
 (6,NULL,NULL,1,'2014-05-26 10:07:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (7,NULL,NULL,1,'2014-05-26 11:54:00','platform_access',''),
 (8,NULL,NULL,1,'2014-05-26 11:54:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (9,NULL,NULL,NULL,'2014-05-26 11:54:00','platform_access',''),
 (10,NULL,NULL,1,'2014-05-26 11:54:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (11,NULL,NULL,1,'2014-05-26 12:03:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (12,NULL,NULL,NULL,'2014-05-26 12:05:00','platform_access',''),
 (13,NULL,NULL,1,'2014-05-26 13:04:00','platform_access',''),
 (14,NULL,NULL,1,'2014-05-26 13:04:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (15,NULL,NULL,NULL,'2014-05-27 11:30:00','platform_access',''),
 (16,NULL,NULL,NULL,'2014-05-27 15:09:00','platform_access',''),
 (17,NULL,NULL,1,'2014-05-27 15:09:00','platform_access',''),
 (18,NULL,NULL,1,'2014-05-27 15:09:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (19,NULL,NULL,NULL,'2014-05-27 15:44:00','platform_access',''),
 (20,NULL,NULL,1,'2014-05-27 16:01:00','platform_access',''),
 (21,NULL,NULL,1,'2014-05-27 16:01:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (22,'CLQWWHMIS',NULL,NULL,'2014-05-27 16:23:00','platform_access',''),
 (23,NULL,NULL,1,'2014-05-27 16:24:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (24,NULL,NULL,1,'2014-05-28 08:42:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (25,NULL,NULL,1,'2014-05-28 10:51:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (26,NULL,NULL,NULL,'2014-05-28 11:09:00','platform_access',''),
 (27,NULL,NULL,1,'2014-05-28 11:18:00','platform_access',''),
 (28,NULL,NULL,1,'2014-05-28 11:18:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (29,NULL,NULL,3,'2014-05-28 12:26:00','platform_access',''),
 (30,NULL,NULL,3,'2014-05-28 12:26:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (31,NULL,NULL,3,'2014-05-28 12:28:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (32,NULL,NULL,1,'2014-05-28 13:00:00','platform_access',''),
 (33,NULL,NULL,1,'2014-05-28 13:00:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (34,NULL,NULL,1,'2014-05-28 13:02:00','platform_access',''),
 (35,NULL,NULL,1,'2014-05-28 13:02:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (36,NULL,NULL,NULL,'2014-05-28 13:03:00','platform_access',''),
 (37,NULL,NULL,3,'2014-05-28 13:03:00','platform_access',''),
 (38,NULL,NULL,3,'2014-05-28 13:03:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (39,NULL,NULL,1,'2014-05-28 13:04:00','platform_access',''),
 (40,NULL,NULL,1,'2014-05-28 13:04:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (41,NULL,NULL,NULL,'2014-05-28 13:09:00','platform_access',''),
 (42,NULL,NULL,3,'2014-05-28 13:09:00','platform_access',''),
 (43,NULL,NULL,3,'2014-05-28 13:09:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (44,NULL,NULL,1,'2014-05-28 13:10:00','platform_access',''),
 (45,NULL,NULL,1,'2014-05-28 13:10:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (46,NULL,NULL,3,'2014-05-28 13:16:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (47,NULL,NULL,1,'2014-05-28 13:18:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (48,NULL,NULL,1,'2014-05-28 13:20:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (49,NULL,NULL,3,'2014-05-28 13:23:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (50,NULL,NULL,3,'2014-05-28 13:49:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (51,NULL,NULL,NULL,'2014-06-23 16:30:00','platform_access',''),
 (52,NULL,NULL,1,'2014-06-23 17:24:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (53,NULL,NULL,NULL,'2014-06-23 17:52:00','platform_access',''),
 (54,NULL,NULL,1,'2014-06-23 17:53:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (55,NULL,NULL,3,'2014-06-23 17:56:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (56,NULL,NULL,1,'2014-06-23 18:10:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (57,NULL,NULL,1,'2014-06-23 18:34:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (58,NULL,NULL,3,'2014-06-23 18:35:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (59,NULL,NULL,1,'2014-06-23 18:35:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (60,NULL,NULL,3,'2014-06-23 18:38:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (61,NULL,NULL,1,'2014-06-23 18:41:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (62,NULL,NULL,3,'2014-06-23 18:43:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (63,NULL,NULL,1,'2014-06-23 18:45:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (64,NULL,NULL,3,'2014-06-23 18:55:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (65,NULL,NULL,1,'2014-06-23 18:56:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (66,NULL,NULL,3,'2014-06-23 18:57:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (67,NULL,NULL,1,'2014-06-23 18:57:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (68,NULL,NULL,3,'2014-06-23 18:58:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (69,NULL,NULL,1,'2014-06-23 18:58:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (70,NULL,NULL,3,'2014-06-23 18:59:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (71,NULL,NULL,NULL,'2014-06-23 20:46:00','platform_access',''),
 (72,NULL,NULL,1,'2014-06-23 20:46:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (73,NULL,NULL,3,'2014-06-23 20:47:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (74,NULL,NULL,3,'2014-06-23 21:33:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (75,NULL,NULL,1,'2014-06-23 21:39:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (76,NULL,NULL,NULL,'2014-06-25 13:42:00','platform_access',''),
 (77,NULL,NULL,NULL,'2014-06-25 13:43:00','platform_access',''),
 (78,NULL,NULL,NULL,'2014-06-26 13:09:00','platform_access',''),
 (79,NULL,NULL,1,'2014-06-26 13:09:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (80,NULL,NULL,NULL,'2014-06-26 13:51:00','platform_access',''),
 (81,NULL,NULL,1,'2014-06-26 13:51:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (82,NULL,NULL,3,'2014-06-26 13:51:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (83,NULL,NULL,1,'2014-06-26 13:52:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (84,NULL,NULL,3,'2014-06-26 13:54:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (85,NULL,NULL,1,'2014-06-26 13:55:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (86,NULL,NULL,NULL,'2014-06-27 09:28:00','platform_access',''),
 (87,NULL,NULL,1,'2014-06-27 09:28:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (88,NULL,NULL,NULL,'2014-07-09 02:53:00','platform_access',''),
 (89,NULL,NULL,NULL,'2014-07-09 02:53:00','platform_access',''),
 (90,NULL,NULL,NULL,'2014-07-09 02:53:00','platform_access',''),
 (91,NULL,NULL,NULL,'2014-07-09 02:53:00','platform_access',''),
 (92,NULL,NULL,NULL,'2014-07-09 02:53:00','platform_access',''),
 (93,NULL,NULL,NULL,'2014-07-09 02:53:00','platform_access',''),
 (94,NULL,NULL,NULL,'2014-07-09 02:53:00','platform_access',''),
 (95,NULL,NULL,NULL,'2014-07-13 08:34:00','platform_access',''),
 (96,NULL,NULL,NULL,'2014-07-13 13:09:00','platform_access',''),
 (97,NULL,NULL,NULL,'2014-07-13 16:58:00','platform_access',''),
 (98,NULL,NULL,NULL,'2014-07-24 12:30:00','platform_access',''),
 (99,NULL,NULL,1,'2014-07-24 12:31:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (100,NULL,NULL,NULL,'2014-07-24 13:20:00','platform_access',''),
 (101,NULL,NULL,1,'2014-07-24 13:21:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (102,NULL,NULL,NULL,'2014-07-24 13:26:00','platform_access',''),
 (103,NULL,NULL,NULL,'2014-07-25 08:07:00','platform_access',''),
 (104,NULL,NULL,1,'2014-07-25 08:47:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (105,NULL,NULL,NULL,'2014-07-25 08:59:00','platform_access',''),
 (106,NULL,NULL,1,'2014-07-25 08:59:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (107,NULL,NULL,NULL,'2014-07-25 09:01:00','platform_access',''),
 (108,NULL,NULL,1,'2014-07-25 09:01:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (109,NULL,NULL,1,'2014-07-25 09:10:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (110,NULL,NULL,NULL,'2014-07-25 09:13:00','platform_access',''),
 (111,NULL,NULL,1,'2014-07-25 09:13:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (112,NULL,NULL,1,'2014-07-25 09:48:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (113,NULL,NULL,1,'2014-07-25 09:52:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (114,NULL,NULL,NULL,'2014-07-25 10:06:00','platform_access',''),
 (115,NULL,NULL,1,'2014-07-25 10:09:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (116,NULL,NULL,1,'2014-07-25 10:11:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (117,NULL,NULL,1,'2014-07-25 11:55:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (118,NULL,NULL,1,'2014-07-25 12:24:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (119,NULL,NULL,1,'2014-07-25 12:53:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (120,NULL,NULL,1,'2014-07-25 13:11:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (121,NULL,NULL,1,'2014-07-25 13:11:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (122,NULL,NULL,1,'2014-07-25 13:43:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (123,NULL,NULL,NULL,'2014-07-25 20:30:00','platform_access',''),
 (124,NULL,NULL,1,'2014-07-25 20:45:00','platform_access',''),
 (125,NULL,NULL,1,'2014-07-25 20:45:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (126,NULL,NULL,1,'2014-07-25 20:52:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (127,NULL,NULL,1,'2014-07-25 21:15:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (128,NULL,NULL,1,'2014-07-26 06:23:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (129,NULL,NULL,1,'2014-07-26 08:01:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (130,NULL,NULL,1,'2014-07-26 08:18:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (131,NULL,NULL,NULL,'2014-07-26 10:11:00','platform_access',''),
 (132,NULL,NULL,1,'2014-07-26 10:11:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (133,NULL,NULL,1,'2014-07-26 10:55:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (134,NULL,NULL,1,'2014-07-26 11:27:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (135,NULL,NULL,1,'2014-07-26 11:28:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (136,NULL,NULL,1,'2014-07-26 11:47:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (137,NULL,NULL,1,'2014-07-26 12:23:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (138,NULL,NULL,1,'2014-07-26 12:50:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (139,NULL,NULL,1,'2014-07-26 13:40:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (140,NULL,NULL,1,'2014-07-26 13:40:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (141,NULL,NULL,1,'2014-07-26 14:02:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (142,NULL,NULL,1,'2014-07-26 18:17:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (143,NULL,NULL,1,'2014-07-26 20:13:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (144,NULL,NULL,1,'2014-07-26 20:26:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (145,NULL,NULL,1,'2014-07-26 20:39:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (146,NULL,NULL,NULL,'2014-07-26 20:40:00','platform_access',''),
 (147,NULL,NULL,1,'2014-07-26 20:41:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (148,NULL,NULL,1,'2014-07-26 20:45:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (149,NULL,NULL,NULL,'2014-07-26 20:50:00','platform_access',''),
 (150,NULL,NULL,1,'2014-07-26 20:50:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (151,NULL,NULL,1,'2014-07-26 20:51:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (152,NULL,NULL,NULL,'2014-07-26 23:12:00','platform_access',''),
 (153,NULL,NULL,1,'2014-07-27 07:42:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (154,NULL,NULL,1,'2014-07-27 08:12:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (155,NULL,NULL,1,'2014-07-27 08:31:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (156,NULL,NULL,1,'2014-07-27 08:39:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (157,NULL,NULL,NULL,'2014-07-27 11:01:00','platform_access',''),
 (158,NULL,NULL,1,'2014-07-27 11:03:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (159,NULL,NULL,NULL,'2014-07-27 11:06:00','platform_access',''),
 (160,NULL,NULL,1,'2014-07-27 11:06:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (161,NULL,NULL,1,'2014-07-27 11:06:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (162,NULL,NULL,1,'2014-07-27 11:07:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (163,NULL,NULL,1,'2014-07-27 11:08:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (164,NULL,NULL,1,'2014-07-27 15:00:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (165,NULL,NULL,1,'2014-07-27 17:07:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (166,NULL,NULL,NULL,'2014-07-27 17:41:00','platform_access',''),
 (167,NULL,NULL,NULL,'2014-07-27 17:52:00','platform_access',''),
 (168,NULL,NULL,1,'2014-07-27 19:59:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (169,NULL,NULL,1,'2014-07-27 20:07:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (170,NULL,NULL,NULL,'2014-07-27 21:40:00','platform_access',''),
 (171,NULL,NULL,NULL,'2014-07-28 07:58:00','platform_access',''),
 (172,NULL,NULL,NULL,'2014-07-28 08:02:00','platform_access',''),
 (173,NULL,NULL,1,'2014-07-28 10:55:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (174,NULL,NULL,NULL,'2014-07-28 11:40:00','platform_access',''),
 (175,NULL,NULL,NULL,'2014-07-28 14:35:00','platform_access',''),
 (176,NULL,NULL,1,'2014-07-28 15:31:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (177,NULL,NULL,1,'2014-07-28 18:53:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (178,NULL,NULL,1,'2014-07-28 19:52:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (179,NULL,NULL,NULL,'2014-07-28 22:44:00','platform_access',''),
 (180,NULL,NULL,NULL,'2014-07-28 22:48:00','platform_access',''),
 (181,NULL,NULL,NULL,'2014-07-29 06:26:00','platform_access',''),
 (182,NULL,NULL,NULL,'2014-07-29 06:39:00','platform_access',''),
 (183,NULL,NULL,NULL,'2014-07-29 08:13:00','platform_access',''),
 (184,NULL,NULL,1,'2014-07-29 10:08:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (185,NULL,NULL,2,'2014-07-29 10:21:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (186,NULL,NULL,1,'2014-07-29 10:22:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (187,NULL,NULL,1,'2014-07-29 10:25:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (188,NULL,NULL,1,'2014-07-29 10:30:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (189,NULL,NULL,1,'2014-07-29 10:36:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (190,'PICTON_C1',NULL,NULL,'2014-07-29 11:48:00','platform_access',''),
 (191,NULL,NULL,4,'2014-07-29 11:49:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (192,NULL,NULL,NULL,'2014-07-29 18:14:00','platform_access',''),
 (193,NULL,NULL,NULL,'2014-07-30 09:14:00','platform_access',''),
 (194,NULL,NULL,NULL,'2014-07-30 10:25:00','platform_access',''),
 (195,NULL,NULL,NULL,'2014-07-30 10:36:00','platform_access',''),
 (196,NULL,NULL,NULL,'2014-07-30 11:52:00','platform_access',''),
 (197,NULL,NULL,NULL,'2014-07-30 12:53:00','platform_access',''),
 (198,NULL,NULL,1,'2014-07-30 12:54:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (199,NULL,NULL,1,'2014-07-30 13:05:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (200,NULL,NULL,1,'2014-07-30 13:16:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (201,NULL,NULL,NULL,'2014-07-31 08:22:00','platform_access',''),
 (202,NULL,NULL,NULL,'2014-07-31 09:17:00','platform_access',''),
 (203,NULL,NULL,1,'2014-07-31 10:38:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (204,NULL,NULL,NULL,'2014-08-03 10:37:00','platform_access',''),
 (205,NULL,NULL,NULL,'2014-08-03 13:18:00','platform_access',''),
 (206,NULL,NULL,NULL,'2014-08-03 13:30:00','platform_access',''),
 (207,NULL,NULL,NULL,'2014-08-04 05:53:00','platform_access',''),
 (208,NULL,NULL,NULL,'2014-08-04 06:34:00','platform_access',''),
 (209,NULL,NULL,NULL,'2014-08-04 07:41:00','platform_access',''),
 (210,NULL,NULL,NULL,'2014-08-05 06:19:00','platform_access',''),
 (211,NULL,NULL,NULL,'2014-08-05 06:23:00','platform_access',''),
 (212,NULL,NULL,NULL,'2014-08-06 09:19:00','platform_access',''),
 (213,NULL,NULL,NULL,'2014-08-07 09:20:00','platform_access',''),
 (214,NULL,NULL,NULL,'2014-08-07 11:22:00','platform_access',''),
 (215,NULL,NULL,NULL,'2014-08-07 11:23:00','platform_access',''),
 (216,NULL,NULL,NULL,'2014-08-07 17:54:00','platform_access',''),
 (217,NULL,NULL,NULL,'2014-08-08 08:07:00','platform_access',''),
 (218,NULL,NULL,NULL,'2014-08-08 13:13:00','platform_access',''),
 (219,NULL,NULL,NULL,'2014-08-09 04:53:00','platform_access',''),
 (220,NULL,NULL,NULL,'2014-08-09 09:10:00','platform_access',''),
 (221,NULL,NULL,NULL,'2014-08-10 07:22:00','platform_access',''),
 (222,NULL,NULL,NULL,'2014-08-10 17:15:00','platform_access',''),
 (223,NULL,NULL,NULL,'2014-08-11 08:15:00','platform_access',''),
 (224,NULL,NULL,1,'2014-08-11 09:05:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (225,NULL,NULL,1,'2014-08-11 09:12:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (226,NULL,NULL,NULL,'2014-08-11 09:19:00','platform_access',''),
 (227,NULL,NULL,1,'2014-08-11 09:19:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (228,NULL,NULL,NULL,'2014-08-11 13:24:00','platform_access',''),
 (229,NULL,NULL,NULL,'2014-08-11 14:46:00','platform_access',''),
 (230,NULL,NULL,NULL,'2014-08-11 18:19:00','platform_access',''),
 (231,NULL,NULL,1,'2014-08-11 20:05:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (232,NULL,NULL,NULL,'2014-08-11 21:20:00','platform_access',''),
 (233,NULL,NULL,NULL,'2014-08-11 21:44:00','platform_access',''),
 (234,NULL,NULL,NULL,'2014-08-12 08:08:00','platform_access',''),
 (235,NULL,NULL,NULL,'2014-08-12 08:52:00','platform_access',''),
 (236,NULL,NULL,NULL,'2014-08-12 10:47:00','platform_access',''),
 (237,NULL,NULL,NULL,'2014-08-12 11:59:00','platform_access',''),
 (238,NULL,NULL,NULL,'2014-08-12 14:33:00','platform_access',''),
 (239,NULL,NULL,NULL,'2014-08-12 16:02:00','platform_access',''),
 (240,NULL,NULL,NULL,'2014-08-12 20:36:00','platform_access',''),
 (241,NULL,NULL,NULL,'2014-08-13 10:07:00','platform_access',''),
 (242,NULL,NULL,NULL,'2014-08-13 11:47:00','platform_access',''),
 (243,NULL,NULL,NULL,'2014-08-13 15:41:00','platform_access',''),
 (244,NULL,NULL,NULL,'2014-08-13 17:49:00','platform_access',''),
 (245,NULL,NULL,NULL,'2014-08-14 09:14:00','platform_access',''),
 (246,NULL,NULL,NULL,'2014-08-14 13:34:00','platform_access',''),
 (247,NULL,NULL,NULL,'2014-08-14 13:44:00','platform_access',''),
 (248,NULL,NULL,NULL,'2014-08-15 09:31:00','platform_access',''),
 (249,NULL,NULL,NULL,'2014-08-15 11:19:00','platform_access',''),
 (250,NULL,NULL,NULL,'2014-08-15 13:42:00','platform_access',''),
 (251,NULL,NULL,NULL,'2014-08-15 14:43:00','platform_access',''),
 (252,NULL,NULL,1,'2014-08-17 13:05:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (253,NULL,NULL,16,'2014-08-17 14:19:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}'),
 (254,NULL,NULL,NULL,'2014-08-17 19:59:00','platform_access',''),
 (255,NULL,NULL,NULL,'2014-08-17 23:55:00','platform_access',''),
 (256,NULL,NULL,NULL,'2014-08-18 06:11:00','platform_access',''),
 (257,NULL,NULL,NULL,'2014-08-18 08:08:00','platform_access',''),
 (258,NULL,NULL,NULL,'2014-08-18 08:23:00','platform_access',''),
 (259,NULL,NULL,NULL,'2014-08-18 08:54:00','platform_access',''),
 (260,NULL,NULL,NULL,'2014-08-18 09:06:00','platform_access',''),
 (261,NULL,NULL,1,'2014-08-18 09:38:00','user_login','a:1:{s:2:\"ip\";s:11:\"72.38.52.78\";}'),
 (262,NULL,NULL,NULL,'2014-08-18 09:59:00','platform_access',''),
 (263,NULL,NULL,NULL,'2014-08-18 09:59:00','platform_access',''),
 (264,NULL,NULL,NULL,'2014-08-18 10:31:00','platform_access',''),
 (265,NULL,NULL,NULL,'2014-08-18 14:32:00','platform_access',''),
 (266,NULL,NULL,1,'2014-08-18 17:05:00','user_login','a:1:{s:2:\"ip\";s:12:\"192.168.99.1\";}');
/*!40000 ALTER TABLE `cl_tracking_event` ENABLE KEYS */;


--
-- Definition of table `cl_upgrade_status`
--

DROP TABLE IF EXISTS `cl_upgrade_status`;
CREATE TABLE `cl_upgrade_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(40) NOT NULL,
  `claro_label` varchar(8) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_upgrade_status`
--

/*!40000 ALTER TABLE `cl_upgrade_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `cl_upgrade_status` ENABLE KEYS */;


--
-- Definition of table `cl_user`
--

DROP TABLE IF EXISTS `cl_user`;
CREATE TABLE `cl_user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) DEFAULT NULL,
  `prenom` varchar(60) DEFAULT NULL,
  `username` varchar(255) DEFAULT 'empty',
  `password` varchar(50) DEFAULT 'password',
  `language` varchar(15) DEFAULT 'english',
  `authSource` varchar(50) DEFAULT 'claroline',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `officialCode` varchar(255) DEFAULT NULL,
  `officialEmail` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(30) DEFAULT NULL,
  `pictureUri` varchar(250) DEFAULT NULL,
  `creatorId` int(11) unsigned DEFAULT '5',
  `isPlatformAdmin` tinyint(4) DEFAULT '0',
  `isCourseCreator` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `loginpass` (`username`,`password`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_user`
--

/*!40000 ALTER TABLE `cl_user` DISABLE KEYS */;
INSERT INTO `cl_user` (`user_id`,`nom`,`prenom`,`username`,`password`,`language`,`authSource`,`email`,`officialCode`,`officialEmail`,`phoneNumber`,`pictureUri`,`creatorId`,`isPlatformAdmin`,`isCourseCreator`) VALUES 
 (1,'Cole','Steve','scole','R1bsteak!','english','claroline',0x73746576654070726F66696C657175696E74652E636F6D,'Community Living Quinte West','','613-394-2222','',1,1,0),
 (6,'Dale','Darlene','darlene','bubbafan','english','claroline',0x6461726C656E6540636C71772E6361,'Community Living Quinte West',NULL,'613-394-2222',NULL,5,0,1),
 (4,'Kirby','Toni','tkirby','password','english','claroline',0x746F6E6940636C71772E6361,'Community Living Quinte West','','613-394-2223',NULL,4,1,0),
 (5,'User','Automation','auto','ntatioth','english','claroline',0x7765626D617374657240726567696F6E656173747064612E6361,'Community Living Quinte West','','613-394-2223',NULL,NULL,1,0),
 (15,'user','George','testinguser','password','english','claroline',0x6372617040636C71772E6361,'Community Living Campbellford/Brighton',NULL,'613-475-0428',NULL,5,0,0),
 (16,'twoaa','user','user2','password','english','claroline',0x757365723240636C71772E6361,'Community Visions & Networking',NULL,'613-394-2222','',16,0,0),
 (17,'newuser','another','justanotheruser','password','english','claroline',0x73746576652E6D2E636F6C6540676D61696C2E636F6D,'Community Living Kingston & District',NULL,'613-392-2345',NULL,5,0,0),
 (18,'truman','harry','harry','password','english','claroline',0x686172727940636C71772E6361,'Community Living Quinte West',NULL,'613-999-9999',NULL,5,0,0),
 (19,'xxx','uuu','uuuu','password','english','claroline',0x75757540636C71772E6361,'Dual Diagnosis Consultation Outreach Team',NULL,'613-394-2222',NULL,5,0,0);
/*!40000 ALTER TABLE `cl_user` ENABLE KEYS */;


--
-- Definition of table `cl_user_property`
--

DROP TABLE IF EXISTS `cl_user_property`;
CREATE TABLE `cl_user_property` (
  `userId` int(10) unsigned NOT NULL DEFAULT '0',
  `propertyId` varchar(255) NOT NULL DEFAULT '',
  `propertyValue` varchar(255) NOT NULL DEFAULT '',
  `scope` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`scope`,`propertyId`,`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_user_property`
--

/*!40000 ALTER TABLE `cl_user_property` DISABLE KEYS */;
INSERT INTO `cl_user_property` (`userId`,`propertyId`,`propertyValue`,`scope`) VALUES 
 (1,'skype','steve.m.cole2',''),
 (4,'skype','',''),
 (5,'skype','',''),
 (6,'skype','',''),
 (15,'skype','testuser','');
/*!40000 ALTER TABLE `cl_user_property` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
