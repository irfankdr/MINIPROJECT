/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - studentissue
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`studentissue` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `studentissue`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add login_table',7,'add_login_table'),
(26,'Can change login_table',7,'change_login_table'),
(27,'Can delete login_table',7,'delete_login_table'),
(28,'Can view login_table',7,'view_login_table'),
(29,'Can add student_table',8,'add_student_table'),
(30,'Can change student_table',8,'change_student_table'),
(31,'Can delete student_table',8,'delete_student_table'),
(32,'Can view student_table',8,'view_student_table'),
(33,'Can add registration_table',9,'add_registration_table'),
(34,'Can change registration_table',9,'change_registration_table'),
(35,'Can delete registration_table',9,'delete_registration_table'),
(36,'Can view registration_table',9,'view_registration_table'),
(37,'Can add counsilor_table',10,'add_counsilor_table'),
(38,'Can change counsilor_table',10,'change_counsilor_table'),
(39,'Can delete counsilor_table',10,'delete_counsilor_table'),
(40,'Can view counsilor_table',10,'view_counsilor_table'),
(41,'Can add feedback_table',11,'add_feedback_table'),
(42,'Can change feedback_table',11,'change_feedback_table'),
(43,'Can delete feedback_table',11,'delete_feedback_table'),
(44,'Can view feedback_table',11,'view_feedback_table'),
(45,'Can add report_table',12,'add_report_table'),
(46,'Can change report_table',12,'change_report_table'),
(47,'Can delete report_table',12,'delete_report_table'),
(48,'Can view report_table',12,'view_report_table'),
(49,'Can add teacher_table',13,'add_teacher_table'),
(50,'Can change teacher_table',13,'change_teacher_table'),
(51,'Can delete teacher_table',13,'delete_teacher_table'),
(52,'Can view teacher_table',13,'view_teacher_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$W50XuirRPTCbOXgugVEpDY$qCdR8OM8rdU/hbmMC9Hksnf+a3Z0XvAwWreow33ZX/E=','2024-10-23 10:06:18.482301',1,'admin','','','admin@gmail.com',1,1,'2024-10-22 06:14:12.083336');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(10,'myapp','counsilor_table'),
(11,'myapp','feedback_table'),
(7,'myapp','login_table'),
(9,'myapp','registration_table'),
(12,'myapp','report_table'),
(8,'myapp','student_table'),
(13,'myapp','teacher_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-10-18 06:05:49.006046'),
(2,'auth','0001_initial','2024-10-18 06:05:49.600684'),
(3,'admin','0001_initial','2024-10-18 06:05:49.736125'),
(4,'admin','0002_logentry_remove_auto_add','2024-10-18 06:05:49.743124'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-10-18 06:05:49.750519'),
(6,'contenttypes','0002_remove_content_type_name','2024-10-18 06:05:49.812721'),
(7,'auth','0002_alter_permission_name_max_length','2024-10-18 06:05:49.860605'),
(8,'auth','0003_alter_user_email_max_length','2024-10-18 06:05:49.883271'),
(9,'auth','0004_alter_user_username_opts','2024-10-18 06:05:49.891569'),
(10,'auth','0005_alter_user_last_login_null','2024-10-18 06:05:49.938622'),
(11,'auth','0006_require_contenttypes_0002','2024-10-18 06:05:49.942039'),
(12,'auth','0007_alter_validators_add_error_messages','2024-10-18 06:05:49.950087'),
(13,'auth','0008_alter_user_username_max_length','2024-10-18 06:05:50.000797'),
(14,'auth','0009_alter_user_last_name_max_length','2024-10-18 06:05:50.056907'),
(15,'auth','0010_alter_group_name_max_length','2024-10-18 06:05:50.074529'),
(16,'auth','0011_update_proxy_permissions','2024-10-18 06:05:50.082849'),
(17,'auth','0012_alter_user_first_name_max_length','2024-10-18 06:05:50.137088'),
(18,'myapp','0001_initial','2024-10-18 06:05:50.266514'),
(19,'sessions','0001_initial','2024-10-18 06:05:50.297785'),
(20,'myapp','0002_auto_20241018_1215','2024-10-18 06:45:15.180888'),
(21,'myapp','0003_counsilor_table','2024-10-18 09:20:35.362034'),
(22,'myapp','0004_feedback_table','2024-10-18 10:23:33.330904'),
(23,'myapp','0005_report_table','2024-10-18 10:57:19.927943'),
(24,'myapp','0006_alter_report_table_report','2024-10-18 11:30:31.720560'),
(25,'myapp','0007_report_table_counsilor','2024-10-18 11:35:45.391035'),
(26,'myapp','0008_auto_20241019_0842','2024-10-19 03:12:34.511643'),
(27,'myapp','0009_auto_20241019_0921','2024-10-19 03:51:45.816733'),
(28,'myapp','0010_report_table_reply','2024-10-21 04:16:38.643024'),
(29,'myapp','0011_report_table_register','2024-10-21 06:09:18.875795'),
(30,'myapp','0012_remove_report_table_register','2024-10-21 06:21:59.712656'),
(31,'myapp','0013_report_table_register','2024-10-21 06:29:22.628384'),
(32,'myapp','0014_alter_report_table_register','2024-10-21 06:31:58.530430'),
(33,'myapp','0015_teacher_table','2024-10-21 10:05:20.073296'),
(34,'myapp','0016_auto_20241021_1549','2024-10-21 10:19:31.400223'),
(35,'myapp','0017_student_table_standered','2024-10-21 10:53:24.860994');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('1k759brppga7fondhudbltwxf006bg8o','eyJsaWQiOjE0fQ:1t2mRh:MZzOiMzuAc83y5H9qsUJW_MAhXzswLRB5BcpmyRtlFQ','2024-11-04 07:03:17.443942'),
('395w2usxpb84ekxhfxhceaaf3mk93t83','.eJxVjsEOgyAQRP-FsyGACOix934DAXaptgYSwVPTf68kmrS33TczO_sm1u11tnvBzS5AJsJJ98u8Cy9MTYCnS49MQ051WzxtFnqqhd4z4Ho7vX8HZlfmI80GgcIbDOgZ06wXkSk0o4igetnrMKpeS8GVA2eYiYhc86CkD1FwANm-OiC0QhvyniqZREfaVJY1bxcbOlKqi_Ha9ecL2QlK4A:1t3YFu:_2Sv3y48qddIW8-OJl-pM9aq2XJ7S4LxZIea0ibbAD0','2024-11-06 10:06:18.830418'),
('qwxgrwv82c46hd8lf1vg1b25mg7tdqvx','eyJsaWQiOjE0LCJyaWQiOiI4IiwiY2lkIjoiMSJ9:1t2mJ3:XIrfIMDIHCvW3ZC_sisnuyvhz49_CpU2UOtG2Xuv9j8','2024-11-04 06:54:21.033623'),
('x6rp7wtuok6u4yk4cgtphb2zssh1y241','eyJsaWQiOjE3LCJyaWQiOiIxIiwiY2lkIjoiMSJ9:1t2Rf8:7dFN9dZKCXwiWm2KB7SLc5TRhonTz4172kLlCfarBSA','2024-11-03 08:51:46.720489');

/*Table structure for table `myapp_counsilor_table` */

DROP TABLE IF EXISTS `myapp_counsilor_table`;

CREATE TABLE `myapp_counsilor_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_counsilor_table_LOGIN_id_60ff81b8_fk_myapp_login_table_id` (`LOGIN_id`),
  CONSTRAINT `myapp_counsilor_table_LOGIN_id_60ff81b8_fk_myapp_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_counsilor_table` */

insert  into `myapp_counsilor_table`(`id`,`name`,`place`,`phone`,`email`,`qualification`,`LOGIN_id`,`image`) values 
(1,'appu','a',11,'qqq','qq',8,'1'),
(2,'ammu','kannur',123456,'qwer','sd',9,'1'),
(3,'ammu','kannur',123456,'qwer','sd',10,'1'),
(4,'a','a',34567,'aa','a',13,'1'),
(5,'firstone','mannn',345678,'dfgh@gmail.com','sdfgh',26,''),
(6,'second','dfghj',45678,'dfghj@gmail.com','dfghj',30,''),
(7,'third','cvbn',4567,'a@gmail.com','fgh',31,'');

/*Table structure for table `myapp_feedback_table` */

DROP TABLE IF EXISTS `myapp_feedback_table`;

CREATE TABLE `myapp_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `STUDENT_id` bigint NOT NULL,
  `feedback` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_table_STUDENT_id_9471fb9c_fk_myapp_stu` (`STUDENT_id`),
  CONSTRAINT `myapp_feedback_table_STUDENT_id_9471fb9c_fk_myapp_stu` FOREIGN KEY (`STUDENT_id`) REFERENCES `myapp_student_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_feedback_table` */

insert  into `myapp_feedback_table`(`id`,`date`,`STUDENT_id`,`feedback`) values 
(1,'2024-10-21',3,'hiiiiiiiiiiiiiiiiiiiiiiiiii\r\n\r\n'),
(2,'2024-10-22',6,'jgyyyyyyyyyyyyyyyyyyyyyyy');

/*Table structure for table `myapp_login_table` */

DROP TABLE IF EXISTS `myapp_login_table`;

CREATE TABLE `myapp_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_login_table` */

insert  into `myapp_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'appu','Appu@123','teacher'),
(3,'aa','12','student'),
(4,'aa','Aaa@123456','student'),
(5,'asd','Athira@12345','blocked'),
(6,'dfgh','Adfgh@123456','actionboard'),
(7,'aa','aa',''),
(8,'qq','qq','counsilor'),
(9,'asd','asd',''),
(10,'asd','asd',''),
(13,'a','a','counsilor'),
(14,'ww','Athira@12345','student'),
(15,'kavya','Kavya@12345','actionboard'),
(16,'ac','ac','teacher'),
(17,'ac','acr','actionboard'),
(18,'athira','athira','teacher'),
(19,'athira','athira','actionboard'),
(20,'tea','Athirapp@1234','teacher'),
(21,'first','First@1234','teacher'),
(22,'aa','Appuku@12345','teacher'),
(24,'mn','Malu@12345','student'),
(25,'kukku','Kukku@12345','student'),
(26,'first','second','counsilor'),
(27,'action','Action','teacher'),
(28,'action','Action','actionboard'),
(29,'actionu','Action@1239','actionboard'),
(30,'se','se','counsilor'),
(31,'th','th','counsilor'),
(32,'aam','aam','actionboard'),
(33,'zz','zzb','actionboard'),
(34,'maya','maya@123','actionboard'),
(35,'kiran','kiran@123','student'),
(36,'rahul','Rahul@1234567','student'),
(37,'athu','Athu@1232','student');

/*Table structure for table `myapp_registration_table` */

DROP TABLE IF EXISTS `myapp_registration_table`;

CREATE TABLE `myapp_registration_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `idproof` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_registration_t_LOGIN_id_844956a7_fk_myapp_log` (`LOGIN_id`),
  CONSTRAINT `myapp_registration_t_LOGIN_id_844956a7_fk_myapp_log` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_registration_table` */

insert  into `myapp_registration_table`(`id`,`name`,`place`,`qualification`,`phone`,`email`,`image`,`idproof`,`LOGIN_id`) values 
(1,'asdfgh','sdfgh','sdfgh',9544292406,'aa@gmail.com','myimage_3QOwLH3.jpg','myimage_kKS2NoP.jpg',6),
(2,'kavya','sdfgh','dfghj',9544292406,'xcvb','image.webp','myimage_wt1w9lh.jpg',15),
(3,'xxxx','xx','xx',9544292406,'aa@gmail.com','image_hlxLpip.webp','myimage_MPEpk8S.jpg',16),
(4,'athira','mangad','mca',9544292406,'ar@gmail.com','images_4rls2DM.jpg','myimage_e23TLri.jpg',18),
(5,'teacher','kannur','mcs',9544292406,'a@gmail.com','images_NYl4cYQ.jpg','myimage_BZVBL7Y.jpg',20),
(6,'action','dfgh','werfg',9544292406,'as@gmail.com','images_aWpABep.jpg','myimage_BEfWrBL.jpg',27),
(7,'actionm','asdfg','dfgh',9544292406,'a@gmail.com','images_t5Ec2EU.jpg','myimage_ECnckXi.jpg',29),
(8,'c1','wed','edf',9544292406,'sdfv','image_3sxR6Dl.webp','myimage_fdcGpT1.jpg',32),
(9,'zz','zz','zz',9544292406,'zz@gmail.com','images_ot0ELai.jpg','myimage_f6zANbR.jpg',33),
(10,'maya','kollam','12',9898989898,'maya@gmail.com','myimage_Dj0dAZJ.jpg','myimage_mQUI3tW.jpg',34);

/*Table structure for table `myapp_report_table` */

DROP TABLE IF EXISTS `myapp_report_table`;

CREATE TABLE `myapp_report_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `report` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `COUNSILOR_id` bigint NOT NULL,
  `STUDENT_id` bigint NOT NULL,
  `reply` varchar(100) NOT NULL,
  `REGISTER_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_report_table_COUNSILOR_id_7b73f5bf_fk_myapp_cou` (`COUNSILOR_id`),
  KEY `myapp_report_table_STUDENT_id_8010fe61_fk_myapp_student_table_id` (`STUDENT_id`),
  KEY `myapp_report_table_REGISTER_id_d7a56f3d_fk_myapp_reg` (`REGISTER_id`),
  CONSTRAINT `myapp_report_table_COUNSILOR_id_7b73f5bf_fk_myapp_cou` FOREIGN KEY (`COUNSILOR_id`) REFERENCES `myapp_counsilor_table` (`id`),
  CONSTRAINT `myapp_report_table_REGISTER_id_d7a56f3d_fk_myapp_reg` FOREIGN KEY (`REGISTER_id`) REFERENCES `myapp_registration_table` (`id`),
  CONSTRAINT `myapp_report_table_STUDENT_id_8010fe61_fk_myapp_student_table_id` FOREIGN KEY (`STUDENT_id`) REFERENCES `myapp_student_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_report_table` */

insert  into `myapp_report_table`(`id`,`category`,`report`,`date`,`status`,`COUNSILOR_id`,`STUDENT_id`,`reply`,`REGISTER_id`) values 
(1,'bullying','m','2024-10-21','staff rejected',7,6,'staff rejected',NULL),
(2,'bullying','help','2024-10-21','staff verified',7,6,'ok man ',10),
(3,'bullying','ydtfkewuifghwls','2024-10-21','forwareded to actionboard',7,6,'pending',10),
(4,'mental_concern','depression stage','2024-10-21','pending',7,6,'pending',NULL),
(5,'mental_concern','jhygtfr5e4534stry','2024-10-21','pending',7,6,'pending',NULL),
(6,'violence','jhuyf','2024-10-22','pending',7,6,'pending',NULL);

/*Table structure for table `myapp_student_table` */

DROP TABLE IF EXISTS `myapp_student_table`;

CREATE TABLE `myapp_student_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `standered` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_student_table_LOGIN_id_c3386235_fk_myapp_login_table_id` (`LOGIN_id`),
  CONSTRAINT `myapp_student_table_LOGIN_id_c3386235_fk_myapp_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_student_table` */

insert  into `myapp_student_table`(`id`,`name`,`place`,`phone`,`email`,`image`,`LOGIN_id`,`standered`) values 
(1,'as','mm',9544292406,'aa@gmail.com','myimage_ffQL4km.jpg',4,'1'),
(2,'wer','kannue',9544292406,'asd','myimage_utYeSLU.jpg',5,'1'),
(3,'aas','aa',9544292406,'sd','myimage_HIsF9xc.jpg',14,'1'),
(4,'malu','ma',9544292406,'nd','myimage_bmjkfYu.jpg',24,''),
(5,'kukku','kukku',9544292406,'malu@gmail.com','myimage_ClW9REe.jpg',25,''),
(6,'mathu','kkkk',9898989899,'jnjnj','image_n95mz8s.webp',35,'2'),
(7,'rahul','kollam',8989898989,'rahul@gmail.com','myimage_4yJisP3.jpg',36,''),
(8,'athu','kollam',9809098989,'athu@gmail.com','image_jt7Ftye.webp',37,'6');

/*Table structure for table `myapp_teacher_table` */

DROP TABLE IF EXISTS `myapp_teacher_table`;

CREATE TABLE `myapp_teacher_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `idproof` varchar(100) NOT NULL,
  `standered` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_teacher_table_LOGIN_id_ad659b93_fk_myapp_login_table_id` (`LOGIN_id`),
  CONSTRAINT `myapp_teacher_table_LOGIN_id_ad659b93_fk_myapp_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_teacher_table` */

insert  into `myapp_teacher_table`(`id`,`name`,`place`,`qualification`,`phone`,`email`,`image`,`idproof`,`standered`,`LOGIN_id`) values 
(1,'first','pl','dd',9544292406,'dfg@gmail.com','myimage_q9SEJ5H.jpg','images_eYqgSz0.jpg','2',21),
(2,'second','sdfg','dfgh',9544292406,'xfdf','images_aQ77BYs.jpg','myimage_Y1Tgq9o.jpg','3',22);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
