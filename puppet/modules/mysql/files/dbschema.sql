CREATE DATABASE IF NOT EXISTS `symfony3playground`;

-- grant only the necessary privileges to our new user

CREATE USER IF NOT EXISTS 'dev'@'%';
SET PASSWORD FOR 'dev'@'%' = PASSWORD('dev');
CREATE USER IF NOT EXISTS 'dev'@'localhost';
SET PASSWORD FOR 'dev'@'localhost' = PASSWORD('dev');

GRANT ALL PRIVILEGES ON *.* To 'dev'@'localhost' IDENTIFIED BY 'dev';
GRANT ALL PRIVILEGES ON *.* To 'dev'@'%' IDENTIFIED BY 'dev';

FLUSH PRIVILEGES;

-- make this our active database
USE `symfony3playground`;
