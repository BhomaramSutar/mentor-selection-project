# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     mentordb
# Server version:               5.1.73-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2022-04-21 16:03:30
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for mentordb
CREATE DATABASE IF NOT EXISTS `mentordb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mentordb`;


# Dumping structure for table mentordb.candidateregistration
CREATE TABLE IF NOT EXISTS `candidateregistration` (
  `C_ID` int(100) NOT NULL AUTO_INCREMENT,
  `Uname` varchar(100) DEFAULT NULL,
  `Uaddress` varchar(100) DEFAULT NULL,
  `Umobno` varchar(100) DEFAULT NULL,
  `Uemail` varchar(100) DEFAULT NULL,
  `Upassword` varchar(100) DEFAULT NULL,
  `UGender` text,
  `skilldata` longtext,
  `Mentor_ID` longtext,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

# Dumping data for table mentordb.candidateregistration: 9 rows
/*!40000 ALTER TABLE `candidateregistration` DISABLE KEYS */;
INSERT INTO `candidateregistration` (`C_ID`, `Uname`, `Uaddress`, `Umobno`, `Uemail`, `Upassword`, `UGender`, `skilldata`, `Mentor_ID`) VALUES (1, 'jitu', 'pune', '8888888888', 'jitusunsofttech@gmail.com', '123456', 'Male', 'java									', 'jitu@gmail.com'), (2, 'om', 'pune', '8888888888', 'jadhavpravin920@gmail.com', '123456', 'Male', 'java,sql									', 'jitu@gmail.com'), (3, 'ravi', 'pune', '8888888888', 'ravi@gmail.com', '123456', 'Male', 'sql,C#				', 'jitu@gmail.com'), (4, 'nayan', 'pune', '8888888888', 'nayan@gmail.com', '123456', 'Male', 'java									', 'jitu@gmail.com'), (5, 'nayan', 'pune', '8888888888', 'nayan@gmail.com', '123456', 'Male', 'java									', 'jitu@gmail.com'), (6, 'nayan', 'pune', '8888888888', 'nayan@gmail.com', '123456', 'Male', 'java									', 'jitu@gmail.com'), (7, 'nayan', 'pune', '8888888888', 'nayan@gmail.com', '123456', 'Male', 'java									', 'jitu@gmail.com'), (8, 'nayan', 'pune', '8888888888', 'nayan@gmail.com', '123456', 'Male', 'java									', 'jitu@gmail.com'), (9, 'nayan', 'pune', '8888888888', 'nayan@gmail.com', '123456', 'Male', 'java									', 'jitu@gmail.com'), (10, 'shreyas', 'pune', '8208452346', 'shreyask2000.22@gmail.com', '123456', 'Male', 'java,sql,c#									', 'pravin@gmail.com');
/*!40000 ALTER TABLE `candidateregistration` ENABLE KEYS */;


# Dumping structure for table mentordb.mentorregistration
CREATE TABLE IF NOT EXISTS `mentorregistration` (
  `M_ID` int(100) NOT NULL AUTO_INCREMENT,
  `Uname` varchar(100) DEFAULT NULL,
  `Uaddress` varchar(100) DEFAULT NULL,
  `Umobno` varchar(100) DEFAULT NULL,
  `Uemail` varchar(100) DEFAULT NULL,
  `Upassword` varchar(100) DEFAULT NULL,
  `UGender` text,
  `skilldata` text,
  PRIMARY KEY (`M_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table mentordb.mentorregistration: 3 rows
/*!40000 ALTER TABLE `mentorregistration` DISABLE KEYS */;
INSERT INTO `mentorregistration` (`M_ID`, `Uname`, `Uaddress`, `Umobno`, `Uemail`, `Upassword`, `UGender`, `skilldata`) VALUES (1, 'jitu', 'pune', '8888888888', 'jitu@gmail.com', '123456', 'Male', 'java,sql									'), (2, 'om', 'pune', '8888888888', 'om@gmail.com', '123456', 'Male', 'java,sql									'), (3, 'amit', 'pune', '8888888888', 'amit@gmail.com', '123456', 'Male', 'sql,php									'), (4, 'pravin', 'pune', '8888888888', 'pravin@gmail.com', '123456', 'Male', 'java,sql,.net,C#									');
/*!40000 ALTER TABLE `mentorregistration` ENABLE KEYS */;


# Dumping structure for table mentordb.tblmentorrating
CREATE TABLE IF NOT EXISTS `tblmentorrating` (
  `R_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` text,
  `Email_ID` text,
  `Rating_values` text,
  PRIMARY KEY (`R_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

# Dumping data for table mentordb.tblmentorrating: 3 rows
/*!40000 ALTER TABLE `tblmentorrating` DISABLE KEYS */;
INSERT INTO `tblmentorrating` (`R_id`, `User_ID`, `Email_ID`, `Rating_values`) VALUES (2, 'jitu@gmail.com', 'jitusunsofttech@gmail.com', '2'), (3, 'jitu@gmail.com', 'jadhavpravin920@gmail.com', '4'), (4, 'jitu@gmail.com', 'ravi@gmail.com', '4'), (5, 'pravin@gmail.com', 'shreyask2000.22@gmail.com', '4');
/*!40000 ALTER TABLE `tblmentorrating` ENABLE KEYS */;


# Dumping structure for table mentordb.tblrating
CREATE TABLE IF NOT EXISTS `tblrating` (
  `R_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` text,
  `Email_ID` text,
  `Rating_values` text,
  PRIMARY KEY (`R_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table mentordb.tblrating: 3 rows
/*!40000 ALTER TABLE `tblrating` DISABLE KEYS */;
INSERT INTO `tblrating` (`R_id`, `User_ID`, `Email_ID`, `Rating_values`) VALUES (1, 'jitusunsofttech@gmail.com', 'jitu@gmail.com', '1'), (2, 'jadhavpravin920@gmail.com', 'jitu@gmail.com', '2'), (3, 'ravi@gmail.com', 'jitu@gmail.com', '5'), (4, 'shreyask2000.22@gmail.com', 'pravin@gmail.com', '5');
/*!40000 ALTER TABLE `tblrating` ENABLE KEYS */;


# Dumping structure for table mentordb.tblscore
CREATE TABLE IF NOT EXISTS `tblscore` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Mentor_ID` text,
  `Score_Info` double DEFAULT NULL,
  `Search_Word` text,
  `User_ID` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table mentordb.tblscore: 3 rows
/*!40000 ALTER TABLE `tblscore` DISABLE KEYS */;
INSERT INTO `tblscore` (`id`, `Mentor_ID`, `Score_Info`, `Search_Word`, `User_ID`) VALUES (1, 'jitu@gmail.com', 0.333333333333333, 'java,sql,c#									', 'shreyask2000.22@gmail.com'), (2, 'om@gmail.com', 0.333333333333333, 'java,sql,c#									', 'shreyask2000.22@gmail.com'), (3, 'amit@gmail.com', 0.166666666666667, 'java,sql,c#									', 'shreyask2000.22@gmail.com'), (4, 'pravin@gmail.com', 0.166666666666667, 'java,sql,c#									', 'shreyask2000.22@gmail.com');
/*!40000 ALTER TABLE `tblscore` ENABLE KEYS */;


# Dumping structure for table mentordb.tblskill
CREATE TABLE IF NOT EXISTS `tblskill` (
  `useremail` text,
  `skilldata` text,
  `U_Id` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table mentordb.tblskill: 4 rows
/*!40000 ALTER TABLE `tblskill` DISABLE KEYS */;
INSERT INTO `tblskill` (`useremail`, `skilldata`, `U_Id`) VALUES ('a@gmail.com', 'ECLIPSE\n  JAVA\n  SPRING\n  HTML\n  JAVASCRIPT	\n Programming Languages-Java, JavaScript, HTML and CSS. Tools- Eclipse IDE, Spring Tool Suite, XAMPP, SQLyog."\n', '1'), ('b@gmail.com', 'ECLIPSE\n  JAVA\n  SPRING\n  HTML\n  JAVASCRIPT	\n Programming Languages-Java, JavaScript, HTML and CSS. Tools- Eclipse IDE, Spring Tool Suite, XAMPP, SQLyog."\nJava\n', '2'), ('c@gmail.com', 'ECLIPSE\n  JAVA\n  SPRING\n  HTML\n  JAVASCRIPT	\n Programming Languages-Java, JavaScript, HTML and CSS. Tools- Eclipse IDE, Spring Tool Suite, XAMPP, SQLyog."\nJava\njava\n javascript\n ajax etc.\n', '3'), ('jj@gmail.com', 'ECLIPSE\n  J2EE\n  JAVA\n  HIBERNATE\n  SPRING\nProgramming Languages C, C++, Core Java, J2EE \n Web Designing HTML, CSS-3, Bootstrap 4 \n Scripting Languages JavaScript, jQuery Server Technologies Jsp and Servlet. Frameworks Struts 2.3, Tiles 3, Spring MVC, Spring Boot, Hibernate 4.3, 5.2  Design Pattern MVC \n Building Tool Maven \n Databases MySQL 5.7, MariaDB  Web Servers Apache Tomcat 8.5 \n Platforms Ubuntu 17.04, Windows, CentOS 7 Desktop and Server Editors STS(Spring Tool Suite), Eclipse Neon 3"\n', '4');
/*!40000 ALTER TABLE `tblskill` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
