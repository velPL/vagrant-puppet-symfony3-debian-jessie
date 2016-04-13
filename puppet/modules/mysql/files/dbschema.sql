-- prepare database and user with proper access options
CREATE DATABASE IF NOT EXISTS `symfony3playground`;
CREATE USER IF NOT EXISTS 'dev'@'%';
SET PASSWORD FOR 'dev'@'%' = PASSWORD('dev');
CREATE USER IF NOT EXISTS 'dev'@'localhost';
SET PASSWORD FOR 'dev'@'localhost' = PASSWORD('dev');
GRANT ALL PRIVILEGES ON *.* To 'dev'@'localhost' IDENTIFIED BY 'dev';
GRANT ALL PRIVILEGES ON *.* To 'dev'@'%' IDENTIFIED BY 'dev';
FLUSH PRIVILEGES;
USE `symfony3playground`;

-- ############################################
-- put all your database schema below this line
-- ############################################


-- this is only demo table to make sphinx search properly install and run - feel free to remove this, but be aware to adjust sphinx.conf in /puppet/modules/sphinxsearch/files afterwards
DROP TABLE IF EXISTS `symfony3demo`;
CREATE TABLE `symfony3demo` (
	`ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`)
)
ENGINE=InnoDB;
