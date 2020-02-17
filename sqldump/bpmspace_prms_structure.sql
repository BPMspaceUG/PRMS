-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'prms_project'
-- 
-- ---

DROP TABLE IF EXISTS `prms_project`;
		
CREATE TABLE `prms_project` (
  `prms_project_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `prms_project_name` VARCHAR(256) NULL DEFAULT NULL,
  `prms_project_description` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`prms_project_id`)
);

-- ---
-- Table 'prms_task'
-- 
-- ---

DROP TABLE IF EXISTS `prms_task`;
		
CREATE TABLE `prms_task` (
  `prms_task_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `prms_task_name` VARCHAR(256) NULL DEFAULT NULL,
  PRIMARY KEY (`prms_task_id`)
);

-- ---
-- Table 'prms_project_task'
-- 
-- ---

DROP TABLE IF EXISTS `prms_project_task`;
		
CREATE TABLE `prms_project_task` (
  `prms_project_task_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `prms_project_id_fk_350642` BIGINT(20) NULL DEFAULT NULL,
  `prms_task_id_fk_516161` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`prms_project_task_id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `prms_project_task` ADD FOREIGN KEY (prms_project_id_fk_350642) REFERENCES `prms_project` (`prms_project_id`);
ALTER TABLE `prms_project_task` ADD FOREIGN KEY (prms_task_id_fk_516161) REFERENCES `prms_task` (`prms_task_id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `prms_project` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `prms_task` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `prms_project_task` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `prms_project` (`prms_project_id`,`prms_project_name`,`prms_project_description`) VALUES
-- ('','','');
-- INSERT INTO `prms_task` (`prms_task_id`,`prms_task_name`) VALUES
-- ('','');
-- INSERT INTO `prms_project_task` (`prms_project_task_id`,`prms_project_id_fk_350642`,`prms_task_id_fk_516161`) VALUES
-- ('','','');