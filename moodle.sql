-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2014 at 05:01 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table saves information about an instance of mod_assign' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text feedback for submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext,
  `type` varchar(10) DEFAULT 'line',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores annotations added to pdfs submitted by students' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments added to pdfs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores teacher specified quicklist comments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about the number of files submitted by a student' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about file submissions for assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about onlinetext submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading information about a single assignment submission.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config data for an instance of a plugin in an assignment.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about student interactions with' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of flags that can be set for a single user in a single ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Map an assignment specific id number to a user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge`
--

CREATE TABLE IF NOT EXISTS `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) NOT NULL DEFAULT '',
  `issuerurl` varchar(255) NOT NULL DEFAULT '',
  `issuercontact` varchar(255) DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext NOT NULL,
  `messagesubject` longtext NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines badge' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_backpack`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `backpackurl` varchar(255) NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines settings for connecting external backpack' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria for issuing badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_met`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria that were met for an issued badge' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_param`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines parameters for badges criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_external`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Setting for external badges display' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_issued`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines issued badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_manual_award`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track manual award criteria for badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks' AUTO_INCREMENT=40 ;

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 0, 0, 1),
(2, 'admin_bookmarks', 0, 0, 1),
(3, 'badges', 0, 0, 1),
(4, 'blog_menu', 0, 0, 1),
(5, 'blog_recent', 0, 0, 1),
(6, 'blog_tags', 0, 0, 1),
(7, 'calendar_month', 0, 0, 1),
(8, 'calendar_upcoming', 0, 0, 1),
(9, 'comments', 0, 0, 1),
(10, 'community', 0, 0, 1),
(11, 'completionstatus', 0, 0, 1),
(12, 'course_list', 0, 0, 1),
(13, 'course_overview', 0, 0, 1),
(14, 'course_summary', 0, 0, 1),
(15, 'feedback', 0, 0, 0),
(16, 'glossary_random', 0, 0, 1),
(17, 'html', 0, 0, 1),
(18, 'login', 0, 0, 1),
(19, 'mentees', 0, 0, 1),
(20, 'messages', 0, 0, 1),
(21, 'mnet_hosts', 0, 0, 1),
(22, 'myprofile', 0, 0, 1),
(23, 'navigation', 0, 0, 1),
(24, 'news_items', 0, 0, 1),
(25, 'online_users', 0, 0, 1),
(26, 'participants', 0, 0, 1),
(27, 'private_files', 0, 0, 1),
(28, 'quiz_results', 0, 0, 1),
(29, 'recent_activity', 0, 0, 1),
(30, 'rss_client', 300, 0, 1),
(31, 'search_forums', 0, 0, 1),
(32, 'section_links', 0, 0, 1),
(33, 'selfcompletion', 0, 0, 1),
(34, 'settings', 0, 0, 1),
(35, 'site_main_menu', 0, 0, 1),
(36, 'social_activities', 0, 0, 1),
(37, 'tag_flickr', 0, 0, 1),
(38, 'tag_youtube', 0, 0, 1),
(39, 'tags', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'hidden-dock', -3, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'hidden-dock', 1, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'hidden-dock', -1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(10, 'search_forums', 16, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(11, 'news_items', 16, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(12, 'calendar_upcoming', 16, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(13, 'recent_activity', 16, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(14, 'participants', 2, 0, 'site-index', NULL, 'hidden-dock', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_block_positions`
--

INSERT INTO `mdl_block_positions` (`id`, `blockinstanceid`, `contextid`, `pagetype`, `subpage`, `visible`, `region`, `weight`) VALUES
(1, 3, 2, 'site-index', '', 0, 'hidden-dock', -1),
(2, 4, 2, 'site-index', '', 1, 'hidden-dock', 0),
(3, 5, 2, 'site-index', '', 1, 'hidden-dock', -2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1402752795, '1', 1402759995),
(2, 'accesslib/dirtycontexts', '/1/3/16', 1402746083, '1', 1402753283),
(3, 'accesslib/dirtycontexts', '/1/2/15', 1402748002, '1', 1402755202),
(4, 'accesslib/dirtycontexts', '/1/2/23', 1402752804, '1', 1402760004);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_text`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_text` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `formattedtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts' AUTO_INCREMENT=122 ;

--
-- Dumping data for table `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, '9ddbc4549b7a680d4c1ab908bca279ee', '<p>Here you can find various settings to change many of the colours found in this theme.</p>\n', 1402750740),
(2, '7e417a6825bc9c1d13e188438fbe87a1', '<p>This creates a dynamic slideshow of up to 4 slides for you to promote important elements of your site.</p>\n', 1402750741),
(3, '29eb99acfa924b9209f8e6f51fa6080e', '<p>This adds a custom content area inbetween the Slideshow and the Marketing boxes for your own custom content</p>\n', 1402750741),
(4, '050576f57a783232db5cb433f4208c2e', '<p>This theme provides the option of enabling three "marketing" or "ad" spots just under the slideshow.  These allow you to easily identify core information to your users and provide direct links.</p>\n', 1402750741),
(5, 'd8716256b1866f5de12529ac4450e477', '<p>Provide direct links to the core social networks that promote your brand.  These will appear in the header of every page.</p>\n', 1402750741),
(6, 'd59b01b4027ee4466f0b19640cebfe7c', '<p>If enabled this will allow you to set icons for each category of course.</p>\n', 1402750741),
(7, 'c14aeceba48baeaa76cd68bbf2e5f809', '<p>Have you got a web app on the App Store or Google Play Store?  Provide a link here so your users can grab the apps online</p>\n', 1402750741),
(8, '0f490335051cb1a8709026159746fd18', '<p>This will display an alert (or multiple) in three different styles to your users on the Moodle frontpage. Please remember to disable these when no longer needed.</p>\n', 1402750741),
(9, '7a0ffc273b618c1e65aa9d84f4804481', '<p>Here you can enable Google Analytics for your moodle site. You will need to sign up for a free account at the Google Analytics site (<a href="http://analytics.google.com" target="_blank">http://analytics.google.com</a>)</p>\n', 1402750741),
(10, '7088784e04c075cc90016a72cf938cb2', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1402750741),
(11, 'b53e05db5ae61f17c795e7b764243cd7', '<div class="text_to_html"> <div class="clearfix"><div class="well"><h2>Essential</h2><p><img class="img-polaroid" src="essential/pix/screenshot.jpg" alt="screenshot.jpg" /></p></div><div class="well"><h3>About Essential</h3><p>Essential is a modified Moodle bootstrap theme which inherits styles and renderers from its parent theme.</p><h3>Parents</h3><p>This theme is based upon the Bootstrap theme, which was created for Moodle 2.5, with the help of:<br /> Stuart Lamour, Mark Aberdour, Paul Hibbitts, Mary Evans.</p><h3>Theme Credits</h3><p>Authors: Julian Ridden<br /> Contact: julian@moodleman.net<br /> Website: <a href="http://www.moodleman.net">www.moodleman.net</a></p></div></div></div>', 1402746507),
(12, '7e31a3a47403fbddd73b19e93770801b', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(13, '7535d9dfc9c1a7178a5e1b7ee6003dc2', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(14, 'b95880f6d3956332cacd58f88306fbc0', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(15, '087e1ae247975216ba3b798dbf039027', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(16, '8a4ccc6303a87fde5e2a4457a9b984ad', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(17, '19900184056635c40f3579c1510d8a1f', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(18, 'df0d1ff5751f814dadafba1ea52413d6', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(19, '15fede1709895ad450853d00868a9fc2', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(20, '767e77c596f7788a6e33b55588387dbc', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(21, '524bf4224bb8a3393d220ebcad540e11', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(22, '200b19cb2a32aba55d7a77110bc0e505', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(23, '053a3678648e8f6c725245cd157d4123', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(24, '6fc234c0a8b68a716b0855502b482062', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(25, '6c0186636bbcf978c5e06bd59f8dc811', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(26, '61287f7924b3c108da04965e2dc654f5', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(27, '1c7ba7ffec01fc017e8b5bd536b90187', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747633),
(28, 'a33e35ee2effb85ab3686942ee8944b5', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747634),
(29, '2f801bd544e41c69aa2e63925fc266b5', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747634),
(30, 'bad5592308060c65b9dbc9b61de45ca2', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747634),
(31, 'ba71a7d8bbc4de64f96c9d598107ba3f', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402747634),
(32, '5f92dea42c8e4496ac7bb4889529ee6d', '<div class="no-overflow"><p>sads</p></div>', 1402747868),
(33, 'e17df3377eacca1005aa33298e389f50', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(34, 'f01b7e295672f6c0035a8266c50459ef', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(35, '0186a118ba8ae45c7db932e36a653642', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(36, 'd6474bfdec82fb3711e667bc32a4786b', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(37, '408478120306ea02265a02b5598b3673', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(38, 'de08e7b9d3bf8cb4d9c5ddeb3443cfad', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(39, 'a33ff23f40b6cbabd316eb91abf809e2', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(40, '533d30e628c4456b79f14ec335886648', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(41, '6af72562f625e18ddafc767d397ffb6b', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(42, 'd2087126f4ad8dfcfc561d542e88b26e', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(43, 'fcc6725e9389499e606f453f5d1edafe', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(44, 'b2212b8fb081b98d44f8b27cf8d3f7ff', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(45, '56a1bc7a82728090494c01388a2f78c9', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(46, '81b065b93207e7a1f17a52baeb1d8957', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(47, '00f3dbcf2ff6cce6fcc6609f02501c3b', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(48, '89d93db7d371eed7082565f8fded7ea3', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746981),
(49, '6509c996955dcfafa8f0be7979edae4c', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746982),
(50, 'a9cedaaf7981020219b1be99a7202899', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746982),
(51, 'f3f8c130035c35c735ecc6412e612a2e', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746982);
INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(52, 'f0c76bef4b9e70e9fa08cc1c6018eb60', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402746575/docs" />More help</a></div>\n', 1402746982),
(53, 'b1e8d2cbcf9ae65839470e44637e5df8', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747775),
(54, '416473ca865ba25ce251746c9a75ad29', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747775),
(55, '3b9e51c6d2036401edfcaaf9eeac4e8b', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747775),
(56, '446948f96c8916fc55280e30ade2ed5b', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747775),
(57, '4110595329398fbbd2e191f277e1d990', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747775),
(58, 'f4401eee15978425feb9da8439dcc53a', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747775),
(59, '864237b158465a316913a91ccc760011', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747775),
(60, '04cb5f0d9281e1621624bb45c3b44703', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(61, '4d768bbf82a062eb1637678e2ee35a07', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(62, 'adef95fb79ea99eac54fcb387a79f02e', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(63, '9e1cd88e54a4e3e4ba60d5ffd50da46f', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(64, '91af2a0092b230c9788521c9efc329c4', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(65, 'ca83d75c312d29c06a1522266904d3ef', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(66, 'be05cd8a71fa26740113a1ac56a4a3cb', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(67, '6524ef05c5c1e57a6175d821634846da', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(68, '59ca8f876e95f867c55f396e6f2e936f', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(69, '547b259895337603a071dcb99c5129fb', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(70, '177f69fd516ef45f77369df009aca58d', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(71, '522b1dd1e179b10d35012af1ae8bf466', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(72, 'cf20560505092765a658ab89e981b78f', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747769/docs" />More help</a></div>\n', 1402747776),
(73, 'd95d6a2cf5112966f55db526e7886acb', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(74, '66d1c568c7eac90b9cdcc36dd30cef89', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(75, 'dd8cfcec20c561737c37cb47507fde3c', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(76, '659096135e0e17933b0f4485cbacd04a', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(77, 'c36150f330b9ed499c65dfa391c8ebd7', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(78, '72c3297210e5786d7116a0f1f8a7a786', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(79, '676718602bb912a83c8a6ceec14e0d54', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(80, 'b68480202435f269fd08787e6d7e4472', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(81, '7ded26f823bd1499215278dc84f6ae1c', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(82, '3b27426f327e159c808dcb37261cf7fe', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747826),
(83, '72694398aa67800ae97c24dc630ee0aa', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(84, '7129055fa6767e052f747a052c638ae2', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(85, '7ba88383327a5afce366d433015bbd3d', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(86, 'c5ccc4b1deffa3aacc849b9854ddc3b0', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(87, '9e3d92806197c012f10aba2c81c885eb', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(88, '488cd907f238cb008bae0119216d6207', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(89, '669fc3a30614738a4dcafec274e32efa', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(90, 'ca0f0b0a0d41f75e7feede0bf9034a8c', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(91, 'bf5838bfbc413319fd2132638414e6d0', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(92, 'dc32dc40f07f48e53809839858c27379', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747822/docs" />More help</a></div>\n', 1402747827),
(93, 'fba0be9b8c48bc1dea510383613c695e', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805);
INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(94, '44adb5deb7eb52d4d389bb521202b829', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(95, '43b4dd9193793d5e8ad53f55a4a63c14', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(96, 'e277d922f4e206debb2da8811aa77599', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(97, '8f0b84dceedd92c9a09d0ce58a9d88c4', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(98, 'c99523e5daaa641ff9e0c7d0b2130e99', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(99, 'c6227a0cf58f9c97194bf0fcfe4749a6', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(100, '6d1fed260d0ba9dd56929ae827c53860', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(101, '8091c15ad0836f8e1e444f5dd9c8a301', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(102, '115f5dc1ce4717146334872fa5cd8e3f', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(103, '53ac2e58162f650694b991ac2fa07e78', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(104, 'eebbe2b71af2cb11528b6ee95fd95a48', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(105, 'b7a75328f527a86a7951138ebd547957', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(106, 'b9cb8462ecc884ea3550980c09bfa315', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(107, 'bea50478e0119636a5c1bc78a2aac5bd', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(108, '7422ec39477e433fbd2074aa4a3ed716', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752805),
(109, 'e08aa145f36ad8b0c6bd50d715984785', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752806),
(110, '2cccd46035cb3c650ae79df36f49ece3', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752806),
(111, '4956f8c3463ef5868ab39e4cdead1da4', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752806),
(112, 'e59e4abdee66a86cc7f9c39086c752d5', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/essential/core/1402747862/docs" />More help</a></div>\n', 1402752806),
(113, '491219857a5181c41e13642fc72167b1', '<p>abc</p>', 1402750735),
(114, '7840132011c0d498b9f9cc0e789581ea', '<div class="no-overflow"><div class="text_to_html"><p>abc</p></div></div>', 1402750669),
(115, '87438c5455cadd4e1dab18d4e145975e', '<p>abc</p>', 1402750669),
(116, 'f873a2b767301268045888172a7ccee7', '<div class="no-overflow"><p>Front Page</p></div>', 1402752568),
(117, 'ae883cb1dd337e1e23ed369b55a02d83', '<p>Online Tutoring That Delivers Results</p>', 1402752736),
(118, '74411bcd162b03a9f2c983b4c1511f87', '<div class="no-overflow"><div class="text_to_html"><p>Online Tutoring That Delivers Results</p></div></div>', 1402752795),
(119, '049df479de7f6d89fddcf2acf07395cb', '<p>Online Tutoring That Delivers Results</p>', 1402752795),
(120, 'f294ea573df134e1fe5f87369850535b', '<div class="no-overflow"><p>&lt;!DOCTYPE html&gt;<br />&lt;html&gt;<br /> &lt;head&gt;<br /> &lt;title&gt;Top Grader&lt;/title&gt;<br /> <br /> &lt;link rel="stylesheet" type="text/css" href="main.css" /&gt;<br /> <br /> &lt;!--&lt;script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"&gt;&lt;/script&gt;--&gt;<br /> &lt;script src="js/jquery.js"&gt;&lt;/script&gt;<br /> &lt;script src="js/animations.js"&gt;&lt;/script&gt;<br /> &lt;script src="http://jarallax.com/download/jarallax-min-0.2.js" type="text/javascript"&gt;&lt;/script&gt;<br /> &lt;/head&gt;<br /> &lt;body onload="init()"&gt;<br /> <br /> &lt;div class="content"&gt;<br /> &lt;span class="planet0"&gt;&lt;/span&gt;</p>\r\n<p>&lt;div class="header"&gt;<br /> &lt;h1&gt;Helping students improve grades in USA, Canada, UK, Singapore and Australia&lt;/h1&gt;<br /> &lt;/div&gt;<br /> <br /> &lt;h2 id="head1"&gt;1-on-1 Quality Online Tutoring for Grades K - 12&lt;/h2&gt;<br /> &lt;p id="p1"&gt;<br /> Our experienced, professional tutors will help you with:<br /> <br /> Homework/Assignment &lt;br/&gt;<br /> Test preparation in SCAT/GT/Other&lt;br/&gt;<br /> Advanced Placement(AP) classes&lt;br/&gt;<br /> Projects&lt;br/&gt;<br /> Research Reports&lt;br/&gt;<br /> ...and any other service to help excel in school</p>\r\n<p><br /> &lt;/p&gt;<br /> &lt;h2 id="head2"&gt;Our Results&lt;/h2&gt;<br /> &lt;p id="p2"&gt;<br /> 86% of our students reported a 90+ percentile score on SCAT&lt;br/&gt;<br /> 92% of our students reported improvement in grades&lt;br/&gt;<br /> 94% of the students experienced an improvement in their confidence in solving Math problems&lt;br/&gt;<br /> 95% of the parents said they are completely satisfied with Top Grader online tutoring &lt;br/&gt;<br /> &lt;/p&gt;<br /> &lt;h2 id="head3"&gt;Get Better Tutoring, Get Better Results!&lt;/h2&gt;<br /> &lt;p id="p3"&gt;<br /> &lt;a class="button" href="http://jarallax.com/download"&gt;Sign Up Now!&lt;/a&gt;<br /> &lt;/p&gt;<br /> &lt;/div&gt;<br /> &lt;script type="text/javascript"&gt;<br /> try{ <br /> var pageTracker = _gat._getTracker("UA-26904605-1");<br /> pageTracker._trackPageview();<br /> } catch(err) {} <br /> &lt;/script&gt;<br /> &lt;/body&gt;<br />&lt;/html&gt;</p></div>', 1402752658),
(121, '74d51ca3e9a2ecf66bf5bc5e5e17b6f6', '<div class="no-overflow"><title>Top Grader</title>\r\n<p><link rel="stylesheet" type="text/css" href="http://localhost/moodle/main.css" /> </p>\r\n<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>-->\r\n<script src="http://localhost/moodle/js/jquery.js" type="text/javascript"></script>\r\n<script src="http://localhost/moodle/js/animations.js" type="text/javascript"></script>\r\n<script src="http://jarallax.com/download/jarallax-min-0.2.js" type="text/javascript"></script>\r\n<div class="content"><span class="planet0"></span>\r\n<div class="header">\r\n<h1>Helping students improve grades in USA, Canada, UK, Singapore and Australia</h1>\r\n</div>\r\n<h2 id="head1">1-on-1 Quality Online Tutoring for Grades K - 12</h2>\r\n<p id="p1">Our experienced, professional tutors will help you with: Homework/Assignment <br /> Test preparation in SCAT/GT/Other<br /> Advanced Placement(AP) classes<br /> Projects<br /> Research Reports<br /> ...and any other service to help excel in school</p>\r\n<h2 id="head2">Our Results</h2>\r\n<p id="p2">86% of our students reported a 90+ percentile score on SCAT<br /> 92% of our students reported improvement in grades<br /> 94% of the students experienced an improvement in their confidence in solving Math problems<br /> 95% of the parents said they are completely satisfied with Top Grader online tutoring </p>\r\n<h2 id="head3">Get Better Tutoring, Get Better Results!</h2>\r\n<p id="p3"><a class="button" href="http://jarallax.com/download">Sign Up Now!</a></p>\r\n</div>\r\n<script type="text/javascript">// <![CDATA[\r\n      try{ \r\n      var pageTracker = _gat._getTracker("UA-26904605-1");\r\n      pageTracker._trackPageview();\r\n      } catch(err) {} \r\n    \r\n// ]]></script></div>', 1402752784);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities' AUTO_INCREMENT=501 ;

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(39, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(40, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(41, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(42, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(43, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(44, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(45, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(46, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(47, 'moodle/role:review', 'read', 50, 'moodle', 8),
(48, 'moodle/role:override', 'write', 50, 'moodle', 28),
(49, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(50, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(51, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(52, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(53, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(54, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(55, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(56, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(57, 'moodle/course:create', 'write', 40, 'moodle', 4),
(58, 'moodle/course:request', 'write', 10, 'moodle', 0),
(59, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(60, 'moodle/course:update', 'write', 50, 'moodle', 4),
(61, 'moodle/course:view', 'read', 50, 'moodle', 0),
(62, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(63, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(64, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(65, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(66, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(67, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(68, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(69, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(70, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(71, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(72, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(73, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(74, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(76, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(77, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(78, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(79, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(80, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(81, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(82, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(83, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(84, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(85, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(86, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(87, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(88, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(89, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(90, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(91, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(92, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(93, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(94, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(95, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(96, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(97, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(98, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(99, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(100, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(101, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(102, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(103, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(104, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(105, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(106, 'moodle/question:add', 'write', 50, 'moodle', 20),
(107, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(108, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(109, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(110, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(111, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(112, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(113, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(114, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(115, 'moodle/question:config', 'write', 10, 'moodle', 2),
(116, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(117, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(118, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(119, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(120, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(121, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(122, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(123, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(124, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(125, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(126, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(127, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(128, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(129, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(130, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(131, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(132, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(133, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(134, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(135, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(136, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(137, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(138, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(139, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(140, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(141, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(142, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(143, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(144, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(145, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(146, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(147, 'moodle/block:view', 'read', 80, 'moodle', 0),
(148, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(149, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(150, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(151, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(152, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(153, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(154, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(155, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(156, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(157, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(158, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(159, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(160, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(161, 'moodle/community:add', 'write', 10, 'moodle', 0),
(162, 'moodle/community:download', 'write', 10, 'moodle', 0),
(163, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(164, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(165, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(166, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(167, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(168, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(169, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(170, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(171, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 0),
(172, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(173, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(174, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(175, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(176, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(177, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(178, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(179, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(180, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(181, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(182, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
(183, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
(184, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
(185, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
(186, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(187, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(188, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(189, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(190, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(191, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(192, 'mod/book:read', 'read', 70, 'mod_book', 0),
(193, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(194, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(195, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(196, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(197, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(198, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(199, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(200, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(201, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(202, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(203, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(204, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(205, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(206, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(207, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(208, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(209, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(210, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(211, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(212, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(213, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(214, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(215, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(216, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(217, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(218, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(219, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(220, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(221, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(222, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(223, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(224, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(225, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(226, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(227, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(228, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(229, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(230, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(231, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(232, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(233, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(234, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(235, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(236, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(237, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(238, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(239, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(240, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(241, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(242, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(243, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(244, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(245, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(246, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(247, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(248, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(249, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(250, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(251, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(252, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(253, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(254, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(255, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(256, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(257, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(258, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(259, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(260, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(261, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(262, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(263, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(264, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(265, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(266, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(267, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(268, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(269, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(270, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(271, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(272, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(273, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(274, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(275, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(276, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(277, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(278, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(279, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(280, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(281, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(282, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(283, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(284, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(285, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(286, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(287, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(288, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(289, 'mod/lti:grade', 'write', 70, 'mod_lti', 8),
(290, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(291, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(292, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(293, 'mod/page:view', 'read', 70, 'mod_page', 0),
(294, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(295, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(296, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(297, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(298, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(299, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(300, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(301, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(302, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(303, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(304, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(305, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(306, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(307, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(308, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(309, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(310, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(311, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(312, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(313, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(314, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(315, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(316, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(317, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(318, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(319, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(320, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(321, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(322, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(323, 'mod/url:view', 'read', 70, 'mod_url', 0),
(324, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(325, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(326, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(327, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(328, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(329, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(330, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(331, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(332, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(333, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(334, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(335, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(336, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(337, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(338, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(339, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(340, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(341, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(342, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(343, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(344, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(345, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(346, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(347, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(348, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(349, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(350, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(351, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(352, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(353, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(354, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(355, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(356, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(357, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(358, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(359, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(360, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(361, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(362, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(363, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(364, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(365, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(366, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(367, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(368, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(369, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(370, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(371, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(372, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(373, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(374, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(375, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(376, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(377, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(378, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(379, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(380, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(381, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(382, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(383, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(384, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(385, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(386, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(387, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(388, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(389, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(390, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(391, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(392, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(393, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(394, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(395, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(396, 'block/course_overview:addinstance', 'write', 80, 'block_course_overview', 20),
(397, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(398, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(399, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(400, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(401, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(402, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(403, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(404, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(405, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(406, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(407, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(408, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(409, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(410, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(411, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(412, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(413, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(414, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(415, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(416, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(417, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(418, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(419, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(420, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(421, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(422, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(423, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(424, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(425, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(426, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(427, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(428, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(429, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(430, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(431, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(432, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(433, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(434, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(435, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(436, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(437, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(438, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(439, 'report/completion:view', 'read', 50, 'report_completion', 8),
(440, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(441, 'report/log:view', 'read', 50, 'report_log', 8),
(442, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(443, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(444, 'report/outline:view', 'read', 50, 'report_outline', 8),
(445, 'report/participation:view', 'read', 50, 'report_participation', 8),
(446, 'report/performance:view', 'read', 10, 'report_performance', 2),
(447, 'report/progress:view', 'read', 50, 'report_progress', 8),
(448, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(449, 'report/security:view', 'read', 10, 'report_security', 2),
(450, 'report/stats:view', 'read', 50, 'report_stats', 8),
(451, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(452, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(453, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(454, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(455, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(456, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(457, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(458, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(459, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(460, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(461, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(462, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(463, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(464, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(465, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(466, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(467, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(468, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(469, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(470, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(471, 'repository/areafiles:view', 'read', 70, 'repository_areafiles', 0),
(472, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(473, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(474, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(475, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(476, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(477, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(478, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(479, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(480, 'repository/local:view', 'read', 70, 'repository_local', 0),
(481, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(482, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(483, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(484, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(485, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
(486, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(487, 'repository/url:view', 'read', 70, 'repository_url', 0),
(488, 'repository/user:view', 'read', 70, 'repository_user', 0),
(489, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(490, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(491, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(492, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(493, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(494, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16),
(495, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(496, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(497, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(498, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(499, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(500, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables' AUTO_INCREMENT=445 ;

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'essential'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'CKVgFwGBpQ7BG4YxGq0fQsD8fPYh7IaKlocalhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '1402747862'),
(21, 'jsrev', '1402746413'),
(22, 'gdversion', '2'),
(23, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(24, 'version', '2013111803'),
(25, 'enableoutcomes', '0'),
(26, 'usecomments', '1'),
(27, 'usetags', '1'),
(28, 'enablenotes', '1'),
(29, 'enableportfolios', '0'),
(30, 'enablewebservices', '0'),
(31, 'messaging', '1'),
(32, 'messaginghidereadnotifications', '0'),
(33, 'messagingdeletereadnotificationsdelay', '604800'),
(34, 'messagingallowemailoverride', '0'),
(35, 'enablestats', '0'),
(36, 'enablerssfeeds', '0'),
(37, 'enableblogs', '1'),
(38, 'enablecompletion', '0'),
(39, 'completiondefault', '1'),
(40, 'enableavailability', '0'),
(41, 'enableplagiarism', '0'),
(42, 'enablebadges', '1'),
(43, 'autologinguests', '0'),
(44, 'hiddenuserfields', ''),
(45, 'showuseridentity', 'email'),
(46, 'fullnamedisplay', 'language'),
(47, 'maxusersperpage', '100'),
(48, 'enablegravatar', '0'),
(49, 'gravatardefaulturl', 'mm'),
(50, 'enablecourserequests', '0'),
(51, 'defaultrequestcategory', '1'),
(52, 'requestcategoryselection', '0'),
(53, 'courserequestnotify', ''),
(54, 'grade_profilereport', 'user'),
(55, 'grade_aggregationposition', '1'),
(56, 'grade_includescalesinaggregation', '1'),
(57, 'grade_hiddenasdate', '0'),
(58, 'gradepublishing', '0'),
(59, 'grade_export_displaytype', '1'),
(60, 'grade_export_decimalpoints', '2'),
(61, 'grade_navmethod', '0'),
(62, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(63, 'grade_export_customprofilefields', ''),
(64, 'recovergradesdefault', '0'),
(65, 'gradeexport', ''),
(66, 'unlimitedgrades', '0'),
(67, 'grade_hideforcedsettings', '1'),
(68, 'grade_aggregation', '11'),
(69, 'grade_aggregation_flag', '0'),
(70, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(71, 'grade_aggregateonlygraded', '1'),
(72, 'grade_aggregateonlygraded_flag', '2'),
(73, 'grade_aggregateoutcomes', '0'),
(74, 'grade_aggregateoutcomes_flag', '2'),
(75, 'grade_aggregatesubcats', '0'),
(76, 'grade_aggregatesubcats_flag', '2'),
(77, 'grade_keephigh', '0'),
(78, 'grade_keephigh_flag', '3'),
(79, 'grade_droplow', '0'),
(80, 'grade_droplow_flag', '2'),
(81, 'grade_displaytype', '1'),
(82, 'grade_decimalpoints', '2'),
(83, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(84, 'grade_report_studentsperpage', '100'),
(85, 'grade_report_showonlyactiveenrol', '1'),
(86, 'grade_report_quickgrading', '1'),
(87, 'grade_report_showquickfeedback', '0'),
(88, 'grade_report_fixedstudents', '0'),
(89, 'grade_report_meanselection', '1'),
(90, 'grade_report_enableajax', '0'),
(91, 'grade_report_showcalculations', '0'),
(92, 'grade_report_showeyecons', '0'),
(93, 'grade_report_showaverages', '1'),
(94, 'grade_report_showlocks', '0'),
(95, 'grade_report_showranges', '0'),
(96, 'grade_report_showanalysisicon', '1'),
(97, 'grade_report_showuserimage', '1'),
(98, 'grade_report_showactivityicons', '1'),
(99, 'grade_report_shownumberofgrades', '0'),
(100, 'grade_report_averagesdisplaytype', 'inherit'),
(101, 'grade_report_rangesdisplaytype', 'inherit'),
(102, 'grade_report_averagesdecimalpoints', 'inherit'),
(103, 'grade_report_rangesdecimalpoints', 'inherit'),
(104, 'grade_report_overview_showrank', '0'),
(105, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(106, 'grade_report_user_showrank', '0'),
(107, 'grade_report_user_showpercentage', '1'),
(108, 'grade_report_user_showgrade', '1'),
(109, 'grade_report_user_showfeedback', '1'),
(110, 'grade_report_user_showrange', '1'),
(111, 'grade_report_user_showweight', '0'),
(112, 'grade_report_user_showaverage', '0'),
(113, 'grade_report_user_showlettergrade', '0'),
(114, 'grade_report_user_rangedecimals', '0'),
(115, 'grade_report_user_showhiddenitems', '1'),
(116, 'grade_report_user_showtotalsifcontainhidden', '0'),
(117, 'badges_defaultissuername', ''),
(118, 'badges_defaultissuercontact', ''),
(119, 'badges_badgesalt', 'badges1402744563'),
(120, 'badges_allowexternalbackpack', '1'),
(121, 'badges_allowcoursebadges', '1'),
(122, 'timezone', '99'),
(123, 'forcetimezone', '99'),
(124, 'country', '0'),
(125, 'defaultcity', ''),
(126, 'geoipfile', 'C:\\wamp\\moodledata/geoip/GeoLiteCity.dat'),
(127, 'googlemapkey3', ''),
(128, 'allcountrycodes', ''),
(129, 'autolang', '1'),
(130, 'lang', 'en'),
(131, 'langmenu', '1'),
(132, 'langlist', ''),
(133, 'langrev', '1402746413'),
(134, 'langcache', '1'),
(135, 'langstringcache', '1'),
(136, 'locale', ''),
(137, 'latinexcelexport', '0'),
(139, 'authpreventaccountcreation', '0'),
(140, 'loginpageautofocus', '0'),
(141, 'guestloginbutton', '1'),
(142, 'alternateloginurl', ''),
(143, 'forgottenpasswordurl', ''),
(144, 'auth_instructions', ''),
(145, 'allowemailaddresses', ''),
(146, 'denyemailaddresses', ''),
(147, 'verifychangedemail', '1'),
(148, 'recaptchapublickey', ''),
(149, 'recaptchaprivatekey', ''),
(150, 'sitedefaultlicense', 'allrightsreserved'),
(151, 'cachetext', '60'),
(152, 'filteruploadedfiles', '0'),
(153, 'filtermatchoneperpage', '0'),
(154, 'filtermatchonepertext', '0'),
(155, 'portfolio_moderate_filesize_threshold', '1048576'),
(156, 'portfolio_high_filesize_threshold', '5242880'),
(157, 'portfolio_moderate_db_threshold', '20'),
(158, 'portfolio_high_db_threshold', '50'),
(159, 'repositorycacheexpire', '120'),
(160, 'repositoryallowexternallinks', '1'),
(161, 'legacyfilesinnewcourses', '0'),
(162, 'legacyfilesaddallowed', '1'),
(163, 'mobilecssurl', ''),
(164, 'enablewsdocumentation', '0'),
(165, 'allowbeforeblock', '0'),
(166, 'allowedip', ''),
(167, 'blockedip', ''),
(168, 'protectusernames', '1'),
(169, 'forcelogin', '0'),
(170, 'forceloginforprofiles', '1'),
(171, 'forceloginforprofileimage', '0'),
(172, 'opentogoogle', '0'),
(173, 'maxbytes', '0'),
(174, 'userquota', '104857600'),
(175, 'allowobjectembed', '0'),
(176, 'enabletrusttext', '0'),
(177, 'maxeditingtime', '1800'),
(178, 'extendedusernamechars', '0'),
(179, 'sitepolicy', ''),
(180, 'sitepolicyguest', ''),
(181, 'keeptagnamecase', '1'),
(182, 'profilesforenrolledusersonly', '1'),
(183, 'cronclionly', '0'),
(184, 'cronremotepassword', ''),
(185, 'lockoutthreshold', '0'),
(186, 'lockoutwindow', '1800'),
(187, 'lockoutduration', '1800'),
(188, 'passwordpolicy', '1'),
(189, 'minpasswordlength', '8'),
(190, 'minpassworddigits', '1'),
(191, 'minpasswordlower', '1'),
(192, 'minpasswordupper', '1'),
(193, 'minpasswordnonalphanum', '1'),
(194, 'maxconsecutiveidentchars', '0'),
(195, 'pwresettime', '1800'),
(196, 'groupenrolmentkeypolicy', '1'),
(197, 'disableuserimages', '0'),
(198, 'emailchangeconfirmation', '1'),
(199, 'rememberusername', '2'),
(200, 'strictformsrequired', '0'),
(201, 'loginhttps', '0'),
(202, 'cookiesecure', '0'),
(203, 'cookiehttponly', '0'),
(204, 'allowframembedding', '0'),
(205, 'loginpasswordautocomplete', '0'),
(206, 'displayloginfailures', ''),
(207, 'notifyloginfailures', ''),
(208, 'notifyloginthreshold', '10'),
(209, 'runclamonupload', '0'),
(210, 'pathtoclam', ''),
(211, 'quarantinedir', ''),
(212, 'clamfailureonupload', 'donothing'),
(213, 'themelist', ''),
(214, 'themedesignermode', '0'),
(215, 'allowuserthemes', '0'),
(216, 'allowcoursethemes', '0'),
(217, 'allowcategorythemes', '0'),
(218, 'allowthemechangeonurl', '0'),
(219, 'allowuserblockhiding', '1'),
(220, 'allowblockstodock', '1'),
(221, 'custommenuitems', ''),
(222, 'enabledevicedetection', '1'),
(223, 'devicedetectregex', '[]'),
(224, 'calendartype', 'gregorian'),
(225, 'calendar_adminseesall', '0'),
(226, 'calendar_site_timeformat', '0'),
(227, 'calendar_startwday', '0'),
(228, 'calendar_weekend', '65'),
(229, 'calendar_lookahead', '21'),
(230, 'calendar_maxevents', '10'),
(231, 'enablecalendarexport', '1'),
(232, 'calendar_customexport', '1'),
(233, 'calendar_exportlookahead', '365'),
(234, 'calendar_exportlookback', '5'),
(235, 'calendar_exportsalt', 'Q7RVvQQEjrHL9wmhiZJR6TLF1BPGCANyU2lAb123txfHWagOZ45oAOSe2sVg'),
(236, 'calendar_showicalsource', '1'),
(237, 'useblogassociations', '1'),
(238, 'bloglevel', '4'),
(239, 'useexternalblogs', '1'),
(240, 'externalblogcrontime', '86400'),
(241, 'maxexternalblogsperuser', '1'),
(242, 'blogusecomments', '1'),
(243, 'blogshowcommentscount', '1'),
(244, 'defaulthomepage', '0'),
(245, 'allowguestmymoodle', '1'),
(246, 'navshowfullcoursenames', '0'),
(247, 'navshowcategories', '1'),
(248, 'navshowmycoursecategories', '0'),
(249, 'navshowallcourses', '0'),
(250, 'navsortmycoursessort', 'sortorder'),
(251, 'navcourselimit', '20'),
(252, 'usesitenameforsitepages', '0'),
(253, 'linkadmincategories', '0'),
(254, 'navshowfrontpagemods', '1'),
(255, 'navadduserpostslinks', '1'),
(256, 'formatstringstriptags', '1'),
(257, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(258, 'core_media_enable_youtube', '1'),
(259, 'core_media_enable_vimeo', '0'),
(260, 'core_media_enable_mp3', '1'),
(261, 'core_media_enable_flv', '1'),
(262, 'core_media_enable_swf', '1'),
(263, 'core_media_enable_html5audio', '1'),
(264, 'core_media_enable_html5video', '1'),
(265, 'core_media_enable_qt', '1'),
(266, 'core_media_enable_wmp', '1'),
(267, 'core_media_enable_rm', '1'),
(268, 'docroot', 'http://docs.moodle.org'),
(269, 'doctonewwindow', '0'),
(270, 'courselistshortnames', '0'),
(271, 'coursesperpage', '20'),
(272, 'courseswithsummarieslimit', '10'),
(273, 'courseoverviewfileslimit', '1'),
(274, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(275, 'enableajax', '1'),
(276, 'useexternalyui', '0'),
(277, 'yuicomboloading', '1'),
(278, 'cachejs', '1'),
(279, 'modchooserdefault', '1'),
(280, 'modeditingmenu', '1'),
(281, 'blockeditingmenu', '1'),
(282, 'additionalhtmlhead', ''),
(283, 'additionalhtmltopofbody', ''),
(284, 'additionalhtmlfooter', ''),
(285, 'pathtodu', ''),
(286, 'aspellpath', ''),
(287, 'pathtodot', ''),
(288, 'supportpage', ''),
(289, 'dbsessions', '0'),
(290, 'sessioncookie', ''),
(291, 'sessioncookiepath', ''),
(292, 'sessioncookiedomain', ''),
(293, 'statsfirstrun', 'none'),
(294, 'statsmaxruntime', '0'),
(295, 'statsruntimedays', '31'),
(296, 'statsruntimestarthour', '0'),
(297, 'statsruntimestartminute', '0'),
(298, 'statsuserthreshold', '0'),
(299, 'slasharguments', '1'),
(300, 'getremoteaddrconf', '0'),
(301, 'proxyhost', ''),
(302, 'proxyport', '0'),
(303, 'proxytype', 'HTTP'),
(304, 'proxyuser', ''),
(305, 'proxypassword', ''),
(306, 'proxybypass', 'localhost, 127.0.0.1'),
(307, 'maintenance_enabled', '0'),
(308, 'maintenance_message', ''),
(309, 'deleteunconfirmed', '168'),
(310, 'deleteincompleteusers', '0'),
(311, 'logguests', '1'),
(312, 'loglifetime', '0'),
(313, 'disablegradehistory', '0'),
(314, 'gradehistorylifetime', '0'),
(315, 'extramemorylimit', '512M'),
(316, 'curlcache', '120'),
(317, 'curltimeoutkbitrate', '56'),
(318, 'updateautocheck', '1'),
(319, 'updateautodeploy', '0'),
(320, 'updateminmaturity', '200'),
(321, 'updatenotifybuilds', '0'),
(322, 'enablesafebrowserintegration', '0'),
(323, 'enablegroupmembersonly', '0'),
(324, 'dndallowtextandlinks', '0'),
(325, 'enablecssoptimiser', '0'),
(326, 'enabletgzbackups', '0'),
(327, 'debug', '0'),
(328, 'debugdisplay', '1'),
(329, 'debugsmtp', '0'),
(330, 'perfdebug', '7'),
(331, 'debugstringids', '0'),
(332, 'debugvalidators', '0'),
(333, 'debugpageinfo', '0'),
(334, 'profilingenabled', '0'),
(335, 'profilingincluded', ''),
(336, 'profilingexcluded', ''),
(337, 'profilingautofrec', '0'),
(338, 'profilingallowme', '0'),
(339, 'profilingallowall', '0'),
(340, 'profilinglifetime', '1440'),
(341, 'profilingimportprefix', '(I)'),
(342, 'release', '2.6.3 (Build: 20140512)'),
(343, 'branch', '26'),
(344, 'localcachedirpurged', '1402746413'),
(345, 'allversionshash', 'eb7ab4c035bc81c2bd778e15831ab69a0735ff94'),
(347, 'notloggedinroleid', '6'),
(348, 'guestroleid', '6'),
(349, 'defaultuserroleid', '7'),
(350, 'creatornewroleid', '3'),
(351, 'restorernewroleid', '3'),
(352, 'gradebookroles', '5'),
(353, 'assignment_maxbytes', '1048576'),
(354, 'assignment_itemstocount', '1'),
(355, 'assignment_showrecentsubmissions', '1'),
(356, 'chat_method', 'ajax'),
(357, 'chat_refresh_userlist', '10'),
(358, 'chat_old_ping', '35'),
(359, 'chat_refresh_room', '5'),
(360, 'chat_normal_updatemode', 'jsupdate'),
(361, 'chat_serverhost', 'localhost'),
(362, 'chat_serverip', '127.0.0.1'),
(363, 'chat_serverport', '9111'),
(364, 'chat_servermax', '100'),
(365, 'data_enablerssfeeds', '0'),
(366, 'feedback_allowfullanonymous', '0'),
(367, 'forum_displaymode', '3'),
(368, 'forum_replytouser', '1'),
(369, 'forum_shortpost', '300'),
(370, 'forum_longpost', '600'),
(371, 'forum_manydiscussions', '100'),
(372, 'forum_maxbytes', '512000'),
(373, 'forum_maxattachments', '9'),
(374, 'forum_trackingtype', '1'),
(375, 'forum_trackreadposts', '1'),
(376, 'forum_allowforcedreadtracking', '0'),
(377, 'forum_oldpostdays', '14'),
(378, 'forum_usermarksread', '0'),
(379, 'forum_cleanreadtime', '2'),
(380, 'digestmailtime', '17'),
(381, 'forum_enablerssfeeds', '0'),
(382, 'forum_enabletimedposts', '0'),
(383, 'glossary_entbypage', '10'),
(384, 'glossary_dupentries', '0'),
(385, 'glossary_allowcomments', '0'),
(386, 'glossary_linkbydefault', '1'),
(387, 'glossary_defaultapproval', '1'),
(388, 'glossary_enablerssfeeds', '0'),
(389, 'glossary_linkentries', '0'),
(390, 'glossary_casesensitive', '0'),
(391, 'glossary_fullmatch', '0'),
(392, 'lesson_slideshowwidth', '640'),
(393, 'lesson_slideshowheight', '480'),
(394, 'lesson_slideshowbgcolor', '#FFFFFF'),
(395, 'lesson_mediawidth', '640'),
(396, 'lesson_mediaheight', '480'),
(397, 'lesson_mediaclose', '0'),
(398, 'lesson_maxhighscores', '10'),
(399, 'lesson_maxanswers', '4'),
(400, 'lesson_defaultnextpage', '0'),
(401, 'block_course_list_adminview', 'all'),
(402, 'block_course_list_hideallcourseslink', '0'),
(403, 'block_html_allowcssclasses', '0'),
(404, 'block_online_users_timetosee', '5'),
(405, 'block_rss_client_num_entries', '5'),
(406, 'block_rss_client_timeout', '30'),
(407, 'block_tags_showcoursetags', '0'),
(408, 'smtphosts', ''),
(409, 'smtpsecure', ''),
(410, 'smtpuser', ''),
(411, 'smtppass', ''),
(412, 'smtpmaxbulk', '1'),
(413, 'noreplyaddress', 'noreply@localhost'),
(414, 'sitemailcharset', '0'),
(415, 'allowusermailcharset', '0'),
(416, 'allowattachments', '1'),
(417, 'mailnewline', 'LF'),
(418, 'jabberhost', ''),
(419, 'jabberserver', ''),
(420, 'jabberusername', ''),
(421, 'jabberpassword', ''),
(422, 'jabberport', '5222'),
(423, 'filter_censor_badwords', ''),
(424, 'filter_multilang_force_old', '0'),
(425, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(426, 'filter_tex_latexbackground', '#FFFFFF'),
(427, 'filter_tex_density', '120'),
(428, 'filter_tex_pathlatex', '"c:\\texmf\\miktex\\bin\\latex.exe" '),
(429, 'filter_tex_pathdvips', '"c:\\texmf\\miktex\\bin\\dvips.exe" '),
(430, 'filter_tex_pathconvert', '"c:\\imagemagick\\convert.exe" '),
(431, 'filter_tex_convertformat', 'gif'),
(432, 'profileroles', '5,4,3'),
(433, 'coursecontact', '3'),
(434, 'frontpage', ''),
(435, 'frontpageloggedin', ''),
(436, 'maxcategorydepth', '2'),
(437, 'frontpagecourselimit', '200'),
(438, 'commentsperpage', '15'),
(439, 'defaultfrontpageroleid', '8'),
(440, 'supportname', 'Admin User'),
(441, 'supportemail', 'md.j.shakir@gmail.com'),
(442, 'registerauth', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=1060 ;

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1402744601, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1402744601, NULL, 'usecomments', '1', NULL),
(3, 0, 1402744602, NULL, 'usetags', '1', NULL),
(4, 0, 1402744602, NULL, 'enablenotes', '1', NULL),
(5, 0, 1402744602, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1402744602, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1402744602, NULL, 'messaging', '1', NULL),
(8, 0, 1402744602, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1402744602, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1402744602, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1402744602, NULL, 'enablestats', '0', NULL),
(12, 0, 1402744602, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1402744603, NULL, 'enableblogs', '1', NULL),
(14, 0, 1402744603, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1402744603, NULL, 'completiondefault', '1', NULL),
(16, 0, 1402744603, NULL, 'enableavailability', '0', NULL),
(17, 0, 1402744603, NULL, 'enableplagiarism', '0', NULL),
(18, 0, 1402744603, NULL, 'enablebadges', '1', NULL),
(19, 0, 1402744603, NULL, 'autologinguests', '0', NULL),
(20, 0, 1402744603, NULL, 'hiddenuserfields', '', NULL),
(21, 0, 1402744604, NULL, 'showuseridentity', 'email', NULL),
(22, 0, 1402744604, NULL, 'fullnamedisplay', 'language', NULL),
(23, 0, 1402744604, NULL, 'maxusersperpage', '100', NULL),
(24, 0, 1402744604, NULL, 'enablegravatar', '0', NULL),
(25, 0, 1402744604, NULL, 'gravatardefaulturl', 'mm', NULL),
(26, 0, 1402744604, 'moodlecourse', 'visible', '1', NULL),
(27, 0, 1402744604, 'moodlecourse', 'format', 'weeks', NULL),
(28, 0, 1402744604, 'moodlecourse', 'maxsections', '52', NULL),
(29, 0, 1402744604, 'moodlecourse', 'numsections', '10', NULL),
(30, 0, 1402744604, 'moodlecourse', 'hiddensections', '0', NULL),
(31, 0, 1402744604, 'moodlecourse', 'coursedisplay', '0', NULL),
(32, 0, 1402744604, 'moodlecourse', 'lang', '', NULL),
(33, 0, 1402744605, 'moodlecourse', 'newsitems', '5', NULL),
(34, 0, 1402744605, 'moodlecourse', 'showgrades', '1', NULL),
(35, 0, 1402744605, 'moodlecourse', 'showreports', '0', NULL),
(36, 0, 1402744605, 'moodlecourse', 'maxbytes', '0', NULL),
(37, 0, 1402744605, 'moodlecourse', 'enablecompletion', '0', NULL),
(38, 0, 1402744605, 'moodlecourse', 'groupmode', '0', NULL),
(39, 0, 1402744605, 'moodlecourse', 'groupmodeforce', '0', NULL),
(40, 0, 1402744605, NULL, 'enablecourserequests', '0', NULL),
(41, 0, 1402744605, NULL, 'defaultrequestcategory', '1', NULL),
(42, 0, 1402744605, NULL, 'requestcategoryselection', '0', NULL),
(43, 0, 1402744605, NULL, 'courserequestnotify', '', NULL),
(44, 0, 1402744605, 'backup', 'loglifetime', '30', NULL),
(45, 0, 1402744606, 'backup', 'backup_general_users', '1', NULL),
(46, 0, 1402744606, 'backup', 'backup_general_users_locked', '', NULL),
(47, 0, 1402744606, 'backup', 'backup_general_anonymize', '0', NULL),
(48, 0, 1402744606, 'backup', 'backup_general_anonymize_locked', '', NULL),
(49, 0, 1402744606, 'backup', 'backup_general_role_assignments', '1', NULL),
(50, 0, 1402744606, 'backup', 'backup_general_role_assignments_locked', '', NULL),
(51, 0, 1402744606, 'backup', 'backup_general_activities', '1', NULL),
(52, 0, 1402744606, 'backup', 'backup_general_activities_locked', '', NULL),
(53, 0, 1402744606, 'backup', 'backup_general_blocks', '1', NULL),
(54, 0, 1402744606, 'backup', 'backup_general_blocks_locked', '', NULL),
(55, 0, 1402744606, 'backup', 'backup_general_filters', '1', NULL),
(56, 0, 1402744606, 'backup', 'backup_general_filters_locked', '', NULL),
(57, 0, 1402744606, 'backup', 'backup_general_comments', '1', NULL),
(58, 0, 1402744606, 'backup', 'backup_general_comments_locked', '', NULL),
(59, 0, 1402744607, 'backup', 'backup_general_badges', '1', NULL),
(60, 0, 1402744607, 'backup', 'backup_general_badges_locked', '', NULL),
(61, 0, 1402744607, 'backup', 'backup_general_userscompletion', '1', NULL),
(62, 0, 1402744607, 'backup', 'backup_general_userscompletion_locked', '', NULL),
(63, 0, 1402744607, 'backup', 'backup_general_logs', '0', NULL),
(64, 0, 1402744607, 'backup', 'backup_general_logs_locked', '', NULL),
(65, 0, 1402744607, 'backup', 'backup_general_histories', '0', NULL),
(66, 0, 1402744608, 'backup', 'backup_general_histories_locked', '', NULL),
(67, 0, 1402744608, 'backup', 'backup_general_questionbank', '1', NULL),
(68, 0, 1402744608, 'backup', 'backup_general_questionbank_locked', '', NULL),
(69, 0, 1402744608, 'backup', 'import_general_maxresults', '10', NULL),
(70, 0, 1402744608, 'backup', 'backup_auto_active', '0', NULL),
(71, 0, 1402744608, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(72, 0, 1402744608, 'backup', 'backup_auto_hour', '0', NULL),
(73, 0, 1402744608, 'backup', 'backup_auto_minute', '0', NULL),
(74, 0, 1402744608, 'backup', 'backup_auto_storage', '0', NULL),
(75, 0, 1402744609, 'backup', 'backup_auto_destination', '', NULL),
(76, 0, 1402744609, 'backup', 'backup_auto_keep', '1', NULL),
(77, 0, 1402744609, 'backup', 'backup_shortname', '0', NULL),
(78, 0, 1402744609, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(79, 0, 1402744609, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(80, 0, 1402744609, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(81, 0, 1402744609, 'backup', 'backup_auto_users', '1', NULL),
(82, 0, 1402744609, 'backup', 'backup_auto_role_assignments', '1', NULL),
(83, 0, 1402744609, 'backup', 'backup_auto_activities', '1', NULL),
(84, 0, 1402744609, 'backup', 'backup_auto_blocks', '1', NULL),
(85, 0, 1402744609, 'backup', 'backup_auto_filters', '1', NULL),
(86, 0, 1402744610, 'backup', 'backup_auto_comments', '1', NULL),
(87, 0, 1402744610, 'backup', 'backup_auto_badges', '1', NULL),
(88, 0, 1402744610, 'backup', 'backup_auto_userscompletion', '1', NULL),
(89, 0, 1402744610, 'backup', 'backup_auto_logs', '0', NULL),
(90, 0, 1402744610, 'backup', 'backup_auto_histories', '0', NULL),
(91, 0, 1402744610, 'backup', 'backup_auto_questionbank', '1', NULL),
(92, 0, 1402744610, NULL, 'grade_profilereport', 'user', NULL),
(93, 0, 1402744610, NULL, 'grade_aggregationposition', '1', NULL),
(94, 0, 1402744610, NULL, 'grade_includescalesinaggregation', '1', NULL),
(95, 0, 1402744610, NULL, 'grade_hiddenasdate', '0', NULL),
(96, 0, 1402744610, NULL, 'gradepublishing', '0', NULL),
(97, 0, 1402744610, NULL, 'grade_export_displaytype', '1', NULL),
(98, 0, 1402744610, NULL, 'grade_export_decimalpoints', '2', NULL),
(99, 0, 1402744611, NULL, 'grade_navmethod', '0', NULL),
(100, 0, 1402744611, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(101, 0, 1402744611, NULL, 'grade_export_customprofilefields', '', NULL),
(102, 0, 1402744611, NULL, 'recovergradesdefault', '0', NULL),
(103, 0, 1402744611, NULL, 'gradeexport', '', NULL),
(104, 0, 1402744611, NULL, 'unlimitedgrades', '0', NULL),
(105, 0, 1402744611, NULL, 'grade_hideforcedsettings', '1', NULL),
(106, 0, 1402744611, NULL, 'grade_aggregation', '11', NULL),
(107, 0, 1402744611, NULL, 'grade_aggregation_flag', '0', NULL),
(108, 0, 1402744611, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(109, 0, 1402744611, NULL, 'grade_aggregateonlygraded', '1', NULL),
(110, 0, 1402744611, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(111, 0, 1402744612, NULL, 'grade_aggregateoutcomes', '0', NULL),
(112, 0, 1402744612, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(113, 0, 1402744612, NULL, 'grade_aggregatesubcats', '0', NULL),
(114, 0, 1402744612, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(115, 0, 1402744612, NULL, 'grade_keephigh', '0', NULL),
(116, 0, 1402744612, NULL, 'grade_keephigh_flag', '3', NULL),
(117, 0, 1402744612, NULL, 'grade_droplow', '0', NULL),
(118, 0, 1402744612, NULL, 'grade_droplow_flag', '2', NULL),
(119, 0, 1402744612, NULL, 'grade_displaytype', '1', NULL),
(120, 0, 1402744612, NULL, 'grade_decimalpoints', '2', NULL),
(121, 0, 1402744613, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(122, 0, 1402744613, NULL, 'grade_report_studentsperpage', '100', NULL),
(123, 0, 1402744613, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(124, 0, 1402744613, NULL, 'grade_report_quickgrading', '1', NULL),
(125, 0, 1402744613, NULL, 'grade_report_showquickfeedback', '0', NULL),
(126, 0, 1402744613, NULL, 'grade_report_fixedstudents', '0', NULL),
(127, 0, 1402744613, NULL, 'grade_report_meanselection', '1', NULL),
(128, 0, 1402744613, NULL, 'grade_report_enableajax', '0', NULL),
(129, 0, 1402744613, NULL, 'grade_report_showcalculations', '0', NULL),
(130, 0, 1402744614, NULL, 'grade_report_showeyecons', '0', NULL),
(131, 0, 1402744614, NULL, 'grade_report_showaverages', '1', NULL),
(132, 0, 1402744614, NULL, 'grade_report_showlocks', '0', NULL),
(133, 0, 1402744614, NULL, 'grade_report_showranges', '0', NULL),
(134, 0, 1402744614, NULL, 'grade_report_showanalysisicon', '1', NULL),
(135, 0, 1402744614, NULL, 'grade_report_showuserimage', '1', NULL),
(136, 0, 1402744614, NULL, 'grade_report_showactivityicons', '1', NULL),
(137, 0, 1402744614, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(138, 0, 1402744614, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(139, 0, 1402744614, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(140, 0, 1402744614, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(141, 0, 1402744615, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(142, 0, 1402744615, NULL, 'grade_report_overview_showrank', '0', NULL),
(143, 0, 1402744615, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(144, 0, 1402744615, NULL, 'grade_report_user_showrank', '0', NULL),
(145, 0, 1402744615, NULL, 'grade_report_user_showpercentage', '1', NULL),
(146, 0, 1402744615, NULL, 'grade_report_user_showgrade', '1', NULL),
(147, 0, 1402744615, NULL, 'grade_report_user_showfeedback', '1', NULL),
(148, 0, 1402744615, NULL, 'grade_report_user_showrange', '1', NULL),
(149, 0, 1402744615, NULL, 'grade_report_user_showweight', '0', NULL),
(150, 0, 1402744615, NULL, 'grade_report_user_showaverage', '0', NULL),
(151, 0, 1402744615, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(152, 0, 1402744615, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(153, 0, 1402744615, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(154, 0, 1402744616, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(155, 0, 1402744616, NULL, 'badges_defaultissuername', '', NULL),
(156, 0, 1402744616, NULL, 'badges_defaultissuercontact', '', NULL),
(157, 0, 1402744616, NULL, 'badges_badgesalt', 'badges1402744563', NULL),
(158, 0, 1402744616, NULL, 'badges_allowexternalbackpack', '1', NULL),
(159, 0, 1402744616, NULL, 'badges_allowcoursebadges', '1', NULL),
(160, 0, 1402744616, NULL, 'timezone', '99', NULL),
(161, 0, 1402744616, NULL, 'forcetimezone', '99', NULL),
(162, 0, 1402744616, NULL, 'country', '0', NULL),
(163, 0, 1402744617, NULL, 'defaultcity', '', NULL),
(164, 0, 1402744617, NULL, 'geoipfile', 'C:\\wamp\\moodledata/geoip/GeoLiteCity.dat', NULL),
(165, 0, 1402744617, NULL, 'googlemapkey3', '', NULL),
(166, 0, 1402744617, NULL, 'allcountrycodes', '', NULL),
(167, 0, 1402744617, NULL, 'autolang', '1', NULL),
(168, 0, 1402744617, NULL, 'lang', 'en', NULL),
(169, 0, 1402744617, NULL, 'langmenu', '1', NULL),
(170, 0, 1402744617, NULL, 'langlist', '', NULL),
(171, 0, 1402744617, NULL, 'langcache', '1', NULL),
(172, 0, 1402744617, NULL, 'langstringcache', '1', NULL),
(173, 0, 1402744617, NULL, 'locale', '', NULL),
(174, 0, 1402744617, NULL, 'latinexcelexport', '0', NULL),
(175, 0, 1402744617, NULL, 'registerauth', '', NULL),
(176, 0, 1402744618, NULL, 'authpreventaccountcreation', '0', NULL),
(177, 0, 1402744618, NULL, 'loginpageautofocus', '0', NULL),
(178, 0, 1402744618, NULL, 'guestloginbutton', '1', NULL),
(179, 0, 1402744618, NULL, 'alternateloginurl', '', NULL),
(180, 0, 1402744618, NULL, 'forgottenpasswordurl', '', NULL),
(181, 0, 1402744618, NULL, 'auth_instructions', '', NULL),
(182, 0, 1402744618, NULL, 'allowemailaddresses', '', NULL),
(183, 0, 1402744618, NULL, 'denyemailaddresses', '', NULL),
(184, 0, 1402744619, NULL, 'verifychangedemail', '1', NULL),
(185, 0, 1402744619, NULL, 'recaptchapublickey', '', NULL),
(186, 0, 1402744619, NULL, 'recaptchaprivatekey', '', NULL),
(187, 0, 1402744619, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(188, 0, 1402744619, NULL, 'cachetext', '60', NULL),
(189, 0, 1402744619, NULL, 'filteruploadedfiles', '0', NULL),
(190, 0, 1402744619, NULL, 'filtermatchoneperpage', '0', NULL),
(191, 0, 1402744619, NULL, 'filtermatchonepertext', '0', NULL),
(192, 0, 1402744619, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(193, 0, 1402744619, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(194, 0, 1402744619, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(195, 0, 1402744619, NULL, 'portfolio_high_db_threshold', '50', NULL),
(196, 0, 1402744620, NULL, 'repositorycacheexpire', '120', NULL),
(197, 0, 1402744620, NULL, 'repositoryallowexternallinks', '1', NULL),
(198, 0, 1402744620, NULL, 'legacyfilesinnewcourses', '0', NULL),
(199, 0, 1402744620, NULL, 'legacyfilesaddallowed', '1', NULL),
(200, 0, 1402744620, NULL, 'mobilecssurl', '', NULL),
(201, 0, 1402744620, NULL, 'enablewsdocumentation', '0', NULL),
(202, 0, 1402744620, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(203, 0, 1402744620, 'question_preview', 'correctness', '1', NULL),
(204, 0, 1402744620, 'question_preview', 'marks', '1', NULL),
(205, 0, 1402744620, 'question_preview', 'markdp', '2', NULL),
(206, 0, 1402744620, 'question_preview', 'feedback', '1', NULL),
(207, 0, 1402744621, 'question_preview', 'generalfeedback', '1', NULL),
(208, 0, 1402744621, 'question_preview', 'rightanswer', '1', NULL),
(209, 0, 1402744621, 'question_preview', 'history', '0', NULL),
(210, 0, 1402744621, 'cachestore_memcache', 'testservers', '', NULL),
(211, 0, 1402744621, 'cachestore_memcached', 'testservers', '', NULL),
(212, 0, 1402744621, 'cachestore_mongodb', 'testserver', '', NULL),
(213, 0, 1402744621, NULL, 'allowbeforeblock', '0', NULL),
(214, 0, 1402744621, NULL, 'allowedip', '', NULL),
(215, 0, 1402744621, NULL, 'blockedip', '', NULL),
(216, 0, 1402744622, NULL, 'protectusernames', '1', NULL),
(217, 0, 1402744622, NULL, 'forcelogin', '0', NULL),
(218, 0, 1402744622, NULL, 'forceloginforprofiles', '1', NULL),
(219, 0, 1402744622, NULL, 'forceloginforprofileimage', '0', NULL),
(220, 0, 1402744622, NULL, 'opentogoogle', '0', NULL),
(221, 0, 1402744622, NULL, 'maxbytes', '0', NULL),
(222, 0, 1402744622, NULL, 'userquota', '104857600', NULL),
(223, 0, 1402744622, NULL, 'allowobjectembed', '0', NULL),
(224, 0, 1402744622, NULL, 'enabletrusttext', '0', NULL),
(225, 0, 1402744622, NULL, 'maxeditingtime', '1800', NULL),
(226, 0, 1402744622, NULL, 'extendedusernamechars', '0', NULL),
(227, 0, 1402744622, NULL, 'sitepolicy', '', NULL),
(228, 0, 1402744623, NULL, 'sitepolicyguest', '', NULL),
(229, 0, 1402744623, NULL, 'keeptagnamecase', '1', NULL),
(230, 0, 1402744623, NULL, 'profilesforenrolledusersonly', '1', NULL),
(231, 0, 1402744623, NULL, 'cronclionly', '0', NULL),
(232, 0, 1402744623, NULL, 'cronremotepassword', '', NULL),
(233, 0, 1402744623, NULL, 'lockoutthreshold', '0', NULL),
(234, 0, 1402744623, NULL, 'lockoutwindow', '1800', NULL),
(235, 0, 1402744623, NULL, 'lockoutduration', '1800', NULL),
(236, 0, 1402744624, NULL, 'passwordpolicy', '1', NULL),
(237, 0, 1402744624, NULL, 'minpasswordlength', '8', NULL),
(238, 0, 1402744624, NULL, 'minpassworddigits', '1', NULL),
(239, 0, 1402744624, NULL, 'minpasswordlower', '1', NULL),
(240, 0, 1402744624, NULL, 'minpasswordupper', '1', NULL),
(241, 0, 1402744624, NULL, 'minpasswordnonalphanum', '1', NULL),
(242, 0, 1402744624, NULL, 'maxconsecutiveidentchars', '0', NULL),
(243, 0, 1402744624, NULL, 'pwresettime', '1800', NULL),
(244, 0, 1402744624, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(245, 0, 1402744624, NULL, 'disableuserimages', '0', NULL),
(246, 0, 1402744624, NULL, 'emailchangeconfirmation', '1', NULL),
(247, 0, 1402744625, NULL, 'rememberusername', '2', NULL),
(248, 0, 1402744625, NULL, 'strictformsrequired', '0', NULL),
(249, 0, 1402744625, NULL, 'loginhttps', '0', NULL),
(250, 0, 1402744625, NULL, 'cookiesecure', '0', NULL),
(251, 0, 1402744625, NULL, 'cookiehttponly', '0', NULL),
(252, 0, 1402744625, NULL, 'allowframembedding', '0', NULL),
(253, 0, 1402744625, NULL, 'loginpasswordautocomplete', '0', NULL),
(254, 0, 1402744625, NULL, 'displayloginfailures', '', NULL),
(255, 0, 1402744625, NULL, 'notifyloginfailures', '', NULL),
(256, 0, 1402744625, NULL, 'notifyloginthreshold', '10', NULL),
(257, 0, 1402744626, NULL, 'runclamonupload', '0', NULL),
(258, 0, 1402744626, NULL, 'pathtoclam', '', NULL),
(259, 0, 1402744626, NULL, 'quarantinedir', '', NULL),
(260, 0, 1402744626, NULL, 'clamfailureonupload', 'donothing', NULL),
(261, 0, 1402744626, NULL, 'themelist', '', NULL),
(262, 0, 1402744626, NULL, 'themedesignermode', '0', NULL),
(263, 0, 1402744626, NULL, 'allowuserthemes', '0', NULL),
(264, 0, 1402744626, NULL, 'allowcoursethemes', '0', NULL),
(265, 0, 1402744626, NULL, 'allowcategorythemes', '0', NULL),
(266, 0, 1402744627, NULL, 'allowthemechangeonurl', '0', NULL),
(267, 0, 1402744627, NULL, 'allowuserblockhiding', '1', NULL),
(268, 0, 1402744627, NULL, 'allowblockstodock', '1', NULL),
(269, 0, 1402744627, NULL, 'custommenuitems', '', NULL),
(270, 0, 1402744627, NULL, 'enabledevicedetection', '1', NULL),
(271, 0, 1402744627, NULL, 'devicedetectregex', '[]', NULL),
(272, 0, 1402744627, 'theme_afterburner', 'logo', '', NULL),
(273, 0, 1402744627, 'theme_afterburner', 'footnote', '', NULL),
(274, 0, 1402744627, 'theme_afterburner', 'customcss', '', NULL),
(275, 0, 1402744627, 'theme_anomaly', 'tagline', '', NULL),
(276, 0, 1402744627, 'theme_anomaly', 'customcss', '', NULL),
(277, 0, 1402744627, 'theme_arialist', 'logo', '', NULL),
(278, 0, 1402744627, 'theme_arialist', 'tagline', '', NULL),
(279, 0, 1402744628, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(280, 0, 1402744628, 'theme_arialist', 'regionwidth', '250', NULL),
(281, 0, 1402744628, 'theme_arialist', 'customcss', '', NULL),
(282, 0, 1402744628, 'theme_brick', 'logo', '', NULL),
(283, 0, 1402744628, 'theme_brick', 'linkcolor', '#06365b', NULL),
(284, 0, 1402744628, 'theme_brick', 'linkhover', '#5487ad', NULL),
(285, 0, 1402744628, 'theme_brick', 'maincolor', '#8e2800', NULL),
(286, 0, 1402744628, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(287, 0, 1402744628, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(288, 0, 1402744628, 'theme_clean', 'invert', '0', NULL),
(289, 0, 1402744629, 'theme_clean', 'logo', '', NULL),
(290, 0, 1402744629, 'theme_clean', 'customcss', '', NULL),
(291, 0, 1402744629, 'theme_clean', 'footnote', '', NULL),
(292, 0, 1402744629, 'theme_formal_white', 'fontsizereference', '13', NULL),
(293, 0, 1402744629, 'theme_formal_white', 'noframe', '0', NULL),
(294, 0, 1402744629, 'theme_formal_white', 'framemargin', '15', NULL),
(295, 0, 1402744629, 'theme_formal_white', 'headercontent', '1', NULL),
(296, 0, 1402744629, 'theme_formal_white', 'trendcolor', 'mink', NULL),
(297, 0, 1402744629, 'theme_formal_white', 'customlogourl', '', NULL),
(298, 0, 1402744629, 'theme_formal_white', 'frontpagelogourl', '', NULL),
(299, 0, 1402744629, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(300, 0, 1402744629, 'theme_formal_white', 'creditstomoodleorg', '2', NULL),
(301, 0, 1402744630, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(302, 0, 1402744630, 'theme_formal_white', 'blockpadding', '8', NULL),
(303, 0, 1402744630, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(304, 0, 1402744630, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(305, 0, 1402744630, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(306, 0, 1402744630, 'theme_formal_white', 'footnote', '', NULL),
(307, 0, 1402744630, 'theme_formal_white', 'customcss', '', NULL),
(308, 0, 1402744631, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(309, 0, 1402744631, 'theme_fusion', 'tagline', '', NULL),
(310, 0, 1402744631, 'theme_fusion', 'footertext', '', NULL),
(311, 0, 1402744631, 'theme_fusion', 'customcss', '', NULL),
(312, 0, 1402744631, 'theme_magazine', 'background', '', NULL),
(313, 0, 1402744631, 'theme_magazine', 'logo', '', NULL),
(314, 0, 1402744631, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(315, 0, 1402744631, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(316, 0, 1402744631, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(317, 0, 1402744631, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(318, 0, 1402744631, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(319, 0, 1402744631, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(320, 0, 1402744631, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(321, 0, 1402744631, 'theme_nimble', 'tagline', '', NULL),
(322, 0, 1402744632, 'theme_nimble', 'footerline', '', NULL),
(323, 0, 1402744632, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(324, 0, 1402744632, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(325, 0, 1402744632, 'theme_nimble', 'linkhover', '#222222', NULL),
(326, 0, 1402744632, 'theme_nonzero', 'regionprewidth', '200', NULL),
(327, 0, 1402744632, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(328, 0, 1402744632, 'theme_nonzero', 'customcss', '', NULL),
(329, 0, 1402744632, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(330, 0, 1402744632, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(331, 0, 1402744632, 'theme_overlay', 'footertext', '', NULL),
(332, 0, 1402744632, 'theme_overlay', 'customcss', '', NULL),
(333, 0, 1402744632, 'theme_sky_high', 'logo', '', NULL),
(334, 0, 1402744633, 'theme_sky_high', 'regionwidth', '240', NULL),
(335, 0, 1402744633, 'theme_sky_high', 'footnote', '', NULL),
(336, 0, 1402744633, 'theme_sky_high', 'customcss', '', NULL),
(337, 0, 1402744633, 'theme_splash', 'logo', '', NULL),
(338, 0, 1402744633, 'theme_splash', 'tagline', 'Virtual learning center', NULL),
(339, 0, 1402744633, 'theme_splash', 'hide_tagline', '0', NULL),
(340, 0, 1402744633, 'theme_splash', 'footnote', '', NULL),
(341, 0, 1402744633, 'theme_splash', 'customcss', '', NULL),
(342, 0, 1402744633, NULL, 'calendartype', 'gregorian', NULL),
(343, 0, 1402744633, NULL, 'calendar_adminseesall', '0', NULL),
(344, 0, 1402744633, NULL, 'calendar_site_timeformat', '0', NULL),
(345, 0, 1402744633, NULL, 'calendar_startwday', '0', NULL),
(346, 0, 1402744634, NULL, 'calendar_weekend', '65', NULL),
(347, 0, 1402744634, NULL, 'calendar_lookahead', '21', NULL),
(348, 0, 1402744634, NULL, 'calendar_maxevents', '10', NULL),
(349, 0, 1402744634, NULL, 'enablecalendarexport', '1', NULL),
(350, 0, 1402744635, NULL, 'calendar_customexport', '1', NULL),
(351, 0, 1402744635, NULL, 'calendar_exportlookahead', '365', NULL),
(352, 0, 1402744635, NULL, 'calendar_exportlookback', '5', NULL),
(353, 0, 1402744635, NULL, 'calendar_exportsalt', 'Q7RVvQQEjrHL9wmhiZJR6TLF1BPGCANyU2lAb123txfHWagOZ45oAOSe2sVg', NULL),
(354, 0, 1402744635, NULL, 'calendar_showicalsource', '1', NULL),
(355, 0, 1402744635, NULL, 'useblogassociations', '1', NULL),
(356, 0, 1402744635, NULL, 'bloglevel', '4', NULL),
(357, 0, 1402744635, NULL, 'useexternalblogs', '1', NULL),
(358, 0, 1402744636, NULL, 'externalblogcrontime', '86400', NULL),
(359, 0, 1402744636, NULL, 'maxexternalblogsperuser', '1', NULL),
(360, 0, 1402744636, NULL, 'blogusecomments', '1', NULL),
(361, 0, 1402744636, NULL, 'blogshowcommentscount', '1', NULL),
(362, 0, 1402744636, NULL, 'defaulthomepage', '0', NULL),
(363, 0, 1402744636, NULL, 'allowguestmymoodle', '1', NULL),
(364, 0, 1402744636, NULL, 'navshowfullcoursenames', '0', NULL),
(365, 0, 1402744636, NULL, 'navshowcategories', '1', NULL),
(366, 0, 1402744636, NULL, 'navshowmycoursecategories', '0', NULL),
(367, 0, 1402744636, NULL, 'navshowallcourses', '0', NULL),
(368, 0, 1402744636, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(369, 0, 1402744637, NULL, 'navcourselimit', '20', NULL),
(370, 0, 1402744637, NULL, 'usesitenameforsitepages', '0', NULL),
(371, 0, 1402744637, NULL, 'linkadmincategories', '0', NULL),
(372, 0, 1402744637, NULL, 'navshowfrontpagemods', '1', NULL),
(373, 0, 1402744637, NULL, 'navadduserpostslinks', '1', NULL),
(374, 0, 1402744637, NULL, 'formatstringstriptags', '1', NULL),
(375, 0, 1402744637, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(376, 0, 1402744637, NULL, 'core_media_enable_youtube', '1', NULL),
(377, 0, 1402744637, NULL, 'core_media_enable_vimeo', '0', NULL),
(378, 0, 1402744637, NULL, 'core_media_enable_mp3', '1', NULL),
(379, 0, 1402744637, NULL, 'core_media_enable_flv', '1', NULL),
(380, 0, 1402744637, NULL, 'core_media_enable_swf', '1', NULL),
(381, 0, 1402744638, NULL, 'core_media_enable_html5audio', '1', NULL),
(382, 0, 1402744638, NULL, 'core_media_enable_html5video', '1', NULL),
(383, 0, 1402744638, NULL, 'core_media_enable_qt', '1', NULL),
(384, 0, 1402744638, NULL, 'core_media_enable_wmp', '1', NULL),
(385, 0, 1402744638, NULL, 'core_media_enable_rm', '1', NULL),
(386, 0, 1402744638, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(387, 0, 1402744638, NULL, 'doctonewwindow', '0', NULL),
(388, 0, 1402744638, NULL, 'courselistshortnames', '0', NULL),
(389, 0, 1402744638, NULL, 'coursesperpage', '20', NULL),
(390, 0, 1402744638, NULL, 'courseswithsummarieslimit', '10', NULL),
(391, 0, 1402744638, NULL, 'courseoverviewfileslimit', '1', NULL),
(392, 0, 1402744639, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(393, 0, 1402744639, NULL, 'enableajax', '1', NULL),
(394, 0, 1402744639, NULL, 'useexternalyui', '0', NULL),
(395, 0, 1402744639, NULL, 'yuicomboloading', '1', NULL),
(396, 0, 1402744639, NULL, 'cachejs', '1', NULL),
(397, 0, 1402744639, NULL, 'modchooserdefault', '1', NULL),
(398, 0, 1402744639, NULL, 'modeditingmenu', '1', NULL),
(399, 0, 1402744639, NULL, 'blockeditingmenu', '1', NULL),
(400, 0, 1402744639, NULL, 'additionalhtmlhead', '', NULL),
(401, 0, 1402744639, NULL, 'additionalhtmltopofbody', '', NULL),
(402, 0, 1402744640, NULL, 'additionalhtmlfooter', '', NULL),
(403, 0, 1402744640, NULL, 'pathtodu', '', NULL),
(404, 0, 1402744640, NULL, 'aspellpath', '', NULL),
(405, 0, 1402744640, NULL, 'pathtodot', '', NULL),
(406, 0, 1402744640, NULL, 'supportpage', '', NULL),
(407, 0, 1402744640, NULL, 'dbsessions', '0', NULL),
(408, 0, 1402744640, NULL, 'sessioncookie', '', NULL),
(409, 0, 1402744641, NULL, 'sessioncookiepath', '', NULL),
(410, 0, 1402744641, NULL, 'sessioncookiedomain', '', NULL),
(411, 0, 1402744641, NULL, 'statsfirstrun', 'none', NULL),
(412, 0, 1402744641, NULL, 'statsmaxruntime', '0', NULL),
(413, 0, 1402744641, NULL, 'statsruntimedays', '31', NULL),
(414, 0, 1402744641, NULL, 'statsruntimestarthour', '0', NULL),
(415, 0, 1402744641, NULL, 'statsruntimestartminute', '0', NULL),
(416, 0, 1402744641, NULL, 'statsuserthreshold', '0', NULL),
(417, 0, 1402744641, NULL, 'slasharguments', '1', NULL),
(418, 0, 1402744641, NULL, 'getremoteaddrconf', '0', NULL),
(419, 0, 1402744641, NULL, 'proxyhost', '', NULL),
(420, 0, 1402744641, NULL, 'proxyport', '0', NULL),
(421, 0, 1402744642, NULL, 'proxytype', 'HTTP', NULL),
(422, 0, 1402744642, NULL, 'proxyuser', '', NULL),
(423, 0, 1402744642, NULL, 'proxypassword', '', NULL),
(424, 0, 1402744642, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(425, 0, 1402744642, NULL, 'maintenance_enabled', '0', NULL),
(426, 0, 1402744642, NULL, 'maintenance_message', '', NULL),
(427, 0, 1402744642, NULL, 'deleteunconfirmed', '168', NULL),
(428, 0, 1402744642, NULL, 'deleteincompleteusers', '0', NULL),
(429, 0, 1402744642, NULL, 'logguests', '1', NULL),
(430, 0, 1402744642, NULL, 'loglifetime', '0', NULL),
(431, 0, 1402744642, NULL, 'disablegradehistory', '0', NULL),
(432, 0, 1402744642, NULL, 'gradehistorylifetime', '0', NULL),
(433, 0, 1402744643, NULL, 'extramemorylimit', '512M', NULL),
(434, 0, 1402744643, NULL, 'curlcache', '120', NULL),
(435, 0, 1402744643, NULL, 'curltimeoutkbitrate', '56', NULL),
(436, 0, 1402744643, NULL, 'updateautocheck', '1', NULL),
(437, 0, 1402744643, NULL, 'updateautodeploy', '0', NULL),
(438, 0, 1402744643, NULL, 'updateminmaturity', '200', NULL),
(439, 0, 1402744643, NULL, 'updatenotifybuilds', '0', NULL),
(440, 0, 1402744643, NULL, 'enablesafebrowserintegration', '0', NULL),
(441, 0, 1402744643, NULL, 'enablegroupmembersonly', '0', NULL),
(442, 0, 1402744643, NULL, 'dndallowtextandlinks', '0', NULL),
(443, 0, 1402744644, NULL, 'enablecssoptimiser', '0', NULL),
(444, 0, 1402744644, NULL, 'enabletgzbackups', '0', NULL),
(445, 0, 1402744644, NULL, 'debug', '0', NULL),
(446, 0, 1402744644, NULL, 'debugdisplay', '1', NULL),
(447, 0, 1402744644, NULL, 'debugsmtp', '0', NULL),
(448, 0, 1402744644, NULL, 'perfdebug', '7', NULL),
(449, 0, 1402744644, NULL, 'debugstringids', '0', NULL),
(450, 0, 1402744644, NULL, 'debugvalidators', '0', NULL),
(451, 0, 1402744644, NULL, 'debugpageinfo', '0', NULL),
(452, 0, 1402744644, NULL, 'profilingenabled', '0', NULL),
(453, 0, 1402744645, NULL, 'profilingincluded', '', NULL),
(454, 0, 1402744645, NULL, 'profilingexcluded', '', NULL),
(455, 0, 1402744645, NULL, 'profilingautofrec', '0', NULL),
(456, 0, 1402744645, NULL, 'profilingallowme', '0', NULL),
(457, 0, 1402744645, NULL, 'profilingallowall', '0', NULL),
(458, 0, 1402744645, NULL, 'profilinglifetime', '1440', NULL),
(459, 0, 1402744645, NULL, 'profilingimportprefix', '(I)', NULL),
(460, 0, 1402744867, 'activitynames', 'filter_active', '1', ''),
(461, 0, 1402744870, 'mediaplugin', 'filter_active', '1', ''),
(462, 2, 1402745184, NULL, 'notloggedinroleid', '6', NULL),
(463, 2, 1402745184, NULL, 'guestroleid', '6', NULL),
(464, 2, 1402745184, NULL, 'defaultuserroleid', '7', NULL),
(465, 2, 1402745185, NULL, 'creatornewroleid', '3', NULL),
(466, 2, 1402745185, NULL, 'restorernewroleid', '3', NULL),
(467, 2, 1402745185, NULL, 'gradebookroles', '5', NULL),
(468, 2, 1402745185, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(469, 2, 1402745185, 'assign', 'showrecentsubmissions', '0', NULL),
(470, 2, 1402745185, 'assign', 'submissionreceipts', '1', NULL),
(471, 2, 1402745185, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(472, 2, 1402745185, 'assign', 'alwaysshowdescription', '1', NULL),
(473, 2, 1402745185, 'assign', 'alwaysshowdescription_adv', '', NULL),
(474, 2, 1402745185, 'assign', 'alwaysshowdescription_locked', '', NULL),
(475, 2, 1402745186, 'assign', 'allowsubmissionsfromdate', '0', NULL),
(476, 2, 1402745186, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
(477, 2, 1402745186, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
(478, 2, 1402745186, 'assign', 'duedate', '604800', NULL),
(479, 2, 1402745186, 'assign', 'duedate_enabled', '1', NULL),
(480, 2, 1402745186, 'assign', 'duedate_adv', '', NULL),
(481, 2, 1402745186, 'assign', 'cutoffdate', '1209600', NULL),
(482, 2, 1402745186, 'assign', 'cutoffdate_enabled', '', NULL),
(483, 2, 1402745186, 'assign', 'cutoffdate_adv', '', NULL),
(484, 2, 1402745186, 'assign', 'submissiondrafts', '0', NULL),
(485, 2, 1402745186, 'assign', 'submissiondrafts_adv', '', NULL),
(486, 2, 1402745186, 'assign', 'submissiondrafts_locked', '', NULL),
(487, 2, 1402745186, 'assign', 'requiresubmissionstatement', '0', NULL),
(488, 2, 1402745186, 'assign', 'requiresubmissionstatement_adv', '', NULL),
(489, 2, 1402745187, 'assign', 'requiresubmissionstatement_locked', '', NULL),
(490, 2, 1402745187, 'assign', 'attemptreopenmethod', 'none', NULL),
(491, 2, 1402745187, 'assign', 'attemptreopenmethod_adv', '', NULL),
(492, 2, 1402745187, 'assign', 'attemptreopenmethod_locked', '', NULL),
(493, 2, 1402745187, 'assign', 'maxattempts', '-1', NULL),
(494, 2, 1402745188, 'assign', 'maxattempts_adv', '', NULL),
(495, 2, 1402745188, 'assign', 'maxattempts_locked', '', NULL),
(496, 2, 1402745188, 'assign', 'teamsubmission', '0', NULL),
(497, 2, 1402745188, 'assign', 'teamsubmission_adv', '', NULL),
(498, 2, 1402745188, 'assign', 'teamsubmission_locked', '', NULL),
(499, 2, 1402745188, 'assign', 'requireallteammemberssubmit', '0', NULL),
(500, 2, 1402745188, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
(501, 2, 1402745189, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
(502, 2, 1402745189, 'assign', 'teamsubmissiongroupingid', '', NULL),
(503, 2, 1402745189, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
(504, 2, 1402745189, 'assign', 'sendnotifications', '0', NULL),
(505, 2, 1402745189, 'assign', 'sendnotifications_adv', '', NULL),
(506, 2, 1402745189, 'assign', 'sendnotifications_locked', '', NULL),
(507, 2, 1402745189, 'assign', 'sendlatenotifications', '0', NULL),
(508, 2, 1402745189, 'assign', 'sendlatenotifications_adv', '', NULL),
(509, 2, 1402745189, 'assign', 'sendlatenotifications_locked', '', NULL),
(510, 2, 1402745189, 'assign', 'blindmarking', '0', NULL),
(511, 2, 1402745189, 'assign', 'blindmarking_adv', '', NULL),
(512, 2, 1402745190, 'assign', 'blindmarking_locked', '', NULL),
(513, 2, 1402745190, 'assign', 'markingworkflow', '0', NULL),
(514, 2, 1402745190, 'assign', 'markingworkflow_adv', '', NULL),
(515, 2, 1402745190, 'assign', 'markingworkflow_locked', '', NULL),
(516, 2, 1402745190, 'assign', 'markingallocation', '0', NULL),
(517, 2, 1402745190, 'assign', 'markingallocation_adv', '', NULL),
(518, 2, 1402745190, 'assign', 'markingallocation_locked', '', NULL),
(519, 2, 1402745190, 'assignsubmission_file', 'default', '1', NULL),
(520, 2, 1402745190, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(521, 2, 1402745190, 'assignsubmission_onlinetext', 'default', '0', NULL),
(522, 2, 1402745190, 'assignfeedback_comments', 'default', '1', NULL),
(523, 2, 1402745190, 'assignfeedback_editpdf', 'stamps', '', NULL),
(524, 2, 1402745191, 'assignfeedback_editpdf', 'gspath', '/usr/bin/gs', NULL),
(525, 2, 1402745191, 'assignfeedback_file', 'default', '0', NULL),
(526, 2, 1402745191, 'assignfeedback_offline', 'default', '0', NULL),
(527, 2, 1402745191, NULL, 'assignment_maxbytes', '1048576', NULL),
(528, 2, 1402745191, NULL, 'assignment_itemstocount', '1', NULL),
(529, 2, 1402745191, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(530, 2, 1402745191, 'book', 'requiremodintro', '1', NULL),
(531, 2, 1402745191, 'book', 'numberingoptions', '0,1,2,3', NULL),
(532, 2, 1402745191, 'book', 'numbering', '1', NULL),
(533, 2, 1402745191, NULL, 'chat_method', 'ajax', NULL),
(534, 2, 1402745192, NULL, 'chat_refresh_userlist', '10', NULL),
(535, 2, 1402745192, NULL, 'chat_old_ping', '35', NULL),
(536, 2, 1402745192, NULL, 'chat_refresh_room', '5', NULL),
(537, 2, 1402745192, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(538, 2, 1402745192, NULL, 'chat_serverhost', 'localhost', NULL),
(539, 2, 1402745192, NULL, 'chat_serverip', '127.0.0.1', NULL),
(540, 2, 1402745192, NULL, 'chat_serverport', '9111', NULL),
(541, 2, 1402745192, NULL, 'chat_servermax', '100', NULL),
(542, 2, 1402745192, NULL, 'data_enablerssfeeds', '0', NULL),
(543, 2, 1402745192, NULL, 'feedback_allowfullanonymous', '0', NULL),
(544, 2, 1402745193, 'folder', 'requiremodintro', '1', NULL),
(545, 2, 1402745193, 'folder', 'showexpanded', '1', NULL),
(546, 2, 1402745193, NULL, 'forum_displaymode', '3', NULL),
(547, 2, 1402745193, NULL, 'forum_replytouser', '1', NULL),
(548, 2, 1402745193, NULL, 'forum_shortpost', '300', NULL),
(549, 2, 1402745193, NULL, 'forum_longpost', '600', NULL),
(550, 2, 1402745193, NULL, 'forum_manydiscussions', '100', NULL),
(551, 2, 1402745193, NULL, 'forum_maxbytes', '512000', NULL),
(552, 2, 1402745193, NULL, 'forum_maxattachments', '9', NULL),
(553, 2, 1402745193, NULL, 'forum_trackingtype', '1', NULL),
(554, 2, 1402745193, NULL, 'forum_trackreadposts', '1', NULL),
(555, 2, 1402745193, NULL, 'forum_allowforcedreadtracking', '0', NULL),
(556, 2, 1402745194, NULL, 'forum_oldpostdays', '14', NULL),
(557, 2, 1402745194, NULL, 'forum_usermarksread', '0', NULL),
(558, 2, 1402745194, NULL, 'forum_cleanreadtime', '2', NULL),
(559, 2, 1402745194, NULL, 'digestmailtime', '17', NULL),
(560, 2, 1402745194, NULL, 'forum_enablerssfeeds', '0', NULL),
(561, 2, 1402745194, NULL, 'forum_enabletimedposts', '0', NULL),
(562, 2, 1402745194, NULL, 'glossary_entbypage', '10', NULL),
(563, 2, 1402745194, NULL, 'glossary_dupentries', '0', NULL),
(564, 2, 1402745194, NULL, 'glossary_allowcomments', '0', NULL),
(565, 2, 1402745195, NULL, 'glossary_linkbydefault', '1', NULL),
(566, 2, 1402745195, NULL, 'glossary_defaultapproval', '1', NULL),
(567, 2, 1402745195, NULL, 'glossary_enablerssfeeds', '0', NULL),
(568, 2, 1402745195, NULL, 'glossary_linkentries', '0', NULL),
(569, 2, 1402745195, NULL, 'glossary_casesensitive', '0', NULL),
(570, 2, 1402745195, NULL, 'glossary_fullmatch', '0', NULL),
(571, 2, 1402745195, 'imscp', 'requiremodintro', '1', NULL),
(572, 2, 1402745195, 'imscp', 'keepold', '1', NULL),
(573, 2, 1402745195, 'imscp', 'keepold_adv', '', NULL),
(574, 2, 1402745196, 'label', 'dndmedia', '1', NULL),
(575, 2, 1402745196, 'label', 'dndresizewidth', '400', NULL),
(576, 2, 1402745196, 'label', 'dndresizeheight', '400', NULL),
(577, 2, 1402745196, NULL, 'lesson_slideshowwidth', '640', NULL),
(578, 2, 1402745196, NULL, 'lesson_slideshowheight', '480', NULL),
(579, 2, 1402745196, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(580, 2, 1402745196, NULL, 'lesson_mediawidth', '640', NULL),
(581, 2, 1402745196, NULL, 'lesson_mediaheight', '480', NULL),
(582, 2, 1402745196, NULL, 'lesson_mediaclose', '0', NULL),
(583, 2, 1402745196, NULL, 'lesson_maxhighscores', '10', NULL),
(584, 2, 1402745196, NULL, 'lesson_maxanswers', '4', NULL),
(585, 2, 1402745197, NULL, 'lesson_defaultnextpage', '0', NULL),
(586, 2, 1402745197, 'page', 'requiremodintro', '1', NULL),
(587, 2, 1402745197, 'page', 'displayoptions', '5', NULL),
(588, 2, 1402745197, 'page', 'printintro', '0', NULL),
(589, 2, 1402745197, 'page', 'display', '5', NULL),
(590, 2, 1402745197, 'page', 'popupwidth', '620', NULL),
(591, 2, 1402745197, 'page', 'popupheight', '450', NULL),
(592, 2, 1402745197, 'quiz', 'timelimit', '0', NULL),
(593, 2, 1402745197, 'quiz', 'timelimit_adv', '', NULL),
(594, 2, 1402745197, 'quiz', 'overduehandling', 'autoabandon', NULL),
(595, 2, 1402745198, 'quiz', 'overduehandling_adv', '', NULL),
(596, 2, 1402745198, 'quiz', 'graceperiod', '86400', NULL),
(597, 2, 1402745198, 'quiz', 'graceperiod_adv', '', NULL),
(598, 2, 1402745198, 'quiz', 'graceperiodmin', '60', NULL),
(599, 2, 1402745198, 'quiz', 'attempts', '0', NULL),
(600, 2, 1402745198, 'quiz', 'attempts_adv', '', NULL),
(601, 2, 1402745198, 'quiz', 'grademethod', '1', NULL),
(602, 2, 1402745198, 'quiz', 'grademethod_adv', '', NULL),
(603, 2, 1402745198, 'quiz', 'maximumgrade', '10', NULL),
(604, 2, 1402745198, 'quiz', 'shufflequestions', '0', NULL),
(605, 2, 1402745198, 'quiz', 'shufflequestions_adv', '', NULL),
(606, 2, 1402745198, 'quiz', 'questionsperpage', '1', NULL),
(607, 2, 1402745198, 'quiz', 'questionsperpage_adv', '', NULL),
(608, 2, 1402745198, 'quiz', 'navmethod', 'free', NULL),
(609, 2, 1402745198, 'quiz', 'navmethod_adv', '1', NULL),
(610, 2, 1402745199, 'quiz', 'shuffleanswers', '1', NULL),
(611, 2, 1402745199, 'quiz', 'shuffleanswers_adv', '', NULL),
(612, 2, 1402745199, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(613, 2, 1402745199, 'quiz', 'attemptonlast', '0', NULL),
(614, 2, 1402745199, 'quiz', 'attemptonlast_adv', '1', NULL),
(615, 2, 1402745199, 'quiz', 'reviewattempt', '69904', NULL),
(616, 2, 1402745199, 'quiz', 'reviewcorrectness', '69904', NULL),
(617, 2, 1402745199, 'quiz', 'reviewmarks', '69904', NULL),
(618, 2, 1402745199, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(619, 2, 1402745199, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(620, 2, 1402745200, 'quiz', 'reviewrightanswer', '69904', NULL),
(621, 2, 1402745200, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(622, 2, 1402745200, 'quiz', 'showuserpicture', '0', NULL),
(623, 2, 1402745200, 'quiz', 'showuserpicture_adv', '', NULL),
(624, 2, 1402745200, 'quiz', 'decimalpoints', '2', NULL),
(625, 2, 1402745200, 'quiz', 'decimalpoints_adv', '', NULL),
(626, 2, 1402745200, 'quiz', 'questiondecimalpoints', '-1', NULL),
(627, 2, 1402745200, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(628, 2, 1402745200, 'quiz', 'showblocks', '0', NULL),
(629, 2, 1402745200, 'quiz', 'showblocks_adv', '1', NULL),
(630, 2, 1402745200, 'quiz', 'password', '', NULL),
(631, 2, 1402745200, 'quiz', 'password_adv', '1', NULL),
(632, 2, 1402745201, 'quiz', 'subnet', '', NULL),
(633, 2, 1402745201, 'quiz', 'subnet_adv', '1', NULL),
(634, 2, 1402745201, 'quiz', 'delay1', '0', NULL),
(635, 2, 1402745201, 'quiz', 'delay1_adv', '1', NULL),
(636, 2, 1402745201, 'quiz', 'delay2', '0', NULL),
(637, 2, 1402745201, 'quiz', 'delay2_adv', '1', NULL),
(638, 2, 1402745201, 'quiz', 'browsersecurity', '-', NULL),
(639, 2, 1402745201, 'quiz', 'browsersecurity_adv', '1', NULL),
(640, 2, 1402745201, 'quiz', 'autosaveperiod', '0', NULL),
(641, 2, 1402745201, 'resource', 'framesize', '130', NULL),
(642, 2, 1402745202, 'resource', 'requiremodintro', '1', NULL),
(643, 2, 1402745202, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(644, 2, 1402745202, 'resource', 'printintro', '1', NULL),
(645, 2, 1402745202, 'resource', 'display', '0', NULL),
(646, 2, 1402745202, 'resource', 'showsize', '0', NULL),
(647, 2, 1402745202, 'resource', 'showtype', '0', NULL),
(648, 2, 1402745202, 'resource', 'popupwidth', '620', NULL),
(649, 2, 1402745202, 'resource', 'popupheight', '450', NULL),
(650, 2, 1402745202, 'resource', 'filterfiles', '0', NULL),
(651, 2, 1402745202, 'scorm', 'displaycoursestructure', '0', NULL),
(652, 2, 1402745202, 'scorm', 'displaycoursestructure_adv', '', NULL),
(653, 2, 1402745202, 'scorm', 'popup', '0', NULL),
(654, 2, 1402745202, 'scorm', 'popup_adv', '', NULL),
(655, 2, 1402745202, 'scorm', 'framewidth', '100', NULL),
(656, 2, 1402745202, 'scorm', 'framewidth_adv', '1', NULL),
(657, 2, 1402745203, 'scorm', 'frameheight', '500', NULL),
(658, 2, 1402745203, 'scorm', 'frameheight_adv', '1', NULL),
(659, 2, 1402745203, 'scorm', 'winoptgrp_adv', '1', NULL),
(660, 2, 1402745203, 'scorm', 'scrollbars', '0', NULL),
(661, 2, 1402745203, 'scorm', 'directories', '0', NULL),
(662, 2, 1402745203, 'scorm', 'location', '0', NULL),
(663, 2, 1402745203, 'scorm', 'menubar', '0', NULL),
(664, 2, 1402745203, 'scorm', 'toolbar', '0', NULL),
(665, 2, 1402745203, 'scorm', 'status', '0', NULL),
(666, 2, 1402745203, 'scorm', 'skipview', '0', NULL),
(667, 2, 1402745203, 'scorm', 'skipview_adv', '1', NULL),
(668, 2, 1402745203, 'scorm', 'hidebrowse', '0', NULL),
(669, 2, 1402745204, 'scorm', 'hidebrowse_adv', '1', NULL),
(670, 2, 1402745204, 'scorm', 'hidetoc', '0', NULL),
(671, 2, 1402745204, 'scorm', 'hidetoc_adv', '1', NULL),
(672, 2, 1402745204, 'scorm', 'nav', '1', NULL),
(673, 2, 1402745204, 'scorm', 'nav_adv', '1', NULL),
(674, 2, 1402745204, 'scorm', 'navpositionleft', '-100', NULL),
(675, 2, 1402745204, 'scorm', 'navpositionleft_adv', '1', NULL),
(676, 2, 1402745204, 'scorm', 'navpositiontop', '-100', NULL),
(677, 2, 1402745204, 'scorm', 'navpositiontop_adv', '1', NULL),
(678, 2, 1402745204, 'scorm', 'collapsetocwinsize', '767', NULL),
(679, 2, 1402745204, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
(680, 2, 1402745204, 'scorm', 'displayattemptstatus', '1', NULL),
(681, 2, 1402745204, 'scorm', 'displayattemptstatus_adv', '', NULL),
(682, 2, 1402745204, 'scorm', 'grademethod', '1', NULL),
(683, 2, 1402745204, 'scorm', 'maxgrade', '100', NULL),
(684, 2, 1402745205, 'scorm', 'maxattempt', '0', NULL),
(685, 2, 1402745205, 'scorm', 'whatgrade', '0', NULL),
(686, 2, 1402745205, 'scorm', 'forcecompleted', '0', NULL),
(687, 2, 1402745205, 'scorm', 'forcenewattempt', '0', NULL),
(688, 2, 1402745205, 'scorm', 'lastattemptlock', '0', NULL),
(689, 2, 1402745205, 'scorm', 'auto', '0', NULL),
(690, 2, 1402745206, 'scorm', 'updatefreq', '0', NULL),
(691, 2, 1402745206, 'scorm', 'allowtypeexternal', '0', NULL),
(692, 2, 1402745206, 'scorm', 'allowtypelocalsync', '0', NULL),
(693, 2, 1402745206, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(694, 2, 1402745206, 'scorm', 'allowaicchacp', '0', NULL),
(695, 2, 1402745206, 'scorm', 'aicchacptimeout', '30', NULL),
(696, 2, 1402745206, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(697, 2, 1402745206, 'scorm', 'forcejavascript', '1', NULL),
(698, 2, 1402745206, 'scorm', 'allowapidebug', '0', NULL),
(699, 2, 1402745206, 'scorm', 'apidebugmask', '.*', NULL),
(700, 2, 1402745206, 'url', 'framesize', '130', NULL),
(701, 2, 1402745206, 'url', 'requiremodintro', '1', NULL),
(702, 2, 1402745206, 'url', 'secretphrase', '', NULL),
(703, 2, 1402745206, 'url', 'rolesinparams', '0', NULL),
(704, 2, 1402745206, 'url', 'displayoptions', '0,1,5,6', NULL),
(705, 2, 1402745206, 'url', 'printintro', '1', NULL),
(706, 2, 1402745206, 'url', 'display', '0', NULL),
(707, 2, 1402745206, 'url', 'popupwidth', '620', NULL),
(708, 2, 1402745207, 'url', 'popupheight', '450', NULL),
(709, 2, 1402745207, 'workshop', 'grade', '80', NULL),
(710, 2, 1402745207, 'workshop', 'gradinggrade', '20', NULL),
(711, 2, 1402745207, 'workshop', 'gradedecimals', '0', NULL),
(712, 2, 1402745207, 'workshop', 'maxbytes', '0', NULL),
(713, 2, 1402745207, 'workshop', 'strategy', 'accumulative', NULL),
(714, 2, 1402745207, 'workshop', 'examplesmode', '0', NULL),
(715, 2, 1402745207, 'workshopallocation_random', 'numofreviews', '5', NULL),
(716, 2, 1402745207, 'workshopform_numerrors', 'grade0', 'No', NULL),
(717, 2, 1402745207, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(718, 2, 1402745208, 'workshopeval_best', 'comparison', '5', NULL),
(719, 2, 1402745208, 'format_singleactivity', 'activitytype', 'forum', NULL),
(720, 2, 1402745208, NULL, 'block_course_list_adminview', 'all', NULL),
(721, 2, 1402745208, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(722, 2, 1402745208, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(723, 2, 1402745208, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(724, 2, 1402745208, 'block_course_overview', 'showchildren', '0', NULL),
(725, 2, 1402745208, 'block_course_overview', 'showwelcomearea', '0', NULL),
(726, 2, 1402745208, NULL, 'block_html_allowcssclasses', '0', NULL),
(727, 2, 1402745208, NULL, 'block_online_users_timetosee', '5', NULL),
(728, 2, 1402745209, NULL, 'block_rss_client_num_entries', '5', NULL),
(729, 2, 1402745209, NULL, 'block_rss_client_timeout', '30', NULL),
(730, 2, 1402745209, 'block_section_links', 'numsections1', '22', NULL),
(731, 2, 1402745209, 'block_section_links', 'incby1', '2', NULL),
(732, 2, 1402745209, 'block_section_links', 'numsections2', '40', NULL),
(733, 2, 1402745209, 'block_section_links', 'incby2', '5', NULL),
(734, 2, 1402745209, NULL, 'block_tags_showcoursetags', '0', NULL),
(735, 2, 1402745209, NULL, 'smtphosts', '', NULL),
(736, 2, 1402745209, NULL, 'smtpsecure', '', NULL),
(737, 2, 1402745210, NULL, 'smtpuser', '', NULL),
(738, 2, 1402745210, NULL, 'smtppass', '', NULL),
(739, 2, 1402745210, NULL, 'smtpmaxbulk', '1', NULL),
(740, 2, 1402745210, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(741, 2, 1402745210, NULL, 'sitemailcharset', '0', NULL),
(742, 2, 1402745210, NULL, 'allowusermailcharset', '0', NULL),
(743, 2, 1402745210, NULL, 'allowattachments', '1', NULL),
(744, 2, 1402745210, NULL, 'mailnewline', 'LF', NULL),
(745, 2, 1402745210, NULL, 'jabberhost', '', NULL),
(746, 2, 1402745210, NULL, 'jabberserver', '', NULL),
(747, 2, 1402745210, NULL, 'jabberusername', '', NULL),
(748, 2, 1402745210, NULL, 'jabberpassword', '', NULL),
(749, 2, 1402745210, NULL, 'jabberport', '5222', NULL),
(750, 2, 1402745211, 'enrol_cohort', 'roleid', '5', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(751, 2, 1402745211, 'enrol_cohort', 'unenrolaction', '0', NULL),
(752, 2, 1402745211, 'enrol_database', 'dbtype', '', NULL),
(753, 2, 1402745211, 'enrol_database', 'dbhost', 'localhost', NULL),
(754, 2, 1402745211, 'enrol_database', 'dbuser', '', NULL),
(755, 2, 1402745211, 'enrol_database', 'dbpass', '', NULL),
(756, 2, 1402745211, 'enrol_database', 'dbname', '', NULL),
(757, 2, 1402745211, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(758, 2, 1402745211, 'enrol_database', 'dbsetupsql', '', NULL),
(759, 2, 1402745211, 'enrol_database', 'dbsybasequoting', '0', NULL),
(760, 2, 1402745211, 'enrol_database', 'debugdb', '0', NULL),
(761, 2, 1402745212, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(762, 2, 1402745212, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(763, 2, 1402745212, 'enrol_database', 'localrolefield', 'shortname', NULL),
(764, 2, 1402745212, 'enrol_database', 'localcategoryfield', 'id', NULL),
(765, 2, 1402745212, 'enrol_database', 'remoteenroltable', '', NULL),
(766, 2, 1402745212, 'enrol_database', 'remotecoursefield', '', NULL),
(767, 2, 1402745212, 'enrol_database', 'remoteuserfield', '', NULL),
(768, 2, 1402745212, 'enrol_database', 'remoterolefield', '', NULL),
(769, 2, 1402745212, 'enrol_database', 'defaultrole', '5', NULL),
(770, 2, 1402745212, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(771, 2, 1402745212, 'enrol_database', 'unenrolaction', '0', NULL),
(772, 2, 1402745212, 'enrol_database', 'newcoursetable', '', NULL),
(773, 2, 1402745212, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(774, 2, 1402745212, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(775, 2, 1402745213, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(776, 2, 1402745213, 'enrol_database', 'newcoursecategory', '', NULL),
(777, 2, 1402745213, 'enrol_database', 'defaultcategory', '1', NULL),
(778, 2, 1402745213, 'enrol_database', 'templatecourse', '', NULL),
(779, 2, 1402745213, 'enrol_flatfile', 'location', '', NULL),
(780, 2, 1402745213, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(781, 2, 1402745213, 'enrol_flatfile', 'mailstudents', '0', NULL),
(782, 2, 1402745213, 'enrol_flatfile', 'mailteachers', '0', NULL),
(783, 2, 1402745213, 'enrol_flatfile', 'mailadmins', '0', NULL),
(784, 2, 1402745214, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(785, 2, 1402745214, 'enrol_flatfile', 'expiredaction', '3', NULL),
(786, 2, 1402745214, 'enrol_guest', 'requirepassword', '0', NULL),
(787, 2, 1402745214, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(788, 2, 1402745214, 'enrol_guest', 'showhint', '0', NULL),
(789, 2, 1402745214, 'enrol_guest', 'defaultenrol', '1', NULL),
(790, 2, 1402745214, 'enrol_guest', 'status', '1', NULL),
(791, 2, 1402745214, 'enrol_guest', 'status_adv', '', NULL),
(792, 2, 1402745214, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(793, 2, 1402745214, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(794, 2, 1402745215, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(795, 2, 1402745215, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(796, 2, 1402745215, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(797, 2, 1402745215, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(798, 2, 1402745215, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(799, 2, 1402745215, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(800, 2, 1402745215, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(801, 2, 1402745215, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(802, 2, 1402745215, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(803, 2, 1402745215, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(804, 2, 1402745215, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(805, 2, 1402745215, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(806, 2, 1402745215, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(807, 2, 1402745215, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(808, 2, 1402745216, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(809, 2, 1402745216, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(810, 2, 1402745216, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(811, 2, 1402745216, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(812, 2, 1402745216, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(813, 2, 1402745216, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(814, 2, 1402745216, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(815, 2, 1402745216, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(816, 2, 1402745216, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(817, 2, 1402745216, 'enrol_manual', 'expiredaction', '1', NULL),
(818, 2, 1402745216, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(819, 2, 1402745216, 'enrol_manual', 'defaultenrol', '1', NULL),
(820, 2, 1402745216, 'enrol_manual', 'status', '0', NULL),
(821, 2, 1402745216, 'enrol_manual', 'roleid', '5', NULL),
(822, 2, 1402745216, 'enrol_manual', 'enrolperiod', '0', NULL),
(823, 2, 1402745216, 'enrol_manual', 'expirynotify', '0', NULL),
(824, 2, 1402745217, 'enrol_manual', 'expirythreshold', '86400', NULL),
(825, 2, 1402745217, 'enrol_meta', 'nosyncroleids', '', NULL),
(826, 2, 1402745217, 'enrol_meta', 'syncall', '1', NULL),
(827, 2, 1402745217, 'enrol_meta', 'unenrolaction', '3', NULL),
(828, 2, 1402745217, 'enrol_mnet', 'roleid', '5', NULL),
(829, 2, 1402745217, 'enrol_mnet', 'roleid_adv', '1', NULL),
(830, 2, 1402745217, 'enrol_paypal', 'paypalbusiness', '', NULL),
(831, 2, 1402745217, 'enrol_paypal', 'mailstudents', '0', NULL),
(832, 2, 1402745217, 'enrol_paypal', 'mailteachers', '0', NULL),
(833, 2, 1402745217, 'enrol_paypal', 'mailadmins', '0', NULL),
(834, 2, 1402745217, 'enrol_paypal', 'expiredaction', '3', NULL),
(835, 2, 1402745217, 'enrol_paypal', 'status', '1', NULL),
(836, 2, 1402745218, 'enrol_paypal', 'cost', '0', NULL),
(837, 2, 1402745218, 'enrol_paypal', 'currency', 'USD', NULL),
(838, 2, 1402745219, 'enrol_paypal', 'roleid', '5', NULL),
(839, 2, 1402745219, 'enrol_paypal', 'enrolperiod', '0', NULL),
(840, 2, 1402745219, 'enrol_self', 'requirepassword', '0', NULL),
(841, 2, 1402745219, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(842, 2, 1402745219, 'enrol_self', 'showhint', '0', NULL),
(843, 2, 1402745219, 'enrol_self', 'expiredaction', '1', NULL),
(844, 2, 1402745219, 'enrol_self', 'expirynotifyhour', '6', NULL),
(845, 2, 1402745219, 'enrol_self', 'defaultenrol', '1', NULL),
(846, 2, 1402745220, 'enrol_self', 'status', '1', NULL),
(847, 2, 1402745220, 'enrol_self', 'newenrols', '1', NULL),
(848, 2, 1402745220, 'enrol_self', 'groupkey', '0', NULL),
(849, 2, 1402745220, 'enrol_self', 'roleid', '5', NULL),
(850, 2, 1402745220, 'enrol_self', 'enrolperiod', '0', NULL),
(851, 2, 1402745220, 'enrol_self', 'expirynotify', '0', NULL),
(852, 2, 1402745220, 'enrol_self', 'expirythreshold', '86400', NULL),
(853, 2, 1402745220, 'enrol_self', 'longtimenosee', '0', NULL),
(854, 2, 1402745220, 'enrol_self', 'maxenrolled', '0', NULL),
(855, 2, 1402745220, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(856, 2, 1402745220, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen', NULL),
(857, 2, 1402745220, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(858, 2, 1402745220, 'editor_tinymce', 'customconfig', '', NULL),
(859, 2, 1402745220, 'tinymce_dragmath', 'requiretex', '1', NULL),
(860, 2, 1402745220, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(861, 2, 1402745221, 'tinymce_spellchecker', 'spellengine', '', NULL),
(862, 2, 1402745221, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(863, 2, 1402745221, NULL, 'filter_censor_badwords', '', NULL),
(864, 2, 1402745221, 'filter_emoticon', 'formats', '1,4,0', NULL),
(865, 2, 1402745221, NULL, 'filter_multilang_force_old', '0', NULL),
(866, 2, 1402745221, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(867, 2, 1402745221, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(868, 2, 1402745221, NULL, 'filter_tex_density', '120', NULL),
(869, 2, 1402745221, NULL, 'filter_tex_pathlatex', '"c:\\texmf\\miktex\\bin\\latex.exe" ', NULL),
(870, 2, 1402745222, NULL, 'filter_tex_pathdvips', '"c:\\texmf\\miktex\\bin\\dvips.exe" ', NULL),
(871, 2, 1402745222, NULL, 'filter_tex_pathconvert', '"c:\\imagemagick\\convert.exe" ', NULL),
(872, 2, 1402745222, NULL, 'filter_tex_convertformat', 'gif', NULL),
(873, 2, 1402745222, 'filter_urltolink', 'formats', '0', NULL),
(874, 2, 1402745222, 'filter_urltolink', 'embedimages', '1', NULL),
(875, 2, 1402745222, NULL, 'profileroles', '5,4,3', NULL),
(876, 2, 1402745222, NULL, 'coursecontact', '3', NULL),
(877, 2, 1402745222, NULL, 'frontpage', '6', NULL),
(878, 2, 1402745222, NULL, 'frontpageloggedin', '6', NULL),
(879, 2, 1402745222, NULL, 'maxcategorydepth', '2', NULL),
(880, 2, 1402745223, NULL, 'frontpagecourselimit', '200', NULL),
(881, 2, 1402745223, NULL, 'commentsperpage', '15', NULL),
(882, 2, 1402745223, NULL, 'defaultfrontpageroleid', '8', NULL),
(883, 2, 1402745223, NULL, 'supportname', 'Admin User', NULL),
(884, 2, 1402745223, NULL, 'supportemail', 'md.j.shakir@gmail.com', NULL),
(885, 2, 1402745244, NULL, 'registerauth', '', NULL),
(886, 2, 1402745884, 'theme_aardvark', 'logo', '', NULL),
(887, 2, 1402745884, 'theme_aardvark', 'hidemenu', '1', NULL),
(888, 2, 1402745884, 'theme_aardvark', 'emailurl', '', NULL),
(889, 2, 1402745884, 'theme_aardvark', 'customcss', '', NULL),
(890, 2, 1402745885, 'theme_aardvark', 'titledate', '1', NULL),
(891, 2, 1402745885, 'theme_aardvark', 'generalalert', '', NULL),
(892, 2, 1402745885, 'theme_aardvark', 'snowalert', '', NULL),
(893, 2, 1402745885, 'theme_aardvark', 'backcolor', '#fafafa', NULL),
(894, 2, 1402745885, 'theme_aardvark', 'backimage', '', NULL),
(895, 2, 1402745885, 'theme_aardvark', 'backposition', 'no-repeat', NULL),
(896, 2, 1402745885, 'theme_aardvark', 'menuhovercolor', '#f42941', NULL),
(897, 2, 1402745885, 'theme_aardvark', 'copyright', '', NULL),
(898, 2, 1402745885, 'theme_aardvark', 'ceop', '', NULL),
(899, 2, 1402745885, 'theme_aardvark', 'disclaimer', '', NULL),
(900, 2, 1402745885, 'theme_aardvark', 'website', '', NULL),
(901, 2, 1402745885, 'theme_aardvark', 'facebook', '', NULL),
(902, 2, 1402745885, 'theme_aardvark', 'twitter', '', NULL),
(903, 2, 1402745885, 'theme_aardvark', 'googleplus', '', NULL),
(904, 2, 1402745885, 'theme_aardvark', 'flickr', '', NULL),
(905, 2, 1402745886, 'theme_aardvark', 'pinterest', '', NULL),
(906, 2, 1402745886, 'theme_aardvark', 'instagram', '', NULL),
(907, 2, 1402745886, 'theme_aardvark', 'linkedin', '', NULL),
(908, 2, 1402745886, 'theme_aardvark', 'wikipedia', '', NULL),
(909, 2, 1402745886, 'theme_aardvark', 'youtube', '', NULL),
(910, 2, 1402745886, 'theme_aardvark', 'apple', '', NULL),
(911, 2, 1402745886, 'theme_aardvark', 'android', '', NULL),
(912, 2, 1402746455, 'theme_essential', 'siteicon', 'laptop', NULL),
(913, 2, 1402746455, 'theme_essential', 'bootstrapcdn', '0', NULL),
(914, 2, 1402746455, 'theme_essential', 'logo', '', NULL),
(915, 2, 1402746455, 'theme_essential', 'fontselect', '1', NULL),
(916, 2, 1402746456, 'theme_essential', 'headerprofilepic', '1', NULL),
(917, 2, 1402746456, 'theme_essential', 'pagewidth', '1200', NULL),
(918, 2, 1402746456, 'theme_essential', 'layout', '', NULL),
(919, 2, 1402746456, 'theme_essential', 'sideregionsmaxwidth', '', NULL),
(920, 2, 1402746456, 'theme_essential', 'editicons', '0', NULL),
(921, 2, 1402746456, 'theme_essential', 'perfinfo', 'min', NULL),
(922, 2, 1402746456, 'theme_essential', 'navbarsep', '/', NULL),
(923, 2, 1402746457, 'theme_essential', 'copyright', '', NULL),
(924, 2, 1402746457, 'theme_essential', 'footnote', '', NULL),
(925, 2, 1402746457, 'theme_essential', 'customcss', '', NULL),
(926, 2, 1402746457, 'theme_essential', 'displaymydashboard', '1', NULL),
(927, 2, 1402746457, 'theme_essential', 'displaymycourses', '1', NULL),
(928, 2, 1402746457, 'theme_essential', 'mycoursetitle', 'course', NULL),
(929, 2, 1402746457, 'theme_essential', 'pagebackground', '', NULL),
(930, 2, 1402746457, 'theme_essential', 'themecolor', '#30add1', NULL),
(931, 2, 1402746457, 'theme_essential', 'themehovercolor', '#29a1c4', NULL),
(932, 2, 1402746458, 'theme_essential', 'slideheadercolor', '#30add1', NULL),
(933, 2, 1402746458, 'theme_essential', 'slidecolor', '#888', NULL),
(934, 2, 1402746458, 'theme_essential', 'slidebuttoncolor', '#30add1', NULL),
(935, 2, 1402746458, 'theme_essential', 'footercolor', '#000000', NULL),
(936, 2, 1402746459, 'theme_essential', 'footertextcolor', '#DDDDDD', NULL),
(937, 2, 1402746459, 'theme_essential', 'footerheadingcolor', '#CCCCCC', NULL),
(938, 2, 1402746459, 'theme_essential', 'footersepcolor', '#313131', NULL),
(939, 2, 1402746459, 'theme_essential', 'footerurlcolor', '#BBBBBB', NULL),
(940, 2, 1402746459, 'theme_essential', 'footerhovercolor', '#FFFFFF', NULL),
(941, 2, 1402746459, 'theme_essential', 'enablealternativethemecolors1', '', NULL),
(942, 2, 1402746459, 'theme_essential', 'alternativethemename1', 'Alternative Colours 1', NULL),
(943, 2, 1402746459, 'theme_essential', 'alternativethemecolor1', '#a430d1', NULL),
(944, 2, 1402746460, 'theme_essential', 'alternativethemehovercolor1', '#9929c4', NULL),
(945, 2, 1402746460, 'theme_essential', 'enablealternativethemecolors2', '', NULL),
(946, 2, 1402746460, 'theme_essential', 'alternativethemename2', 'Alternative Colours 2', NULL),
(947, 2, 1402746460, 'theme_essential', 'alternativethemecolor2', '#d15430', NULL),
(948, 2, 1402746460, 'theme_essential', 'alternativethemehovercolor2', '#c44c29', NULL),
(949, 2, 1402746460, 'theme_essential', 'enablealternativethemecolors3', '', NULL),
(950, 2, 1402746460, 'theme_essential', 'alternativethemename3', 'Alternative Colours 3', NULL),
(951, 2, 1402746460, 'theme_essential', 'alternativethemecolor3', '#5dd130', NULL),
(952, 2, 1402746461, 'theme_essential', 'alternativethemehovercolor3', '#53c429', NULL),
(953, 2, 1402746461, 'theme_essential', 'toggleslideshow', '1', NULL),
(954, 2, 1402746461, 'theme_essential', 'hideonphone', '', NULL),
(955, 2, 1402746461, 'theme_essential', 'slideshowvariant', '1', NULL),
(956, 2, 1402746461, 'theme_essential', 'slide1', '', NULL),
(957, 2, 1402746461, 'theme_essential', 'slide1image', '', NULL),
(958, 2, 1402746461, 'theme_essential', 'slide1caption', '', NULL),
(959, 2, 1402746461, 'theme_essential', 'slide1url', '', NULL),
(960, 2, 1402746461, 'theme_essential', 'slide2', '', NULL),
(961, 2, 1402746461, 'theme_essential', 'slide2image', '', NULL),
(962, 2, 1402746462, 'theme_essential', 'slide2caption', '', NULL),
(963, 2, 1402746462, 'theme_essential', 'slide2url', '', NULL),
(964, 2, 1402746462, 'theme_essential', 'slide3', '', NULL),
(965, 2, 1402746462, 'theme_essential', 'slide3image', '', NULL),
(966, 2, 1402746462, 'theme_essential', 'slide3caption', '', NULL),
(967, 2, 1402746462, 'theme_essential', 'slide3url', '', NULL),
(968, 2, 1402746463, 'theme_essential', 'slide4', '', NULL),
(969, 2, 1402746463, 'theme_essential', 'slide4image', '', NULL),
(970, 2, 1402746463, 'theme_essential', 'slide4caption', '', NULL),
(971, 2, 1402746463, 'theme_essential', 'slide4url', '', NULL),
(972, 2, 1402746463, 'theme_essential', 'usefrontcontent', '', NULL),
(973, 2, 1402746463, 'theme_essential', 'frontcontentarea', '', NULL),
(974, 2, 1402746463, 'theme_essential', 'frontpageblocks', '1', NULL),
(975, 2, 1402746463, 'theme_essential', 'frontpagemiddleblocks', '1', NULL),
(976, 2, 1402746463, 'theme_essential', 'togglemarketing', '1', NULL),
(977, 2, 1402746464, 'theme_essential', 'marketingheight', '0', NULL),
(978, 2, 1402746464, 'theme_essential', 'marketing1', '', NULL),
(979, 2, 1402746464, 'theme_essential', 'marketing1icon', 'star', NULL),
(980, 2, 1402746464, 'theme_essential', 'marketing1image', '', NULL),
(981, 2, 1402746464, 'theme_essential', 'marketing1content', '', NULL),
(982, 2, 1402746464, 'theme_essential', 'marketing1buttontext', '', NULL),
(983, 2, 1402746465, 'theme_essential', 'marketing1buttonurl', '', NULL),
(984, 2, 1402746465, 'theme_essential', 'marketing2', '', NULL),
(985, 2, 1402746465, 'theme_essential', 'marketing2icon', 'star', NULL),
(986, 2, 1402746465, 'theme_essential', 'marketing2image', '', NULL),
(987, 2, 1402746465, 'theme_essential', 'marketing2content', '', NULL),
(988, 2, 1402746465, 'theme_essential', 'marketing2buttontext', '', NULL),
(989, 2, 1402746465, 'theme_essential', 'marketing2buttonurl', '', NULL),
(990, 2, 1402746465, 'theme_essential', 'marketing3', '', NULL),
(991, 2, 1402746465, 'theme_essential', 'marketing3icon', 'star', NULL),
(992, 2, 1402746466, 'theme_essential', 'marketing3image', '', NULL),
(993, 2, 1402746466, 'theme_essential', 'marketing3content', '', NULL),
(994, 2, 1402746466, 'theme_essential', 'marketing3buttontext', '', NULL),
(995, 2, 1402746466, 'theme_essential', 'marketing3buttonurl', '', NULL),
(996, 2, 1402746466, 'theme_essential', 'website', '', NULL),
(997, 2, 1402746466, 'theme_essential', 'facebook', '', NULL),
(998, 2, 1402746466, 'theme_essential', 'flickr', '', NULL),
(999, 2, 1402746466, 'theme_essential', 'twitter', '', NULL),
(1000, 2, 1402746467, 'theme_essential', 'googleplus', '', NULL),
(1001, 2, 1402746467, 'theme_essential', 'linkedin', '', NULL),
(1002, 2, 1402746467, 'theme_essential', 'pinterest', '', NULL),
(1003, 2, 1402746467, 'theme_essential', 'instagram', '', NULL),
(1004, 2, 1402746467, 'theme_essential', 'youtube', '', NULL),
(1005, 2, 1402746467, 'theme_essential', 'skype', '', NULL),
(1006, 2, 1402746468, 'theme_essential', 'vk', '', NULL),
(1007, 2, 1402746468, 'theme_essential', 'usecategoryicon', '', NULL),
(1008, 2, 1402746468, 'theme_essential', 'defaultcategoryicon', 'f07c', NULL),
(1009, 2, 1402746468, 'theme_essential', 'categoryicon1', 'f07c', NULL),
(1010, 2, 1402746468, 'theme_essential', 'categoryicon2', 'f07c', NULL),
(1011, 2, 1402746468, 'theme_essential', 'categoryicon3', 'f07c', NULL),
(1012, 2, 1402746468, 'theme_essential', 'categoryicon4', 'f07c', NULL),
(1013, 2, 1402746468, 'theme_essential', 'categoryicon5', 'f07c', NULL),
(1014, 2, 1402746468, 'theme_essential', 'categoryicon6', 'f07c', NULL),
(1015, 2, 1402746469, 'theme_essential', 'categoryicon7', 'f07c', NULL),
(1016, 2, 1402746469, 'theme_essential', 'categoryicon8', 'f07c', NULL),
(1017, 2, 1402746469, 'theme_essential', 'categoryicon9', 'f07c', NULL),
(1018, 2, 1402746469, 'theme_essential', 'categoryicon10', 'f07c', NULL),
(1019, 2, 1402746470, 'theme_essential', 'categoryicon11', 'f07c', NULL),
(1020, 2, 1402746470, 'theme_essential', 'categoryicon12', 'f07c', NULL),
(1021, 2, 1402746470, 'theme_essential', 'categoryicon13', 'f07c', NULL),
(1022, 2, 1402746470, 'theme_essential', 'categoryicon14', 'f07c', NULL),
(1023, 2, 1402746470, 'theme_essential', 'categoryicon15', 'f07c', NULL),
(1024, 2, 1402746470, 'theme_essential', 'categoryicon16', 'f07c', NULL),
(1025, 2, 1402746470, 'theme_essential', 'categoryicon17', 'f07c', NULL),
(1026, 2, 1402746470, 'theme_essential', 'categoryicon18', 'f07c', NULL),
(1027, 2, 1402746470, 'theme_essential', 'categoryicon19', 'f07c', NULL),
(1028, 2, 1402746471, 'theme_essential', 'categoryicon20', 'f07c', NULL),
(1029, 2, 1402746471, 'theme_essential', 'android', '', NULL),
(1030, 2, 1402746471, 'theme_essential', 'ios', '', NULL),
(1031, 2, 1402746471, 'theme_essential', 'iphoneicon', '', NULL),
(1032, 2, 1402746471, 'theme_essential', 'iphoneretinaicon', '', NULL),
(1033, 2, 1402746471, 'theme_essential', 'ipadicon', '', NULL),
(1034, 2, 1402746471, 'theme_essential', 'ipadretinaicon', '', NULL),
(1035, 2, 1402746472, 'theme_essential', 'enable1alert', '', NULL),
(1036, 2, 1402746472, 'theme_essential', 'alert1type', 'info', NULL),
(1037, 2, 1402746472, 'theme_essential', 'alert1title_en', '', NULL),
(1038, 2, 1402746472, 'theme_essential', 'alert1text_en', '', NULL),
(1039, 2, 1402746472, 'theme_essential', 'enable2alert', '', NULL),
(1040, 2, 1402746472, 'theme_essential', 'alert2type', 'info', NULL),
(1041, 2, 1402746472, 'theme_essential', 'alert2title_en', '', NULL),
(1042, 2, 1402746472, 'theme_essential', 'alert2text_en', '', NULL),
(1043, 2, 1402746472, 'theme_essential', 'enable3alert', '', NULL),
(1044, 2, 1402746473, 'theme_essential', 'alert3type', 'info', NULL),
(1045, 2, 1402746473, 'theme_essential', 'alert3title_en', '', NULL),
(1046, 2, 1402746473, 'theme_essential', 'alert3text_en', '', NULL),
(1047, 2, 1402746473, 'theme_essential', 'useanalytics', '', NULL),
(1048, 2, 1402746473, 'theme_essential', 'analyticsid', '', NULL),
(1049, 2, 1402746473, 'theme_essential', 'analyticsclean', '', NULL),
(1050, 2, 1402747747, 'theme_essential', 'slide1', 'This is Slide 1', ''),
(1051, 2, 1402747748, 'theme_essential', 'slide2', 'This is Slide 2', ''),
(1052, 2, 1402747748, 'theme_essential', 'slide3', 'This is Slide 3', ''),
(1053, 2, 1402747748, 'theme_essential', 'slide4', 'This is Slide 4', ''),
(1054, 2, 1402747769, 'theme_essential', 'frontpagemiddleblocks', '0', '1'),
(1055, 2, 1402747821, 'theme_essential', 'toggleslideshow', '0', '1'),
(1056, 2, 1402747821, 'theme_essential', 'hideonphone', 'hidden-phone', ''),
(1057, 2, 1402747862, 'theme_essential', 'togglemarketing', '0', '1'),
(1058, 2, 1402747918, NULL, 'frontpage', '', '6'),
(1059, 2, 1402747918, NULL, 'frontpageloggedin', '', '6');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=1180 ;

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'visible', '1'),
(2, 'moodlecourse', 'format', 'weeks'),
(3, 'moodlecourse', 'maxsections', '52'),
(4, 'moodlecourse', 'numsections', '10'),
(5, 'moodlecourse', 'hiddensections', '0'),
(6, 'moodlecourse', 'coursedisplay', '0'),
(7, 'moodlecourse', 'lang', ''),
(8, 'moodlecourse', 'newsitems', '5'),
(9, 'moodlecourse', 'showgrades', '1'),
(10, 'moodlecourse', 'showreports', '0'),
(11, 'moodlecourse', 'maxbytes', '0'),
(12, 'moodlecourse', 'enablecompletion', '0'),
(13, 'moodlecourse', 'groupmode', '0'),
(14, 'moodlecourse', 'groupmodeforce', '0'),
(15, 'backup', 'loglifetime', '30'),
(16, 'backup', 'backup_general_users', '1'),
(17, 'backup', 'backup_general_users_locked', ''),
(18, 'backup', 'backup_general_anonymize', '0'),
(19, 'backup', 'backup_general_anonymize_locked', ''),
(20, 'backup', 'backup_general_role_assignments', '1'),
(21, 'backup', 'backup_general_role_assignments_locked', ''),
(22, 'backup', 'backup_general_activities', '1'),
(23, 'backup', 'backup_general_activities_locked', ''),
(24, 'backup', 'backup_general_blocks', '1'),
(25, 'backup', 'backup_general_blocks_locked', ''),
(26, 'backup', 'backup_general_filters', '1'),
(27, 'backup', 'backup_general_filters_locked', ''),
(28, 'backup', 'backup_general_comments', '1'),
(29, 'backup', 'backup_general_comments_locked', ''),
(30, 'backup', 'backup_general_badges', '1'),
(31, 'backup', 'backup_general_badges_locked', ''),
(32, 'backup', 'backup_general_userscompletion', '1'),
(33, 'backup', 'backup_general_userscompletion_locked', ''),
(34, 'backup', 'backup_general_logs', '0'),
(35, 'backup', 'backup_general_logs_locked', ''),
(36, 'backup', 'backup_general_histories', '0'),
(37, 'backup', 'backup_general_histories_locked', ''),
(38, 'backup', 'backup_general_questionbank', '1'),
(39, 'backup', 'backup_general_questionbank_locked', ''),
(40, 'backup', 'import_general_maxresults', '10'),
(41, 'backup', 'backup_auto_active', '0'),
(42, 'backup', 'backup_auto_weekdays', '0000000'),
(43, 'backup', 'backup_auto_hour', '0'),
(44, 'backup', 'backup_auto_minute', '0'),
(45, 'backup', 'backup_auto_storage', '0'),
(46, 'backup', 'backup_auto_destination', ''),
(47, 'backup', 'backup_auto_keep', '1'),
(48, 'backup', 'backup_shortname', '0'),
(49, 'backup', 'backup_auto_skip_hidden', '1'),
(50, 'backup', 'backup_auto_skip_modif_days', '30'),
(51, 'backup', 'backup_auto_skip_modif_prev', '0'),
(52, 'backup', 'backup_auto_users', '1'),
(53, 'backup', 'backup_auto_role_assignments', '1'),
(54, 'backup', 'backup_auto_activities', '1'),
(55, 'backup', 'backup_auto_blocks', '1'),
(56, 'backup', 'backup_auto_filters', '1'),
(57, 'backup', 'backup_auto_comments', '1'),
(58, 'backup', 'backup_auto_badges', '1'),
(59, 'backup', 'backup_auto_userscompletion', '1'),
(60, 'backup', 'backup_auto_logs', '0'),
(61, 'backup', 'backup_auto_histories', '0'),
(62, 'backup', 'backup_auto_questionbank', '1'),
(63, 'question_preview', 'behaviour', 'deferredfeedback'),
(64, 'question_preview', 'correctness', '1'),
(65, 'question_preview', 'marks', '1'),
(66, 'question_preview', 'markdp', '2'),
(67, 'question_preview', 'feedback', '1'),
(68, 'question_preview', 'generalfeedback', '1'),
(69, 'question_preview', 'rightanswer', '1'),
(70, 'question_preview', 'history', '0'),
(71, 'cachestore_memcache', 'testservers', ''),
(72, 'cachestore_memcached', 'testservers', ''),
(73, 'cachestore_mongodb', 'testserver', ''),
(74, 'theme_afterburner', 'logo', ''),
(75, 'theme_afterburner', 'footnote', ''),
(76, 'theme_afterburner', 'customcss', ''),
(77, 'theme_anomaly', 'tagline', ''),
(78, 'theme_anomaly', 'customcss', ''),
(79, 'theme_arialist', 'logo', ''),
(80, 'theme_arialist', 'tagline', ''),
(81, 'theme_arialist', 'linkcolor', '#f25f0f'),
(82, 'theme_arialist', 'regionwidth', '250'),
(83, 'theme_arialist', 'customcss', ''),
(84, 'theme_brick', 'logo', ''),
(85, 'theme_brick', 'linkcolor', '#06365b'),
(86, 'theme_brick', 'linkhover', '#5487ad'),
(87, 'theme_brick', 'maincolor', '#8e2800'),
(88, 'theme_brick', 'maincolorlink', '#fff0a5'),
(89, 'theme_brick', 'headingcolor', '#5c3500'),
(90, 'theme_clean', 'invert', '0'),
(91, 'theme_clean', 'logo', ''),
(92, 'theme_clean', 'customcss', ''),
(93, 'theme_clean', 'footnote', ''),
(94, 'theme_formal_white', 'fontsizereference', '13'),
(95, 'theme_formal_white', 'noframe', '0'),
(96, 'theme_formal_white', 'framemargin', '15'),
(97, 'theme_formal_white', 'headercontent', '1'),
(98, 'theme_formal_white', 'trendcolor', 'mink'),
(99, 'theme_formal_white', 'customlogourl', ''),
(100, 'theme_formal_white', 'frontpagelogourl', ''),
(101, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(102, 'theme_formal_white', 'creditstomoodleorg', '2'),
(103, 'theme_formal_white', 'blockcolumnwidth', '200'),
(104, 'theme_formal_white', 'blockpadding', '8'),
(105, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(106, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(107, 'theme_formal_white', 'rblockcolumnbgc', ''),
(108, 'theme_formal_white', 'footnote', ''),
(109, 'theme_formal_white', 'customcss', ''),
(110, 'theme_fusion', 'linkcolor', '#2d83d5'),
(111, 'theme_fusion', 'tagline', ''),
(112, 'theme_fusion', 'footertext', ''),
(113, 'theme_fusion', 'customcss', ''),
(114, 'theme_magazine', 'background', ''),
(115, 'theme_magazine', 'logo', ''),
(116, 'theme_magazine', 'linkcolor', '#32529a'),
(117, 'theme_magazine', 'linkhover', '#4e2300'),
(118, 'theme_magazine', 'maincolor', '#002f2f'),
(119, 'theme_magazine', 'maincoloraccent', '#092323'),
(120, 'theme_magazine', 'headingcolor', '#4e0000'),
(121, 'theme_magazine', 'blockcolor', '#002f2f'),
(122, 'theme_magazine', 'forumback', '#e6e2af'),
(123, 'theme_nimble', 'tagline', ''),
(124, 'theme_nimble', 'footerline', ''),
(125, 'theme_nimble', 'backgroundcolor', '#454545'),
(126, 'theme_nimble', 'linkcolor', '#2a65b1'),
(127, 'theme_nimble', 'linkhover', '#222222'),
(128, 'theme_nonzero', 'regionprewidth', '200'),
(129, 'theme_nonzero', 'regionpostwidth', '200'),
(130, 'theme_nonzero', 'customcss', ''),
(131, 'theme_overlay', 'linkcolor', '#428ab5'),
(132, 'theme_overlay', 'headercolor', '#2a4c7b'),
(133, 'theme_overlay', 'footertext', ''),
(134, 'theme_overlay', 'customcss', ''),
(135, 'theme_sky_high', 'logo', ''),
(136, 'theme_sky_high', 'regionwidth', '240'),
(137, 'theme_sky_high', 'footnote', ''),
(138, 'theme_sky_high', 'customcss', ''),
(139, 'theme_splash', 'logo', ''),
(140, 'theme_splash', 'tagline', 'Virtual learning center'),
(141, 'theme_splash', 'hide_tagline', '0'),
(142, 'theme_splash', 'footnote', ''),
(143, 'theme_splash', 'customcss', ''),
(144, 'qtype_calculated', 'version', '2013110500'),
(145, 'qtype_calculatedmulti', 'version', '2013110500'),
(146, 'qtype_calculatedsimple', 'version', '2013110500'),
(147, 'qtype_description', 'version', '2013110500'),
(148, 'qtype_essay', 'version', '2013110500'),
(149, 'qtype_match', 'version', '2013110500'),
(150, 'qtype_missingtype', 'version', '2013110500'),
(151, 'qtype_multianswer', 'version', '2013110500'),
(152, 'qtype_multichoice', 'version', '2013110500'),
(153, 'qtype_numerical', 'version', '2013110500'),
(154, 'qtype_random', 'version', '2013110500'),
(155, 'qtype_randomsamatch', 'version', '2013110503'),
(156, 'qtype_shortanswer', 'version', '2013110500'),
(157, 'qtype_truefalse', 'version', '2013110500'),
(158, 'mod_assign', 'version', '2013110500'),
(159, 'mod_assignment', 'version', '2013110500'),
(161, 'mod_book', 'version', '2013110500'),
(162, 'mod_chat', 'version', '2013110500'),
(163, 'mod_choice', 'version', '2013110500'),
(164, 'mod_data', 'version', '2013110500'),
(165, 'mod_feedback', 'version', '2013110500'),
(167, 'mod_folder', 'version', '2013110500'),
(169, 'mod_forum', 'version', '2013110500'),
(170, 'mod_glossary', 'version', '2013110500'),
(171, 'mod_imscp', 'version', '2013110500'),
(173, 'mod_label', 'version', '2013110500'),
(174, 'mod_lesson', 'version', '2013110500'),
(175, 'mod_lti', 'version', '2013110500'),
(176, 'mod_page', 'version', '2013110500'),
(178, 'mod_quiz', 'version', '2013110501'),
(179, 'mod_resource', 'version', '2013110500'),
(180, 'mod_scorm', 'version', '2013110504'),
(181, 'mod_survey', 'version', '2013110500'),
(183, 'mod_url', 'version', '2013110500'),
(185, 'mod_wiki', 'version', '2013110500'),
(187, 'mod_workshop', 'version', '2013110500'),
(188, 'auth_cas', 'version', '2013110500'),
(190, 'auth_db', 'version', '2013110500'),
(192, 'auth_email', 'version', '2013110500'),
(193, 'auth_fc', 'version', '2013110500'),
(195, 'auth_imap', 'version', '2013110500'),
(197, 'auth_ldap', 'version', '2013110500'),
(199, 'auth_manual', 'version', '2013110500'),
(200, 'auth_mnet', 'version', '2013110500'),
(202, 'auth_nntp', 'version', '2013110500'),
(204, 'auth_nologin', 'version', '2013110500'),
(205, 'auth_none', 'version', '2013110500'),
(206, 'auth_pam', 'version', '2013110500'),
(208, 'auth_pop3', 'version', '2013110500'),
(210, 'auth_radius', 'version', '2013110500'),
(212, 'auth_shibboleth', 'version', '2013110500'),
(214, 'auth_webservice', 'version', '2013110500'),
(215, 'calendartype_gregorian', 'version', '2013110500'),
(216, 'enrol_category', 'version', '2013110500'),
(218, 'enrol_cohort', 'version', '2013110500'),
(219, 'enrol_database', 'version', '2013110500'),
(221, 'enrol_flatfile', 'version', '2013110500'),
(223, 'enrol_flatfile', 'map_1', 'manager'),
(224, 'enrol_flatfile', 'map_2', 'coursecreator'),
(225, 'enrol_flatfile', 'map_3', 'editingteacher'),
(226, 'enrol_flatfile', 'map_4', 'teacher'),
(227, 'enrol_flatfile', 'map_5', 'student'),
(228, 'enrol_flatfile', 'map_6', 'guest'),
(229, 'enrol_flatfile', 'map_7', 'user'),
(230, 'enrol_flatfile', 'map_8', 'frontpage'),
(231, 'enrol_guest', 'version', '2013110500'),
(232, 'enrol_imsenterprise', 'version', '2013110500'),
(234, 'enrol_ldap', 'version', '2013110500'),
(236, 'enrol_manual', 'version', '2013110500'),
(238, 'enrol_meta', 'version', '2013110500'),
(240, 'enrol_mnet', 'version', '2013110500'),
(241, 'enrol_paypal', 'version', '2013110500'),
(242, 'enrol_self', 'version', '2013110501'),
(244, 'message_email', 'version', '2013110500'),
(246, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(247, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(248, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(249, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(250, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(251, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(252, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(253, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(254, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(255, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(256, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(257, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(258, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(259, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(260, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(261, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(262, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(263, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(264, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(265, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(266, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(267, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(268, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(269, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(270, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(271, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(272, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(273, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(274, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(275, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(276, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(277, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(278, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(279, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(280, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(281, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(282, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(283, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(284, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(285, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(286, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(287, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(288, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(289, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(290, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(291, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(292, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(293, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(294, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(295, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(296, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(297, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(298, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(299, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(300, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(301, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(302, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(303, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(304, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(305, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(306, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(307, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(308, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(309, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(310, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(311, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(312, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'popup,email'),
(313, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(314, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
(315, 'message_jabber', 'version', '2013110500'),
(317, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(318, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(319, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(320, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(321, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(322, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(323, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(324, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(325, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(326, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(327, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(328, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(329, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(330, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(331, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(332, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(333, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(334, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(335, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(336, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(337, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(338, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(339, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(340, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(341, 'message_popup', 'version', '2013110500'),
(343, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(344, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(345, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(346, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(347, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(348, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(349, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(350, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(351, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(352, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(353, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(354, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(355, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(356, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(357, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(358, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(359, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(360, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(361, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(362, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(363, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(364, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(365, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(366, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(367, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
(368, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(369, 'block_activity_modules', 'version', '2013110500'),
(370, 'block_admin_bookmarks', 'version', '2013110500'),
(371, 'block_badges', 'version', '2013110500'),
(372, 'block_blog_menu', 'version', '2013110500'),
(373, 'block_blog_recent', 'version', '2013110500'),
(374, 'block_blog_tags', 'version', '2013110500'),
(375, 'block_calendar_month', 'version', '2013110500'),
(376, 'block_calendar_upcoming', 'version', '2013110500'),
(377, 'block_comments', 'version', '2013110500'),
(378, 'block_community', 'version', '2013110500'),
(379, 'block_completionstatus', 'version', '2013110500'),
(380, 'block_course_list', 'version', '2013110500'),
(381, 'block_course_overview', 'version', '2013110500'),
(382, 'block_course_summary', 'version', '2013110500'),
(383, 'block_feedback', 'version', '2013110500'),
(385, 'block_glossary_random', 'version', '2013110500'),
(386, 'block_html', 'version', '2013110500'),
(387, 'block_login', 'version', '2013110500'),
(388, 'block_mentees', 'version', '2013110500'),
(389, 'block_messages', 'version', '2013110500'),
(390, 'block_mnet_hosts', 'version', '2013110500'),
(391, 'block_myprofile', 'version', '2013110500'),
(392, 'block_navigation', 'version', '2013110500'),
(393, 'block_news_items', 'version', '2013110501'),
(394, 'block_online_users', 'version', '2013110500'),
(395, 'block_participants', 'version', '2013110500'),
(396, 'block_private_files', 'version', '2013110500'),
(397, 'block_quiz_results', 'version', '2013110500'),
(398, 'block_recent_activity', 'version', '2013110500'),
(399, 'block_rss_client', 'version', '2013110500'),
(400, 'block_search_forums', 'version', '2013110500'),
(401, 'block_section_links', 'version', '2013110500'),
(402, 'block_selfcompletion', 'version', '2013110500'),
(403, 'block_settings', 'version', '2013110500'),
(404, 'block_site_main_menu', 'version', '2013110500'),
(405, 'block_social_activities', 'version', '2013110500'),
(406, 'block_tag_flickr', 'version', '2013110500'),
(407, 'block_tag_youtube', 'version', '2013110500'),
(408, 'block_tags', 'version', '2013110500'),
(409, 'filter_activitynames', 'version', '2013110500'),
(411, 'filter_algebra', 'version', '2013110500'),
(412, 'filter_censor', 'version', '2013110500'),
(413, 'filter_data', 'version', '2013110500'),
(415, 'filter_emailprotect', 'version', '2013110500'),
(416, 'filter_emoticon', 'version', '2013110500'),
(417, 'filter_glossary', 'version', '2013110500'),
(419, 'filter_mediaplugin', 'version', '2013110500'),
(421, 'filter_multilang', 'version', '2013110500'),
(422, 'filter_tex', 'version', '2013110500'),
(424, 'filter_tidy', 'version', '2013110500'),
(425, 'filter_urltolink', 'version', '2013110500'),
(426, 'editor_textarea', 'version', '2013110500'),
(427, 'editor_tinymce', 'version', '2013110601'),
(428, 'format_singleactivity', 'version', '2013110500'),
(429, 'format_social', 'version', '2013110500'),
(430, 'format_topics', 'version', '2013110500'),
(431, 'format_weeks', 'version', '2013110500'),
(432, 'profilefield_checkbox', 'version', '2013110500'),
(433, 'profilefield_datetime', 'version', '2013110500'),
(434, 'profilefield_menu', 'version', '2013110500'),
(435, 'profilefield_text', 'version', '2013110500'),
(436, 'profilefield_textarea', 'version', '2013110500'),
(437, 'report_backups', 'version', '2013110500'),
(438, 'report_completion', 'version', '2013110500'),
(440, 'report_configlog', 'version', '2013110500'),
(441, 'report_courseoverview', 'version', '2013110500'),
(442, 'report_log', 'version', '2013110500'),
(444, 'report_loglive', 'version', '2013110500'),
(445, 'report_outline', 'version', '2013110500'),
(447, 'report_participation', 'version', '2013110500'),
(449, 'report_performance', 'version', '2013110500'),
(450, 'report_progress', 'version', '2013110500'),
(452, 'report_questioninstances', 'version', '2013110500'),
(453, 'report_security', 'version', '2013110500'),
(454, 'report_stats', 'version', '2013110500'),
(456, 'gradeexport_ods', 'version', '2013110500'),
(457, 'gradeexport_txt', 'version', '2013110500'),
(458, 'gradeexport_xls', 'version', '2013110500'),
(459, 'gradeexport_xml', 'version', '2013110500'),
(460, 'gradeimport_csv', 'version', '2013110500'),
(461, 'gradeimport_xml', 'version', '2013110500'),
(462, 'gradereport_grader', 'version', '2013110500'),
(463, 'gradereport_outcomes', 'version', '2013110500'),
(464, 'gradereport_overview', 'version', '2013110500'),
(465, 'gradereport_user', 'version', '2013110500'),
(466, 'gradingform_guide', 'version', '2013110500'),
(467, 'gradingform_rubric', 'version', '2013110500'),
(468, 'mnetservice_enrol', 'version', '2013110500'),
(469, 'webservice_amf', 'version', '2013110500'),
(470, 'webservice_rest', 'version', '2013110500'),
(471, 'webservice_soap', 'version', '2013110500'),
(472, 'webservice_xmlrpc', 'version', '2013110500'),
(473, 'repository_alfresco', 'version', '2014022600'),
(474, 'repository_areafiles', 'version', '2013110500'),
(476, 'areafiles', 'enablecourseinstances', '0'),
(477, 'areafiles', 'enableuserinstances', '0'),
(478, 'repository_boxnet', 'version', '2013110700'),
(479, 'repository_coursefiles', 'version', '2013110500'),
(480, 'repository_dropbox', 'version', '2013110500'),
(481, 'repository_equella', 'version', '2013110500'),
(482, 'repository_filesystem', 'version', '2013110500'),
(483, 'repository_flickr', 'version', '2013110500'),
(484, 'repository_flickr_public', 'version', '2013110500'),
(485, 'repository_googledocs', 'version', '2013110500'),
(486, 'repository_local', 'version', '2013110500'),
(488, 'local', 'enablecourseinstances', '0'),
(489, 'local', 'enableuserinstances', '0'),
(490, 'repository_merlot', 'version', '2013110500'),
(491, 'repository_picasa', 'version', '2013110500'),
(492, 'repository_recent', 'version', '2013110500'),
(494, 'recent', 'enablecourseinstances', '0'),
(495, 'recent', 'enableuserinstances', '0'),
(496, 'repository_s3', 'version', '2013110500'),
(497, 'repository_skydrive', 'version', '2013110500'),
(498, 'repository_upload', 'version', '2013110500'),
(500, 'upload', 'enablecourseinstances', '0'),
(501, 'upload', 'enableuserinstances', '0'),
(502, 'repository_url', 'version', '2013110500'),
(504, 'url', 'enablecourseinstances', '0'),
(505, 'url', 'enableuserinstances', '0'),
(506, 'repository_user', 'version', '2013110500'),
(508, 'user', 'enablecourseinstances', '0'),
(509, 'user', 'enableuserinstances', '0'),
(510, 'repository_webdav', 'version', '2013110500'),
(511, 'repository_wikimedia', 'version', '2013110500'),
(513, 'wikimedia', 'enablecourseinstances', '0'),
(514, 'wikimedia', 'enableuserinstances', '0'),
(515, 'repository_youtube', 'version', '2013110500'),
(517, 'youtube', 'enablecourseinstances', '0'),
(518, 'youtube', 'enableuserinstances', '0'),
(519, 'portfolio_boxnet', 'version', '2013110602'),
(520, 'portfolio_download', 'version', '2013110500'),
(521, 'portfolio_flickr', 'version', '2013110500'),
(522, 'portfolio_googledocs', 'version', '2013110500'),
(523, 'portfolio_mahara', 'version', '2013110500'),
(524, 'portfolio_picasa', 'version', '2013110500'),
(525, 'qbehaviour_adaptive', 'version', '2013110500'),
(526, 'qbehaviour_adaptivenopenalty', 'version', '2013110500'),
(527, 'qbehaviour_deferredcbm', 'version', '2013110500'),
(528, 'qbehaviour_deferredfeedback', 'version', '2013110500'),
(529, 'qbehaviour_immediatecbm', 'version', '2013110500'),
(530, 'qbehaviour_immediatefeedback', 'version', '2013110500'),
(531, 'qbehaviour_informationitem', 'version', '2013110500'),
(532, 'qbehaviour_interactive', 'version', '2013110500'),
(533, 'qbehaviour_interactivecountback', 'version', '2013110500'),
(534, 'qbehaviour_manualgraded', 'version', '2013110500'),
(536, 'question', 'disabledbehaviours', 'manualgraded'),
(537, 'qbehaviour_missing', 'version', '2013110500'),
(538, 'qformat_aiken', 'version', '2013110500'),
(539, 'qformat_blackboard_six', 'version', '2013110500'),
(540, 'qformat_examview', 'version', '2013110500'),
(541, 'qformat_gift', 'version', '2013110500'),
(542, 'qformat_learnwise', 'version', '2013110500'),
(543, 'qformat_missingword', 'version', '2013110500'),
(544, 'qformat_multianswer', 'version', '2013110500'),
(545, 'qformat_webct', 'version', '2013110500'),
(546, 'qformat_xhtml', 'version', '2013110500'),
(547, 'qformat_xml', 'version', '2013110500'),
(548, 'tool_assignmentupgrade', 'version', '2013110500'),
(549, 'tool_behat', 'version', '2013110501'),
(550, 'tool_capability', 'version', '2013110500'),
(551, 'tool_customlang', 'version', '2013110500'),
(553, 'tool_dbtransfer', 'version', '2013110500'),
(554, 'tool_generator', 'version', '2013110500'),
(555, 'tool_health', 'version', '2013110500'),
(556, 'tool_innodb', 'version', '2013110500'),
(557, 'tool_installaddon', 'version', '2013110500'),
(558, 'tool_langimport', 'version', '2013110500'),
(559, 'tool_multilangupgrade', 'version', '2013110500'),
(560, 'tool_phpunit', 'version', '2013110500'),
(561, 'tool_profiling', 'version', '2013110500'),
(562, 'tool_qeupgradehelper', 'version', '2013110500'),
(564, 'tool_replace', 'version', '2013110501'),
(565, 'tool_spamcleaner', 'version', '2013110500'),
(566, 'tool_timezoneimport', 'version', '2013110500'),
(567, 'tool_unsuproles', 'version', '2013110500'),
(569, 'tool_uploadcourse', 'version', '2013110500'),
(570, 'tool_uploaduser', 'version', '2013110500'),
(571, 'tool_xmldb', 'version', '2013110500'),
(572, 'cachestore_file', 'version', '2013110500'),
(573, 'cachestore_memcache', 'version', '2013110500'),
(574, 'cachestore_memcached', 'version', '2013110500'),
(575, 'cachestore_mongodb', 'version', '2013110500'),
(576, 'cachestore_session', 'version', '2013110500'),
(577, 'cachestore_static', 'version', '2013110500'),
(578, 'cachelock_file', 'version', '2013110500'),
(579, 'theme_afterburner', 'version', '2013110500'),
(580, 'theme_anomaly', 'version', '2013110500'),
(581, 'theme_arialist', 'version', '2013110500'),
(582, 'theme_base', 'version', '2013110500'),
(583, 'theme_binarius', 'version', '2013110500'),
(584, 'theme_bootstrapbase', 'version', '2013110500'),
(585, 'theme_boxxie', 'version', '2013110500'),
(586, 'theme_brick', 'version', '2013110500'),
(587, 'theme_canvas', 'version', '2013110500'),
(588, 'theme_clean', 'version', '2013110500'),
(589, 'theme_formal_white', 'version', '2013110500'),
(591, 'theme_formfactor', 'version', '2013110500'),
(592, 'theme_fusion', 'version', '2013110500'),
(593, 'theme_leatherbound', 'version', '2013110500'),
(594, 'theme_magazine', 'version', '2013110500'),
(595, 'theme_nimble', 'version', '2013110500'),
(596, 'theme_nonzero', 'version', '2013110500'),
(597, 'theme_overlay', 'version', '2013110500'),
(598, 'theme_serenity', 'version', '2013110500'),
(599, 'theme_sky_high', 'version', '2013110500'),
(600, 'theme_splash', 'version', '2013110500'),
(601, 'theme_standard', 'version', '2013110500'),
(602, 'theme_standardold', 'version', '2013110500'),
(603, 'assignsubmission_comments', 'version', '2013110500'),
(605, 'assignsubmission_file', 'sortorder', '1'),
(606, 'assignsubmission_comments', 'sortorder', '2'),
(607, 'assignsubmission_onlinetext', 'sortorder', '0'),
(608, 'assignsubmission_file', 'version', '2013110500'),
(609, 'assignsubmission_onlinetext', 'version', '2013110500'),
(611, 'assignfeedback_comments', 'version', '2013110500'),
(613, 'assignfeedback_comments', 'sortorder', '0'),
(614, 'assignfeedback_editpdf', 'sortorder', '1'),
(615, 'assignfeedback_file', 'sortorder', '3'),
(616, 'assignfeedback_offline', 'sortorder', '2'),
(617, 'assignfeedback_editpdf', 'version', '2013110800'),
(619, 'assignfeedback_file', 'version', '2013110500'),
(621, 'assignfeedback_offline', 'version', '2013110500'),
(622, 'assignment_offline', 'version', '2013110500'),
(623, 'assignment_online', 'version', '2013110500'),
(624, 'assignment_upload', 'version', '2013110500'),
(625, 'assignment_uploadsingle', 'version', '2013110500'),
(626, 'booktool_exportimscp', 'version', '2013110500'),
(627, 'booktool_importhtml', 'version', '2013110500'),
(628, 'booktool_print', 'version', '2013110500'),
(629, 'datafield_checkbox', 'version', '2013110500'),
(630, 'datafield_date', 'version', '2013110500'),
(631, 'datafield_file', 'version', '2013110500'),
(632, 'datafield_latlong', 'version', '2013110500'),
(633, 'datafield_menu', 'version', '2013110500'),
(634, 'datafield_multimenu', 'version', '2013110500'),
(635, 'datafield_number', 'version', '2013110500'),
(636, 'datafield_picture', 'version', '2013110500'),
(637, 'datafield_radiobutton', 'version', '2013110500'),
(638, 'datafield_text', 'version', '2013110500'),
(639, 'datafield_textarea', 'version', '2013110500'),
(640, 'datafield_url', 'version', '2013110500'),
(641, 'datapreset_imagegallery', 'version', '2013110500'),
(642, 'quiz_grading', 'version', '2013110500'),
(644, 'quiz_overview', 'version', '2013110500'),
(646, 'quiz_responses', 'version', '2013110500'),
(648, 'quiz_statistics', 'version', '2013110500'),
(650, 'quizaccess_delaybetweenattempts', 'version', '2013110500'),
(651, 'quizaccess_ipaddress', 'version', '2013110500'),
(652, 'quizaccess_numattempts', 'version', '2013110500'),
(653, 'quizaccess_openclosedate', 'version', '2013110500'),
(654, 'quizaccess_password', 'version', '2013110500'),
(655, 'quizaccess_safebrowser', 'version', '2013110500'),
(656, 'quizaccess_securewindow', 'version', '2013110500'),
(657, 'quizaccess_timelimit', 'version', '2013110500'),
(658, 'scormreport_basic', 'version', '2013110500'),
(659, 'scormreport_graphs', 'version', '2013110500'),
(660, 'scormreport_interactions', 'version', '2013110500'),
(661, 'scormreport_objectives', 'version', '2013110500'),
(662, 'workshopform_accumulative', 'version', '2013110500'),
(664, 'workshopform_comments', 'version', '2013110500'),
(666, 'workshopform_numerrors', 'version', '2013110500'),
(668, 'workshopform_rubric', 'version', '2013110500'),
(670, 'workshopallocation_manual', 'version', '2013110500'),
(671, 'workshopallocation_random', 'version', '2013110500'),
(672, 'workshopallocation_scheduled', 'version', '2013110500'),
(673, 'workshopeval_best', 'version', '2013110500'),
(674, 'tinymce_ctrlhelp', 'version', '2013110500'),
(675, 'tinymce_dragmath', 'version', '2013110500'),
(676, 'tinymce_managefiles', 'version', '2014010800'),
(677, 'tinymce_moodleemoticon', 'version', '2013110500'),
(678, 'tinymce_moodleimage', 'version', '2013110500'),
(679, 'tinymce_moodlemedia', 'version', '2013110500'),
(680, 'tinymce_moodlenolink', 'version', '2013110500'),
(681, 'tinymce_pdw', 'version', '2013110500'),
(682, 'tinymce_spellchecker', 'version', '2013110500'),
(684, 'tinymce_wrap', 'version', '2013110500'),
(685, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(686, 'assign', 'showrecentsubmissions', '0'),
(687, 'assign', 'submissionreceipts', '1'),
(688, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(689, 'assign', 'alwaysshowdescription', '1'),
(690, 'assign', 'alwaysshowdescription_adv', ''),
(691, 'assign', 'alwaysshowdescription_locked', ''),
(692, 'assign', 'allowsubmissionsfromdate', '0'),
(693, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
(694, 'assign', 'allowsubmissionsfromdate_adv', ''),
(695, 'assign', 'duedate', '604800'),
(696, 'assign', 'duedate_enabled', '1'),
(697, 'assign', 'duedate_adv', ''),
(698, 'assign', 'cutoffdate', '1209600'),
(699, 'assign', 'cutoffdate_enabled', ''),
(700, 'assign', 'cutoffdate_adv', ''),
(701, 'assign', 'submissiondrafts', '0'),
(702, 'assign', 'submissiondrafts_adv', ''),
(703, 'assign', 'submissiondrafts_locked', ''),
(704, 'assign', 'requiresubmissionstatement', '0'),
(705, 'assign', 'requiresubmissionstatement_adv', ''),
(706, 'assign', 'requiresubmissionstatement_locked', ''),
(707, 'assign', 'attemptreopenmethod', 'none'),
(708, 'assign', 'attemptreopenmethod_adv', ''),
(709, 'assign', 'attemptreopenmethod_locked', ''),
(710, 'assign', 'maxattempts', '-1'),
(711, 'assign', 'maxattempts_adv', ''),
(712, 'assign', 'maxattempts_locked', ''),
(713, 'assign', 'teamsubmission', '0'),
(714, 'assign', 'teamsubmission_adv', ''),
(715, 'assign', 'teamsubmission_locked', ''),
(716, 'assign', 'requireallteammemberssubmit', '0'),
(717, 'assign', 'requireallteammemberssubmit_adv', ''),
(718, 'assign', 'requireallteammemberssubmit_locked', ''),
(719, 'assign', 'teamsubmissiongroupingid', ''),
(720, 'assign', 'teamsubmissiongroupingid_adv', ''),
(721, 'assign', 'sendnotifications', '0'),
(722, 'assign', 'sendnotifications_adv', ''),
(723, 'assign', 'sendnotifications_locked', ''),
(724, 'assign', 'sendlatenotifications', '0'),
(725, 'assign', 'sendlatenotifications_adv', ''),
(726, 'assign', 'sendlatenotifications_locked', ''),
(727, 'assign', 'blindmarking', '0'),
(728, 'assign', 'blindmarking_adv', ''),
(729, 'assign', 'blindmarking_locked', ''),
(730, 'assign', 'markingworkflow', '0'),
(731, 'assign', 'markingworkflow_adv', ''),
(732, 'assign', 'markingworkflow_locked', ''),
(733, 'assign', 'markingallocation', '0'),
(734, 'assign', 'markingallocation_adv', ''),
(735, 'assign', 'markingallocation_locked', ''),
(736, 'assignsubmission_file', 'default', '1'),
(737, 'assignsubmission_file', 'maxbytes', '1048576'),
(738, 'assignsubmission_onlinetext', 'default', '0'),
(739, 'assignfeedback_comments', 'default', '1'),
(740, 'assignfeedback_editpdf', 'stamps', ''),
(741, 'assignfeedback_editpdf', 'gspath', '/usr/bin/gs'),
(742, 'assignfeedback_file', 'default', '0'),
(743, 'assignfeedback_offline', 'default', '0'),
(744, 'book', 'requiremodintro', '1'),
(745, 'book', 'numberingoptions', '0,1,2,3'),
(746, 'book', 'numbering', '1'),
(747, 'folder', 'requiremodintro', '1'),
(748, 'folder', 'showexpanded', '1'),
(749, 'imscp', 'requiremodintro', '1'),
(750, 'imscp', 'keepold', '1'),
(751, 'imscp', 'keepold_adv', ''),
(752, 'label', 'dndmedia', '1'),
(753, 'label', 'dndresizewidth', '400'),
(754, 'label', 'dndresizeheight', '400'),
(755, 'page', 'requiremodintro', '1'),
(756, 'page', 'displayoptions', '5'),
(757, 'page', 'printintro', '0'),
(758, 'page', 'display', '5'),
(759, 'page', 'popupwidth', '620'),
(760, 'page', 'popupheight', '450'),
(761, 'quiz', 'timelimit', '0'),
(762, 'quiz', 'timelimit_adv', ''),
(763, 'quiz', 'overduehandling', 'autoabandon'),
(764, 'quiz', 'overduehandling_adv', ''),
(765, 'quiz', 'graceperiod', '86400'),
(766, 'quiz', 'graceperiod_adv', ''),
(767, 'quiz', 'graceperiodmin', '60'),
(768, 'quiz', 'attempts', '0'),
(769, 'quiz', 'attempts_adv', ''),
(770, 'quiz', 'grademethod', '1'),
(771, 'quiz', 'grademethod_adv', ''),
(772, 'quiz', 'maximumgrade', '10'),
(773, 'quiz', 'shufflequestions', '0'),
(774, 'quiz', 'shufflequestions_adv', ''),
(775, 'quiz', 'questionsperpage', '1'),
(776, 'quiz', 'questionsperpage_adv', ''),
(777, 'quiz', 'navmethod', 'free'),
(778, 'quiz', 'navmethod_adv', '1'),
(779, 'quiz', 'shuffleanswers', '1'),
(780, 'quiz', 'shuffleanswers_adv', ''),
(781, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(782, 'quiz', 'attemptonlast', '0'),
(783, 'quiz', 'attemptonlast_adv', '1'),
(784, 'quiz', 'reviewattempt', '69904'),
(785, 'quiz', 'reviewcorrectness', '69904'),
(786, 'quiz', 'reviewmarks', '69904'),
(787, 'quiz', 'reviewspecificfeedback', '69904'),
(788, 'quiz', 'reviewgeneralfeedback', '69904'),
(789, 'quiz', 'reviewrightanswer', '69904'),
(790, 'quiz', 'reviewoverallfeedback', '4368'),
(791, 'quiz', 'showuserpicture', '0'),
(792, 'quiz', 'showuserpicture_adv', ''),
(793, 'quiz', 'decimalpoints', '2'),
(794, 'quiz', 'decimalpoints_adv', ''),
(795, 'quiz', 'questiondecimalpoints', '-1'),
(796, 'quiz', 'questiondecimalpoints_adv', '1'),
(797, 'quiz', 'showblocks', '0'),
(798, 'quiz', 'showblocks_adv', '1'),
(799, 'quiz', 'password', ''),
(800, 'quiz', 'password_adv', '1'),
(801, 'quiz', 'subnet', ''),
(802, 'quiz', 'subnet_adv', '1'),
(803, 'quiz', 'delay1', '0'),
(804, 'quiz', 'delay1_adv', '1'),
(805, 'quiz', 'delay2', '0'),
(806, 'quiz', 'delay2_adv', '1'),
(807, 'quiz', 'browsersecurity', '-'),
(808, 'quiz', 'browsersecurity_adv', '1'),
(809, 'quiz', 'autosaveperiod', '0'),
(810, 'resource', 'framesize', '130'),
(811, 'resource', 'requiremodintro', '1'),
(812, 'resource', 'displayoptions', '0,1,4,5,6'),
(813, 'resource', 'printintro', '1'),
(814, 'resource', 'display', '0'),
(815, 'resource', 'showsize', '0'),
(816, 'resource', 'showtype', '0'),
(817, 'resource', 'popupwidth', '620'),
(818, 'resource', 'popupheight', '450'),
(819, 'resource', 'filterfiles', '0'),
(820, 'scorm', 'displaycoursestructure', '0'),
(821, 'scorm', 'displaycoursestructure_adv', ''),
(822, 'scorm', 'popup', '0'),
(823, 'scorm', 'popup_adv', ''),
(824, 'scorm', 'framewidth', '100'),
(825, 'scorm', 'framewidth_adv', '1'),
(826, 'scorm', 'frameheight', '500'),
(827, 'scorm', 'frameheight_adv', '1'),
(828, 'scorm', 'winoptgrp_adv', '1'),
(829, 'scorm', 'scrollbars', '0'),
(830, 'scorm', 'directories', '0'),
(831, 'scorm', 'location', '0'),
(832, 'scorm', 'menubar', '0'),
(833, 'scorm', 'toolbar', '0'),
(834, 'scorm', 'status', '0'),
(835, 'scorm', 'skipview', '0'),
(836, 'scorm', 'skipview_adv', '1'),
(837, 'scorm', 'hidebrowse', '0'),
(838, 'scorm', 'hidebrowse_adv', '1'),
(839, 'scorm', 'hidetoc', '0'),
(840, 'scorm', 'hidetoc_adv', '1'),
(841, 'scorm', 'nav', '1'),
(842, 'scorm', 'nav_adv', '1'),
(843, 'scorm', 'navpositionleft', '-100'),
(844, 'scorm', 'navpositionleft_adv', '1'),
(845, 'scorm', 'navpositiontop', '-100'),
(846, 'scorm', 'navpositiontop_adv', '1'),
(847, 'scorm', 'collapsetocwinsize', '767'),
(848, 'scorm', 'collapsetocwinsize_adv', '1'),
(849, 'scorm', 'displayattemptstatus', '1'),
(850, 'scorm', 'displayattemptstatus_adv', ''),
(851, 'scorm', 'grademethod', '1'),
(852, 'scorm', 'maxgrade', '100'),
(853, 'scorm', 'maxattempt', '0'),
(854, 'scorm', 'whatgrade', '0'),
(855, 'scorm', 'forcecompleted', '0'),
(856, 'scorm', 'forcenewattempt', '0'),
(857, 'scorm', 'lastattemptlock', '0'),
(858, 'scorm', 'auto', '0'),
(859, 'scorm', 'updatefreq', '0'),
(860, 'scorm', 'allowtypeexternal', '0'),
(861, 'scorm', 'allowtypelocalsync', '0'),
(862, 'scorm', 'allowtypeexternalaicc', '0'),
(863, 'scorm', 'allowaicchacp', '0'),
(864, 'scorm', 'aicchacptimeout', '30'),
(865, 'scorm', 'aicchacpkeepsessiondata', '1'),
(866, 'scorm', 'forcejavascript', '1'),
(867, 'scorm', 'allowapidebug', '0'),
(868, 'scorm', 'apidebugmask', '.*'),
(869, 'url', 'framesize', '130'),
(870, 'url', 'requiremodintro', '1'),
(871, 'url', 'secretphrase', ''),
(872, 'url', 'rolesinparams', '0'),
(873, 'url', 'displayoptions', '0,1,5,6'),
(874, 'url', 'printintro', '1'),
(875, 'url', 'display', '0'),
(876, 'url', 'popupwidth', '620'),
(877, 'url', 'popupheight', '450'),
(878, 'workshop', 'grade', '80'),
(879, 'workshop', 'gradinggrade', '20'),
(880, 'workshop', 'gradedecimals', '0'),
(881, 'workshop', 'maxbytes', '0'),
(882, 'workshop', 'strategy', 'accumulative'),
(883, 'workshop', 'examplesmode', '0'),
(884, 'workshopallocation_random', 'numofreviews', '5'),
(885, 'workshopform_numerrors', 'grade0', 'No'),
(886, 'workshopform_numerrors', 'grade1', 'Yes'),
(887, 'workshopeval_best', 'comparison', '5'),
(888, 'format_singleactivity', 'activitytype', 'forum'),
(889, 'block_course_overview', 'defaultmaxcourses', '10'),
(890, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(891, 'block_course_overview', 'showchildren', '0'),
(892, 'block_course_overview', 'showwelcomearea', '0'),
(893, 'block_section_links', 'numsections1', '22'),
(894, 'block_section_links', 'incby1', '2'),
(895, 'block_section_links', 'numsections2', '40'),
(896, 'block_section_links', 'incby2', '5'),
(897, 'enrol_cohort', 'roleid', '5'),
(898, 'enrol_cohort', 'unenrolaction', '0'),
(899, 'enrol_database', 'dbtype', ''),
(900, 'enrol_database', 'dbhost', 'localhost'),
(901, 'enrol_database', 'dbuser', ''),
(902, 'enrol_database', 'dbpass', ''),
(903, 'enrol_database', 'dbname', ''),
(904, 'enrol_database', 'dbencoding', 'utf-8'),
(905, 'enrol_database', 'dbsetupsql', ''),
(906, 'enrol_database', 'dbsybasequoting', '0'),
(907, 'enrol_database', 'debugdb', '0'),
(908, 'enrol_database', 'localcoursefield', 'idnumber'),
(909, 'enrol_database', 'localuserfield', 'idnumber'),
(910, 'enrol_database', 'localrolefield', 'shortname'),
(911, 'enrol_database', 'localcategoryfield', 'id'),
(912, 'enrol_database', 'remoteenroltable', ''),
(913, 'enrol_database', 'remotecoursefield', ''),
(914, 'enrol_database', 'remoteuserfield', ''),
(915, 'enrol_database', 'remoterolefield', ''),
(916, 'enrol_database', 'defaultrole', '5'),
(917, 'enrol_database', 'ignorehiddencourses', '0'),
(918, 'enrol_database', 'unenrolaction', '0'),
(919, 'enrol_database', 'newcoursetable', ''),
(920, 'enrol_database', 'newcoursefullname', 'fullname'),
(921, 'enrol_database', 'newcourseshortname', 'shortname'),
(922, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(923, 'enrol_database', 'newcoursecategory', ''),
(924, 'enrol_database', 'defaultcategory', '1'),
(925, 'enrol_database', 'templatecourse', ''),
(926, 'enrol_flatfile', 'location', ''),
(927, 'enrol_flatfile', 'encoding', 'UTF-8'),
(928, 'enrol_flatfile', 'mailstudents', '0'),
(929, 'enrol_flatfile', 'mailteachers', '0'),
(930, 'enrol_flatfile', 'mailadmins', '0'),
(931, 'enrol_flatfile', 'unenrolaction', '3'),
(932, 'enrol_flatfile', 'expiredaction', '3'),
(933, 'enrol_guest', 'requirepassword', '0'),
(934, 'enrol_guest', 'usepasswordpolicy', '0'),
(935, 'enrol_guest', 'showhint', '0'),
(936, 'enrol_guest', 'defaultenrol', '1'),
(937, 'enrol_guest', 'status', '1'),
(938, 'enrol_guest', 'status_adv', ''),
(939, 'enrol_imsenterprise', 'imsfilelocation', ''),
(940, 'enrol_imsenterprise', 'logtolocation', ''),
(941, 'enrol_imsenterprise', 'mailadmins', '0'),
(942, 'enrol_imsenterprise', 'createnewusers', '0'),
(943, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(944, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(945, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(946, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(947, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(948, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(949, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(950, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(951, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(952, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(953, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(954, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(955, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(956, 'enrol_imsenterprise', 'createnewcourses', '0'),
(957, 'enrol_imsenterprise', 'createnewcategories', '0'),
(958, 'enrol_imsenterprise', 'imsunenrol', '0'),
(959, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(960, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(961, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(962, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(963, 'enrol_imsenterprise', 'imscapitafix', '0'),
(964, 'enrol_manual', 'expiredaction', '1'),
(965, 'enrol_manual', 'expirynotifyhour', '6'),
(966, 'enrol_manual', 'defaultenrol', '1'),
(967, 'enrol_manual', 'status', '0'),
(968, 'enrol_manual', 'roleid', '5'),
(969, 'enrol_manual', 'enrolperiod', '0'),
(970, 'enrol_manual', 'expirynotify', '0'),
(971, 'enrol_manual', 'expirythreshold', '86400'),
(972, 'enrol_meta', 'nosyncroleids', ''),
(973, 'enrol_meta', 'syncall', '1'),
(974, 'enrol_meta', 'unenrolaction', '3'),
(975, 'enrol_mnet', 'roleid', '5'),
(976, 'enrol_mnet', 'roleid_adv', '1'),
(977, 'enrol_paypal', 'paypalbusiness', ''),
(978, 'enrol_paypal', 'mailstudents', '0'),
(979, 'enrol_paypal', 'mailteachers', '0'),
(980, 'enrol_paypal', 'mailadmins', '0'),
(981, 'enrol_paypal', 'expiredaction', '3'),
(982, 'enrol_paypal', 'status', '1'),
(983, 'enrol_paypal', 'cost', '0'),
(984, 'enrol_paypal', 'currency', 'USD'),
(985, 'enrol_paypal', 'roleid', '5'),
(986, 'enrol_paypal', 'enrolperiod', '0'),
(987, 'enrol_self', 'requirepassword', '0'),
(988, 'enrol_self', 'usepasswordpolicy', '0'),
(989, 'enrol_self', 'showhint', '0'),
(990, 'enrol_self', 'expiredaction', '1'),
(991, 'enrol_self', 'expirynotifyhour', '6'),
(992, 'enrol_self', 'defaultenrol', '1'),
(993, 'enrol_self', 'status', '1'),
(994, 'enrol_self', 'newenrols', '1'),
(995, 'enrol_self', 'groupkey', '0'),
(996, 'enrol_self', 'roleid', '5'),
(997, 'enrol_self', 'enrolperiod', '0'),
(998, 'enrol_self', 'expirynotify', '0'),
(999, 'enrol_self', 'expirythreshold', '86400'),
(1000, 'enrol_self', 'longtimenosee', '0'),
(1001, 'enrol_self', 'maxenrolled', '0'),
(1002, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(1003, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
(1004, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(1005, 'editor_tinymce', 'customconfig', ''),
(1006, 'tinymce_dragmath', 'requiretex', '1'),
(1007, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(1008, 'tinymce_spellchecker', 'spellengine', ''),
(1009, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(1010, 'filter_emoticon', 'formats', '1,4,0'),
(1011, 'filter_urltolink', 'formats', '0'),
(1012, 'filter_urltolink', 'embedimages', '1'),
(1013, 'theme_aardvark', 'version', '2014051300'),
(1014, 'theme_aardvark', 'logo', ''),
(1015, 'theme_aardvark', 'hidemenu', '1'),
(1016, 'theme_aardvark', 'emailurl', ''),
(1017, 'theme_aardvark', 'customcss', ''),
(1018, 'theme_aardvark', 'titledate', '1'),
(1019, 'theme_aardvark', 'generalalert', ''),
(1020, 'theme_aardvark', 'snowalert', ''),
(1021, 'theme_aardvark', 'backcolor', '#fafafa'),
(1022, 'theme_aardvark', 'backimage', ''),
(1023, 'theme_aardvark', 'backposition', 'no-repeat'),
(1024, 'theme_aardvark', 'menuhovercolor', '#f42941'),
(1025, 'theme_aardvark', 'copyright', ''),
(1026, 'theme_aardvark', 'ceop', ''),
(1027, 'theme_aardvark', 'disclaimer', ''),
(1028, 'theme_aardvark', 'website', ''),
(1029, 'theme_aardvark', 'facebook', ''),
(1030, 'theme_aardvark', 'twitter', ''),
(1031, 'theme_aardvark', 'googleplus', ''),
(1032, 'theme_aardvark', 'flickr', ''),
(1033, 'theme_aardvark', 'pinterest', ''),
(1034, 'theme_aardvark', 'instagram', ''),
(1035, 'theme_aardvark', 'linkedin', ''),
(1036, 'theme_aardvark', 'wikipedia', ''),
(1037, 'theme_aardvark', 'youtube', ''),
(1038, 'theme_aardvark', 'apple', ''),
(1039, 'theme_aardvark', 'android', ''),
(1040, 'enrol_ldap', 'objectclass', '(objectClass=*)'),
(1041, 'theme_essential', 'version', '2014020300'),
(1042, 'theme_essential', 'siteicon', 'laptop'),
(1043, 'theme_essential', 'bootstrapcdn', '0'),
(1044, 'theme_essential', 'logo', ''),
(1045, 'theme_essential', 'fontselect', '1'),
(1046, 'theme_essential', 'headerprofilepic', '1'),
(1047, 'theme_essential', 'pagewidth', '1200'),
(1048, 'theme_essential', 'layout', ''),
(1049, 'theme_essential', 'sideregionsmaxwidth', ''),
(1050, 'theme_essential', 'editicons', '0');
INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1051, 'theme_essential', 'perfinfo', 'min'),
(1052, 'theme_essential', 'navbarsep', '/'),
(1053, 'theme_essential', 'copyright', ''),
(1054, 'theme_essential', 'footnote', ''),
(1055, 'theme_essential', 'customcss', ''),
(1056, 'theme_essential', 'displaymydashboard', '1'),
(1057, 'theme_essential', 'displaymycourses', '1'),
(1058, 'theme_essential', 'mycoursetitle', 'course'),
(1059, 'theme_essential', 'pagebackground', ''),
(1060, 'theme_essential', 'themecolor', '#30add1'),
(1061, 'theme_essential', 'themehovercolor', '#29a1c4'),
(1062, 'theme_essential', 'slideheadercolor', '#30add1'),
(1063, 'theme_essential', 'slidecolor', '#888'),
(1064, 'theme_essential', 'slidebuttoncolor', '#30add1'),
(1065, 'theme_essential', 'footercolor', '#000000'),
(1066, 'theme_essential', 'footertextcolor', '#DDDDDD'),
(1067, 'theme_essential', 'footerheadingcolor', '#CCCCCC'),
(1068, 'theme_essential', 'footersepcolor', '#313131'),
(1069, 'theme_essential', 'footerurlcolor', '#BBBBBB'),
(1070, 'theme_essential', 'footerhovercolor', '#FFFFFF'),
(1071, 'theme_essential', 'enablealternativethemecolors1', ''),
(1072, 'theme_essential', 'alternativethemename1', 'Alternative Colours 1'),
(1073, 'theme_essential', 'alternativethemecolor1', '#a430d1'),
(1074, 'theme_essential', 'alternativethemehovercolor1', '#9929c4'),
(1075, 'theme_essential', 'enablealternativethemecolors2', ''),
(1076, 'theme_essential', 'alternativethemename2', 'Alternative Colours 2'),
(1077, 'theme_essential', 'alternativethemecolor2', '#d15430'),
(1078, 'theme_essential', 'alternativethemehovercolor2', '#c44c29'),
(1079, 'theme_essential', 'enablealternativethemecolors3', ''),
(1080, 'theme_essential', 'alternativethemename3', 'Alternative Colours 3'),
(1081, 'theme_essential', 'alternativethemecolor3', '#5dd130'),
(1082, 'theme_essential', 'alternativethemehovercolor3', '#53c429'),
(1083, 'theme_essential', 'toggleslideshow', '0'),
(1084, 'theme_essential', 'hideonphone', 'hidden-phone'),
(1085, 'theme_essential', 'slideshowvariant', '1'),
(1086, 'theme_essential', 'slide1', 'This is Slide 1'),
(1087, 'theme_essential', 'slide1image', ''),
(1088, 'theme_essential', 'slide1caption', ''),
(1089, 'theme_essential', 'slide1url', ''),
(1090, 'theme_essential', 'slide2', 'This is Slide 2'),
(1091, 'theme_essential', 'slide2image', ''),
(1092, 'theme_essential', 'slide2caption', ''),
(1093, 'theme_essential', 'slide2url', ''),
(1094, 'theme_essential', 'slide3', 'This is Slide 3'),
(1095, 'theme_essential', 'slide3image', ''),
(1096, 'theme_essential', 'slide3caption', ''),
(1097, 'theme_essential', 'slide3url', ''),
(1098, 'theme_essential', 'slide4', 'This is Slide 4'),
(1099, 'theme_essential', 'slide4image', ''),
(1100, 'theme_essential', 'slide4caption', ''),
(1101, 'theme_essential', 'slide4url', ''),
(1102, 'theme_essential', 'usefrontcontent', ''),
(1103, 'theme_essential', 'frontcontentarea', ''),
(1104, 'theme_essential', 'frontpageblocks', '1'),
(1105, 'theme_essential', 'frontpagemiddleblocks', '0'),
(1106, 'theme_essential', 'togglemarketing', '0'),
(1107, 'theme_essential', 'marketingheight', '0'),
(1108, 'theme_essential', 'marketing1', ''),
(1109, 'theme_essential', 'marketing1icon', 'star'),
(1110, 'theme_essential', 'marketing1image', ''),
(1111, 'theme_essential', 'marketing1content', ''),
(1112, 'theme_essential', 'marketing1buttontext', ''),
(1113, 'theme_essential', 'marketing1buttonurl', ''),
(1114, 'theme_essential', 'marketing2', ''),
(1115, 'theme_essential', 'marketing2icon', 'star'),
(1116, 'theme_essential', 'marketing2image', ''),
(1117, 'theme_essential', 'marketing2content', ''),
(1118, 'theme_essential', 'marketing2buttontext', ''),
(1119, 'theme_essential', 'marketing2buttonurl', ''),
(1120, 'theme_essential', 'marketing3', ''),
(1121, 'theme_essential', 'marketing3icon', 'star'),
(1122, 'theme_essential', 'marketing3image', ''),
(1123, 'theme_essential', 'marketing3content', ''),
(1124, 'theme_essential', 'marketing3buttontext', ''),
(1125, 'theme_essential', 'marketing3buttonurl', ''),
(1126, 'theme_essential', 'website', ''),
(1127, 'theme_essential', 'facebook', ''),
(1128, 'theme_essential', 'flickr', ''),
(1129, 'theme_essential', 'twitter', ''),
(1130, 'theme_essential', 'googleplus', ''),
(1131, 'theme_essential', 'linkedin', ''),
(1132, 'theme_essential', 'pinterest', ''),
(1133, 'theme_essential', 'instagram', ''),
(1134, 'theme_essential', 'youtube', ''),
(1135, 'theme_essential', 'skype', ''),
(1136, 'theme_essential', 'vk', ''),
(1137, 'theme_essential', 'usecategoryicon', ''),
(1138, 'theme_essential', 'defaultcategoryicon', 'f07c'),
(1139, 'theme_essential', 'categoryicon1', 'f07c'),
(1140, 'theme_essential', 'categoryicon2', 'f07c'),
(1141, 'theme_essential', 'categoryicon3', 'f07c'),
(1142, 'theme_essential', 'categoryicon4', 'f07c'),
(1143, 'theme_essential', 'categoryicon5', 'f07c'),
(1144, 'theme_essential', 'categoryicon6', 'f07c'),
(1145, 'theme_essential', 'categoryicon7', 'f07c'),
(1146, 'theme_essential', 'categoryicon8', 'f07c'),
(1147, 'theme_essential', 'categoryicon9', 'f07c'),
(1148, 'theme_essential', 'categoryicon10', 'f07c'),
(1149, 'theme_essential', 'categoryicon11', 'f07c'),
(1150, 'theme_essential', 'categoryicon12', 'f07c'),
(1151, 'theme_essential', 'categoryicon13', 'f07c'),
(1152, 'theme_essential', 'categoryicon14', 'f07c'),
(1153, 'theme_essential', 'categoryicon15', 'f07c'),
(1154, 'theme_essential', 'categoryicon16', 'f07c'),
(1155, 'theme_essential', 'categoryicon17', 'f07c'),
(1156, 'theme_essential', 'categoryicon18', 'f07c'),
(1157, 'theme_essential', 'categoryicon19', 'f07c'),
(1158, 'theme_essential', 'categoryicon20', 'f07c'),
(1159, 'theme_essential', 'android', ''),
(1160, 'theme_essential', 'ios', ''),
(1161, 'theme_essential', 'iphoneicon', ''),
(1162, 'theme_essential', 'iphoneretinaicon', ''),
(1163, 'theme_essential', 'ipadicon', ''),
(1164, 'theme_essential', 'ipadretinaicon', ''),
(1165, 'theme_essential', 'enable1alert', ''),
(1166, 'theme_essential', 'alert1type', 'info'),
(1167, 'theme_essential', 'alert1title_en', ''),
(1168, 'theme_essential', 'alert1text_en', ''),
(1169, 'theme_essential', 'enable2alert', ''),
(1170, 'theme_essential', 'alert2type', 'info'),
(1171, 'theme_essential', 'alert2title_en', ''),
(1172, 'theme_essential', 'alert2text_en', ''),
(1173, 'theme_essential', 'enable3alert', ''),
(1174, 'theme_essential', 'alert3type', 'info'),
(1175, 'theme_essential', 'alert3title_en', ''),
(1176, 'theme_essential', 'alert3text_en', ''),
(1177, 'theme_essential', 'useanalytics', ''),
(1178, 'theme_essential', 'analyticsid', ''),
(1179, 'theme_essential', 'analyticsclean', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='one of these must be set' AUTO_INCREMENT=24 ;

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(16, 50, 2, '/1/3/16', 3),
(17, 80, 10, '/1/3/16/17', 4),
(18, 80, 11, '/1/3/16/18', 4),
(19, 80, 12, '/1/3/16/19', 4),
(20, 80, 13, '/1/3/16/20', 4),
(21, 80, 14, '/1/2/21', 3),
(22, 70, 2, '/1/3/16/22', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `calendartype` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Central course table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `calendartype`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`) VALUES
(1, 0, 1, 'Top-Grader', 'TopGrader', '', '<p>Online Tutoring That Delivers Results</p>', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1402744563, 1402750742, 0, 0, 0, 1402750742),
(2, 1, 10001, 'test course', 'testing', 'admin', '<p>sads</p>', 1, 'weeks', 1, 5, 1402770600, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1402746082, 1402746082, 0, 0, 0, 1402746982);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Course categories' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 1, 1, 1, 1402744563, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores format-specific options for the course or course sect' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1'),
(2, 2, 'weeks', 0, 'numsections', '10'),
(3, 2, 'weeks', 0, 'hiddensections', '0'),
(4, 2, 'weeks', 0, 'coursedisplay', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `groupmembersonly`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `availablefrom`, `availableuntil`, `showavailability`, `showdescription`) VALUES
(2, 2, 9, 1, 3, NULL, 1402746980, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table stores conditions that affect whether a module/activit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavaifiel_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availablefrom`, `availableuntil`, `showavailability`, `groupingid`) VALUES
(1, 1, 0, NULL, '', 1, '', 1, 0, 0, 0, 0),
(2, 1, 1, NULL, '', 1, '', 1, 0, 0, 0, 0),
(3, 2, 0, NULL, '', 1, '2', 1, 0, 0, 0, 0),
(4, 2, 1, NULL, '', 1, '', 1, 0, 0, 0, 0),
(5, 2, 2, NULL, '', 1, '', 1, 0, 0, 0, 0),
(6, 2, 3, NULL, '', 1, '', 1, 0, 0, 0, 0),
(7, 2, 4, NULL, '', 1, '', 1, 0, 0, 0, 0),
(8, 2, 5, NULL, '', 1, '', 1, 0, 0, 0, 0),
(9, 2, 6, NULL, '', 1, '', 1, 0, 0, 0, 0),
(10, 2, 7, NULL, '', 1, '', 1, 0, 0, 0, 0),
(11, 2, 8, NULL, '', 1, '', 1, 0, 0, 0, 0),
(12, 2, 9, NULL, '', 1, '', 1, 0, 0, 0, 0),
(13, 2, 10, NULL, '', 1, '', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavai_cou_ix` (`coursesectionid`),
  KEY `mdl_coursectavai_sou_ix` (`sourcecmid`),
  KEY `mdl_coursectavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Completion or grade conditions that affect if a section is c' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavaifiel_cou_ix` (`coursesectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1402746083, 1402746083),
(2, 'guest', 1, 2, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1402746083, 1402746083),
(3, 'self', 1, 2, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1402746083, 1402746083);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfoliolib.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks subscriptions to remote calendars.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='list of all external functions' AUTO_INCREMENT=114 ;

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(2, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(3, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(4, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(5, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(6, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(7, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(8, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(9, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(10, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(16, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(17, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(18, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(19, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(20, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(21, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(22, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(23, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(24, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(25, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(26, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(27, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(28, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(29, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(30, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(31, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(32, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(33, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(34, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(35, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(36, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(37, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(38, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(39, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(40, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(41, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(42, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(43, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(44, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(45, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(46, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', ''),
(47, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(48, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(49, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(50, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(51, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(52, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', ''),
(53, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(54, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(55, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(56, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(57, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(58, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(59, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(60, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(61, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(62, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(63, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities'),
(64, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(65, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),
(66, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(67, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(68, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(69, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(70, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(71, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(72, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(73, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', ''),
(74, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', ''),
(75, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', ''),
(76, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', ''),
(77, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', ''),
(78, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', ''),
(79, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(80, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(81, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(82, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(83, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(84, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(85, 'core_grade_get_definitions', 'core_grade_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(86, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', 'grade/externallib.php', 'moodle', ''),
(87, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(88, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(89, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(90, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(91, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(92, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(93, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(94, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(95, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(96, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(97, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(98, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', ''),
(99, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade'),
(100, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', ''),
(101, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', ''),
(102, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(103, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(104, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', ''),
(105, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', ''),
(106, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', ''),
(107, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', ''),
(108, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', ''),
(109, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(110, 'mod_forum_get_forum_discussions', 'mod_forum_external', 'get_forum_discussions', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(111, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(112, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(113, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1402744599, NULL, 'moodle_mobile_app', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings'),
(11, 1, 'core_user_add_user_device'),
(12, 1, 'core_calendar_get_calendar_events');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_files`
--

INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
(1, 'fb262df98d67c4e2a5c9802403821e00cf2992af', '508e674d49c30d4fde325fe6c7f6fd3d56b247e1', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1600, 'image/png', 0, NULL, NULL, NULL, 1402744946, 1402744946, 0, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1402744946, 1402744946, 0, NULL),
(3, 'a4f146f120e7e00d21291b924e26aaabe9f4297a', '68317eab56c67d32aeaee5acf509a0c4aa828b6b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 1702, 'image/png', 0, NULL, NULL, NULL, 1402744946, 1402744946, 0, NULL),
(4, '33957e31ba9c763a74638b825f0a9154acf475e1', '695a55ff780e61c9e59428aa425430b0d6bde53b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1187, 'image/png', 0, NULL, NULL, NULL, 1402744946, 1402744946, 0, NULL),
(5, 'd613d55f37bb76d38d4ffb4b7b83e6c694778c30', '373e63af262a9b8466ba8632551520be793c37ff', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 1230, 'image/png', 0, NULL, NULL, NULL, 1402744947, 1402744947, 0, NULL),
(6, 'b7ec6bd342f62da90bd4d98097bd996684ac4355', '70bd4cc16567d28fd295b46ba28799ebb814b1d5', 5, 'user', 'draft', 21026612, '/', 'Project scope document  Milestones-10 June.docx', 2, 34247, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, 'O:8:"stdClass":1:{s:6:"source";s:48:"Project scope document & Milestones-10 June.docx";}', 'Admin User', 'allrightsreserved', 1402745995, 1402745995, 0, NULL),
(7, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '0c45536a96186285d272da97f1761f36de9ea6cc', 5, 'user', 'draft', 21026612, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1402745995, 1402745995, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store files references' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 1),
(2, 'mediaplugin', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`, `displaywordcount`) VALUES
(1, 2, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1402746980, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_digests`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of user mail delivery preferences for each forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='frequently used comments used in marking guide' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the criteria grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the guide is filled by a particular r' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=110 ;

--
-- Dumping data for table `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1402745106, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(2, 1402745182, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(3, 1402745183, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(4, 1402745260, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(5, 1402745284, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(6, 1402745285, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(7, 1402745895, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(8, 1402745976, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(9, 1402746008, 2, '127.0.0.1', 1, 'course', 0, 'add mod', '../mod/resource/view.php?id=1', 'resource 1'),
(10, 1402746008, 2, '127.0.0.1', 1, 'resource', 1, 'add', 'view.php?id=1', '1'),
(11, 1402746009, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(12, 1402746013, 2, '127.0.0.1', 1, 'resource', 1, 'view', 'view.php?id=1', '1'),
(13, 1402746083, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=2', 'test course (ID 2)'),
(14, 1402746088, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(15, 1402746190, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(16, 1402746513, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(17, 1402746522, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(18, 1402746542, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(19, 1402746566, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(20, 1402746595, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(21, 1402746595, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(22, 1402746629, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(23, 1402746630, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(24, 1402746637, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(25, 1402746641, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(26, 1402746646, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(27, 1402746648, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(28, 1402746649, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(29, 1402746665, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(30, 1402746671, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(31, 1402746678, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(32, 1402746682, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(33, 1402746697, 1, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=1&course=1', '1'),
(34, 1402746697, 1, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(35, 1402746785, 1, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(36, 1402746797, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(37, 1402746800, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(38, 1402746804, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(39, 1402746804, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(40, 1402746812, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(41, 1402746817, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(42, 1402746852, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(43, 1402746855, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(44, 1402746864, 2, '127.0.0.1', 1, 'course', 0, 'update mod', '../mod/resource/view.php?id=1', 'resource 1'),
(45, 1402746869, 2, '127.0.0.1', 1, 'course', 0, 'update mod', '../mod/resource/view.php?id=1', 'resource 1'),
(46, 1402746884, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(47, 1402746885, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(48, 1402746897, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(49, 1402746910, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(50, 1402746910, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(51, 1402746919, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(52, 1402746920, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(53, 1402746930, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(54, 1402746935, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(55, 1402746943, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(56, 1402746979, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(57, 1402746996, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(58, 1402747008, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(59, 1402747618, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(60, 1402747619, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(61, 1402747632, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(62, 1402747633, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(63, 1402747775, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(64, 1402747825, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(65, 1402747866, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(66, 1402747874, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(67, 1402747922, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(68, 1402747983, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(69, 1402748002, 2, '127.0.0.1', 1, 'course', 1, 'delete mod', 'view.php?id=1', 'resource 1'),
(70, 1402748007, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(71, 1402748009, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(72, 1402748020, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(73, 1402748020, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(74, 1402748027, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(75, 1402748027, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(76, 1402748032, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(77, 1402748033, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(78, 1402748044, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(79, 1402748061, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(80, 1402748062, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(81, 1402748067, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(82, 1402749964, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(83, 1402749964, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(84, 1402750669, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(85, 1402750745, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(86, 1402752567, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(87, 1402752567, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(88, 1402752572, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(89, 1402752657, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(90, 1402752657, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(91, 1402752664, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(92, 1402752688, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(93, 1402752689, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(94, 1402752694, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(95, 1402752731, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(96, 1402752737, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(97, 1402752738, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(98, 1402752742, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(99, 1402752742, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(100, 1402752747, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(101, 1402752784, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(102, 1402752795, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(103, 1402752795, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(104, 1402752799, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(105, 1402752799, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(106, 1402752803, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(107, 1402752804, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(108, 1402752805, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(109, 1402752813, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=188 ;

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(45, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(46, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(51, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(52, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
(53, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(56, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(57, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(58, 'book', 'add', 'book', 'name', 'mod_book'),
(59, 'book', 'update', 'book', 'name', 'mod_book'),
(60, 'book', 'view', 'book', 'name', 'mod_book'),
(61, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(63, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(64, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(67, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(68, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(69, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(73, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(74, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(75, 'data', 'view', 'data', 'name', 'mod_data'),
(76, 'data', 'add', 'data', 'name', 'mod_data'),
(77, 'data', 'update', 'data', 'name', 'mod_data'),
(78, 'data', 'record delete', 'data', 'name', 'mod_data'),
(79, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(80, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(81, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(82, 'data', 'templates def', 'data', 'name', 'mod_data'),
(83, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(86, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(87, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(88, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(90, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(91, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(92, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(93, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(94, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(95, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(96, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(97, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(98, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(101, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(102, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(103, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(104, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(105, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(106, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(113, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(114, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary'),
(115, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(116, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(117, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(118, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(119, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(120, 'label', 'add', 'label', 'name', 'mod_label'),
(121, 'label', 'update', 'label', 'name', 'mod_label'),
(122, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(123, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(124, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(125, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(126, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(127, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(128, 'page', 'view', 'page', 'name', 'mod_page'),
(129, 'page', 'view all', 'page', 'name', 'mod_page'),
(130, 'page', 'update', 'page', 'name', 'mod_page'),
(131, 'page', 'add', 'page', 'name', 'mod_page'),
(132, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(133, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(134, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(143, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(144, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(145, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(146, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(147, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(148, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(149, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(150, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(151, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(152, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(153, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(154, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(155, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(156, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(157, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(158, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(159, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(160, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(161, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(162, 'url', 'view', 'url', 'name', 'mod_url'),
(163, 'url', 'view all', 'url', 'name', 'mod_url'),
(164, 'url', 'update', 'url', 'name', 'mod_url'),
(165, 'url', 'add', 'url', 'name', 'mod_url'),
(166, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(167, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(168, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(169, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(170, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(171, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(172, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(179, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(180, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(181, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(182, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(183, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(184, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(185, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(186, 'book', 'print', 'book', 'name', 'booktool_print'),
(187, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of message output plugins' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
(10, 'badgecreatornotice', 'moodle', NULL),
(11, 'assign_notification', 'mod_assign', NULL),
(12, 'assignment_updates', 'mod_assignment', NULL),
(13, 'submission', 'mod_feedback', NULL),
(14, 'message', 'mod_feedback', NULL),
(15, 'posts', 'mod_forum', NULL),
(16, 'graded_essay', 'mod_lesson', NULL),
(17, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(18, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(19, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(20, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(21, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(22, 'expiry_notification', 'enrol_manual', NULL),
(23, 'paypal_enrolment', 'enrol_paypal', NULL),
(24, 'expiry_notification', 'enrol_self', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost/moodle', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='modules available in the site' AUTO_INCREMENT=23 ;

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 60, 0, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'chat', 300, 0, '', 1),
(5, 'choice', 0, 0, '', 1),
(6, 'data', 0, 0, '', 1),
(7, 'feedback', 0, 0, '', 0),
(8, 'folder', 0, 0, '', 1),
(9, 'forum', 60, 0, '', 1),
(10, 'glossary', 0, 0, '', 1),
(11, 'imscp', 0, 0, '', 1),
(12, 'label', 0, 0, '', 1),
(13, 'lesson', 0, 0, '', 1),
(14, 'lti', 0, 0, '', 1),
(15, 'page', 0, 0, '', 1),
(16, 'quiz', 60, 0, '', 1),
(17, 'resource', 0, 0, '', 1),
(18, 'scorm', 300, 0, '', 1),
(19, 'survey', 0, 0, '', 1),
(20, 'url', 0, 0, '', 1),
(21, 'wiki', 0, 0, '', 1),
(22, 'workshop', 60, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the question-type specific options for matching ques' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The subquestions that make up a matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The questions themselves' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext,
  `rightanswer` longtext,
  `responsesummary` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `subqid` varchar(100) NOT NULL DEFAULT '',
  `aid` varchar(100) DEFAULT NULL,
  `response` longtext,
  `rcount` bigint(10) DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Analysis of student responses given to questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `newest` bigint(10) NOT NULL DEFAULT '0',
  `newgraded` bigint(10) NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` longtext NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_states`
--

CREATE TABLE IF NOT EXISTS `mdl_question_states` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  `event` smallint(4) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Statistics for individual questions used in an activity.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` longtext NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The settings for each quiz.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `needsupgradetonewqe` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores users attempts at quizzes.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the overall grade for each user on the quiz, based on' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the maximum possible grade (weight) for each question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'areafiles', 1, 1),
(2, 'local', 1, 2),
(3, 'recent', 1, 3),
(4, 'upload', 1, 4),
(5, 'url', 1, 5),
(6, 'user', 1, 6),
(7, 'wikimedia', 1, 7),
(8, 'youtube', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1402744898, 1402744898, 0),
(2, '', 2, 0, 1, NULL, NULL, 1402744902, 1402744902, 0),
(3, '', 3, 0, 1, NULL, NULL, 1402744904, 1402744904, 0),
(4, '', 4, 0, 1, NULL, NULL, 1402744905, 1402744905, 0),
(5, '', 5, 0, 1, NULL, NULL, 1402744906, 1402744906, 0),
(6, '', 6, 0, 1, NULL, NULL, 1402744907, 1402744907, 0),
(7, '', 7, 0, 1, NULL, NULL, 1402744908, 1402744908, 0),
(8, '', 8, 0, 1, NULL, NULL, 1402744909, 1402744909, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext NOT NULL,
  `popup` longtext NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=1120 ;

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1402744565, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1402744565, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1402744565, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1402744565, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1402744565, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1402744565, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1402744565, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1402744565, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1402744565, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1402744566, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1402744566, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1402744566, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1402744566, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1402744566, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1402744566, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1402744566, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1402744566, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1402744566, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1402744566, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1402744567, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1402744567, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1402744567, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1402744567, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1402744567, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1402744567, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1402744567, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1402744567, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1402744567, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1402744567, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1402744567, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1402744567, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1402744567, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1402744568, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1402744568, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1402744568, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1402744568, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1402744568, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1402744568, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1402744568, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1402744568, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1402744568, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1402744568, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1402744568, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1402744568, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1402744568, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1402744568, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1402744568, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1402744568, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1402744568, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1402744568, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1402744569, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1402744569, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1402744569, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1402744569, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1402744569, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1402744569, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1402744569, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1402744569, 0),
(59, 1, 1, 'moodle/user:create', 1, 1402744569, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1402744569, 0),
(61, 1, 1, 'moodle/user:update', 1, 1402744569, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1402744569, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1402744570, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1402744570, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1402744570, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1402744570, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1402744570, 0),
(68, 1, 4, 'moodle/user:viewhiddendetails', 1, 1402744570, 0),
(69, 1, 3, 'moodle/user:viewhiddendetails', 1, 1402744570, 0),
(70, 1, 1, 'moodle/user:viewhiddendetails', 1, 1402744570, 0),
(71, 1, 1, 'moodle/user:loginas', 1, 1402744570, 0),
(72, 1, 1, 'moodle/user:managesyspages', 1, 1402744570, 0),
(73, 1, 7, 'moodle/user:manageownblocks', 1, 1402744570, 0),
(74, 1, 7, 'moodle/user:manageownfiles', 1, 1402744571, 0),
(75, 1, 1, 'moodle/my:configsyspages', 1, 1402744571, 0),
(76, 1, 3, 'moodle/role:assign', 1, 1402744571, 0),
(77, 1, 1, 'moodle/role:assign', 1, 1402744571, 0),
(78, 1, 4, 'moodle/role:review', 1, 1402744571, 0),
(79, 1, 3, 'moodle/role:review', 1, 1402744571, 0),
(80, 1, 1, 'moodle/role:review', 1, 1402744571, 0),
(81, 1, 1, 'moodle/role:override', 1, 1402744572, 0),
(82, 1, 3, 'moodle/role:safeoverride', 1, 1402744572, 0),
(83, 1, 1, 'moodle/role:manage', 1, 1402744572, 0),
(84, 1, 3, 'moodle/role:switchroles', 1, 1402744572, 0),
(85, 1, 1, 'moodle/role:switchroles', 1, 1402744572, 0),
(86, 1, 1, 'moodle/category:manage', 1, 1402744572, 0),
(87, 1, 2, 'moodle/category:viewhiddencategories', 1, 1402744572, 0),
(88, 1, 1, 'moodle/category:viewhiddencategories', 1, 1402744572, 0),
(89, 1, 1, 'moodle/cohort:manage', 1, 1402744572, 0),
(90, 1, 1, 'moodle/cohort:assign', 1, 1402744572, 0),
(91, 1, 3, 'moodle/cohort:view', 1, 1402744572, 0),
(92, 1, 1, 'moodle/cohort:view', 1, 1402744572, 0),
(93, 1, 2, 'moodle/course:create', 1, 1402744573, 0),
(94, 1, 1, 'moodle/course:create', 1, 1402744573, 0),
(95, 1, 7, 'moodle/course:request', 1, 1402744573, 0),
(96, 1, 1, 'moodle/course:delete', 1, 1402744573, 0),
(97, 1, 3, 'moodle/course:update', 1, 1402744573, 0),
(98, 1, 1, 'moodle/course:update', 1, 1402744573, 0),
(99, 1, 1, 'moodle/course:view', 1, 1402744573, 0),
(100, 1, 3, 'moodle/course:enrolreview', 1, 1402744573, 0),
(101, 1, 1, 'moodle/course:enrolreview', 1, 1402744573, 0),
(102, 1, 3, 'moodle/course:enrolconfig', 1, 1402744573, 0),
(103, 1, 1, 'moodle/course:enrolconfig', 1, 1402744573, 0),
(104, 1, 4, 'moodle/course:bulkmessaging', 1, 1402744573, 0),
(105, 1, 3, 'moodle/course:bulkmessaging', 1, 1402744573, 0),
(106, 1, 1, 'moodle/course:bulkmessaging', 1, 1402744573, 0),
(107, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1402744573, 0),
(108, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1402744573, 0),
(109, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1402744574, 0),
(110, 1, 2, 'moodle/course:viewhiddencourses', 1, 1402744574, 0),
(111, 1, 4, 'moodle/course:viewhiddencourses', 1, 1402744574, 0),
(112, 1, 3, 'moodle/course:viewhiddencourses', 1, 1402744574, 0),
(113, 1, 1, 'moodle/course:viewhiddencourses', 1, 1402744574, 0),
(114, 1, 3, 'moodle/course:visibility', 1, 1402744574, 0),
(115, 1, 1, 'moodle/course:visibility', 1, 1402744574, 0),
(116, 1, 3, 'moodle/course:managefiles', 1, 1402744574, 0),
(117, 1, 1, 'moodle/course:managefiles', 1, 1402744574, 0),
(118, 1, 3, 'moodle/course:manageactivities', 1, 1402744574, 0),
(119, 1, 1, 'moodle/course:manageactivities', 1, 1402744574, 0),
(120, 1, 3, 'moodle/course:activityvisibility', 1, 1402744574, 0),
(121, 1, 1, 'moodle/course:activityvisibility', 1, 1402744574, 0),
(122, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1402744574, 0),
(123, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1402744574, 0),
(124, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1402744574, 0),
(125, 1, 5, 'moodle/course:viewparticipants', 1, 1402744575, 0),
(126, 1, 4, 'moodle/course:viewparticipants', 1, 1402744575, 0),
(127, 1, 3, 'moodle/course:viewparticipants', 1, 1402744575, 0),
(128, 1, 1, 'moodle/course:viewparticipants', 1, 1402744575, 0),
(129, 1, 3, 'moodle/course:changefullname', 1, 1402744575, 0),
(130, 1, 1, 'moodle/course:changefullname', 1, 1402744575, 0),
(131, 1, 3, 'moodle/course:changeshortname', 1, 1402744575, 0),
(132, 1, 1, 'moodle/course:changeshortname', 1, 1402744575, 0),
(133, 1, 3, 'moodle/course:changeidnumber', 1, 1402744575, 0),
(134, 1, 1, 'moodle/course:changeidnumber', 1, 1402744575, 0),
(135, 1, 3, 'moodle/course:changecategory', 1, 1402744575, 0),
(136, 1, 1, 'moodle/course:changecategory', 1, 1402744575, 0),
(137, 1, 3, 'moodle/course:changesummary', 1, 1402744575, 0),
(138, 1, 1, 'moodle/course:changesummary', 1, 1402744575, 0),
(139, 1, 1, 'moodle/site:viewparticipants', 1, 1402744575, 0),
(140, 1, 5, 'moodle/course:isincompletionreports', 1, 1402744576, 0),
(141, 1, 5, 'moodle/course:viewscales', 1, 1402744576, 0),
(142, 1, 4, 'moodle/course:viewscales', 1, 1402744576, 0),
(143, 1, 3, 'moodle/course:viewscales', 1, 1402744576, 0),
(144, 1, 1, 'moodle/course:viewscales', 1, 1402744576, 0),
(145, 1, 3, 'moodle/course:managescales', 1, 1402744576, 0),
(146, 1, 1, 'moodle/course:managescales', 1, 1402744576, 0),
(147, 1, 3, 'moodle/course:managegroups', 1, 1402744576, 0),
(148, 1, 1, 'moodle/course:managegroups', 1, 1402744576, 0),
(149, 1, 3, 'moodle/course:reset', 1, 1402744576, 0),
(150, 1, 1, 'moodle/course:reset', 1, 1402744576, 0),
(151, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1402744577, 0),
(152, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1402744577, 0),
(153, 1, 6, 'moodle/blog:view', 1, 1402744577, 0),
(154, 1, 7, 'moodle/blog:view', 1, 1402744577, 0),
(155, 1, 5, 'moodle/blog:view', 1, 1402744577, 0),
(156, 1, 4, 'moodle/blog:view', 1, 1402744577, 0),
(157, 1, 3, 'moodle/blog:view', 1, 1402744577, 0),
(158, 1, 1, 'moodle/blog:view', 1, 1402744577, 0),
(159, 1, 6, 'moodle/blog:search', 1, 1402744577, 0),
(160, 1, 7, 'moodle/blog:search', 1, 1402744577, 0),
(161, 1, 5, 'moodle/blog:search', 1, 1402744577, 0),
(162, 1, 4, 'moodle/blog:search', 1, 1402744577, 0),
(163, 1, 3, 'moodle/blog:search', 1, 1402744577, 0),
(164, 1, 1, 'moodle/blog:search', 1, 1402744577, 0),
(165, 1, 1, 'moodle/blog:viewdrafts', 1, 1402744577, 0),
(166, 1, 7, 'moodle/blog:create', 1, 1402744578, 0),
(167, 1, 1, 'moodle/blog:create', 1, 1402744578, 0),
(168, 1, 4, 'moodle/blog:manageentries', 1, 1402744578, 0),
(169, 1, 3, 'moodle/blog:manageentries', 1, 1402744578, 0),
(170, 1, 1, 'moodle/blog:manageentries', 1, 1402744578, 0),
(171, 1, 5, 'moodle/blog:manageexternal', 1, 1402744578, 0),
(172, 1, 7, 'moodle/blog:manageexternal', 1, 1402744578, 0),
(173, 1, 4, 'moodle/blog:manageexternal', 1, 1402744578, 0),
(174, 1, 3, 'moodle/blog:manageexternal', 1, 1402744578, 0),
(175, 1, 1, 'moodle/blog:manageexternal', 1, 1402744578, 0),
(176, 1, 7, 'moodle/calendar:manageownentries', 1, 1402744578, 0),
(177, 1, 1, 'moodle/calendar:manageownentries', 1, 1402744578, 0),
(178, 1, 4, 'moodle/calendar:managegroupentries', 1, 1402744578, 0),
(179, 1, 3, 'moodle/calendar:managegroupentries', 1, 1402744578, 0),
(180, 1, 1, 'moodle/calendar:managegroupentries', 1, 1402744578, 0),
(181, 1, 4, 'moodle/calendar:manageentries', 1, 1402744578, 0),
(182, 1, 3, 'moodle/calendar:manageentries', 1, 1402744578, 0),
(183, 1, 1, 'moodle/calendar:manageentries', 1, 1402744579, 0),
(184, 1, 1, 'moodle/user:editprofile', 1, 1402744579, 0),
(185, 1, 6, 'moodle/user:editownprofile', -1000, 1402744579, 0),
(186, 1, 7, 'moodle/user:editownprofile', 1, 1402744579, 0),
(187, 1, 1, 'moodle/user:editownprofile', 1, 1402744579, 0),
(188, 1, 6, 'moodle/user:changeownpassword', -1000, 1402744579, 0),
(189, 1, 7, 'moodle/user:changeownpassword', 1, 1402744579, 0),
(190, 1, 1, 'moodle/user:changeownpassword', 1, 1402744579, 0),
(191, 1, 5, 'moodle/user:readuserposts', 1, 1402744579, 0),
(192, 1, 4, 'moodle/user:readuserposts', 1, 1402744579, 0),
(193, 1, 3, 'moodle/user:readuserposts', 1, 1402744579, 0),
(194, 1, 1, 'moodle/user:readuserposts', 1, 1402744579, 0),
(195, 1, 5, 'moodle/user:readuserblogs', 1, 1402744579, 0),
(196, 1, 4, 'moodle/user:readuserblogs', 1, 1402744579, 0),
(197, 1, 3, 'moodle/user:readuserblogs', 1, 1402744579, 0),
(198, 1, 1, 'moodle/user:readuserblogs', 1, 1402744579, 0),
(199, 1, 1, 'moodle/user:editmessageprofile', 1, 1402744579, 0),
(200, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1402744579, 0),
(201, 1, 7, 'moodle/user:editownmessageprofile', 1, 1402744579, 0),
(202, 1, 1, 'moodle/user:editownmessageprofile', 1, 1402744580, 0),
(203, 1, 3, 'moodle/question:managecategory', 1, 1402744580, 0),
(204, 1, 1, 'moodle/question:managecategory', 1, 1402744580, 0),
(205, 1, 3, 'moodle/question:add', 1, 1402744580, 0),
(206, 1, 1, 'moodle/question:add', 1, 1402744580, 0),
(207, 1, 3, 'moodle/question:editmine', 1, 1402744580, 0),
(208, 1, 1, 'moodle/question:editmine', 1, 1402744580, 0),
(209, 1, 3, 'moodle/question:editall', 1, 1402744580, 0),
(210, 1, 1, 'moodle/question:editall', 1, 1402744580, 0),
(211, 1, 3, 'moodle/question:viewmine', 1, 1402744580, 0),
(212, 1, 1, 'moodle/question:viewmine', 1, 1402744580, 0),
(213, 1, 3, 'moodle/question:viewall', 1, 1402744581, 0),
(214, 1, 1, 'moodle/question:viewall', 1, 1402744581, 0),
(215, 1, 3, 'moodle/question:usemine', 1, 1402744581, 0),
(216, 1, 1, 'moodle/question:usemine', 1, 1402744581, 0),
(217, 1, 3, 'moodle/question:useall', 1, 1402744581, 0),
(218, 1, 1, 'moodle/question:useall', 1, 1402744581, 0),
(219, 1, 3, 'moodle/question:movemine', 1, 1402744581, 0),
(220, 1, 1, 'moodle/question:movemine', 1, 1402744581, 0),
(221, 1, 3, 'moodle/question:moveall', 1, 1402744581, 0),
(222, 1, 1, 'moodle/question:moveall', 1, 1402744581, 0),
(223, 1, 1, 'moodle/question:config', 1, 1402744581, 0),
(224, 1, 5, 'moodle/question:flag', 1, 1402744581, 0),
(225, 1, 4, 'moodle/question:flag', 1, 1402744581, 0),
(226, 1, 3, 'moodle/question:flag', 1, 1402744581, 0),
(227, 1, 1, 'moodle/question:flag', 1, 1402744581, 0),
(228, 1, 4, 'moodle/site:doclinks', 1, 1402744581, 0),
(229, 1, 3, 'moodle/site:doclinks', 1, 1402744581, 0),
(230, 1, 1, 'moodle/site:doclinks', 1, 1402744581, 0),
(231, 1, 3, 'moodle/course:sectionvisibility', 1, 1402744581, 0),
(232, 1, 1, 'moodle/course:sectionvisibility', 1, 1402744582, 0),
(233, 1, 3, 'moodle/course:useremail', 1, 1402744582, 0),
(234, 1, 1, 'moodle/course:useremail', 1, 1402744582, 0),
(235, 1, 3, 'moodle/course:viewhiddensections', 1, 1402744582, 0),
(236, 1, 1, 'moodle/course:viewhiddensections', 1, 1402744582, 0),
(237, 1, 3, 'moodle/course:setcurrentsection', 1, 1402744582, 0),
(238, 1, 1, 'moodle/course:setcurrentsection', 1, 1402744582, 0),
(239, 1, 3, 'moodle/course:movesections', 1, 1402744582, 0),
(240, 1, 1, 'moodle/course:movesections', 1, 1402744582, 0),
(241, 1, 4, 'moodle/grade:viewall', 1, 1402744582, 0),
(242, 1, 3, 'moodle/grade:viewall', 1, 1402744582, 0),
(243, 1, 1, 'moodle/grade:viewall', 1, 1402744582, 0),
(244, 1, 5, 'moodle/grade:view', 1, 1402744583, 0),
(245, 1, 4, 'moodle/grade:viewhidden', 1, 1402744583, 0),
(246, 1, 3, 'moodle/grade:viewhidden', 1, 1402744583, 0),
(247, 1, 1, 'moodle/grade:viewhidden', 1, 1402744583, 0),
(248, 1, 3, 'moodle/grade:import', 1, 1402744583, 0),
(249, 1, 1, 'moodle/grade:import', 1, 1402744583, 0),
(250, 1, 4, 'moodle/grade:export', 1, 1402744583, 0),
(251, 1, 3, 'moodle/grade:export', 1, 1402744583, 0),
(252, 1, 1, 'moodle/grade:export', 1, 1402744583, 0),
(253, 1, 3, 'moodle/grade:manage', 1, 1402744583, 0),
(254, 1, 1, 'moodle/grade:manage', 1, 1402744583, 0),
(255, 1, 3, 'moodle/grade:edit', 1, 1402744583, 0),
(256, 1, 1, 'moodle/grade:edit', 1, 1402744583, 0),
(257, 1, 3, 'moodle/grade:managegradingforms', 1, 1402744583, 0),
(258, 1, 1, 'moodle/grade:managegradingforms', 1, 1402744583, 0),
(259, 1, 1, 'moodle/grade:sharegradingforms', 1, 1402744584, 0),
(260, 1, 1, 'moodle/grade:managesharedforms', 1, 1402744584, 0),
(261, 1, 3, 'moodle/grade:manageoutcomes', 1, 1402744584, 0),
(262, 1, 1, 'moodle/grade:manageoutcomes', 1, 1402744584, 0),
(263, 1, 3, 'moodle/grade:manageletters', 1, 1402744584, 0),
(264, 1, 1, 'moodle/grade:manageletters', 1, 1402744584, 0),
(265, 1, 3, 'moodle/grade:hide', 1, 1402744584, 0),
(266, 1, 1, 'moodle/grade:hide', 1, 1402744584, 0),
(267, 1, 3, 'moodle/grade:lock', 1, 1402744584, 0),
(268, 1, 1, 'moodle/grade:lock', 1, 1402744584, 0),
(269, 1, 3, 'moodle/grade:unlock', 1, 1402744584, 0),
(270, 1, 1, 'moodle/grade:unlock', 1, 1402744584, 0),
(271, 1, 7, 'moodle/my:manageblocks', 1, 1402744584, 0),
(272, 1, 4, 'moodle/notes:view', 1, 1402744585, 0),
(273, 1, 3, 'moodle/notes:view', 1, 1402744585, 0),
(274, 1, 1, 'moodle/notes:view', 1, 1402744585, 0),
(275, 1, 4, 'moodle/notes:manage', 1, 1402744585, 0),
(276, 1, 3, 'moodle/notes:manage', 1, 1402744585, 0),
(277, 1, 1, 'moodle/notes:manage', 1, 1402744585, 0),
(278, 1, 4, 'moodle/tag:manage', 1, 1402744585, 0),
(279, 1, 3, 'moodle/tag:manage', 1, 1402744585, 0),
(280, 1, 1, 'moodle/tag:manage', 1, 1402744585, 0),
(281, 1, 1, 'moodle/tag:create', 1, 1402744585, 0),
(282, 1, 7, 'moodle/tag:create', 1, 1402744585, 0),
(283, 1, 1, 'moodle/tag:edit', 1, 1402744585, 0),
(284, 1, 7, 'moodle/tag:edit', 1, 1402744585, 0),
(285, 1, 1, 'moodle/tag:flag', 1, 1402744585, 0),
(286, 1, 7, 'moodle/tag:flag', 1, 1402744586, 0),
(287, 1, 4, 'moodle/tag:editblocks', 1, 1402744586, 0),
(288, 1, 3, 'moodle/tag:editblocks', 1, 1402744586, 0),
(289, 1, 1, 'moodle/tag:editblocks', 1, 1402744586, 0),
(290, 1, 6, 'moodle/block:view', 1, 1402744586, 0),
(291, 1, 7, 'moodle/block:view', 1, 1402744586, 0),
(292, 1, 5, 'moodle/block:view', 1, 1402744586, 0),
(293, 1, 4, 'moodle/block:view', 1, 1402744586, 0),
(294, 1, 3, 'moodle/block:view', 1, 1402744586, 0),
(295, 1, 3, 'moodle/block:edit', 1, 1402744586, 0),
(296, 1, 1, 'moodle/block:edit', 1, 1402744586, 0),
(297, 1, 7, 'moodle/portfolio:export', 1, 1402744586, 0),
(298, 1, 5, 'moodle/portfolio:export', 1, 1402744586, 0),
(299, 1, 4, 'moodle/portfolio:export', 1, 1402744586, 0),
(300, 1, 3, 'moodle/portfolio:export', 1, 1402744586, 0),
(301, 1, 8, 'moodle/comment:view', 1, 1402744586, 0),
(302, 1, 6, 'moodle/comment:view', 1, 1402744586, 0),
(303, 1, 7, 'moodle/comment:view', 1, 1402744587, 0),
(304, 1, 5, 'moodle/comment:view', 1, 1402744587, 0),
(305, 1, 4, 'moodle/comment:view', 1, 1402744587, 0),
(306, 1, 3, 'moodle/comment:view', 1, 1402744587, 0),
(307, 1, 1, 'moodle/comment:view', 1, 1402744587, 0),
(308, 1, 7, 'moodle/comment:post', 1, 1402744587, 0),
(309, 1, 5, 'moodle/comment:post', 1, 1402744587, 0),
(310, 1, 4, 'moodle/comment:post', 1, 1402744587, 0),
(311, 1, 3, 'moodle/comment:post', 1, 1402744587, 0),
(312, 1, 1, 'moodle/comment:post', 1, 1402744587, 0),
(313, 1, 3, 'moodle/comment:delete', 1, 1402744587, 0),
(314, 1, 1, 'moodle/comment:delete', 1, 1402744587, 0),
(315, 1, 1, 'moodle/webservice:createtoken', 1, 1402744587, 0),
(316, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1402744588, 0),
(317, 1, 7, 'moodle/rating:view', 1, 1402744588, 0),
(318, 1, 5, 'moodle/rating:view', 1, 1402744588, 0),
(319, 1, 4, 'moodle/rating:view', 1, 1402744588, 0),
(320, 1, 3, 'moodle/rating:view', 1, 1402744588, 0),
(321, 1, 1, 'moodle/rating:view', 1, 1402744588, 0),
(322, 1, 7, 'moodle/rating:viewany', 1, 1402744588, 0),
(323, 1, 5, 'moodle/rating:viewany', 1, 1402744588, 0),
(324, 1, 4, 'moodle/rating:viewany', 1, 1402744588, 0),
(325, 1, 3, 'moodle/rating:viewany', 1, 1402744588, 0),
(326, 1, 1, 'moodle/rating:viewany', 1, 1402744588, 0),
(327, 1, 7, 'moodle/rating:viewall', 1, 1402744588, 0),
(328, 1, 5, 'moodle/rating:viewall', 1, 1402744589, 0),
(329, 1, 4, 'moodle/rating:viewall', 1, 1402744589, 0),
(330, 1, 3, 'moodle/rating:viewall', 1, 1402744589, 0),
(331, 1, 1, 'moodle/rating:viewall', 1, 1402744589, 0),
(332, 1, 7, 'moodle/rating:rate', 1, 1402744589, 0),
(333, 1, 5, 'moodle/rating:rate', 1, 1402744589, 0),
(334, 1, 4, 'moodle/rating:rate', 1, 1402744589, 0),
(335, 1, 3, 'moodle/rating:rate', 1, 1402744589, 0),
(336, 1, 1, 'moodle/rating:rate', 1, 1402744589, 0),
(337, 1, 1, 'moodle/course:publish', 1, 1402744589, 0),
(338, 1, 4, 'moodle/course:markcomplete', 1, 1402744589, 0),
(339, 1, 3, 'moodle/course:markcomplete', 1, 1402744589, 0),
(340, 1, 1, 'moodle/course:markcomplete', 1, 1402744589, 0),
(341, 1, 1, 'moodle/community:add', 1, 1402744589, 0),
(342, 1, 4, 'moodle/community:add', 1, 1402744590, 0),
(343, 1, 3, 'moodle/community:add', 1, 1402744590, 0),
(344, 1, 1, 'moodle/community:download', 1, 1402744590, 0),
(345, 1, 3, 'moodle/community:download', 1, 1402744590, 0),
(346, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1402744590, 0),
(347, 1, 7, 'moodle/badges:viewbadges', 1, 1402744590, 0),
(348, 1, 7, 'moodle/badges:manageownbadges', 1, 1402744590, 0),
(349, 1, 7, 'moodle/badges:viewotherbadges', 1, 1402744590, 0),
(350, 1, 7, 'moodle/badges:earnbadge', 1, 1402744590, 0),
(351, 1, 1, 'moodle/badges:createbadge', 1, 1402744590, 0),
(352, 1, 3, 'moodle/badges:createbadge', 1, 1402744590, 0),
(353, 1, 1, 'moodle/badges:deletebadge', 1, 1402744590, 0),
(354, 1, 3, 'moodle/badges:deletebadge', 1, 1402744590, 0),
(355, 1, 1, 'moodle/badges:configuredetails', 1, 1402744590, 0),
(356, 1, 3, 'moodle/badges:configuredetails', 1, 1402744590, 0),
(357, 1, 1, 'moodle/badges:configurecriteria', 1, 1402744591, 0),
(358, 1, 3, 'moodle/badges:configurecriteria', 1, 1402744591, 0),
(359, 1, 1, 'moodle/badges:configuremessages', 1, 1402744591, 0),
(360, 1, 3, 'moodle/badges:configuremessages', 1, 1402744591, 0),
(361, 1, 1, 'moodle/badges:awardbadge', 1, 1402744591, 0),
(362, 1, 4, 'moodle/badges:awardbadge', 1, 1402744591, 0),
(363, 1, 3, 'moodle/badges:awardbadge', 1, 1402744591, 0),
(364, 1, 1, 'moodle/badges:viewawarded', 1, 1402744591, 0),
(365, 1, 4, 'moodle/badges:viewawarded', 1, 1402744591, 0),
(366, 1, 3, 'moodle/badges:viewawarded', 1, 1402744591, 0),
(367, 1, 6, 'mod/assign:view', 1, 1402744670, 0),
(368, 1, 5, 'mod/assign:view', 1, 1402744670, 0),
(369, 1, 4, 'mod/assign:view', 1, 1402744670, 0),
(370, 1, 3, 'mod/assign:view', 1, 1402744670, 0),
(371, 1, 1, 'mod/assign:view', 1, 1402744670, 0),
(372, 1, 5, 'mod/assign:submit', 1, 1402744670, 0),
(373, 1, 4, 'mod/assign:grade', 1, 1402744670, 0),
(374, 1, 3, 'mod/assign:grade', 1, 1402744671, 0),
(375, 1, 1, 'mod/assign:grade', 1, 1402744671, 0),
(376, 1, 4, 'mod/assign:exportownsubmission', 1, 1402744671, 0),
(377, 1, 3, 'mod/assign:exportownsubmission', 1, 1402744671, 0),
(378, 1, 1, 'mod/assign:exportownsubmission', 1, 1402744671, 0),
(379, 1, 5, 'mod/assign:exportownsubmission', 1, 1402744671, 0),
(380, 1, 3, 'mod/assign:addinstance', 1, 1402744671, 0),
(381, 1, 1, 'mod/assign:addinstance', 1, 1402744671, 0),
(382, 1, 4, 'mod/assign:grantextension', 1, 1402744671, 0),
(383, 1, 3, 'mod/assign:grantextension', 1, 1402744671, 0),
(384, 1, 1, 'mod/assign:grantextension', 1, 1402744671, 0),
(385, 1, 3, 'mod/assign:revealidentities', 1, 1402744671, 0),
(386, 1, 1, 'mod/assign:revealidentities', 1, 1402744671, 0),
(387, 1, 3, 'mod/assign:reviewgrades', 1, 1402744672, 0),
(388, 1, 1, 'mod/assign:reviewgrades', 1, 1402744672, 0),
(389, 1, 3, 'mod/assign:releasegrades', 1, 1402744672, 0),
(390, 1, 1, 'mod/assign:releasegrades', 1, 1402744672, 0),
(391, 1, 3, 'mod/assign:managegrades', 1, 1402744672, 0),
(392, 1, 1, 'mod/assign:managegrades', 1, 1402744672, 0),
(393, 1, 3, 'mod/assign:manageallocations', 1, 1402744672, 0),
(394, 1, 1, 'mod/assign:manageallocations', 1, 1402744672, 0),
(395, 1, 6, 'mod/assignment:view', 1, 1402744676, 0),
(396, 1, 5, 'mod/assignment:view', 1, 1402744676, 0),
(397, 1, 4, 'mod/assignment:view', 1, 1402744676, 0),
(398, 1, 3, 'mod/assignment:view', 1, 1402744676, 0),
(399, 1, 1, 'mod/assignment:view', 1, 1402744676, 0),
(400, 1, 3, 'mod/assignment:addinstance', 1, 1402744677, 0),
(401, 1, 1, 'mod/assignment:addinstance', 1, 1402744677, 0),
(402, 1, 5, 'mod/assignment:submit', 1, 1402744677, 0),
(403, 1, 4, 'mod/assignment:grade', 1, 1402744677, 0),
(404, 1, 3, 'mod/assignment:grade', 1, 1402744677, 0),
(405, 1, 1, 'mod/assignment:grade', 1, 1402744677, 0),
(406, 1, 4, 'mod/assignment:exportownsubmission', 1, 1402744677, 0),
(407, 1, 3, 'mod/assignment:exportownsubmission', 1, 1402744677, 0),
(408, 1, 1, 'mod/assignment:exportownsubmission', 1, 1402744677, 0),
(409, 1, 5, 'mod/assignment:exportownsubmission', 1, 1402744678, 0),
(410, 1, 3, 'mod/book:addinstance', 1, 1402744679, 0),
(411, 1, 1, 'mod/book:addinstance', 1, 1402744679, 0),
(412, 1, 6, 'mod/book:read', 1, 1402744680, 0),
(413, 1, 8, 'mod/book:read', 1, 1402744680, 0),
(414, 1, 5, 'mod/book:read', 1, 1402744680, 0),
(415, 1, 4, 'mod/book:read', 1, 1402744680, 0),
(416, 1, 3, 'mod/book:read', 1, 1402744680, 0),
(417, 1, 1, 'mod/book:read', 1, 1402744680, 0),
(418, 1, 4, 'mod/book:viewhiddenchapters', 1, 1402744680, 0),
(419, 1, 3, 'mod/book:viewhiddenchapters', 1, 1402744680, 0),
(420, 1, 1, 'mod/book:viewhiddenchapters', 1, 1402744680, 0),
(421, 1, 3, 'mod/book:edit', 1, 1402744680, 0),
(422, 1, 1, 'mod/book:edit', 1, 1402744680, 0),
(423, 1, 3, 'mod/chat:addinstance', 1, 1402744686, 0),
(424, 1, 1, 'mod/chat:addinstance', 1, 1402744686, 0),
(425, 1, 5, 'mod/chat:chat', 1, 1402744686, 0),
(426, 1, 4, 'mod/chat:chat', 1, 1402744686, 0),
(427, 1, 3, 'mod/chat:chat', 1, 1402744686, 0),
(428, 1, 1, 'mod/chat:chat', 1, 1402744686, 0),
(429, 1, 5, 'mod/chat:readlog', 1, 1402744686, 0),
(430, 1, 4, 'mod/chat:readlog', 1, 1402744686, 0),
(431, 1, 3, 'mod/chat:readlog', 1, 1402744686, 0),
(432, 1, 1, 'mod/chat:readlog', 1, 1402744686, 0),
(433, 1, 4, 'mod/chat:deletelog', 1, 1402744687, 0),
(434, 1, 3, 'mod/chat:deletelog', 1, 1402744687, 0),
(435, 1, 1, 'mod/chat:deletelog', 1, 1402744687, 0),
(436, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1402744687, 0),
(437, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1402744687, 0),
(438, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1402744687, 0),
(439, 1, 4, 'mod/chat:exportsession', 1, 1402744687, 0),
(440, 1, 3, 'mod/chat:exportsession', 1, 1402744687, 0),
(441, 1, 1, 'mod/chat:exportsession', 1, 1402744687, 0),
(442, 1, 3, 'mod/choice:addinstance', 1, 1402744690, 0),
(443, 1, 1, 'mod/choice:addinstance', 1, 1402744690, 0),
(444, 1, 5, 'mod/choice:choose', 1, 1402744690, 0),
(445, 1, 4, 'mod/choice:choose', 1, 1402744690, 0),
(446, 1, 3, 'mod/choice:choose', 1, 1402744690, 0),
(447, 1, 4, 'mod/choice:readresponses', 1, 1402744690, 0),
(448, 1, 3, 'mod/choice:readresponses', 1, 1402744690, 0),
(449, 1, 1, 'mod/choice:readresponses', 1, 1402744690, 0),
(450, 1, 4, 'mod/choice:deleteresponses', 1, 1402744691, 0),
(451, 1, 3, 'mod/choice:deleteresponses', 1, 1402744691, 0),
(452, 1, 1, 'mod/choice:deleteresponses', 1, 1402744691, 0),
(453, 1, 4, 'mod/choice:downloadresponses', 1, 1402744691, 0),
(454, 1, 3, 'mod/choice:downloadresponses', 1, 1402744691, 0),
(455, 1, 1, 'mod/choice:downloadresponses', 1, 1402744691, 0),
(456, 1, 3, 'mod/data:addinstance', 1, 1402744695, 0),
(457, 1, 1, 'mod/data:addinstance', 1, 1402744695, 0),
(458, 1, 8, 'mod/data:viewentry', 1, 1402744695, 0),
(459, 1, 6, 'mod/data:viewentry', 1, 1402744695, 0),
(460, 1, 5, 'mod/data:viewentry', 1, 1402744695, 0),
(461, 1, 4, 'mod/data:viewentry', 1, 1402744695, 0),
(462, 1, 3, 'mod/data:viewentry', 1, 1402744695, 0),
(463, 1, 1, 'mod/data:viewentry', 1, 1402744695, 0),
(464, 1, 5, 'mod/data:writeentry', 1, 1402744695, 0),
(465, 1, 4, 'mod/data:writeentry', 1, 1402744695, 0),
(466, 1, 3, 'mod/data:writeentry', 1, 1402744695, 0),
(467, 1, 1, 'mod/data:writeentry', 1, 1402744696, 0),
(468, 1, 5, 'mod/data:comment', 1, 1402744696, 0),
(469, 1, 4, 'mod/data:comment', 1, 1402744696, 0),
(470, 1, 3, 'mod/data:comment', 1, 1402744696, 0),
(471, 1, 1, 'mod/data:comment', 1, 1402744696, 0),
(472, 1, 4, 'mod/data:rate', 1, 1402744696, 0),
(473, 1, 3, 'mod/data:rate', 1, 1402744696, 0),
(474, 1, 1, 'mod/data:rate', 1, 1402744696, 0),
(475, 1, 4, 'mod/data:viewrating', 1, 1402744696, 0),
(476, 1, 3, 'mod/data:viewrating', 1, 1402744696, 0),
(477, 1, 1, 'mod/data:viewrating', 1, 1402744696, 0),
(478, 1, 4, 'mod/data:viewanyrating', 1, 1402744697, 0),
(479, 1, 3, 'mod/data:viewanyrating', 1, 1402744697, 0),
(480, 1, 1, 'mod/data:viewanyrating', 1, 1402744697, 0),
(481, 1, 4, 'mod/data:viewallratings', 1, 1402744697, 0),
(482, 1, 3, 'mod/data:viewallratings', 1, 1402744697, 0),
(483, 1, 1, 'mod/data:viewallratings', 1, 1402744697, 0),
(484, 1, 4, 'mod/data:approve', 1, 1402744697, 0),
(485, 1, 3, 'mod/data:approve', 1, 1402744697, 0),
(486, 1, 1, 'mod/data:approve', 1, 1402744697, 0),
(487, 1, 4, 'mod/data:manageentries', 1, 1402744697, 0),
(488, 1, 3, 'mod/data:manageentries', 1, 1402744697, 0),
(489, 1, 1, 'mod/data:manageentries', 1, 1402744697, 0),
(490, 1, 4, 'mod/data:managecomments', 1, 1402744697, 0),
(491, 1, 3, 'mod/data:managecomments', 1, 1402744697, 0),
(492, 1, 1, 'mod/data:managecomments', 1, 1402744697, 0),
(493, 1, 3, 'mod/data:managetemplates', 1, 1402744697, 0),
(494, 1, 1, 'mod/data:managetemplates', 1, 1402744697, 0),
(495, 1, 4, 'mod/data:viewalluserpresets', 1, 1402744698, 0),
(496, 1, 3, 'mod/data:viewalluserpresets', 1, 1402744698, 0),
(497, 1, 1, 'mod/data:viewalluserpresets', 1, 1402744698, 0),
(498, 1, 1, 'mod/data:manageuserpresets', 1, 1402744698, 0),
(499, 1, 1, 'mod/data:exportentry', 1, 1402744698, 0),
(500, 1, 4, 'mod/data:exportentry', 1, 1402744698, 0),
(501, 1, 3, 'mod/data:exportentry', 1, 1402744698, 0),
(502, 1, 1, 'mod/data:exportownentry', 1, 1402744698, 0),
(503, 1, 4, 'mod/data:exportownentry', 1, 1402744698, 0),
(504, 1, 3, 'mod/data:exportownentry', 1, 1402744698, 0),
(505, 1, 5, 'mod/data:exportownentry', 1, 1402744699, 0),
(506, 1, 1, 'mod/data:exportallentries', 1, 1402744699, 0),
(507, 1, 4, 'mod/data:exportallentries', 1, 1402744699, 0),
(508, 1, 3, 'mod/data:exportallentries', 1, 1402744699, 0),
(509, 1, 1, 'mod/data:exportuserinfo', 1, 1402744699, 0),
(510, 1, 4, 'mod/data:exportuserinfo', 1, 1402744699, 0),
(511, 1, 3, 'mod/data:exportuserinfo', 1, 1402744699, 0),
(512, 1, 3, 'mod/feedback:addinstance', 1, 1402744708, 0),
(513, 1, 1, 'mod/feedback:addinstance', 1, 1402744708, 0),
(514, 1, 6, 'mod/feedback:view', 1, 1402744708, 0),
(515, 1, 5, 'mod/feedback:view', 1, 1402744709, 0),
(516, 1, 4, 'mod/feedback:view', 1, 1402744709, 0),
(517, 1, 3, 'mod/feedback:view', 1, 1402744709, 0),
(518, 1, 1, 'mod/feedback:view', 1, 1402744709, 0),
(519, 1, 5, 'mod/feedback:complete', 1, 1402744709, 0),
(520, 1, 5, 'mod/feedback:viewanalysepage', 1, 1402744709, 0),
(521, 1, 3, 'mod/feedback:viewanalysepage', 1, 1402744709, 0),
(522, 1, 1, 'mod/feedback:viewanalysepage', 1, 1402744709, 0),
(523, 1, 3, 'mod/feedback:deletesubmissions', 1, 1402744709, 0),
(524, 1, 1, 'mod/feedback:deletesubmissions', 1, 1402744709, 0),
(525, 1, 1, 'mod/feedback:mapcourse', 1, 1402744709, 0),
(526, 1, 3, 'mod/feedback:edititems', 1, 1402744709, 0),
(527, 1, 1, 'mod/feedback:edititems', 1, 1402744709, 0),
(528, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1402744709, 0),
(529, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1402744710, 0),
(530, 1, 3, 'mod/feedback:createpublictemplate', 1, 1402744710, 0),
(531, 1, 1, 'mod/feedback:createpublictemplate', 1, 1402744710, 0),
(532, 1, 3, 'mod/feedback:deletetemplate', 1, 1402744710, 0),
(533, 1, 1, 'mod/feedback:deletetemplate', 1, 1402744710, 0),
(534, 1, 4, 'mod/feedback:viewreports', 1, 1402744710, 0),
(535, 1, 3, 'mod/feedback:viewreports', 1, 1402744710, 0),
(536, 1, 1, 'mod/feedback:viewreports', 1, 1402744710, 0),
(537, 1, 4, 'mod/feedback:receivemail', 1, 1402744710, 0),
(538, 1, 3, 'mod/feedback:receivemail', 1, 1402744710, 0),
(539, 1, 3, 'mod/folder:addinstance', 1, 1402744712, 0),
(540, 1, 1, 'mod/folder:addinstance', 1, 1402744712, 0),
(541, 1, 6, 'mod/folder:view', 1, 1402744712, 0),
(542, 1, 7, 'mod/folder:view', 1, 1402744712, 0),
(543, 1, 3, 'mod/folder:managefiles', 1, 1402744712, 0),
(544, 1, 3, 'mod/forum:addinstance', 1, 1402744722, 0),
(545, 1, 1, 'mod/forum:addinstance', 1, 1402744722, 0),
(546, 1, 8, 'mod/forum:viewdiscussion', 1, 1402744722, 0),
(547, 1, 6, 'mod/forum:viewdiscussion', 1, 1402744722, 0),
(548, 1, 5, 'mod/forum:viewdiscussion', 1, 1402744722, 0),
(549, 1, 4, 'mod/forum:viewdiscussion', 1, 1402744722, 0),
(550, 1, 3, 'mod/forum:viewdiscussion', 1, 1402744722, 0),
(551, 1, 1, 'mod/forum:viewdiscussion', 1, 1402744722, 0),
(552, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1402744722, 0),
(553, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1402744722, 0),
(554, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1402744722, 0),
(555, 1, 5, 'mod/forum:startdiscussion', 1, 1402744722, 0),
(556, 1, 4, 'mod/forum:startdiscussion', 1, 1402744723, 0),
(557, 1, 3, 'mod/forum:startdiscussion', 1, 1402744723, 0),
(558, 1, 1, 'mod/forum:startdiscussion', 1, 1402744723, 0),
(559, 1, 5, 'mod/forum:replypost', 1, 1402744723, 0),
(560, 1, 4, 'mod/forum:replypost', 1, 1402744723, 0),
(561, 1, 3, 'mod/forum:replypost', 1, 1402744723, 0),
(562, 1, 1, 'mod/forum:replypost', 1, 1402744723, 0),
(563, 1, 4, 'mod/forum:addnews', 1, 1402744723, 0),
(564, 1, 3, 'mod/forum:addnews', 1, 1402744723, 0),
(565, 1, 1, 'mod/forum:addnews', 1, 1402744723, 0),
(566, 1, 4, 'mod/forum:replynews', 1, 1402744723, 0),
(567, 1, 3, 'mod/forum:replynews', 1, 1402744723, 0),
(568, 1, 1, 'mod/forum:replynews', 1, 1402744724, 0),
(569, 1, 5, 'mod/forum:viewrating', 1, 1402744724, 0),
(570, 1, 4, 'mod/forum:viewrating', 1, 1402744724, 0),
(571, 1, 3, 'mod/forum:viewrating', 1, 1402744724, 0),
(572, 1, 1, 'mod/forum:viewrating', 1, 1402744724, 0),
(573, 1, 4, 'mod/forum:viewanyrating', 1, 1402744724, 0),
(574, 1, 3, 'mod/forum:viewanyrating', 1, 1402744724, 0),
(575, 1, 1, 'mod/forum:viewanyrating', 1, 1402744724, 0),
(576, 1, 4, 'mod/forum:viewallratings', 1, 1402744724, 0),
(577, 1, 3, 'mod/forum:viewallratings', 1, 1402744724, 0),
(578, 1, 1, 'mod/forum:viewallratings', 1, 1402744724, 0),
(579, 1, 4, 'mod/forum:rate', 1, 1402744724, 0),
(580, 1, 3, 'mod/forum:rate', 1, 1402744724, 0),
(581, 1, 1, 'mod/forum:rate', 1, 1402744724, 0),
(582, 1, 5, 'mod/forum:createattachment', 1, 1402744724, 0),
(583, 1, 4, 'mod/forum:createattachment', 1, 1402744724, 0),
(584, 1, 3, 'mod/forum:createattachment', 1, 1402744724, 0),
(585, 1, 1, 'mod/forum:createattachment', 1, 1402744724, 0),
(586, 1, 5, 'mod/forum:deleteownpost', 1, 1402744725, 0),
(587, 1, 4, 'mod/forum:deleteownpost', 1, 1402744725, 0),
(588, 1, 3, 'mod/forum:deleteownpost', 1, 1402744725, 0),
(589, 1, 1, 'mod/forum:deleteownpost', 1, 1402744725, 0),
(590, 1, 4, 'mod/forum:deleteanypost', 1, 1402744725, 0),
(591, 1, 3, 'mod/forum:deleteanypost', 1, 1402744725, 0),
(592, 1, 1, 'mod/forum:deleteanypost', 1, 1402744725, 0),
(593, 1, 4, 'mod/forum:splitdiscussions', 1, 1402744725, 0),
(594, 1, 3, 'mod/forum:splitdiscussions', 1, 1402744725, 0),
(595, 1, 1, 'mod/forum:splitdiscussions', 1, 1402744725, 0),
(596, 1, 4, 'mod/forum:movediscussions', 1, 1402744725, 0),
(597, 1, 3, 'mod/forum:movediscussions', 1, 1402744725, 0),
(598, 1, 1, 'mod/forum:movediscussions', 1, 1402744725, 0),
(599, 1, 4, 'mod/forum:editanypost', 1, 1402744725, 0),
(600, 1, 3, 'mod/forum:editanypost', 1, 1402744725, 0),
(601, 1, 1, 'mod/forum:editanypost', 1, 1402744725, 0),
(602, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1402744726, 0),
(603, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1402744726, 0),
(604, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1402744726, 0),
(605, 1, 4, 'mod/forum:viewsubscribers', 1, 1402744726, 0),
(606, 1, 3, 'mod/forum:viewsubscribers', 1, 1402744726, 0),
(607, 1, 1, 'mod/forum:viewsubscribers', 1, 1402744726, 0),
(608, 1, 4, 'mod/forum:managesubscriptions', 1, 1402744726, 0),
(609, 1, 3, 'mod/forum:managesubscriptions', 1, 1402744726, 0),
(610, 1, 1, 'mod/forum:managesubscriptions', 1, 1402744726, 0),
(611, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1402744726, 0),
(612, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1402744726, 0),
(613, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1402744726, 0),
(614, 1, 4, 'mod/forum:exportdiscussion', 1, 1402744726, 0),
(615, 1, 3, 'mod/forum:exportdiscussion', 1, 1402744726, 0),
(616, 1, 1, 'mod/forum:exportdiscussion', 1, 1402744727, 0),
(617, 1, 4, 'mod/forum:exportpost', 1, 1402744727, 0),
(618, 1, 3, 'mod/forum:exportpost', 1, 1402744727, 0),
(619, 1, 1, 'mod/forum:exportpost', 1, 1402744727, 0),
(620, 1, 4, 'mod/forum:exportownpost', 1, 1402744727, 0),
(621, 1, 3, 'mod/forum:exportownpost', 1, 1402744727, 0),
(622, 1, 1, 'mod/forum:exportownpost', 1, 1402744727, 0),
(623, 1, 5, 'mod/forum:exportownpost', 1, 1402744727, 0),
(624, 1, 4, 'mod/forum:addquestion', 1, 1402744727, 0),
(625, 1, 3, 'mod/forum:addquestion', 1, 1402744727, 0),
(626, 1, 1, 'mod/forum:addquestion', 1, 1402744727, 0),
(627, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1402744727, 0),
(628, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1402744727, 0),
(629, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1402744727, 0),
(630, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1402744727, 0),
(631, 1, 3, 'mod/glossary:addinstance', 1, 1402744733, 0),
(632, 1, 1, 'mod/glossary:addinstance', 1, 1402744733, 0),
(633, 1, 8, 'mod/glossary:view', 1, 1402744733, 0),
(634, 1, 6, 'mod/glossary:view', 1, 1402744733, 0),
(635, 1, 5, 'mod/glossary:view', 1, 1402744734, 0),
(636, 1, 4, 'mod/glossary:view', 1, 1402744734, 0),
(637, 1, 3, 'mod/glossary:view', 1, 1402744734, 0),
(638, 1, 1, 'mod/glossary:view', 1, 1402744734, 0),
(639, 1, 5, 'mod/glossary:write', 1, 1402744734, 0),
(640, 1, 4, 'mod/glossary:write', 1, 1402744734, 0),
(641, 1, 3, 'mod/glossary:write', 1, 1402744734, 0),
(642, 1, 1, 'mod/glossary:write', 1, 1402744734, 0),
(643, 1, 4, 'mod/glossary:manageentries', 1, 1402744734, 0),
(644, 1, 3, 'mod/glossary:manageentries', 1, 1402744734, 0),
(645, 1, 1, 'mod/glossary:manageentries', 1, 1402744734, 0),
(646, 1, 4, 'mod/glossary:managecategories', 1, 1402744734, 0),
(647, 1, 3, 'mod/glossary:managecategories', 1, 1402744734, 0),
(648, 1, 1, 'mod/glossary:managecategories', 1, 1402744734, 0),
(649, 1, 5, 'mod/glossary:comment', 1, 1402744734, 0),
(650, 1, 4, 'mod/glossary:comment', 1, 1402744734, 0),
(651, 1, 3, 'mod/glossary:comment', 1, 1402744734, 0),
(652, 1, 1, 'mod/glossary:comment', 1, 1402744734, 0),
(653, 1, 4, 'mod/glossary:managecomments', 1, 1402744735, 0),
(654, 1, 3, 'mod/glossary:managecomments', 1, 1402744735, 0),
(655, 1, 1, 'mod/glossary:managecomments', 1, 1402744735, 0),
(656, 1, 4, 'mod/glossary:import', 1, 1402744735, 0),
(657, 1, 3, 'mod/glossary:import', 1, 1402744735, 0),
(658, 1, 1, 'mod/glossary:import', 1, 1402744735, 0),
(659, 1, 4, 'mod/glossary:export', 1, 1402744735, 0),
(660, 1, 3, 'mod/glossary:export', 1, 1402744735, 0),
(661, 1, 1, 'mod/glossary:export', 1, 1402744735, 0),
(662, 1, 4, 'mod/glossary:approve', 1, 1402744735, 0),
(663, 1, 3, 'mod/glossary:approve', 1, 1402744735, 0),
(664, 1, 1, 'mod/glossary:approve', 1, 1402744735, 0),
(665, 1, 4, 'mod/glossary:rate', 1, 1402744736, 0),
(666, 1, 3, 'mod/glossary:rate', 1, 1402744736, 0),
(667, 1, 1, 'mod/glossary:rate', 1, 1402744736, 0),
(668, 1, 4, 'mod/glossary:viewrating', 1, 1402744736, 0),
(669, 1, 3, 'mod/glossary:viewrating', 1, 1402744736, 0),
(670, 1, 1, 'mod/glossary:viewrating', 1, 1402744736, 0),
(671, 1, 4, 'mod/glossary:viewanyrating', 1, 1402744736, 0),
(672, 1, 3, 'mod/glossary:viewanyrating', 1, 1402744736, 0),
(673, 1, 1, 'mod/glossary:viewanyrating', 1, 1402744737, 0),
(674, 1, 4, 'mod/glossary:viewallratings', 1, 1402744737, 0),
(675, 1, 3, 'mod/glossary:viewallratings', 1, 1402744737, 0),
(676, 1, 1, 'mod/glossary:viewallratings', 1, 1402744737, 0),
(677, 1, 4, 'mod/glossary:exportentry', 1, 1402744737, 0),
(678, 1, 3, 'mod/glossary:exportentry', 1, 1402744737, 0),
(679, 1, 1, 'mod/glossary:exportentry', 1, 1402744737, 0),
(680, 1, 4, 'mod/glossary:exportownentry', 1, 1402744737, 0),
(681, 1, 3, 'mod/glossary:exportownentry', 1, 1402744737, 0),
(682, 1, 1, 'mod/glossary:exportownentry', 1, 1402744737, 0),
(683, 1, 5, 'mod/glossary:exportownentry', 1, 1402744737, 0),
(684, 1, 6, 'mod/imscp:view', 1, 1402744739, 0),
(685, 1, 7, 'mod/imscp:view', 1, 1402744739, 0),
(686, 1, 3, 'mod/imscp:addinstance', 1, 1402744739, 0),
(687, 1, 1, 'mod/imscp:addinstance', 1, 1402744739, 0),
(688, 1, 3, 'mod/label:addinstance', 1, 1402744741, 0),
(689, 1, 1, 'mod/label:addinstance', 1, 1402744741, 0),
(690, 1, 3, 'mod/lesson:addinstance', 1, 1402744749, 0),
(691, 1, 1, 'mod/lesson:addinstance', 1, 1402744749, 0),
(692, 1, 3, 'mod/lesson:edit', 1, 1402744749, 0),
(693, 1, 1, 'mod/lesson:edit', 1, 1402744749, 0),
(694, 1, 4, 'mod/lesson:manage', 1, 1402744749, 0),
(695, 1, 3, 'mod/lesson:manage', 1, 1402744750, 0),
(696, 1, 1, 'mod/lesson:manage', 1, 1402744750, 0),
(697, 1, 5, 'mod/lti:view', 1, 1402744753, 0),
(698, 1, 4, 'mod/lti:view', 1, 1402744753, 0),
(699, 1, 3, 'mod/lti:view', 1, 1402744753, 0),
(700, 1, 1, 'mod/lti:view', 1, 1402744753, 0),
(701, 1, 3, 'mod/lti:addinstance', 1, 1402744753, 0),
(702, 1, 1, 'mod/lti:addinstance', 1, 1402744753, 0),
(703, 1, 4, 'mod/lti:grade', 1, 1402744753, 0),
(704, 1, 3, 'mod/lti:grade', 1, 1402744753, 0),
(705, 1, 1, 'mod/lti:grade', 1, 1402744753, 0),
(706, 1, 4, 'mod/lti:manage', 1, 1402744754, 0),
(707, 1, 3, 'mod/lti:manage', 1, 1402744754, 0),
(708, 1, 1, 'mod/lti:manage', 1, 1402744754, 0),
(709, 1, 3, 'mod/lti:addcoursetool', 1, 1402744754, 0),
(710, 1, 1, 'mod/lti:addcoursetool', 1, 1402744754, 0),
(711, 1, 3, 'mod/lti:requesttooladd', 1, 1402744754, 0),
(712, 1, 1, 'mod/lti:requesttooladd', 1, 1402744754, 0),
(713, 1, 6, 'mod/page:view', 1, 1402744755, 0),
(714, 1, 7, 'mod/page:view', 1, 1402744755, 0),
(715, 1, 3, 'mod/page:addinstance', 1, 1402744755, 0),
(716, 1, 1, 'mod/page:addinstance', 1, 1402744756, 0),
(717, 1, 6, 'mod/quiz:view', 1, 1402744763, 0),
(718, 1, 5, 'mod/quiz:view', 1, 1402744763, 0),
(719, 1, 4, 'mod/quiz:view', 1, 1402744763, 0),
(720, 1, 3, 'mod/quiz:view', 1, 1402744763, 0),
(721, 1, 1, 'mod/quiz:view', 1, 1402744763, 0),
(722, 1, 3, 'mod/quiz:addinstance', 1, 1402744763, 0),
(723, 1, 1, 'mod/quiz:addinstance', 1, 1402744763, 0),
(724, 1, 5, 'mod/quiz:attempt', 1, 1402744764, 0),
(725, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1402744764, 0),
(726, 1, 3, 'mod/quiz:manage', 1, 1402744764, 0),
(727, 1, 1, 'mod/quiz:manage', 1, 1402744764, 0),
(728, 1, 3, 'mod/quiz:manageoverrides', 1, 1402744764, 0),
(729, 1, 1, 'mod/quiz:manageoverrides', 1, 1402744764, 0),
(730, 1, 4, 'mod/quiz:preview', 1, 1402744764, 0),
(731, 1, 3, 'mod/quiz:preview', 1, 1402744764, 0),
(732, 1, 1, 'mod/quiz:preview', 1, 1402744764, 0),
(733, 1, 4, 'mod/quiz:grade', 1, 1402744764, 0),
(734, 1, 3, 'mod/quiz:grade', 1, 1402744764, 0),
(735, 1, 1, 'mod/quiz:grade', 1, 1402744764, 0),
(736, 1, 4, 'mod/quiz:regrade', 1, 1402744764, 0),
(737, 1, 3, 'mod/quiz:regrade', 1, 1402744765, 0),
(738, 1, 1, 'mod/quiz:regrade', 1, 1402744765, 0),
(739, 1, 4, 'mod/quiz:viewreports', 1, 1402744765, 0),
(740, 1, 3, 'mod/quiz:viewreports', 1, 1402744765, 0),
(741, 1, 1, 'mod/quiz:viewreports', 1, 1402744765, 0),
(742, 1, 3, 'mod/quiz:deleteattempts', 1, 1402744765, 0),
(743, 1, 1, 'mod/quiz:deleteattempts', 1, 1402744765, 0),
(744, 1, 6, 'mod/resource:view', 1, 1402744769, 0),
(745, 1, 7, 'mod/resource:view', 1, 1402744769, 0),
(746, 1, 3, 'mod/resource:addinstance', 1, 1402744769, 0),
(747, 1, 1, 'mod/resource:addinstance', 1, 1402744769, 0),
(748, 1, 3, 'mod/scorm:addinstance', 1, 1402744780, 0),
(749, 1, 1, 'mod/scorm:addinstance', 1, 1402744780, 0),
(750, 1, 4, 'mod/scorm:viewreport', 1, 1402744780, 0),
(751, 1, 3, 'mod/scorm:viewreport', 1, 1402744780, 0),
(752, 1, 1, 'mod/scorm:viewreport', 1, 1402744780, 0),
(753, 1, 5, 'mod/scorm:skipview', 1, 1402744780, 0),
(754, 1, 5, 'mod/scorm:savetrack', 1, 1402744781, 0),
(755, 1, 4, 'mod/scorm:savetrack', 1, 1402744781, 0),
(756, 1, 3, 'mod/scorm:savetrack', 1, 1402744781, 0),
(757, 1, 1, 'mod/scorm:savetrack', 1, 1402744781, 0),
(758, 1, 5, 'mod/scorm:viewscores', 1, 1402744781, 0),
(759, 1, 4, 'mod/scorm:viewscores', 1, 1402744781, 0),
(760, 1, 3, 'mod/scorm:viewscores', 1, 1402744781, 0),
(761, 1, 1, 'mod/scorm:viewscores', 1, 1402744781, 0),
(762, 1, 4, 'mod/scorm:deleteresponses', 1, 1402744781, 0),
(763, 1, 3, 'mod/scorm:deleteresponses', 1, 1402744781, 0),
(764, 1, 1, 'mod/scorm:deleteresponses', 1, 1402744781, 0),
(765, 1, 3, 'mod/survey:addinstance', 1, 1402744789, 0),
(766, 1, 1, 'mod/survey:addinstance', 1, 1402744789, 0),
(767, 1, 5, 'mod/survey:participate', 1, 1402744789, 0),
(768, 1, 4, 'mod/survey:participate', 1, 1402744789, 0),
(769, 1, 3, 'mod/survey:participate', 1, 1402744789, 0),
(770, 1, 1, 'mod/survey:participate', 1, 1402744789, 0),
(771, 1, 4, 'mod/survey:readresponses', 1, 1402744789, 0),
(772, 1, 3, 'mod/survey:readresponses', 1, 1402744789, 0),
(773, 1, 1, 'mod/survey:readresponses', 1, 1402744790, 0),
(774, 1, 4, 'mod/survey:download', 1, 1402744790, 0),
(775, 1, 3, 'mod/survey:download', 1, 1402744790, 0),
(776, 1, 1, 'mod/survey:download', 1, 1402744790, 0),
(777, 1, 6, 'mod/url:view', 1, 1402744791, 0),
(778, 1, 7, 'mod/url:view', 1, 1402744791, 0),
(779, 1, 3, 'mod/url:addinstance', 1, 1402744791, 0),
(780, 1, 1, 'mod/url:addinstance', 1, 1402744792, 0),
(781, 1, 3, 'mod/wiki:addinstance', 1, 1402744798, 0),
(782, 1, 1, 'mod/wiki:addinstance', 1, 1402744798, 0),
(783, 1, 6, 'mod/wiki:viewpage', 1, 1402744798, 0),
(784, 1, 5, 'mod/wiki:viewpage', 1, 1402744798, 0),
(785, 1, 4, 'mod/wiki:viewpage', 1, 1402744798, 0),
(786, 1, 3, 'mod/wiki:viewpage', 1, 1402744798, 0),
(787, 1, 1, 'mod/wiki:viewpage', 1, 1402744798, 0),
(788, 1, 5, 'mod/wiki:editpage', 1, 1402744798, 0),
(789, 1, 4, 'mod/wiki:editpage', 1, 1402744798, 0),
(790, 1, 3, 'mod/wiki:editpage', 1, 1402744798, 0),
(791, 1, 1, 'mod/wiki:editpage', 1, 1402744798, 0),
(792, 1, 5, 'mod/wiki:createpage', 1, 1402744798, 0),
(793, 1, 4, 'mod/wiki:createpage', 1, 1402744798, 0),
(794, 1, 3, 'mod/wiki:createpage', 1, 1402744798, 0),
(795, 1, 1, 'mod/wiki:createpage', 1, 1402744798, 0),
(796, 1, 5, 'mod/wiki:viewcomment', 1, 1402744798, 0),
(797, 1, 4, 'mod/wiki:viewcomment', 1, 1402744798, 0),
(798, 1, 3, 'mod/wiki:viewcomment', 1, 1402744798, 0),
(799, 1, 1, 'mod/wiki:viewcomment', 1, 1402744799, 0),
(800, 1, 5, 'mod/wiki:editcomment', 1, 1402744799, 0),
(801, 1, 4, 'mod/wiki:editcomment', 1, 1402744799, 0),
(802, 1, 3, 'mod/wiki:editcomment', 1, 1402744799, 0),
(803, 1, 1, 'mod/wiki:editcomment', 1, 1402744799, 0),
(804, 1, 4, 'mod/wiki:managecomment', 1, 1402744799, 0),
(805, 1, 3, 'mod/wiki:managecomment', 1, 1402744799, 0),
(806, 1, 1, 'mod/wiki:managecomment', 1, 1402744799, 0),
(807, 1, 4, 'mod/wiki:managefiles', 1, 1402744799, 0),
(808, 1, 3, 'mod/wiki:managefiles', 1, 1402744799, 0),
(809, 1, 1, 'mod/wiki:managefiles', 1, 1402744799, 0),
(810, 1, 4, 'mod/wiki:overridelock', 1, 1402744799, 0),
(811, 1, 3, 'mod/wiki:overridelock', 1, 1402744799, 0),
(812, 1, 1, 'mod/wiki:overridelock', 1, 1402744799, 0),
(813, 1, 4, 'mod/wiki:managewiki', 1, 1402744799, 0),
(814, 1, 3, 'mod/wiki:managewiki', 1, 1402744799, 0),
(815, 1, 1, 'mod/wiki:managewiki', 1, 1402744799, 0),
(816, 1, 6, 'mod/workshop:view', 1, 1402744812, 0),
(817, 1, 5, 'mod/workshop:view', 1, 1402744812, 0),
(818, 1, 4, 'mod/workshop:view', 1, 1402744812, 0),
(819, 1, 3, 'mod/workshop:view', 1, 1402744812, 0),
(820, 1, 1, 'mod/workshop:view', 1, 1402744812, 0),
(821, 1, 3, 'mod/workshop:addinstance', 1, 1402744813, 0),
(822, 1, 1, 'mod/workshop:addinstance', 1, 1402744813, 0),
(823, 1, 4, 'mod/workshop:switchphase', 1, 1402744813, 0),
(824, 1, 3, 'mod/workshop:switchphase', 1, 1402744813, 0),
(825, 1, 1, 'mod/workshop:switchphase', 1, 1402744813, 0),
(826, 1, 3, 'mod/workshop:editdimensions', 1, 1402744813, 0),
(827, 1, 1, 'mod/workshop:editdimensions', 1, 1402744813, 0),
(828, 1, 5, 'mod/workshop:submit', 1, 1402744813, 0),
(829, 1, 5, 'mod/workshop:peerassess', 1, 1402744813, 0),
(830, 1, 4, 'mod/workshop:manageexamples', 1, 1402744813, 0),
(831, 1, 3, 'mod/workshop:manageexamples', 1, 1402744813, 0),
(832, 1, 1, 'mod/workshop:manageexamples', 1, 1402744813, 0),
(833, 1, 4, 'mod/workshop:allocate', 1, 1402744813, 0),
(834, 1, 3, 'mod/workshop:allocate', 1, 1402744813, 0),
(835, 1, 1, 'mod/workshop:allocate', 1, 1402744813, 0),
(836, 1, 4, 'mod/workshop:publishsubmissions', 1, 1402744814, 0),
(837, 1, 3, 'mod/workshop:publishsubmissions', 1, 1402744814, 0),
(838, 1, 1, 'mod/workshop:publishsubmissions', 1, 1402744814, 0),
(839, 1, 5, 'mod/workshop:viewauthornames', 1, 1402744814, 0),
(840, 1, 4, 'mod/workshop:viewauthornames', 1, 1402744814, 0),
(841, 1, 3, 'mod/workshop:viewauthornames', 1, 1402744814, 0),
(842, 1, 1, 'mod/workshop:viewauthornames', 1, 1402744814, 0),
(843, 1, 4, 'mod/workshop:viewreviewernames', 1, 1402744814, 0),
(844, 1, 3, 'mod/workshop:viewreviewernames', 1, 1402744814, 0),
(845, 1, 1, 'mod/workshop:viewreviewernames', 1, 1402744814, 0),
(846, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1402744814, 0),
(847, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1402744814, 0),
(848, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1402744814, 0),
(849, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1402744814, 0),
(850, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1402744814, 0),
(851, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1402744814, 0),
(852, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1402744814, 0),
(853, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1402744815, 0),
(854, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1402744815, 0),
(855, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1402744815, 0),
(856, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1402744815, 0),
(857, 1, 4, 'mod/workshop:viewallassessments', 1, 1402744815, 0),
(858, 1, 3, 'mod/workshop:viewallassessments', 1, 1402744815, 0),
(859, 1, 1, 'mod/workshop:viewallassessments', 1, 1402744815, 0),
(860, 1, 4, 'mod/workshop:overridegrades', 1, 1402744815, 0),
(861, 1, 3, 'mod/workshop:overridegrades', 1, 1402744815, 0),
(862, 1, 1, 'mod/workshop:overridegrades', 1, 1402744815, 0),
(863, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1402744816, 0),
(864, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1402744816, 0),
(865, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1402744816, 0),
(866, 1, 3, 'enrol/cohort:config', 1, 1402744827, 0),
(867, 1, 1, 'enrol/cohort:config', 1, 1402744827, 0),
(868, 1, 1, 'enrol/cohort:unenrol', 1, 1402744827, 0),
(869, 1, 1, 'enrol/database:unenrol', 1, 1402744828, 0),
(870, 1, 1, 'enrol/guest:config', 1, 1402744831, 0),
(871, 1, 3, 'enrol/guest:config', 1, 1402744831, 0),
(872, 1, 1, 'enrol/ldap:manage', 1, 1402744831, 0),
(873, 1, 1, 'enrol/manual:config', 1, 1402744832, 0),
(874, 1, 1, 'enrol/manual:enrol', 1, 1402744832, 0),
(875, 1, 3, 'enrol/manual:enrol', 1, 1402744832, 0),
(876, 1, 1, 'enrol/manual:manage', 1, 1402744832, 0),
(877, 1, 3, 'enrol/manual:manage', 1, 1402744832, 0),
(878, 1, 1, 'enrol/manual:unenrol', 1, 1402744832, 0),
(879, 1, 3, 'enrol/manual:unenrol', 1, 1402744832, 0),
(880, 1, 1, 'enrol/meta:config', 1, 1402744833, 0),
(881, 1, 3, 'enrol/meta:config', 1, 1402744833, 0),
(882, 1, 1, 'enrol/meta:selectaslinked', 1, 1402744833, 0),
(883, 1, 1, 'enrol/meta:unenrol', 1, 1402744833, 0),
(884, 1, 1, 'enrol/paypal:config', 1, 1402744835, 0),
(885, 1, 1, 'enrol/paypal:manage', 1, 1402744836, 0),
(886, 1, 3, 'enrol/paypal:manage', 1, 1402744836, 0),
(887, 1, 1, 'enrol/paypal:unenrol', 1, 1402744836, 0),
(888, 1, 3, 'enrol/self:config', 1, 1402744836, 0),
(889, 1, 1, 'enrol/self:config', 1, 1402744836, 0),
(890, 1, 3, 'enrol/self:manage', 1, 1402744836, 0),
(891, 1, 1, 'enrol/self:manage', 1, 1402744836, 0),
(892, 1, 5, 'enrol/self:unenrolself', 1, 1402744836, 0),
(893, 1, 3, 'enrol/self:unenrol', 1, 1402744837, 0),
(894, 1, 1, 'enrol/self:unenrol', 1, 1402744837, 0),
(895, 1, 3, 'block/activity_modules:addinstance', 1, 1402744840, 0),
(896, 1, 1, 'block/activity_modules:addinstance', 1, 1402744840, 0),
(897, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1402744840, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(898, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1402744841, 0),
(899, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1402744841, 0),
(900, 1, 3, 'block/badges:addinstance', 1, 1402744841, 0),
(901, 1, 1, 'block/badges:addinstance', 1, 1402744841, 0),
(902, 1, 7, 'block/badges:myaddinstance', 1, 1402744841, 0),
(903, 1, 3, 'block/blog_menu:addinstance', 1, 1402744842, 0),
(904, 1, 1, 'block/blog_menu:addinstance', 1, 1402744842, 0),
(905, 1, 3, 'block/blog_recent:addinstance', 1, 1402744842, 0),
(906, 1, 1, 'block/blog_recent:addinstance', 1, 1402744842, 0),
(907, 1, 3, 'block/blog_tags:addinstance', 1, 1402744843, 0),
(908, 1, 1, 'block/blog_tags:addinstance', 1, 1402744843, 0),
(909, 1, 7, 'block/calendar_month:myaddinstance', 1, 1402744844, 0),
(910, 1, 3, 'block/calendar_month:addinstance', 1, 1402744844, 0),
(911, 1, 1, 'block/calendar_month:addinstance', 1, 1402744844, 0),
(912, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1402744844, 0),
(913, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1402744844, 0),
(914, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1402744844, 0),
(915, 1, 7, 'block/comments:myaddinstance', 1, 1402744845, 0),
(916, 1, 3, 'block/comments:addinstance', 1, 1402744845, 0),
(917, 1, 1, 'block/comments:addinstance', 1, 1402744845, 0),
(918, 1, 7, 'block/community:myaddinstance', 1, 1402744846, 0),
(919, 1, 3, 'block/community:addinstance', 1, 1402744846, 0),
(920, 1, 1, 'block/community:addinstance', 1, 1402744846, 0),
(921, 1, 3, 'block/completionstatus:addinstance', 1, 1402744847, 0),
(922, 1, 1, 'block/completionstatus:addinstance', 1, 1402744847, 0),
(923, 1, 7, 'block/course_list:myaddinstance', 1, 1402744847, 0),
(924, 1, 3, 'block/course_list:addinstance', 1, 1402744847, 0),
(925, 1, 1, 'block/course_list:addinstance', 1, 1402744847, 0),
(926, 1, 7, 'block/course_overview:myaddinstance', 1, 1402744848, 0),
(927, 1, 3, 'block/course_overview:addinstance', 1, 1402744848, 0),
(928, 1, 1, 'block/course_overview:addinstance', 1, 1402744848, 0),
(929, 1, 3, 'block/course_summary:addinstance', 1, 1402744849, 0),
(930, 1, 1, 'block/course_summary:addinstance', 1, 1402744849, 0),
(931, 1, 3, 'block/feedback:addinstance', 1, 1402744850, 0),
(932, 1, 1, 'block/feedback:addinstance', 1, 1402744850, 0),
(933, 1, 7, 'block/glossary_random:myaddinstance', 1, 1402744850, 0),
(934, 1, 3, 'block/glossary_random:addinstance', 1, 1402744850, 0),
(935, 1, 1, 'block/glossary_random:addinstance', 1, 1402744850, 0),
(936, 1, 7, 'block/html:myaddinstance', 1, 1402744850, 0),
(937, 1, 3, 'block/html:addinstance', 1, 1402744850, 0),
(938, 1, 1, 'block/html:addinstance', 1, 1402744850, 0),
(939, 1, 3, 'block/login:addinstance', 1, 1402744851, 0),
(940, 1, 1, 'block/login:addinstance', 1, 1402744851, 0),
(941, 1, 7, 'block/mentees:myaddinstance', 1, 1402744851, 0),
(942, 1, 3, 'block/mentees:addinstance', 1, 1402744851, 0),
(943, 1, 1, 'block/mentees:addinstance', 1, 1402744851, 0),
(944, 1, 7, 'block/messages:myaddinstance', 1, 1402744852, 0),
(945, 1, 3, 'block/messages:addinstance', 1, 1402744852, 0),
(946, 1, 1, 'block/messages:addinstance', 1, 1402744852, 0),
(947, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1402744853, 0),
(948, 1, 3, 'block/mnet_hosts:addinstance', 1, 1402744853, 0),
(949, 1, 1, 'block/mnet_hosts:addinstance', 1, 1402744853, 0),
(950, 1, 7, 'block/myprofile:myaddinstance', 1, 1402744854, 0),
(951, 1, 3, 'block/myprofile:addinstance', 1, 1402744854, 0),
(952, 1, 1, 'block/myprofile:addinstance', 1, 1402744854, 0),
(953, 1, 7, 'block/navigation:myaddinstance', 1, 1402744854, 0),
(954, 1, 3, 'block/navigation:addinstance', 1, 1402744855, 0),
(955, 1, 1, 'block/navigation:addinstance', 1, 1402744855, 0),
(956, 1, 7, 'block/news_items:myaddinstance', 1, 1402744855, 0),
(957, 1, 3, 'block/news_items:addinstance', 1, 1402744855, 0),
(958, 1, 1, 'block/news_items:addinstance', 1, 1402744855, 0),
(959, 1, 7, 'block/online_users:myaddinstance', 1, 1402744855, 0),
(960, 1, 3, 'block/online_users:addinstance', 1, 1402744855, 0),
(961, 1, 1, 'block/online_users:addinstance', 1, 1402744855, 0),
(962, 1, 7, 'block/online_users:viewlist', 1, 1402744856, 0),
(963, 1, 6, 'block/online_users:viewlist', 1, 1402744856, 0),
(964, 1, 5, 'block/online_users:viewlist', 1, 1402744856, 0),
(965, 1, 4, 'block/online_users:viewlist', 1, 1402744856, 0),
(966, 1, 3, 'block/online_users:viewlist', 1, 1402744856, 0),
(967, 1, 1, 'block/online_users:viewlist', 1, 1402744856, 0),
(968, 1, 3, 'block/participants:addinstance', 1, 1402744856, 0),
(969, 1, 1, 'block/participants:addinstance', 1, 1402744856, 0),
(970, 1, 7, 'block/private_files:myaddinstance', 1, 1402744857, 0),
(971, 1, 3, 'block/private_files:addinstance', 1, 1402744857, 0),
(972, 1, 1, 'block/private_files:addinstance', 1, 1402744857, 0),
(973, 1, 3, 'block/quiz_results:addinstance', 1, 1402744857, 0),
(974, 1, 1, 'block/quiz_results:addinstance', 1, 1402744857, 0),
(975, 1, 3, 'block/recent_activity:addinstance', 1, 1402744858, 0),
(976, 1, 1, 'block/recent_activity:addinstance', 1, 1402744858, 0),
(977, 1, 7, 'block/rss_client:myaddinstance', 1, 1402744860, 0),
(978, 1, 3, 'block/rss_client:addinstance', 1, 1402744860, 0),
(979, 1, 1, 'block/rss_client:addinstance', 1, 1402744860, 0),
(980, 1, 4, 'block/rss_client:manageownfeeds', 1, 1402744860, 0),
(981, 1, 3, 'block/rss_client:manageownfeeds', 1, 1402744860, 0),
(982, 1, 1, 'block/rss_client:manageownfeeds', 1, 1402744860, 0),
(983, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1402744860, 0),
(984, 1, 3, 'block/search_forums:addinstance', 1, 1402744861, 0),
(985, 1, 1, 'block/search_forums:addinstance', 1, 1402744861, 0),
(986, 1, 3, 'block/section_links:addinstance', 1, 1402744861, 0),
(987, 1, 1, 'block/section_links:addinstance', 1, 1402744861, 0),
(988, 1, 3, 'block/selfcompletion:addinstance', 1, 1402744862, 0),
(989, 1, 1, 'block/selfcompletion:addinstance', 1, 1402744862, 0),
(990, 1, 7, 'block/settings:myaddinstance', 1, 1402744862, 0),
(991, 1, 3, 'block/settings:addinstance', 1, 1402744862, 0),
(992, 1, 1, 'block/settings:addinstance', 1, 1402744862, 0),
(993, 1, 3, 'block/site_main_menu:addinstance', 1, 1402744863, 0),
(994, 1, 1, 'block/site_main_menu:addinstance', 1, 1402744863, 0),
(995, 1, 3, 'block/social_activities:addinstance', 1, 1402744863, 0),
(996, 1, 1, 'block/social_activities:addinstance', 1, 1402744863, 0),
(997, 1, 3, 'block/tag_flickr:addinstance', 1, 1402744864, 0),
(998, 1, 1, 'block/tag_flickr:addinstance', 1, 1402744864, 0),
(999, 1, 3, 'block/tag_youtube:addinstance', 1, 1402744864, 0),
(1000, 1, 1, 'block/tag_youtube:addinstance', 1, 1402744864, 0),
(1001, 1, 7, 'block/tags:myaddinstance', 1, 1402744865, 0),
(1002, 1, 3, 'block/tags:addinstance', 1, 1402744865, 0),
(1003, 1, 1, 'block/tags:addinstance', 1, 1402744865, 0),
(1004, 1, 4, 'report/completion:view', 1, 1402744876, 0),
(1005, 1, 3, 'report/completion:view', 1, 1402744876, 0),
(1006, 1, 1, 'report/completion:view', 1, 1402744876, 0),
(1007, 1, 4, 'report/courseoverview:view', 1, 1402744877, 0),
(1008, 1, 3, 'report/courseoverview:view', 1, 1402744877, 0),
(1009, 1, 1, 'report/courseoverview:view', 1, 1402744877, 0),
(1010, 1, 4, 'report/log:view', 1, 1402744878, 0),
(1011, 1, 3, 'report/log:view', 1, 1402744878, 0),
(1012, 1, 1, 'report/log:view', 1, 1402744878, 0),
(1013, 1, 4, 'report/log:viewtoday', 1, 1402744878, 0),
(1014, 1, 3, 'report/log:viewtoday', 1, 1402744878, 0),
(1015, 1, 1, 'report/log:viewtoday', 1, 1402744878, 0),
(1016, 1, 4, 'report/loglive:view', 1, 1402744879, 0),
(1017, 1, 3, 'report/loglive:view', 1, 1402744879, 0),
(1018, 1, 1, 'report/loglive:view', 1, 1402744879, 0),
(1019, 1, 4, 'report/outline:view', 1, 1402744879, 0),
(1020, 1, 3, 'report/outline:view', 1, 1402744880, 0),
(1021, 1, 1, 'report/outline:view', 1, 1402744880, 0),
(1022, 1, 4, 'report/participation:view', 1, 1402744880, 0),
(1023, 1, 3, 'report/participation:view', 1, 1402744880, 0),
(1024, 1, 1, 'report/participation:view', 1, 1402744880, 0),
(1025, 1, 1, 'report/performance:view', 1, 1402744880, 0),
(1026, 1, 4, 'report/progress:view', 1, 1402744881, 0),
(1027, 1, 3, 'report/progress:view', 1, 1402744881, 0),
(1028, 1, 1, 'report/progress:view', 1, 1402744881, 0),
(1029, 1, 1, 'report/security:view', 1, 1402744882, 0),
(1030, 1, 4, 'report/stats:view', 1, 1402744882, 0),
(1031, 1, 3, 'report/stats:view', 1, 1402744882, 0),
(1032, 1, 1, 'report/stats:view', 1, 1402744882, 0),
(1033, 1, 4, 'gradeexport/ods:view', 1, 1402744883, 0),
(1034, 1, 3, 'gradeexport/ods:view', 1, 1402744883, 0),
(1035, 1, 1, 'gradeexport/ods:view', 1, 1402744883, 0),
(1036, 1, 1, 'gradeexport/ods:publish', 1, 1402744883, 0),
(1037, 1, 4, 'gradeexport/txt:view', 1, 1402744883, 0),
(1038, 1, 3, 'gradeexport/txt:view', 1, 1402744883, 0),
(1039, 1, 1, 'gradeexport/txt:view', 1, 1402744883, 0),
(1040, 1, 1, 'gradeexport/txt:publish', 1, 1402744884, 0),
(1041, 1, 4, 'gradeexport/xls:view', 1, 1402744884, 0),
(1042, 1, 3, 'gradeexport/xls:view', 1, 1402744884, 0),
(1043, 1, 1, 'gradeexport/xls:view', 1, 1402744884, 0),
(1044, 1, 1, 'gradeexport/xls:publish', 1, 1402744884, 0),
(1045, 1, 4, 'gradeexport/xml:view', 1, 1402744885, 0),
(1046, 1, 3, 'gradeexport/xml:view', 1, 1402744885, 0),
(1047, 1, 1, 'gradeexport/xml:view', 1, 1402744885, 0),
(1048, 1, 1, 'gradeexport/xml:publish', 1, 1402744885, 0),
(1049, 1, 3, 'gradeimport/csv:view', 1, 1402744885, 0),
(1050, 1, 1, 'gradeimport/csv:view', 1, 1402744885, 0),
(1051, 1, 3, 'gradeimport/xml:view', 1, 1402744886, 0),
(1052, 1, 1, 'gradeimport/xml:view', 1, 1402744886, 0),
(1053, 1, 1, 'gradeimport/xml:publish', 1, 1402744886, 0),
(1054, 1, 4, 'gradereport/grader:view', 1, 1402744886, 0),
(1055, 1, 3, 'gradereport/grader:view', 1, 1402744886, 0),
(1056, 1, 1, 'gradereport/grader:view', 1, 1402744886, 0),
(1057, 1, 4, 'gradereport/outcomes:view', 1, 1402744886, 0),
(1058, 1, 3, 'gradereport/outcomes:view', 1, 1402744886, 0),
(1059, 1, 1, 'gradereport/outcomes:view', 1, 1402744886, 0),
(1060, 1, 5, 'gradereport/overview:view', 1, 1402744887, 0),
(1061, 1, 1, 'gradereport/overview:view', 1, 1402744887, 0),
(1062, 1, 5, 'gradereport/user:view', 1, 1402744887, 0),
(1063, 1, 4, 'gradereport/user:view', 1, 1402744887, 0),
(1064, 1, 3, 'gradereport/user:view', 1, 1402744887, 0),
(1065, 1, 1, 'gradereport/user:view', 1, 1402744888, 0),
(1066, 1, 7, 'repository/alfresco:view', 1, 1402744897, 0),
(1067, 1, 7, 'repository/areafiles:view', 1, 1402744898, 0),
(1068, 1, 7, 'repository/boxnet:view', 1, 1402744899, 0),
(1069, 1, 2, 'repository/coursefiles:view', 1, 1402744899, 0),
(1070, 1, 4, 'repository/coursefiles:view', 1, 1402744899, 0),
(1071, 1, 3, 'repository/coursefiles:view', 1, 1402744899, 0),
(1072, 1, 1, 'repository/coursefiles:view', 1, 1402744899, 0),
(1073, 1, 7, 'repository/dropbox:view', 1, 1402744900, 0),
(1074, 1, 7, 'repository/equella:view', 1, 1402744900, 0),
(1075, 1, 2, 'repository/filesystem:view', 1, 1402744900, 0),
(1076, 1, 4, 'repository/filesystem:view', 1, 1402744901, 0),
(1077, 1, 3, 'repository/filesystem:view', 1, 1402744901, 0),
(1078, 1, 1, 'repository/filesystem:view', 1, 1402744901, 0),
(1079, 1, 7, 'repository/flickr:view', 1, 1402744901, 0),
(1080, 1, 7, 'repository/flickr_public:view', 1, 1402744901, 0),
(1081, 1, 7, 'repository/googledocs:view', 1, 1402744902, 0),
(1082, 1, 2, 'repository/local:view', 1, 1402744902, 0),
(1083, 1, 4, 'repository/local:view', 1, 1402744902, 0),
(1084, 1, 3, 'repository/local:view', 1, 1402744902, 0),
(1085, 1, 1, 'repository/local:view', 1, 1402744903, 0),
(1086, 1, 7, 'repository/merlot:view', 1, 1402744903, 0),
(1087, 1, 7, 'repository/picasa:view', 1, 1402744904, 0),
(1088, 1, 7, 'repository/recent:view', 1, 1402744904, 0),
(1089, 1, 7, 'repository/s3:view', 1, 1402744905, 0),
(1090, 1, 7, 'repository/skydrive:view', 1, 1402744905, 0),
(1091, 1, 7, 'repository/upload:view', 1, 1402744906, 0),
(1092, 1, 7, 'repository/url:view', 1, 1402744906, 0),
(1093, 1, 7, 'repository/user:view', 1, 1402744907, 0),
(1094, 1, 2, 'repository/webdav:view', 1, 1402744907, 0),
(1095, 1, 4, 'repository/webdav:view', 1, 1402744907, 0),
(1096, 1, 3, 'repository/webdav:view', 1, 1402744907, 0),
(1097, 1, 1, 'repository/webdav:view', 1, 1402744907, 0),
(1098, 1, 7, 'repository/wikimedia:view', 1, 1402744908, 0),
(1099, 1, 7, 'repository/youtube:view', 1, 1402744909, 0),
(1100, 1, 1, 'tool/customlang:view', 1, 1402744923, 0),
(1101, 1, 1, 'tool/customlang:edit', 1, 1402744923, 0),
(1102, 1, 1, 'tool/uploaduser:uploaduserpictures', 1, 1402744929, 0),
(1103, 1, 3, 'booktool/importhtml:import', 1, 1402744950, 0),
(1104, 1, 1, 'booktool/importhtml:import', 1, 1402744950, 0),
(1105, 1, 6, 'booktool/print:print', 1, 1402744951, 0),
(1106, 1, 8, 'booktool/print:print', 1, 1402744951, 0),
(1107, 1, 5, 'booktool/print:print', 1, 1402744951, 0),
(1108, 1, 4, 'booktool/print:print', 1, 1402744951, 0),
(1109, 1, 3, 'booktool/print:print', 1, 1402744951, 0),
(1110, 1, 1, 'booktool/print:print', 1, 1402744951, 0),
(1111, 1, 4, 'quiz/grading:viewstudentnames', 1, 1402744956, 0),
(1112, 1, 3, 'quiz/grading:viewstudentnames', 1, 1402744956, 0),
(1113, 1, 1, 'quiz/grading:viewstudentnames', 1, 1402744956, 0),
(1114, 1, 4, 'quiz/grading:viewidnumber', 1, 1402744957, 0),
(1115, 1, 3, 'quiz/grading:viewidnumber', 1, 1402744957, 0),
(1116, 1, 1, 'quiz/grading:viewidnumber', 1, 1402744957, 0),
(1117, 1, 4, 'quiz/statistics:view', 1, 1402744959, 0),
(1118, 1, 3, 'quiz/statistics:view', 1, 1402744959, 0),
(1119, 1, 1, 'quiz/statistics:view', 1, 1402744959, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines grading scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` longtext NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=19 ;

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(18, 0, 'oh5bg83pctjkvqqjtoesl8lcu2', 0, NULL, 1402752813, 1402752813, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext NOT NULL,
  `answer2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `tagtype` varchar(255) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` longtext,
  `backtrace` longtext,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Upgrade logging' AUTO_INCREMENT=972 ;

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2013111803', '2013111803', 'Upgrade savepoint reached', NULL, '', 0, 1402744594),
(2, 0, 'core', '2013111803', '2013111803', 'Core installed', NULL, '', 0, 1402744646),
(3, 0, 'qtype_calculated', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744646),
(4, 0, 'qtype_calculated', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744650),
(5, 0, 'qtype_calculated', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744650),
(6, 0, 'qtype_calculatedmulti', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744650),
(7, 0, 'qtype_calculatedmulti', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744650),
(8, 0, 'qtype_calculatedmulti', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744650),
(9, 0, 'qtype_calculatedsimple', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744650),
(10, 0, 'qtype_calculatedsimple', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744651),
(11, 0, 'qtype_calculatedsimple', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744651),
(12, 0, 'qtype_description', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744651),
(13, 0, 'qtype_description', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744651),
(14, 0, 'qtype_description', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744651),
(15, 0, 'qtype_essay', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744651),
(16, 0, 'qtype_essay', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744652),
(17, 0, 'qtype_essay', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744652),
(18, 0, 'qtype_match', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744652),
(19, 0, 'qtype_match', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744654),
(20, 0, 'qtype_match', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744654),
(21, 0, 'qtype_missingtype', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744654),
(22, 0, 'qtype_missingtype', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744654),
(23, 0, 'qtype_missingtype', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744654),
(24, 0, 'qtype_multianswer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744654),
(25, 0, 'qtype_multianswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744655),
(26, 0, 'qtype_multianswer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744655),
(27, 0, 'qtype_multichoice', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744655),
(28, 0, 'qtype_multichoice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744656),
(29, 0, 'qtype_multichoice', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744656),
(30, 0, 'qtype_numerical', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744656),
(31, 0, 'qtype_numerical', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744659),
(32, 0, 'qtype_numerical', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744659),
(33, 0, 'qtype_random', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744659),
(34, 0, 'qtype_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744659),
(35, 0, 'qtype_random', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744659),
(36, 0, 'qtype_randomsamatch', NULL, '2013110503', 'Starting plugin installation', NULL, '', 0, 1402744659),
(37, 0, 'qtype_randomsamatch', '2013110503', '2013110503', 'Upgrade savepoint reached', NULL, '', 0, 1402744660),
(38, 0, 'qtype_randomsamatch', '2013110503', '2013110503', 'Plugin installed', NULL, '', 0, 1402744660),
(39, 0, 'qtype_shortanswer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744660),
(40, 0, 'qtype_shortanswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744661),
(41, 0, 'qtype_shortanswer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744661),
(42, 0, 'qtype_truefalse', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744661),
(43, 0, 'qtype_truefalse', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744662),
(44, 0, 'qtype_truefalse', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744662),
(45, 0, 'mod_assign', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744662),
(46, 0, 'mod_assign', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744670),
(47, 0, 'mod_assign', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744674),
(48, 0, 'mod_assignment', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744674),
(49, 0, 'mod_assignment', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744676),
(50, 0, 'mod_assignment', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744678),
(51, 0, 'mod_book', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744678),
(52, 0, 'mod_book', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744679),
(53, 0, 'mod_book', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744681),
(54, 0, 'mod_chat', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744681),
(55, 0, 'mod_chat', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744686),
(56, 0, 'mod_chat', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744687),
(57, 0, 'mod_choice', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744687),
(58, 0, 'mod_choice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744690),
(59, 0, 'mod_choice', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744691),
(60, 0, 'mod_data', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744691),
(61, 0, 'mod_data', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744695),
(62, 0, 'mod_data', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744700),
(63, 0, 'mod_feedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744700),
(64, 0, 'mod_feedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744708),
(65, 0, 'mod_feedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744711),
(66, 0, 'mod_folder', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744711),
(67, 0, 'mod_folder', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744711),
(68, 0, 'mod_folder', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744712),
(69, 0, 'mod_forum', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744712),
(70, 0, 'mod_forum', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744721),
(71, 0, 'mod_forum', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744729),
(72, 0, 'mod_glossary', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744729),
(73, 0, 'mod_glossary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744733),
(74, 0, 'mod_glossary', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744738),
(75, 0, 'mod_imscp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744738),
(76, 0, 'mod_imscp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744738),
(77, 0, 'mod_imscp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744739),
(78, 0, 'mod_label', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744739),
(79, 0, 'mod_label', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744741),
(80, 0, 'mod_label', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744741),
(81, 0, 'mod_lesson', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744741),
(82, 0, 'mod_lesson', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744749),
(83, 0, 'mod_lesson', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744750),
(84, 0, 'mod_lti', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744750),
(85, 0, 'mod_lti', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744753),
(86, 0, 'mod_lti', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744754),
(87, 0, 'mod_page', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744754),
(88, 0, 'mod_page', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744755),
(89, 0, 'mod_page', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744756),
(90, 0, 'mod_quiz', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1402744756),
(91, 0, 'mod_quiz', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1402744763),
(92, 0, 'mod_quiz', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1402744767),
(93, 0, 'mod_resource', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744767),
(94, 0, 'mod_resource', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744768),
(95, 0, 'mod_resource', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744769),
(96, 0, 'mod_scorm', NULL, '2013110504', 'Starting plugin installation', NULL, '', 0, 1402744769),
(97, 0, 'mod_scorm', '2013110504', '2013110504', 'Upgrade savepoint reached', NULL, '', 0, 1402744780),
(98, 0, 'mod_scorm', '2013110504', '2013110504', 'Plugin installed', NULL, '', 0, 1402744782),
(99, 0, 'mod_survey', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744782),
(100, 0, 'mod_survey', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744785),
(101, 0, 'mod_survey', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744790),
(102, 0, 'mod_url', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744790),
(103, 0, 'mod_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744791),
(104, 0, 'mod_url', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744792),
(105, 0, 'mod_wiki', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744792),
(106, 0, 'mod_wiki', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744797),
(107, 0, 'mod_wiki', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744800),
(108, 0, 'mod_workshop', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744800),
(109, 0, 'mod_workshop', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744812),
(110, 0, 'mod_workshop', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744817),
(111, 0, 'auth_cas', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744817),
(112, 0, 'auth_cas', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744817),
(113, 0, 'auth_cas', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744817),
(114, 0, 'auth_db', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744817),
(115, 0, 'auth_db', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744817),
(116, 0, 'auth_db', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744817),
(117, 0, 'auth_email', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744817),
(118, 0, 'auth_email', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744817),
(119, 0, 'auth_email', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744818),
(120, 0, 'auth_fc', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744818),
(121, 0, 'auth_fc', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744818),
(122, 0, 'auth_fc', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744818),
(123, 0, 'auth_imap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744818),
(124, 0, 'auth_imap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744818),
(125, 0, 'auth_imap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744818),
(126, 0, 'auth_ldap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744819),
(127, 0, 'auth_ldap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744819),
(128, 0, 'auth_ldap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744819),
(129, 0, 'auth_manual', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744819),
(130, 0, 'auth_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744819),
(131, 0, 'auth_manual', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744819),
(132, 0, 'auth_mnet', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744819),
(133, 0, 'auth_mnet', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744819),
(134, 0, 'auth_mnet', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744822),
(135, 0, 'auth_nntp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744822),
(136, 0, 'auth_nntp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744822),
(137, 0, 'auth_nntp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744823),
(138, 0, 'auth_nologin', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744823),
(139, 0, 'auth_nologin', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744823),
(140, 0, 'auth_nologin', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744824),
(141, 0, 'auth_none', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744824),
(142, 0, 'auth_none', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744824),
(143, 0, 'auth_none', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744824),
(144, 0, 'auth_pam', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744824),
(145, 0, 'auth_pam', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744824),
(146, 0, 'auth_pam', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744824),
(147, 0, 'auth_pop3', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744824),
(148, 0, 'auth_pop3', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744824),
(149, 0, 'auth_pop3', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744824),
(150, 0, 'auth_radius', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744825),
(151, 0, 'auth_radius', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744825),
(152, 0, 'auth_radius', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744825),
(153, 0, 'auth_shibboleth', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744825),
(154, 0, 'auth_shibboleth', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744825),
(155, 0, 'auth_shibboleth', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744826),
(156, 0, 'auth_webservice', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744826),
(157, 0, 'auth_webservice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744826),
(158, 0, 'auth_webservice', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744826),
(159, 0, 'calendartype_gregorian', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744826),
(160, 0, 'calendartype_gregorian', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744826),
(161, 0, 'calendartype_gregorian', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744826),
(162, 0, 'enrol_category', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744826),
(163, 0, 'enrol_category', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744826),
(164, 0, 'enrol_category', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744827),
(165, 0, 'enrol_cohort', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744827),
(166, 0, 'enrol_cohort', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744827),
(167, 0, 'enrol_cohort', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744827),
(168, 0, 'enrol_database', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744827),
(169, 0, 'enrol_database', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744827),
(170, 0, 'enrol_database', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744828),
(171, 0, 'enrol_flatfile', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744828),
(172, 0, 'enrol_flatfile', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744830),
(173, 0, 'enrol_flatfile', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744830),
(174, 0, 'enrol_guest', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744830),
(175, 0, 'enrol_guest', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744830),
(176, 0, 'enrol_guest', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744831),
(177, 0, 'enrol_imsenterprise', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744831),
(178, 0, 'enrol_imsenterprise', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744831),
(179, 0, 'enrol_imsenterprise', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744831),
(180, 0, 'enrol_ldap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744831),
(181, 0, 'enrol_ldap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744831),
(182, 0, 'enrol_ldap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744832),
(183, 0, 'enrol_manual', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744832),
(184, 0, 'enrol_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744832),
(185, 0, 'enrol_manual', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744832),
(186, 0, 'enrol_meta', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744832),
(187, 0, 'enrol_meta', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744833),
(188, 0, 'enrol_meta', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744833),
(189, 0, 'enrol_mnet', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744833),
(190, 0, 'enrol_mnet', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744833),
(191, 0, 'enrol_mnet', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744835),
(192, 0, 'enrol_paypal', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744835),
(193, 0, 'enrol_paypal', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744835),
(194, 0, 'enrol_paypal', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744836),
(195, 0, 'enrol_self', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1402744836),
(196, 0, 'enrol_self', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1402744836),
(197, 0, 'enrol_self', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1402744837),
(198, 0, 'message_email', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744837),
(199, 0, 'message_email', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744837),
(200, 0, 'message_email', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744838),
(201, 0, 'message_jabber', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744838),
(202, 0, 'message_jabber', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744838),
(203, 0, 'message_jabber', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744839),
(204, 0, 'message_popup', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744839),
(205, 0, 'message_popup', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744839),
(206, 0, 'message_popup', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744839),
(207, 0, 'block_activity_modules', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744839),
(208, 0, 'block_activity_modules', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744840),
(209, 0, 'block_activity_modules', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744840),
(210, 0, 'block_admin_bookmarks', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744840),
(211, 0, 'block_admin_bookmarks', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744840),
(212, 0, 'block_admin_bookmarks', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744841),
(213, 0, 'block_badges', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744841),
(214, 0, 'block_badges', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744841),
(215, 0, 'block_badges', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744841),
(216, 0, 'block_blog_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744841),
(217, 0, 'block_blog_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744841),
(218, 0, 'block_blog_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744842),
(219, 0, 'block_blog_recent', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744842),
(220, 0, 'block_blog_recent', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744842),
(221, 0, 'block_blog_recent', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744842),
(222, 0, 'block_blog_tags', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744843),
(223, 0, 'block_blog_tags', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744843),
(224, 0, 'block_blog_tags', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744843),
(225, 0, 'block_calendar_month', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744843),
(226, 0, 'block_calendar_month', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744844),
(227, 0, 'block_calendar_month', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744844),
(228, 0, 'block_calendar_upcoming', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744844),
(229, 0, 'block_calendar_upcoming', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744844),
(230, 0, 'block_calendar_upcoming', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744845),
(231, 0, 'block_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744845),
(232, 0, 'block_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744845),
(233, 0, 'block_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744845),
(234, 0, 'block_community', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744845),
(235, 0, 'block_community', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744846),
(236, 0, 'block_community', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744846),
(237, 0, 'block_completionstatus', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744846),
(238, 0, 'block_completionstatus', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744846),
(239, 0, 'block_completionstatus', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744847),
(240, 0, 'block_course_list', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744847),
(241, 0, 'block_course_list', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744847),
(242, 0, 'block_course_list', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744847),
(243, 0, 'block_course_overview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744848),
(244, 0, 'block_course_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744848),
(245, 0, 'block_course_overview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744848),
(246, 0, 'block_course_summary', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744848),
(247, 0, 'block_course_summary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744848),
(248, 0, 'block_course_summary', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744849),
(249, 0, 'block_feedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744849),
(250, 0, 'block_feedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744849),
(251, 0, 'block_feedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744850),
(252, 0, 'block_glossary_random', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744850),
(253, 0, 'block_glossary_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744850),
(254, 0, 'block_glossary_random', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744850),
(255, 0, 'block_html', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744850),
(256, 0, 'block_html', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744850),
(257, 0, 'block_html', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744851),
(258, 0, 'block_login', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744851),
(259, 0, 'block_login', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744851),
(260, 0, 'block_login', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744851),
(261, 0, 'block_mentees', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744851),
(262, 0, 'block_mentees', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744851),
(263, 0, 'block_mentees', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744852),
(264, 0, 'block_messages', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744852),
(265, 0, 'block_messages', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744852),
(266, 0, 'block_messages', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744852),
(267, 0, 'block_mnet_hosts', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744852),
(268, 0, 'block_mnet_hosts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744853),
(269, 0, 'block_mnet_hosts', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744853),
(270, 0, 'block_myprofile', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744853),
(271, 0, 'block_myprofile', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744853),
(272, 0, 'block_myprofile', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744854),
(273, 0, 'block_navigation', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744854),
(274, 0, 'block_navigation', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744854),
(275, 0, 'block_navigation', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744855),
(276, 0, 'block_news_items', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1402744855),
(277, 0, 'block_news_items', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1402744855),
(278, 0, 'block_news_items', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1402744855),
(279, 0, 'block_online_users', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744855),
(280, 0, 'block_online_users', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744855),
(281, 0, 'block_online_users', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744856),
(282, 0, 'block_participants', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744856),
(283, 0, 'block_participants', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744856),
(284, 0, 'block_participants', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744856),
(285, 0, 'block_private_files', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744856),
(286, 0, 'block_private_files', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744857),
(287, 0, 'block_private_files', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744857),
(288, 0, 'block_quiz_results', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744857),
(289, 0, 'block_quiz_results', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744857),
(290, 0, 'block_quiz_results', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744857),
(291, 0, 'block_recent_activity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744857),
(292, 0, 'block_recent_activity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744858),
(293, 0, 'block_recent_activity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744858),
(294, 0, 'block_rss_client', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744858),
(295, 0, 'block_rss_client', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744859),
(296, 0, 'block_rss_client', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744860),
(297, 0, 'block_search_forums', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744860),
(298, 0, 'block_search_forums', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744860),
(299, 0, 'block_search_forums', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744861),
(300, 0, 'block_section_links', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744861),
(301, 0, 'block_section_links', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744861),
(302, 0, 'block_section_links', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744861),
(303, 0, 'block_selfcompletion', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744861),
(304, 0, 'block_selfcompletion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744861),
(305, 0, 'block_selfcompletion', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744862),
(306, 0, 'block_settings', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744862),
(307, 0, 'block_settings', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744862),
(308, 0, 'block_settings', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744862),
(309, 0, 'block_site_main_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744862),
(310, 0, 'block_site_main_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744862),
(311, 0, 'block_site_main_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744863),
(312, 0, 'block_social_activities', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744863),
(313, 0, 'block_social_activities', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744863),
(314, 0, 'block_social_activities', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744863),
(315, 0, 'block_tag_flickr', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744863),
(316, 0, 'block_tag_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744863),
(317, 0, 'block_tag_flickr', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744864),
(318, 0, 'block_tag_youtube', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744864),
(319, 0, 'block_tag_youtube', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744864),
(320, 0, 'block_tag_youtube', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744865),
(321, 0, 'block_tags', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744865),
(322, 0, 'block_tags', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744865),
(323, 0, 'block_tags', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744865),
(324, 0, 'filter_activitynames', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744867),
(325, 0, 'filter_activitynames', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744867),
(326, 0, 'filter_activitynames', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744867),
(327, 0, 'filter_algebra', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744867),
(328, 0, 'filter_algebra', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744867),
(329, 0, 'filter_algebra', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744867),
(330, 0, 'filter_censor', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744867),
(331, 0, 'filter_censor', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744867),
(332, 0, 'filter_censor', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744868),
(333, 0, 'filter_data', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744868),
(334, 0, 'filter_data', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744868),
(335, 0, 'filter_data', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744868),
(336, 0, 'filter_emailprotect', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744868),
(337, 0, 'filter_emailprotect', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744868),
(338, 0, 'filter_emailprotect', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744868),
(339, 0, 'filter_emoticon', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744868),
(340, 0, 'filter_emoticon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744868),
(341, 0, 'filter_emoticon', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744869),
(342, 0, 'filter_glossary', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744869),
(343, 0, 'filter_glossary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744869),
(344, 0, 'filter_glossary', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744869),
(345, 0, 'filter_mediaplugin', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744869),
(346, 0, 'filter_mediaplugin', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744870),
(347, 0, 'filter_mediaplugin', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744870),
(348, 0, 'filter_multilang', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744870),
(349, 0, 'filter_multilang', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744870),
(350, 0, 'filter_multilang', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744870),
(351, 0, 'filter_tex', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744870),
(352, 0, 'filter_tex', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744870),
(353, 0, 'filter_tex', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744871),
(354, 0, 'filter_tidy', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744871),
(355, 0, 'filter_tidy', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744871),
(356, 0, 'filter_tidy', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744871),
(357, 0, 'filter_urltolink', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744872),
(358, 0, 'filter_urltolink', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744872),
(359, 0, 'filter_urltolink', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744872),
(360, 0, 'editor_textarea', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744872),
(361, 0, 'editor_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744872),
(362, 0, 'editor_textarea', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744872),
(363, 0, 'editor_tinymce', NULL, '2013110601', 'Starting plugin installation', NULL, '', 0, 1402744872),
(364, 0, 'editor_tinymce', '2013110601', '2013110601', 'Upgrade savepoint reached', NULL, '', 0, 1402744872),
(365, 0, 'editor_tinymce', '2013110601', '2013110601', 'Plugin installed', NULL, '', 0, 1402744873),
(366, 0, 'format_singleactivity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744873),
(367, 0, 'format_singleactivity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744873),
(368, 0, 'format_singleactivity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744873),
(369, 0, 'format_social', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744873),
(370, 0, 'format_social', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744873),
(371, 0, 'format_social', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744873),
(372, 0, 'format_topics', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744874),
(373, 0, 'format_topics', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744874),
(374, 0, 'format_topics', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744874),
(375, 0, 'format_weeks', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744874),
(376, 0, 'format_weeks', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744874),
(377, 0, 'format_weeks', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744874),
(378, 0, 'profilefield_checkbox', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744874),
(379, 0, 'profilefield_checkbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744874),
(380, 0, 'profilefield_checkbox', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744874),
(381, 0, 'profilefield_datetime', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744875),
(382, 0, 'profilefield_datetime', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744875),
(383, 0, 'profilefield_datetime', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744875),
(384, 0, 'profilefield_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744875),
(385, 0, 'profilefield_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744875),
(386, 0, 'profilefield_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744875),
(387, 0, 'profilefield_text', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744875),
(388, 0, 'profilefield_text', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744875),
(389, 0, 'profilefield_text', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744875),
(390, 0, 'profilefield_textarea', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744875),
(391, 0, 'profilefield_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744875),
(392, 0, 'profilefield_textarea', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744876),
(393, 0, 'report_backups', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744876),
(394, 0, 'report_backups', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744876),
(395, 0, 'report_backups', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744876),
(396, 0, 'report_completion', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744876),
(397, 0, 'report_completion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744876),
(398, 0, 'report_completion', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744876),
(399, 0, 'report_configlog', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744876),
(400, 0, 'report_configlog', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744877),
(401, 0, 'report_configlog', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744877),
(402, 0, 'report_courseoverview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744877),
(403, 0, 'report_courseoverview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744877),
(404, 0, 'report_courseoverview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744877),
(405, 0, 'report_log', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744877),
(406, 0, 'report_log', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744878),
(407, 0, 'report_log', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744878),
(408, 0, 'report_loglive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744878),
(409, 0, 'report_loglive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744878),
(410, 0, 'report_loglive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744879),
(411, 0, 'report_outline', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744879),
(412, 0, 'report_outline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744879),
(413, 0, 'report_outline', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744880),
(414, 0, 'report_participation', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744880),
(415, 0, 'report_participation', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744880),
(416, 0, 'report_participation', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744880),
(417, 0, 'report_performance', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744880),
(418, 0, 'report_performance', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744880),
(419, 0, 'report_performance', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744881),
(420, 0, 'report_progress', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744881),
(421, 0, 'report_progress', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744881),
(422, 0, 'report_progress', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744881),
(423, 0, 'report_questioninstances', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744881),
(424, 0, 'report_questioninstances', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744881),
(425, 0, 'report_questioninstances', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744881),
(426, 0, 'report_security', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744882),
(427, 0, 'report_security', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744882),
(428, 0, 'report_security', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744882),
(429, 0, 'report_stats', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744882),
(430, 0, 'report_stats', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744882),
(431, 0, 'report_stats', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744882),
(432, 0, 'gradeexport_ods', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744882),
(433, 0, 'gradeexport_ods', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744882),
(434, 0, 'gradeexport_ods', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744883),
(435, 0, 'gradeexport_txt', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744883),
(436, 0, 'gradeexport_txt', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744883),
(437, 0, 'gradeexport_txt', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744884),
(438, 0, 'gradeexport_xls', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744884),
(439, 0, 'gradeexport_xls', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744884),
(440, 0, 'gradeexport_xls', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744884),
(441, 0, 'gradeexport_xml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744884),
(442, 0, 'gradeexport_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744884),
(443, 0, 'gradeexport_xml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744885),
(444, 0, 'gradeimport_csv', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744885),
(445, 0, 'gradeimport_csv', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744885),
(446, 0, 'gradeimport_csv', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744885),
(447, 0, 'gradeimport_xml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744885),
(448, 0, 'gradeimport_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744886),
(449, 0, 'gradeimport_xml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744886),
(450, 0, 'gradereport_grader', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744886),
(451, 0, 'gradereport_grader', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744886),
(452, 0, 'gradereport_grader', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744886),
(453, 0, 'gradereport_outcomes', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744886),
(454, 0, 'gradereport_outcomes', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744886),
(455, 0, 'gradereport_outcomes', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744887),
(456, 0, 'gradereport_overview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744887),
(457, 0, 'gradereport_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744887),
(458, 0, 'gradereport_overview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744887),
(459, 0, 'gradereport_user', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744887),
(460, 0, 'gradereport_user', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744887),
(461, 0, 'gradereport_user', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744888),
(462, 0, 'gradingform_guide', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744888),
(463, 0, 'gradingform_guide', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744890),
(464, 0, 'gradingform_guide', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744890),
(465, 0, 'gradingform_rubric', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744890),
(466, 0, 'gradingform_rubric', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744893),
(467, 0, 'gradingform_rubric', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744893),
(468, 0, 'mnetservice_enrol', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744893),
(469, 0, 'mnetservice_enrol', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744895),
(470, 0, 'mnetservice_enrol', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744895),
(471, 0, 'webservice_amf', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744895),
(472, 0, 'webservice_amf', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744895),
(473, 0, 'webservice_amf', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744896),
(474, 0, 'webservice_rest', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744896),
(475, 0, 'webservice_rest', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744896),
(476, 0, 'webservice_rest', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744896),
(477, 0, 'webservice_soap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744896),
(478, 0, 'webservice_soap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744896),
(479, 0, 'webservice_soap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744896),
(480, 0, 'webservice_xmlrpc', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744896),
(481, 0, 'webservice_xmlrpc', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744896);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(482, 0, 'webservice_xmlrpc', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744897),
(483, 0, 'repository_alfresco', NULL, '2014022600', 'Starting plugin installation', NULL, '', 0, 1402744897),
(484, 0, 'repository_alfresco', '2014022600', '2014022600', 'Upgrade savepoint reached', NULL, '', 0, 1402744897),
(485, 0, 'repository_alfresco', '2014022600', '2014022600', 'Plugin installed', NULL, '', 0, 1402744897),
(486, 0, 'repository_areafiles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744897),
(487, 0, 'repository_areafiles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744897),
(488, 0, 'repository_areafiles', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744898),
(489, 0, 'repository_boxnet', NULL, '2013110700', 'Starting plugin installation', NULL, '', 0, 1402744898),
(490, 0, 'repository_boxnet', '2013110700', '2013110700', 'Upgrade savepoint reached', NULL, '', 0, 1402744898),
(491, 0, 'repository_boxnet', '2013110700', '2013110700', 'Plugin installed', NULL, '', 0, 1402744899),
(492, 0, 'repository_coursefiles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744899),
(493, 0, 'repository_coursefiles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744899),
(494, 0, 'repository_coursefiles', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744899),
(495, 0, 'repository_dropbox', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744899),
(496, 0, 'repository_dropbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744899),
(497, 0, 'repository_dropbox', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744900),
(498, 0, 'repository_equella', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744900),
(499, 0, 'repository_equella', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744900),
(500, 0, 'repository_equella', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744900),
(501, 0, 'repository_filesystem', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744900),
(502, 0, 'repository_filesystem', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744900),
(503, 0, 'repository_filesystem', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744901),
(504, 0, 'repository_flickr', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744901),
(505, 0, 'repository_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744901),
(506, 0, 'repository_flickr', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744901),
(507, 0, 'repository_flickr_public', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744901),
(508, 0, 'repository_flickr_public', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744901),
(509, 0, 'repository_flickr_public', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744901),
(510, 0, 'repository_googledocs', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744902),
(511, 0, 'repository_googledocs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744902),
(512, 0, 'repository_googledocs', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744902),
(513, 0, 'repository_local', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744902),
(514, 0, 'repository_local', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744902),
(515, 0, 'repository_local', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744903),
(516, 0, 'repository_merlot', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744903),
(517, 0, 'repository_merlot', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744903),
(518, 0, 'repository_merlot', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744903),
(519, 0, 'repository_picasa', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744903),
(520, 0, 'repository_picasa', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744903),
(521, 0, 'repository_picasa', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744904),
(522, 0, 'repository_recent', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744904),
(523, 0, 'repository_recent', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744904),
(524, 0, 'repository_recent', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744904),
(525, 0, 'repository_s3', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744904),
(526, 0, 'repository_s3', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744905),
(527, 0, 'repository_s3', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744905),
(528, 0, 'repository_skydrive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744905),
(529, 0, 'repository_skydrive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744905),
(530, 0, 'repository_skydrive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744905),
(531, 0, 'repository_upload', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744905),
(532, 0, 'repository_upload', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744905),
(533, 0, 'repository_upload', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744906),
(534, 0, 'repository_url', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744906),
(535, 0, 'repository_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744906),
(536, 0, 'repository_url', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744906),
(537, 0, 'repository_user', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744906),
(538, 0, 'repository_user', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744907),
(539, 0, 'repository_user', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744907),
(540, 0, 'repository_webdav', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744907),
(541, 0, 'repository_webdav', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744907),
(542, 0, 'repository_webdav', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744907),
(543, 0, 'repository_wikimedia', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744907),
(544, 0, 'repository_wikimedia', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744907),
(545, 0, 'repository_wikimedia', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744908),
(546, 0, 'repository_youtube', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744908),
(547, 0, 'repository_youtube', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744908),
(548, 0, 'repository_youtube', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744909),
(549, 0, 'portfolio_boxnet', NULL, '2013110602', 'Starting plugin installation', NULL, '', 0, 1402744909),
(550, 0, 'portfolio_boxnet', '2013110602', '2013110602', 'Upgrade savepoint reached', NULL, '', 0, 1402744909),
(551, 0, 'portfolio_boxnet', '2013110602', '2013110602', 'Plugin installed', NULL, '', 0, 1402744909),
(552, 0, 'portfolio_download', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744909),
(553, 0, 'portfolio_download', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744909),
(554, 0, 'portfolio_download', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744910),
(555, 0, 'portfolio_flickr', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744910),
(556, 0, 'portfolio_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744910),
(557, 0, 'portfolio_flickr', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744910),
(558, 0, 'portfolio_googledocs', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744910),
(559, 0, 'portfolio_googledocs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744910),
(560, 0, 'portfolio_googledocs', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744910),
(561, 0, 'portfolio_mahara', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744910),
(562, 0, 'portfolio_mahara', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744912),
(563, 0, 'portfolio_mahara', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744912),
(564, 0, 'portfolio_picasa', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744912),
(565, 0, 'portfolio_picasa', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744912),
(566, 0, 'portfolio_picasa', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744912),
(567, 0, 'qbehaviour_adaptive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744912),
(568, 0, 'qbehaviour_adaptive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744913),
(569, 0, 'qbehaviour_adaptive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744913),
(570, 0, 'qbehaviour_adaptivenopenalty', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744913),
(571, 0, 'qbehaviour_adaptivenopenalty', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744913),
(572, 0, 'qbehaviour_adaptivenopenalty', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744913),
(573, 0, 'qbehaviour_deferredcbm', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744913),
(574, 0, 'qbehaviour_deferredcbm', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744913),
(575, 0, 'qbehaviour_deferredcbm', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744913),
(576, 0, 'qbehaviour_deferredfeedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744913),
(577, 0, 'qbehaviour_deferredfeedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744914),
(578, 0, 'qbehaviour_deferredfeedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744914),
(579, 0, 'qbehaviour_immediatecbm', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744914),
(580, 0, 'qbehaviour_immediatecbm', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744914),
(581, 0, 'qbehaviour_immediatecbm', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744914),
(582, 0, 'qbehaviour_immediatefeedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744914),
(583, 0, 'qbehaviour_immediatefeedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744914),
(584, 0, 'qbehaviour_immediatefeedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744914),
(585, 0, 'qbehaviour_informationitem', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744914),
(586, 0, 'qbehaviour_informationitem', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744914),
(587, 0, 'qbehaviour_informationitem', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744915),
(588, 0, 'qbehaviour_interactive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744915),
(589, 0, 'qbehaviour_interactive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744915),
(590, 0, 'qbehaviour_interactive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744915),
(591, 0, 'qbehaviour_interactivecountback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744915),
(592, 0, 'qbehaviour_interactivecountback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744915),
(593, 0, 'qbehaviour_interactivecountback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744915),
(594, 0, 'qbehaviour_manualgraded', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744916),
(595, 0, 'qbehaviour_manualgraded', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744916),
(596, 0, 'qbehaviour_manualgraded', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744916),
(597, 0, 'qbehaviour_missing', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744916),
(598, 0, 'qbehaviour_missing', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744916),
(599, 0, 'qbehaviour_missing', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744916),
(600, 0, 'qformat_aiken', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744916),
(601, 0, 'qformat_aiken', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744916),
(602, 0, 'qformat_aiken', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744917),
(603, 0, 'qformat_blackboard_six', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744917),
(604, 0, 'qformat_blackboard_six', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744917),
(605, 0, 'qformat_blackboard_six', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744917),
(606, 0, 'qformat_examview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744917),
(607, 0, 'qformat_examview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744917),
(608, 0, 'qformat_examview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744917),
(609, 0, 'qformat_gift', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744917),
(610, 0, 'qformat_gift', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744917),
(611, 0, 'qformat_gift', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744918),
(612, 0, 'qformat_learnwise', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744918),
(613, 0, 'qformat_learnwise', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744918),
(614, 0, 'qformat_learnwise', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744918),
(615, 0, 'qformat_missingword', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744918),
(616, 0, 'qformat_missingword', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744918),
(617, 0, 'qformat_missingword', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744918),
(618, 0, 'qformat_multianswer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744919),
(619, 0, 'qformat_multianswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744919),
(620, 0, 'qformat_multianswer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744919),
(621, 0, 'qformat_webct', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744919),
(622, 0, 'qformat_webct', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744919),
(623, 0, 'qformat_webct', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744919),
(624, 0, 'qformat_xhtml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744919),
(625, 0, 'qformat_xhtml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744920),
(626, 0, 'qformat_xhtml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744920),
(627, 0, 'qformat_xml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744920),
(628, 0, 'qformat_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744920),
(629, 0, 'qformat_xml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744920),
(630, 0, 'tool_assignmentupgrade', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744920),
(631, 0, 'tool_assignmentupgrade', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744920),
(632, 0, 'tool_assignmentupgrade', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744920),
(633, 0, 'tool_behat', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1402744920),
(634, 0, 'tool_behat', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1402744920),
(635, 0, 'tool_behat', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1402744920),
(636, 0, 'tool_capability', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744920),
(637, 0, 'tool_capability', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744920),
(638, 0, 'tool_capability', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744921),
(639, 0, 'tool_customlang', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744921),
(640, 0, 'tool_customlang', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744923),
(641, 0, 'tool_customlang', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744923),
(642, 0, 'tool_dbtransfer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744923),
(643, 0, 'tool_dbtransfer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744923),
(644, 0, 'tool_dbtransfer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744923),
(645, 0, 'tool_generator', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744924),
(646, 0, 'tool_generator', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744924),
(647, 0, 'tool_generator', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744924),
(648, 0, 'tool_health', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744924),
(649, 0, 'tool_health', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744924),
(650, 0, 'tool_health', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744924),
(651, 0, 'tool_innodb', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744924),
(652, 0, 'tool_innodb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744924),
(653, 0, 'tool_innodb', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744924),
(654, 0, 'tool_installaddon', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744924),
(655, 0, 'tool_installaddon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744924),
(656, 0, 'tool_installaddon', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744925),
(657, 0, 'tool_langimport', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744925),
(658, 0, 'tool_langimport', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744925),
(659, 0, 'tool_langimport', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744925),
(660, 0, 'tool_multilangupgrade', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744925),
(661, 0, 'tool_multilangupgrade', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744925),
(662, 0, 'tool_multilangupgrade', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744925),
(663, 0, 'tool_phpunit', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744925),
(664, 0, 'tool_phpunit', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744925),
(665, 0, 'tool_phpunit', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744925),
(666, 0, 'tool_profiling', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744926),
(667, 0, 'tool_profiling', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744926),
(668, 0, 'tool_profiling', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744926),
(669, 0, 'tool_qeupgradehelper', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744926),
(670, 0, 'tool_qeupgradehelper', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744926),
(671, 0, 'tool_qeupgradehelper', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744926),
(672, 0, 'tool_replace', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1402744926),
(673, 0, 'tool_replace', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1402744927),
(674, 0, 'tool_replace', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1402744927),
(675, 0, 'tool_spamcleaner', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744927),
(676, 0, 'tool_spamcleaner', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744927),
(677, 0, 'tool_spamcleaner', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744927),
(678, 0, 'tool_timezoneimport', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744927),
(679, 0, 'tool_timezoneimport', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744927),
(680, 0, 'tool_timezoneimport', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744927),
(681, 0, 'tool_unsuproles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744927),
(682, 0, 'tool_unsuproles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744928),
(683, 0, 'tool_unsuproles', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744928),
(684, 0, 'tool_uploadcourse', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744928),
(685, 0, 'tool_uploadcourse', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744928),
(686, 0, 'tool_uploadcourse', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744928),
(687, 0, 'tool_uploaduser', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744928),
(688, 0, 'tool_uploaduser', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744928),
(689, 0, 'tool_uploaduser', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744929),
(690, 0, 'tool_xmldb', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744929),
(691, 0, 'tool_xmldb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744929),
(692, 0, 'tool_xmldb', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744929),
(693, 0, 'cachestore_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744929),
(694, 0, 'cachestore_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744929),
(695, 0, 'cachestore_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744929),
(696, 0, 'cachestore_memcache', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744929),
(697, 0, 'cachestore_memcache', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744929),
(698, 0, 'cachestore_memcache', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744930),
(699, 0, 'cachestore_memcached', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744930),
(700, 0, 'cachestore_memcached', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744930),
(701, 0, 'cachestore_memcached', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744930),
(702, 0, 'cachestore_mongodb', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744930),
(703, 0, 'cachestore_mongodb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744930),
(704, 0, 'cachestore_mongodb', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744930),
(705, 0, 'cachestore_session', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744930),
(706, 0, 'cachestore_session', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744930),
(707, 0, 'cachestore_session', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744931),
(708, 0, 'cachestore_static', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744931),
(709, 0, 'cachestore_static', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744931),
(710, 0, 'cachestore_static', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744931),
(711, 0, 'cachelock_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744931),
(712, 0, 'cachelock_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744931),
(713, 0, 'cachelock_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744931),
(714, 0, 'theme_afterburner', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744931),
(715, 0, 'theme_afterburner', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744931),
(716, 0, 'theme_afterburner', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744931),
(717, 0, 'theme_anomaly', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744931),
(718, 0, 'theme_anomaly', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744931),
(719, 0, 'theme_anomaly', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744932),
(720, 0, 'theme_arialist', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744932),
(721, 0, 'theme_arialist', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744932),
(722, 0, 'theme_arialist', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744932),
(723, 0, 'theme_base', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744932),
(724, 0, 'theme_base', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744932),
(725, 0, 'theme_base', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744932),
(726, 0, 'theme_binarius', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744932),
(727, 0, 'theme_binarius', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744933),
(728, 0, 'theme_binarius', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744933),
(729, 0, 'theme_bootstrapbase', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744933),
(730, 0, 'theme_bootstrapbase', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744933),
(731, 0, 'theme_bootstrapbase', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744933),
(732, 0, 'theme_boxxie', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744933),
(733, 0, 'theme_boxxie', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744933),
(734, 0, 'theme_boxxie', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744933),
(735, 0, 'theme_brick', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744933),
(736, 0, 'theme_brick', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744933),
(737, 0, 'theme_brick', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744933),
(738, 0, 'theme_canvas', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744934),
(739, 0, 'theme_canvas', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744934),
(740, 0, 'theme_canvas', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744934),
(741, 0, 'theme_clean', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744934),
(742, 0, 'theme_clean', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744934),
(743, 0, 'theme_clean', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744934),
(744, 0, 'theme_formal_white', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744934),
(745, 0, 'theme_formal_white', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744934),
(746, 0, 'theme_formal_white', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744935),
(747, 0, 'theme_formfactor', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744935),
(748, 0, 'theme_formfactor', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744935),
(749, 0, 'theme_formfactor', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744935),
(750, 0, 'theme_fusion', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744935),
(751, 0, 'theme_fusion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744936),
(752, 0, 'theme_fusion', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744936),
(753, 0, 'theme_leatherbound', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744936),
(754, 0, 'theme_leatherbound', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744936),
(755, 0, 'theme_leatherbound', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744936),
(756, 0, 'theme_magazine', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744936),
(757, 0, 'theme_magazine', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744936),
(758, 0, 'theme_magazine', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744936),
(759, 0, 'theme_nimble', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744936),
(760, 0, 'theme_nimble', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744937),
(761, 0, 'theme_nimble', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744937),
(762, 0, 'theme_nonzero', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744937),
(763, 0, 'theme_nonzero', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744937),
(764, 0, 'theme_nonzero', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744937),
(765, 0, 'theme_overlay', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744937),
(766, 0, 'theme_overlay', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744937),
(767, 0, 'theme_overlay', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744937),
(768, 0, 'theme_serenity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744937),
(769, 0, 'theme_serenity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744938),
(770, 0, 'theme_serenity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744938),
(771, 0, 'theme_sky_high', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744938),
(772, 0, 'theme_sky_high', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744938),
(773, 0, 'theme_sky_high', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744938),
(774, 0, 'theme_splash', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744938),
(775, 0, 'theme_splash', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744938),
(776, 0, 'theme_splash', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744939),
(777, 0, 'theme_standard', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744939),
(778, 0, 'theme_standard', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744939),
(779, 0, 'theme_standard', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744939),
(780, 0, 'theme_standardold', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744939),
(781, 0, 'theme_standardold', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744939),
(782, 0, 'theme_standardold', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744939),
(783, 0, 'assignsubmission_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744939),
(784, 0, 'assignsubmission_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744939),
(785, 0, 'assignsubmission_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744940),
(786, 0, 'assignsubmission_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744940),
(787, 0, 'assignsubmission_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744941),
(788, 0, 'assignsubmission_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744941),
(789, 0, 'assignsubmission_onlinetext', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744941),
(790, 0, 'assignsubmission_onlinetext', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744942),
(791, 0, 'assignsubmission_onlinetext', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744942),
(792, 0, 'assignfeedback_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744942),
(793, 0, 'assignfeedback_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744943),
(794, 0, 'assignfeedback_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744944),
(795, 0, 'assignfeedback_editpdf', NULL, '2013110800', 'Starting plugin installation', NULL, '', 0, 1402744944),
(796, 0, 'assignfeedback_editpdf', '2013110800', '2013110800', 'Upgrade savepoint reached', NULL, '', 0, 1402744946),
(797, 0, 'assignfeedback_editpdf', '2013110800', '2013110800', 'Plugin installed', NULL, '', 0, 1402744947),
(798, 0, 'assignfeedback_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744947),
(799, 0, 'assignfeedback_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744948),
(800, 0, 'assignfeedback_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744948),
(801, 0, 'assignfeedback_offline', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744948),
(802, 0, 'assignfeedback_offline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744948),
(803, 0, 'assignfeedback_offline', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744948),
(804, 0, 'assignment_offline', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744948),
(805, 0, 'assignment_offline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744948),
(806, 0, 'assignment_offline', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744949),
(807, 0, 'assignment_online', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744949),
(808, 0, 'assignment_online', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744949),
(809, 0, 'assignment_online', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744949),
(810, 0, 'assignment_upload', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744949),
(811, 0, 'assignment_upload', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744949),
(812, 0, 'assignment_upload', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744949),
(813, 0, 'assignment_uploadsingle', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744949),
(814, 0, 'assignment_uploadsingle', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744949),
(815, 0, 'assignment_uploadsingle', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744949),
(816, 0, 'booktool_exportimscp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744949),
(817, 0, 'booktool_exportimscp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744949),
(818, 0, 'booktool_exportimscp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744950),
(819, 0, 'booktool_importhtml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744950),
(820, 0, 'booktool_importhtml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744950),
(821, 0, 'booktool_importhtml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744951),
(822, 0, 'booktool_print', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744951),
(823, 0, 'booktool_print', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744951),
(824, 0, 'booktool_print', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744952),
(825, 0, 'datafield_checkbox', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744952),
(826, 0, 'datafield_checkbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744952),
(827, 0, 'datafield_checkbox', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744952),
(828, 0, 'datafield_date', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744952),
(829, 0, 'datafield_date', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744952),
(830, 0, 'datafield_date', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744952),
(831, 0, 'datafield_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744952),
(832, 0, 'datafield_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744953),
(833, 0, 'datafield_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744953),
(834, 0, 'datafield_latlong', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744953),
(835, 0, 'datafield_latlong', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744953),
(836, 0, 'datafield_latlong', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744953),
(837, 0, 'datafield_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744953),
(838, 0, 'datafield_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744953),
(839, 0, 'datafield_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744953),
(840, 0, 'datafield_multimenu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744953),
(841, 0, 'datafield_multimenu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744953),
(842, 0, 'datafield_multimenu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744954),
(843, 0, 'datafield_number', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744954),
(844, 0, 'datafield_number', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744954),
(845, 0, 'datafield_number', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744954),
(846, 0, 'datafield_picture', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744954),
(847, 0, 'datafield_picture', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744954),
(848, 0, 'datafield_picture', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744954),
(849, 0, 'datafield_radiobutton', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744954),
(850, 0, 'datafield_radiobutton', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744954),
(851, 0, 'datafield_radiobutton', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744955),
(852, 0, 'datafield_text', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744955),
(853, 0, 'datafield_text', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744955),
(854, 0, 'datafield_text', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744955),
(855, 0, 'datafield_textarea', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744955),
(856, 0, 'datafield_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744955),
(857, 0, 'datafield_textarea', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744955),
(858, 0, 'datafield_url', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744955),
(859, 0, 'datafield_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744955),
(860, 0, 'datafield_url', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744955),
(861, 0, 'datapreset_imagegallery', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744955),
(862, 0, 'datapreset_imagegallery', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744956),
(863, 0, 'datapreset_imagegallery', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744956),
(864, 0, 'quiz_grading', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744956),
(865, 0, 'quiz_grading', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744956),
(866, 0, 'quiz_grading', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744957),
(867, 0, 'quiz_overview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744957),
(868, 0, 'quiz_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744957),
(869, 0, 'quiz_overview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744958),
(870, 0, 'quiz_responses', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744958),
(871, 0, 'quiz_responses', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744958),
(872, 0, 'quiz_responses', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744958),
(873, 0, 'quiz_statistics', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744958),
(874, 0, 'quiz_statistics', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744959),
(875, 0, 'quiz_statistics', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744959),
(876, 0, 'quizaccess_delaybetweenattempts', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744959),
(877, 0, 'quizaccess_delaybetweenattempts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744959),
(878, 0, 'quizaccess_delaybetweenattempts', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744959),
(879, 0, 'quizaccess_ipaddress', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744959),
(880, 0, 'quizaccess_ipaddress', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744959),
(881, 0, 'quizaccess_ipaddress', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744960),
(882, 0, 'quizaccess_numattempts', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744960),
(883, 0, 'quizaccess_numattempts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744960),
(884, 0, 'quizaccess_numattempts', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744960),
(885, 0, 'quizaccess_openclosedate', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744960),
(886, 0, 'quizaccess_openclosedate', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744960),
(887, 0, 'quizaccess_openclosedate', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744960),
(888, 0, 'quizaccess_password', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744960),
(889, 0, 'quizaccess_password', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744960),
(890, 0, 'quizaccess_password', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744960),
(891, 0, 'quizaccess_safebrowser', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744961),
(892, 0, 'quizaccess_safebrowser', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744961),
(893, 0, 'quizaccess_safebrowser', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744961),
(894, 0, 'quizaccess_securewindow', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744961),
(895, 0, 'quizaccess_securewindow', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744961),
(896, 0, 'quizaccess_securewindow', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744961),
(897, 0, 'quizaccess_timelimit', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744961),
(898, 0, 'quizaccess_timelimit', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744961),
(899, 0, 'quizaccess_timelimit', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744961),
(900, 0, 'scormreport_basic', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744962),
(901, 0, 'scormreport_basic', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744962),
(902, 0, 'scormreport_basic', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744962),
(903, 0, 'scormreport_graphs', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744962),
(904, 0, 'scormreport_graphs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744962),
(905, 0, 'scormreport_graphs', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744962),
(906, 0, 'scormreport_interactions', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744962),
(907, 0, 'scormreport_interactions', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744963),
(908, 0, 'scormreport_interactions', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744963),
(909, 0, 'scormreport_objectives', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744963),
(910, 0, 'scormreport_objectives', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744963),
(911, 0, 'scormreport_objectives', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744963),
(912, 0, 'workshopform_accumulative', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744963),
(913, 0, 'workshopform_accumulative', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744964),
(914, 0, 'workshopform_accumulative', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744964),
(915, 0, 'workshopform_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744964),
(916, 0, 'workshopform_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744965),
(917, 0, 'workshopform_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744965),
(918, 0, 'workshopform_numerrors', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744965),
(919, 0, 'workshopform_numerrors', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744967),
(920, 0, 'workshopform_numerrors', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744967),
(921, 0, 'workshopform_rubric', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744967),
(922, 0, 'workshopform_rubric', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744969),
(923, 0, 'workshopform_rubric', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744969),
(924, 0, 'workshopallocation_manual', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744969),
(925, 0, 'workshopallocation_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744969),
(926, 0, 'workshopallocation_manual', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744969),
(927, 0, 'workshopallocation_random', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744969),
(928, 0, 'workshopallocation_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744969),
(929, 0, 'workshopallocation_random', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744969),
(930, 0, 'workshopallocation_scheduled', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744969),
(931, 0, 'workshopallocation_scheduled', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744970),
(932, 0, 'workshopallocation_scheduled', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744970),
(933, 0, 'workshopeval_best', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744970),
(934, 0, 'workshopeval_best', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744971),
(935, 0, 'workshopeval_best', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744971),
(936, 0, 'tinymce_ctrlhelp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744972),
(937, 0, 'tinymce_ctrlhelp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744972),
(938, 0, 'tinymce_ctrlhelp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744972),
(939, 0, 'tinymce_dragmath', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744972),
(940, 0, 'tinymce_dragmath', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744972),
(941, 0, 'tinymce_dragmath', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744972),
(942, 0, 'tinymce_managefiles', NULL, '2014010800', 'Starting plugin installation', NULL, '', 0, 1402744972),
(943, 0, 'tinymce_managefiles', '2014010800', '2014010800', 'Upgrade savepoint reached', NULL, '', 0, 1402744972),
(944, 0, 'tinymce_managefiles', '2014010800', '2014010800', 'Plugin installed', NULL, '', 0, 1402744972),
(945, 0, 'tinymce_moodleemoticon', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744972),
(946, 0, 'tinymce_moodleemoticon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744972);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(947, 0, 'tinymce_moodleemoticon', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744973),
(948, 0, 'tinymce_moodleimage', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744973),
(949, 0, 'tinymce_moodleimage', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744973),
(950, 0, 'tinymce_moodleimage', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744973),
(951, 0, 'tinymce_moodlemedia', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744973),
(952, 0, 'tinymce_moodlemedia', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744973),
(953, 0, 'tinymce_moodlemedia', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744973),
(954, 0, 'tinymce_moodlenolink', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744973),
(955, 0, 'tinymce_moodlenolink', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744973),
(956, 0, 'tinymce_moodlenolink', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744973),
(957, 0, 'tinymce_pdw', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744973),
(958, 0, 'tinymce_pdw', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744973),
(959, 0, 'tinymce_pdw', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744974),
(960, 0, 'tinymce_spellchecker', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744974),
(961, 0, 'tinymce_spellchecker', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744974),
(962, 0, 'tinymce_spellchecker', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744974),
(963, 0, 'tinymce_wrap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1402744974),
(964, 0, 'tinymce_wrap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1402744974),
(965, 0, 'tinymce_wrap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1402744974),
(966, 0, 'theme_aardvark', NULL, '2014051300', 'Starting plugin installation', NULL, '', 2, 1402745860),
(967, 0, 'theme_aardvark', '2014051300', '2014051300', 'Upgrade savepoint reached', NULL, '', 2, 1402745861),
(968, 0, 'theme_aardvark', '2014051300', '2014051300', 'Plugin installed', NULL, '', 2, 1402745861),
(969, 0, 'theme_essential', NULL, '2014020300', 'Starting plugin installation', NULL, '', 2, 1402746412),
(970, 0, 'theme_essential', '2014020300', '2014020300', 'Upgrade savepoint reached', NULL, '', 2, 1402746413),
(971, 0, 'theme_essential', '2014020300', '2014020300', 'Plugin installed', NULL, '', 2, 1402746413);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `parameters` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(255) NOT NULL DEFAULT '',
  `department` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  `lastnamephonetic` varchar(255) DEFAULT NULL,
  `firstnamephonetic` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `alternatename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='One record for each person' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `calendartype`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$Y3t0nMsczXI1HcvD6.ivMer6aY84wrQ4TFQeJ15vcHYrehI1strqO', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 1, 1, 0, 2, 1, 0, 0, 1402744564, 0, NULL, NULL, NULL, NULL, NULL),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '$2y$10$pAM3ObxRyykHwgkCMHJJUOZp3hCxyQkI.I0F/lG/oq8swJpTjSpO2', '', 'Admin', 'User', 'md.j.shakir@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '5.5', 1402745106, 1402752795, 1402752737, 1402752795, '127.0.0.1', '', 0, '', '', 1, 1, 0, 0, 1, 0, 0, 1402745182, 0, NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_devices`
--

CREATE TABLE IF NOT EXISTS `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `model` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `pushid` varchar(255) NOT NULL DEFAULT '',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  UNIQUE KEY `mdl_userdevi_puspla_uix` (`pushid`,`platform`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores user''s mobile devices information in order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1402746979);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_resets`
--

CREATE TABLE IF NOT EXISTS `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table tracking password reset confirmation tokens' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'htmleditor', 'tinymce'),
(2, 2, 'email_bounce_count', '1'),
(3, 2, 'email_send_count', '1'),
(4, 2, 'filepicker_recentrepository', '8'),
(5, 2, 'filepicker_recentlicense', 'allrightsreserved'),
(6, 2, 'block3hidden', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) DEFAULT NULL,
  `resultlog` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the allocation settings for the scheduled allocator' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext,
  `teachercomment` longtext,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
