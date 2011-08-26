-- phpMyAdmin SQL Dump
-- version 2.11.9.4
-- http://www.phpmyadmin.net
--
-- Generation Time: Jul 03, 2010 at 10:14 AM
-- Server version: 5.1.39
-- PHP Version: 5.2.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `diowww`
--

-- --------------------------------------------------------

--
-- Table structure for table `core_dio`
--

DROP TABLE IF EXISTS `core_dio`;
CREATE TABLE IF NOT EXISTS `core_dio` (
  `cd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_namespace` varchar(64) NOT NULL,
  `cd_name` varchar(64) NOT NULL,
  `cd_version` varchar(64) NOT NULL,
  `cd_sysclass` varchar(256) DEFAULT NULL,
  `cd_type` varchar(64) NOT NULL,
  `cd_return` varchar(64) DEFAULT NULL,
  `cd_cache` varchar(1) DEFAULT NULL,
  `cd_profile` varchar(1) DEFAULT NULL,
  `cd_audit` varchar(1) DEFAULT NULL,
  `cd_cache_expire` varchar(32) DEFAULT NULL,
  `cd_repl` varchar(32) DEFAULT NULL,
  `cd_action` varchar(32) DEFAULT NULL,
  `cd_stmt` varchar(2000) DEFAULT NULL,
  `cd_stmt_noarg` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`cd_id`),
  KEY `core_dio_i1` (`cd_namespace`,`cd_name`,`cd_version`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=179 ;

--
-- Dumping data for table `core_dio`
--

INSERT INTO `core_dio` (`cd_id`, `cd_namespace`, `cd_name`, `cd_version`, `cd_sysclass`, `cd_type`, `cd_return`, `cd_cache`, `cd_profile`, `cd_audit`, `cd_cache_expire`, `cd_repl`, `cd_action`, `cd_stmt`, `cd_stmt_noarg`) VALUES
(143, 'DIO', 'get_namespaces', '1', 'production', 'DBI', 'arrayofarray', '', NULL, '', '', '', 'select', 'select distinct cd_namespace from core_dio order by cd_namespace', ''),
(144, 'DIO', 'dio_delete', '1', NULL, 'DBI', 'none', '', NULL, '', '', '', 'delete', 'call dio_delete(?)', ''),
(145, 'DIO', 'dio_audit_insert', '1', 'production', 'DBI', 'scalar', '', NULL, '', '', '', 'insert', 'select dio_audit_insert(?,?,?,?)', ''),
(146, 'DIO', 'dio_duplicate', '1', 'production', 'DBI', 'scalar', '', NULL, '', '', '', 'insert', 'select dio_duplicate(?)', ''),
(147, 'DIO', 'dio_outkey_insert', '1', NULL, 'DBI', 'none', '', NULL, '', '', '', 'insert', 'insert into core_dio_outkey (co_cd_id,co_name,co_pos,co_default,co_key,co_inout) values (?,?,?,?,?,?)', ''),
(148, 'DIO', 'get_dio', '1', 'production', 'DBI', 'hash', '', NULL, '', '', '', 'select', 'select  cd_id,cd_namespace,cd_name,cd_version,cd_sysclass,cd_type,cd_cache,cd_return,cd_stmt,cd_stmt_noarg,cd_cache_expire,cd_profile,cd_repl,cd_action,cd_audit from core_dio where cd_id = ?', ''),
(149, 'DIO', 'dio_expkey_delete', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'delete', 'call dio_expkey_delete(?,?,?)', ''),
(150, 'DIO', 'dio_outkey_update', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'update', 'update core_dio_outkey set co_name = ?, co_pos = ?, co_default = ?, co_key = ?, co_inout = ?  where co_cd_id = ?  and co_name = ?', ''),
(151, 'DIO', 'dio_inkey_update', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'update', 'update core_dio_inkey set ci_name = ?, ci_pos = ?, ci_req = ?, ci_default = ?, ci_key = ?, ci_inout = ?, ci_opt = ?  where ci_cd_id = ?  and ci_name = ?', ''),
(152, 'DIO', 'dio_outkey_delete', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'delete', 'delete from core_dio_outkey where co_cd_id = ?  and co_name = ?', ''),
(153, 'DIO', 'get_dio_outkey', '1', 'production', 'DBI', 'hash', '', NULL, '', '', '', 'select', 'select co_name,co_pos,co_default,co_key,co_inout from core_dio_outkey where co_cd_id = ? and co_name = ?', ''),
(154, 'DIO', 'dio_exp_delete', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'delete', 'call dio_exp_delete(?,?)', ''),
(155, 'DIO', 'dio_expkey_insert', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'insert', 'call dio_expkey_insert(?,?,?)', ''),
(156, 'DIO', 'dio_update', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'update', 'update core_dio set cd_namespace = ?, cd_name = ?, cd_version = ?, cd_sysclass = ?, cd_type = ?, cd_return = ?, cd_profile = ?, cd_cache = ?, cd_cache_expire = ?, cd_stmt = ?, cd_stmt_noarg = ?, cd_repl = ?, cd_action = ?, cd_audit = ?  where cd_id = ?', ''),
(157, 'DIO', 'dio_inkey_delete', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'delete', 'delete from core_dio_inkey where ci_cd_id = ? and ci_name = ?', ''),
(158, 'DIO', 'profile_off', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'update', 'update core_dio set cd_profile = null where cd_id = ?', ''),
(159, 'DIO', 'get_dio_exp_keys', '1', 'production', 'DBI', 'arrayofarray', '', NULL, '', '', '', 'select', 'select ck_key from core_dio_cache_exp_key where ck_cd_id = ? and ck_exp_id = ? order by ck_key', ''),
(160, 'DIO', 'profile_on', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'update', 'update core_dio set cd_profile = ''1'' where cd_id = ?', ''),
(161, 'DIO', 'dio_insert', '1', 'production', 'DBI', 'scalar', '', NULL, '', '', '', 'insert', 'select dio_insert(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)', ''),
(162, 'DIO', 'get_dio_outkeys', '1', 'production', 'DBI', 'arrayofhash', '', NULL, '', '', '', 'select', 'select co_name,co_pos,co_default,co_key,co_inout from core_dio_outkey where co_cd_id = ? order by co_pos', ''),
(163, 'DIO', 'get_dio_inkeys', '1', 'production', 'DBI', 'arrayofhash', '', NULL, '', '', '', 'select', 'select ci_name, ci_pos, ci_req, ci_default, ci_key, ci_inout, ci_opt from core_dio_inkey where ci_cd_id = ? order by ci_pos', ''),
(164, 'DIO', 'get_dio_exps', '1', 'production', 'DBI', 'arrayofhash', '', NULL, '', '', '', 'select', 'select ce_exp_id, cd_name from core_dio, core_dio_cache_exp where ce_cd_id = ? and cd_id = ce_exp_id order by cd_name', ''),
(165, 'DIO', 'dio_exp_insert', '1', 'production', 'DBI', 'scalar', '', NULL, '', '', '', 'insert', 'select dio_exp_insert(?,?)', ''),
(166, 'DIO', 'dio_inkey_insert', '1', 'production', 'DBI', 'none', '', NULL, '', '', '', 'insert', 'insert into core_dio_inkey (ci_cd_id, ci_name, ci_pos, ci_req, ci_default, ci_key, ci_inout, ci_opt) values (?, ?, ?, ?, ?, ?, ?, ?)', ''),
(167, 'DIO', 'get_dio_inkey', '1', 'production', 'DBI', 'hash', '', NULL, '', '', '', 'select', 'select ci_name,ci_pos,ci_req,ci_default, ci_key, ci_inout, ci_opt from core_dio_inkey where ci_cd_id = ? and ci_name = ?', ''),
(168, 'DIO', 'dio_list', '1', 'production', 'DBI-Iter', 'hash', '', NULL, '', '', '', 'select', 'select cd_id, cd_namespace, cd_name, cd_version, cd_sysclass, cd_type, cd_cache, cd_profile, cd_repl, cd_action, cd_audit from core_dio order by cd_namespace, cd_name, cd_sysclass, cd_version', '');

-- --------------------------------------------------------

--
-- Table structure for table `core_dio_audit`
--

DROP TABLE IF EXISTS `core_dio_audit`;
CREATE TABLE IF NOT EXISTS `core_dio_audit` (
  `ca_id` int(11) NOT NULL AUTO_INCREMENT,
  `ca_cd_id` int(11) NOT NULL,
  `ca_ip` varchar(256) DEFAULT NULL,
  `ca_user` int(11) DEFAULT NULL,
  `ca_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`ca_id`),
  KEY `core_dio_audit_i1` (`ca_cd_id`,`ca_ts`),
  KEY `core_dio_audit_i2` (`ca_user`),
  KEY `core_dio_audit_i3` (`ca_ts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_dio_audit`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_dio_cache_exp`
--

DROP TABLE IF EXISTS `core_dio_cache_exp`;
CREATE TABLE IF NOT EXISTS `core_dio_cache_exp` (
  `ce_cd_id` int(11) NOT NULL,
  `ce_exp_id` int(11) NOT NULL,
  PRIMARY KEY (`ce_cd_id`,`ce_exp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_dio_cache_exp`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_dio_cache_exp_key`
--

DROP TABLE IF EXISTS `core_dio_cache_exp_key`;
CREATE TABLE IF NOT EXISTS `core_dio_cache_exp_key` (
  `ck_cd_id` int(11) NOT NULL,
  `ck_exp_id` int(11) NOT NULL,
  `ck_key` varchar(64) NOT NULL,
  PRIMARY KEY (`ck_cd_id`,`ck_exp_id`,`ck_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_dio_cache_exp_key`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_dio_inkey`
--

DROP TABLE IF EXISTS `core_dio_inkey`;
CREATE TABLE IF NOT EXISTS `core_dio_inkey` (
  `ci_cd_id` int(11) NOT NULL,
  `ci_name` varchar(64) NOT NULL,
  `ci_pos` int(11) NOT NULL,
  `ci_req` varchar(1) DEFAULT NULL,
  `ci_key` varchar(1) DEFAULT NULL,
  `ci_inout` varchar(1) DEFAULT NULL,
  `ci_opt` varchar(32) DEFAULT NULL,
  `ci_default` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ci_cd_id`,`ci_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_dio_inkey`
--

INSERT INTO `core_dio_inkey` (`ci_cd_id`, `ci_name`, `ci_pos`, `ci_req`, `ci_key`, `ci_inout`, `ci_opt`, `ci_default`) VALUES
(144, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(145, 'ca_id', 0, NULL, NULL, NULL, '', ''),
(145, 'ca_cd_id', 1, NULL, NULL, NULL, '', ''),
(145, 'ca_ip', 2, NULL, NULL, NULL, '', ''),
(145, 'user', 3, NULL, NULL, NULL, '', ''),
(146, 'cd_id', 0, '1', NULL, NULL, '', ''),
(147, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(147, 'co_name', 1, NULL, NULL, NULL, '', ''),
(147, 'co_pos', 2, NULL, NULL, NULL, '', ''),
(147, 'co_default', 3, NULL, NULL, NULL, '', ''),
(147, 'co_key', 4, NULL, NULL, NULL, '', ''),
(147, 'co_inout', 5, NULL, NULL, NULL, '', ''),
(148, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(149, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(149, 'ce_id', 1, NULL, NULL, NULL, '', ''),
(149, 'ck_key', 2, NULL, NULL, NULL, '', ''),
(150, 'co_name', 0, NULL, NULL, NULL, '', ''),
(150, 'co_pos', 1, NULL, NULL, NULL, '', ''),
(150, 'co_default', 2, NULL, NULL, NULL, '', ''),
(150, 'co_key', 3, NULL, NULL, NULL, '', ''),
(150, 'co_inout', 4, NULL, NULL, NULL, '', ''),
(150, 'cd_id', 5, NULL, NULL, NULL, '', ''),
(150, 'old_name', 6, NULL, NULL, NULL, '', ''),
(151, 'ci_name', 0, NULL, NULL, NULL, '', ''),
(151, 'ci_pos', 1, NULL, NULL, NULL, '', ''),
(151, 'ci_req', 2, NULL, NULL, NULL, '', ''),
(151, 'ci_default', 3, NULL, NULL, NULL, '', ''),
(151, 'ci_key', 4, NULL, NULL, NULL, '', ''),
(151, 'ci_inout', 5, NULL, NULL, NULL, '', ''),
(151, 'ci_opt', 6, NULL, NULL, NULL, '', ''),
(151, 'cd_id', 7, NULL, NULL, NULL, '', ''),
(151, 'old_name', 8, NULL, NULL, NULL, '', ''),
(152, 'cd_id', 0, '1', NULL, NULL, '', ''),
(152, 'co_name', 1, '1', NULL, NULL, '', ''),
(153, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(153, 'co_name', 1, NULL, NULL, NULL, '', ''),
(154, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(154, 'ce_id', 1, NULL, NULL, NULL, '', ''),
(155, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(155, 'ce_id', 1, NULL, NULL, NULL, '', ''),
(155, 'ck_key', 2, NULL, NULL, NULL, '', ''),
(156, 'cd_namespace', 0, NULL, NULL, NULL, '', ''),
(156, 'cd_name', 1, NULL, NULL, NULL, '', ''),
(156, 'cd_version', 2, NULL, NULL, NULL, '', ''),
(156, 'cd_sysclass', 3, NULL, NULL, NULL, '', ''),
(156, 'cd_type', 4, NULL, NULL, NULL, '', ''),
(156, 'cd_return', 5, NULL, NULL, NULL, '', ''),
(156, 'cd_profile', 6, NULL, NULL, NULL, '', ''),
(156, 'cd_cache', 7, NULL, NULL, NULL, '', ''),
(156, 'cd_cache_expire', 8, NULL, NULL, NULL, '', ''),
(156, 'cd_stmt', 9, NULL, NULL, NULL, '', ''),
(156, 'cd_stmt_noarg', 10, NULL, NULL, NULL, '', ''),
(156, 'cd_repl', 11, NULL, NULL, NULL, '', ''),
(156, 'cd_action', 12, NULL, NULL, NULL, '', ''),
(156, 'cd_audit', 13, NULL, NULL, NULL, '', ''),
(156, 'cd_id', 14, '1', NULL, NULL, '', ''),
(157, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(157, 'ci_name', 1, NULL, NULL, NULL, '', ''),
(158, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(159, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(159, 'ce_id', 1, NULL, NULL, NULL, '', ''),
(160, 'cd_id', 0, NULL, NULL, NULL, NULL, ''),
(161, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(161, 'cd_namespace', 1, NULL, NULL, NULL, '', ''),
(161, 'cd_name', 2, NULL, NULL, NULL, '', ''),
(161, 'cd_version', 3, NULL, NULL, NULL, '', ''),
(161, 'cd_sysclass', 4, NULL, NULL, NULL, '', ''),
(161, 'cd_type', 5, NULL, NULL, NULL, '', ''),
(161, 'cd_return', 6, NULL, NULL, NULL, '', ''),
(161, 'cd_profile', 7, NULL, NULL, NULL, '', ''),
(161, 'cd_cache', 8, NULL, NULL, NULL, '', ''),
(161, 'cd_cache_expire', 9, NULL, NULL, NULL, '', ''),
(161, 'cd_stmt', 10, NULL, NULL, NULL, '', ''),
(161, 'cd_stmt_noarg', 11, NULL, NULL, NULL, '', ''),
(161, 'cd_repl', 12, NULL, NULL, NULL, '', ''),
(161, 'cd_action', 13, NULL, NULL, NULL, '', ''),
(161, 'cd_audit', 14, NULL, NULL, NULL, '', ''),
(162, 'cd_id', 0, NULL, NULL, NULL, NULL, ''),
(163, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(164, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(165, 'cd_id', 0, NULL, NULL, NULL, '', ''),
(165, 'ce_id', 1, NULL, NULL, NULL, '', ''),
(166, 'cd_id', 0, '1', NULL, NULL, '', ''),
(166, 'ci_name', 1, '1', NULL, NULL, '', ''),
(166, 'ci_pos', 2, '1', NULL, NULL, '', ''),
(166, 'ci_req', 3, NULL, NULL, NULL, '', ''),
(166, 'ci_default', 4, NULL, NULL, NULL, '', ''),
(166, 'ci_key', 5, NULL, NULL, NULL, '', ''),
(166, 'ci_inout', 6, NULL, NULL, NULL, '', ''),
(166, 'ci_opt', 7, NULL, NULL, NULL, '', ''),
(167, 'cd_id', 0, NULL, NULL, NULL, NULL, ''),
(167, 'ci_name', 1, NULL, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `core_dio_outkey`
--

DROP TABLE IF EXISTS `core_dio_outkey`;
CREATE TABLE IF NOT EXISTS `core_dio_outkey` (
  `co_cd_id` int(11) NOT NULL,
  `co_name` varchar(64) NOT NULL,
  `co_pos` int(11) NOT NULL,
  `co_req` varchar(1) DEFAULT NULL,
  `co_key` varchar(1) DEFAULT NULL,
  `co_inout` varchar(1) DEFAULT NULL,
  `co_default` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`co_cd_id`,`co_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_dio_outkey`
--

INSERT INTO `core_dio_outkey` (`co_cd_id`, `co_name`, `co_pos`, `co_req`, `co_key`, `co_inout`, `co_default`) VALUES
(148, 'cd_cache_expire', 10, NULL, NULL, NULL, ''),
(148, 'cd_audit', 14, NULL, NULL, NULL, ''),
(148, 'cd_id', 0, NULL, NULL, NULL, ''),
(148, 'cd_sysclass', 4, NULL, NULL, NULL, ''),
(148, 'cd_return', 7, NULL, NULL, NULL, ''),
(148, 'cd_profile', 11, NULL, NULL, NULL, ''),
(148, 'cd_version', 3, NULL, NULL, NULL, ''),
(148, 'cd_stmt', 8, NULL, NULL, NULL, ''),
(148, 'cd_stmt_noarg', 9, NULL, NULL, NULL, ''),
(148, 'cd_repl', 12, NULL, NULL, NULL, ''),
(148, 'cd_action', 13, NULL, NULL, NULL, ''),
(148, 'cd_cache', 6, NULL, NULL, NULL, ''),
(148, 'cd_type', 5, NULL, NULL, NULL, ''),
(148, 'cd_name', 2, NULL, NULL, NULL, ''),
(148, 'cd_namespace', 1, NULL, NULL, NULL, ''),
(153, 'co_name', 0, NULL, NULL, NULL, ''),
(153, 'co_inout', 4, NULL, NULL, NULL, ''),
(153, 'co_key', 3, NULL, NULL, NULL, ''),
(153, 'co_default', 2, NULL, NULL, NULL, ''),
(153, 'co_pos', 1, NULL, NULL, NULL, ''),
(162, 'co_default', 2, NULL, NULL, NULL, ''),
(162, 'co_inout', 4, NULL, NULL, NULL, ''),
(162, 'co_key', 3, NULL, NULL, NULL, ''),
(162, 'co_name', 0, NULL, NULL, NULL, ''),
(162, 'co_pos', 1, NULL, NULL, NULL, ''),
(163, 'ci_req', 2, NULL, NULL, NULL, ''),
(163, 'ci_pos', 1, NULL, NULL, NULL, ''),
(163, 'ci_default', 3, NULL, NULL, NULL, ''),
(163, 'ci_key', 4, NULL, NULL, NULL, ''),
(163, 'ci_inout', 5, NULL, NULL, NULL, ''),
(163, 'ci_name', 0, NULL, NULL, NULL, ''),
(163, 'ci_opt', 6, NULL, NULL, NULL, ''),
(164, 'cd_id', 0, NULL, NULL, NULL, ''),
(164, 'ce_name', 1, NULL, NULL, NULL, ''),
(167, 'ci_default', 3, NULL, NULL, NULL, ''),
(167, 'ci_inout', 5, NULL, NULL, NULL, ''),
(167, 'ci_key', 4, NULL, NULL, NULL, ''),
(167, 'ci_name', 0, NULL, NULL, NULL, ''),
(167, 'ci_opt', 6, NULL, NULL, NULL, ''),
(167, 'ci_pos', 1, NULL, NULL, NULL, ''),
(167, 'ci_req', 2, NULL, NULL, NULL, ''),
(168, 'cd_audit', 10, NULL, NULL, NULL, ''),
(168, 'cd_id', 0, NULL, NULL, NULL, ''),
(168, 'cd_sysclass', 4, NULL, NULL, NULL, ''),
(168, 'cd_profile', 7, NULL, NULL, NULL, ''),
(168, 'cd_version', 3, NULL, NULL, NULL, ''),
(168, 'cd_action', 9, NULL, NULL, NULL, ''),
(168, 'cd_repl', 8, NULL, NULL, NULL, ''),
(168, 'cd_cache', 6, NULL, NULL, NULL, ''),
(168, 'cd_type', 5, NULL, NULL, NULL, ''),
(168, 'cd_name', 2, NULL, NULL, NULL, ''),
(168, 'cd_namespace', 1, NULL, NULL, NULL, '');

-- --------------------------------------------------------

DROP FUNCTION IF EXISTS `dio_duplicate`$$
CREATE DEFINER=`walzbill`@`69.163.128.0/255.255.128.0` FUNCTION `dio_duplicate`(vcd_id int(11)) RETURNS int(11)
begin
declare vnew_id int(11);
declare vname varchar(64);
  select concat('_new1', cd_name)
    into vname
    from core_dio
   where cd_id = vcd_id;
 
  insert into core_dio (cd_namespace,cd_name,cd_version,cd_sysclass,cd_type,cd_return, cd_profile, cd_cache, cd_stmt, cd_stmt_noarg, cd_repl, cd_action,cd_audit) select cd_namespace,vname,cd_version,cd_sysclass,cd_type,cd_return, cd_profile, cd_cache,cd_stmt,cd_stmt_noarg, cd_repl, cd_action, cd_audit from core_dio where cd_id = vcd_id;
 
 select LAST_INSERT_ID() into vnew_id;

  
  insert into core_dio_inkey (ci_cd_id,ci_name,ci_pos,ci_req,ci_default,ci_key) select vnew_id,ci_name,ci_pos,ci_req,ci_default,ci_key from core_dio_inkey where ci_cd_id = vcd_id;
    insert into core_dio_outkey (co_cd_id,co_name,co_pos,co_default,co_key) select vnew_id,co_name,co_pos,co_default,co_key from core_dio_outkey where co_cd_id = vcd_id;
 
  insert into core_dio_cache_exp (ce_cd_id, ce_exp_id) select vnew_id, ce_exp_id from core_dio_cache_exp where ce_cd_id = vcd_id;
 
  insert into core_dio_cache_exp_key (ck_cd_id, ck_exp_id, ck_key) select vnew_id, ck_exp_id, ck_key from core_dio_cache_exp_key where ck_cd_id = vcd_id;


return vnew_id;
end$$

DROP FUNCTION IF EXISTS `dio_insert`$$
CREATE DEFINER=`walzbill`@`69.163.128.0/255.255.128.0` FUNCTION `dio_insert`(p_cd_id int(11),p_cd_namespace varchar(64), p_cd_name varchar(64), p_cd_version varchar(63), p_cd_sysclass varchar(256), p_cd_type varchar(64), p_cd_return varchar(64), p_cd_profile varchar(1), p_cd_cache varchar(1), p_cd_cache_expire varchar(32), p_cd_stmt varchar(2000), p_cd_stmt_noarg varchar(2000), p_cd_repl varchar(32), p_cd_action varchar(32), p_cd_audit varchar(1)) RETURNS int(11)
begin
   insert into core_dio
      (cd_namespace,cd_name,cd_version,cd_sysclass,cd_type,cd_return,
       cd_profile,cd_cache,cd_cache_expire,cd_stmt,cd_stmt_noarg,cd_repl,
       cd_action,cd_audit)
values 
      (p_cd_namespace,p_cd_name,p_cd_version,p_cd_sysclass,p_cd_type,p_cd_return,
       p_cd_profile,p_cd_cache,p_cd_cache_expire,p_cd_stmt,p_cd_stmt_noarg,p_cd_repl,
       p_cd_action,p_cd_audit);

return LAST_INSERT_ID();
end$$

DELIMITER ;
