/*
SQLyog Community v12.2.1 (64 bit)
MySQL - 10.4.11-MariaDB : Database - laravel7
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel7` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `laravel7`;

/*Table structure for table `data_rows` */

DROP TABLE IF EXISTS `data_rows`;

CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_rows` */

insert  into `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) values 
(1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),
(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),
(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),
(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),
(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),
(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),
(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),
(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),
(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),
(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),
(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),
(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),
(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),
(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),
(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),
(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),
(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),
(22,4,'id','text','Id',1,0,0,0,0,0,'{}',1),
(23,4,'title','text','Title',1,1,1,1,1,1,'{}',2),
(24,4,'description','text','Description',0,1,1,1,1,1,'{}',3),
(25,4,'airing_time','timestamp','Airing Time',0,1,1,1,1,1,'{}',4),
(26,4,'created_at','timestamp','Created At',0,1,1,0,0,1,'{}',5),
(27,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),
(28,5,'id','text','Id',1,0,0,0,0,0,'{}',1),
(29,5,'title','text','Title',1,1,1,1,1,1,'{}',2),
(30,5,'description','text','Description',0,1,1,1,1,1,'{}',3),
(31,5,'duration','text','Duration',1,1,1,1,1,1,'{}',4),
(32,5,'airing_time','timestamp','Airing Time',0,1,1,1,1,1,'{}',5),
(34,5,'video','file','Video',0,1,1,1,1,1,'{}',7),
(35,5,'series_id','select_dropdown','Series Id',1,1,1,1,1,1,'{\"relationship\":{\"key\":\"id\",\"label\":\"title\"}}',8),
(36,5,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',9),
(37,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',10),
(38,5,'total_likes','text','Total Likes',1,1,1,1,0,1,'{}',11),
(39,5,'total_dislikes','text','Total Dislikes',1,1,1,0,0,1,'{}',12),
(40,5,'thumb','image','Thumb',0,1,1,1,1,1,'{\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"140\",\"height\":\"200\"}}]}',6);

/*Table structure for table `data_types` */

DROP TABLE IF EXISTS `data_types`;

CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_types` */

insert  into `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) values 
(1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2020-07-04 13:52:49','2020-07-04 13:52:49'),
(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2020-07-04 13:52:49','2020-07-04 13:52:49'),
(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2020-07-04 13:52:49','2020-07-04 13:52:49'),
(4,'series','series','Series','Series',NULL,'App\\Series',NULL,NULL,NULL,1,0,'{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2020-07-04 13:57:14','2020-07-04 13:57:14'),
(5,'episodes','episodes','Episode','Episodes',NULL,'App\\Episode',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-07-04 14:04:16','2020-07-04 15:21:28');

/*Table structure for table `episode_likes` */

DROP TABLE IF EXISTS `episode_likes`;

CREATE TABLE `episode_likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `episode_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `episode_likes` */

insert  into `episode_likes`(`id`,`episode_id`,`user_id`,`status`,`created_at`,`updated_at`) values 
(2,5,5,1,'2020-07-04 10:09:23','2020-07-04 10:16:10'),
(4,3,5,1,'2020-07-04 10:44:59','2020-07-04 10:45:15'),
(5,7,5,1,'2020-07-04 15:07:13','2020-07-04 15:08:20'),
(6,1,5,1,'2020-07-04 15:15:36','2020-07-04 15:15:36');

/*Table structure for table `episodes` */

DROP TABLE IF EXISTS `episodes`;

CREATE TABLE `episodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `airing_time` timestamp NULL DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `series_id` int(11) NOT NULL,
  `total_likes` int(11) NOT NULL DEFAULT 0,
  `total_dislikes` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `episodes` */

insert  into `episodes`(`id`,`title`,`description`,`duration`,`airing_time`,`thumb`,`video`,`series_id`,`total_likes`,`total_dislikes`,`created_at`,`updated_at`) values 
(1,'prison break e3','89','89','2020-04-06 18:14:00','episodes\\July2020\\TKEkOr8p4eiSgirWTXQP.jpg','[{\"download_link\":\"episodes\\\\July2020\\\\1lm4wF0G6u25JCZ1Ab5B.mp4\",\"original_name\":\"file_example_MP4_480_1_5MG.mp4\"}]',1,1,0,'2020-07-04 15:14:00','2020-07-04 15:32:05'),
(2,'prison break e3','test','20','2020-07-03 18:18:00','episodes\\July2020\\k8XCDcPGWmDYFlRcgyMU.jpg','[]',1,0,0,'2020-07-04 15:18:00','2020-07-04 15:31:49');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `menu_items` */

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_items` */

insert  into `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) values 
(1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2020-07-04 13:52:51','2020-07-04 13:52:51','voyager.dashboard',NULL),
(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2020-07-04 13:52:51','2020-07-04 13:52:51','voyager.media.index',NULL),
(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2020-07-04 13:52:51','2020-07-04 13:52:51','voyager.users.index',NULL),
(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2020-07-04 13:52:51','2020-07-04 13:52:51','voyager.roles.index',NULL),
(5,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2020-07-04 13:52:51','2020-07-04 13:52:51',NULL,NULL),
(6,1,'Menu Builder','','_self','voyager-list',NULL,5,10,'2020-07-04 13:52:51','2020-07-04 13:52:51','voyager.menus.index',NULL),
(7,1,'Database','','_self','voyager-data',NULL,5,11,'2020-07-04 13:52:51','2020-07-04 13:52:51','voyager.database.index',NULL),
(8,1,'Compass','','_self','voyager-compass',NULL,5,12,'2020-07-04 13:52:51','2020-07-04 13:52:51','voyager.compass.index',NULL),
(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2020-07-04 13:52:51','2020-07-04 13:52:51','voyager.bread.index',NULL),
(10,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2020-07-04 13:52:51','2020-07-04 13:52:51','voyager.settings.index',NULL),
(11,1,'Hooks','','_self','voyager-hook',NULL,5,13,'2020-07-04 13:52:56','2020-07-04 13:52:56','voyager.hooks',NULL),
(12,1,'Series','','_self',NULL,NULL,NULL,15,'2020-07-04 13:57:14','2020-07-04 13:57:14','voyager.series.index',NULL),
(13,1,'Episodes','','_self',NULL,NULL,NULL,16,'2020-07-04 14:04:17','2020-07-04 14:04:17','voyager.episodes.index',NULL);

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'admin','2020-07-04 13:52:51','2020-07-04 13:52:51');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2019_08_19_000000_create_failed_jobs_table',1),
(3,'2014_10_12_100000_create_password_resets_table',2),
(7,'2016_01_01_000000_add_voyager_user_fields',4),
(8,'2016_01_01_000000_create_data_types_table',4),
(9,'2016_05_19_173453_create_menu_table',4),
(10,'2016_10_21_190000_create_roles_table',4),
(11,'2016_10_21_190000_create_settings_table',4),
(12,'2016_11_30_135954_create_permission_table',4),
(13,'2016_11_30_141208_create_permission_role_table',4),
(14,'2016_12_26_201236_data_types__add__server_side',4),
(15,'2017_01_13_000000_add_route_to_menu_items_table',4),
(16,'2017_01_14_005015_create_translations_table',4),
(17,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',4),
(18,'2017_03_06_000000_add_controller_to_data_types_table',4),
(19,'2017_04_21_000000_add_order_to_data_rows_table',4),
(20,'2017_07_05_210000_add_policyname_to_data_types_table',4),
(21,'2017_08_05_000000_add_group_to_settings_table',4),
(22,'2017_11_26_013050_add_user_role_relationship',4),
(23,'2017_11_26_015000_create_user_roles_table',4),
(24,'2018_03_11_000000_add_user_settings',4),
(25,'2018_03_14_000000_add_details_to_data_types_table',4),
(26,'2018_03_16_000000_make_settings_value_nullable',4),
(28,'2020_07_04_081002_create_tables_tv',5),
(29,'2020_07_04_134900_create_voyager_admins_table',6);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permission_role` */

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_role` */

insert  into `permission_role`(`permission_id`,`role_id`) values 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) values 
(1,'browse_admin',NULL,'2020-07-04 13:52:52','2020-07-04 13:52:52'),
(2,'browse_bread',NULL,'2020-07-04 13:52:52','2020-07-04 13:52:52'),
(3,'browse_database',NULL,'2020-07-04 13:52:52','2020-07-04 13:52:52'),
(4,'browse_media',NULL,'2020-07-04 13:52:52','2020-07-04 13:52:52'),
(5,'browse_compass',NULL,'2020-07-04 13:52:52','2020-07-04 13:52:52'),
(6,'browse_menus','menus','2020-07-04 13:52:52','2020-07-04 13:52:52'),
(7,'read_menus','menus','2020-07-04 13:52:52','2020-07-04 13:52:52'),
(8,'edit_menus','menus','2020-07-04 13:52:52','2020-07-04 13:52:52'),
(9,'add_menus','menus','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(10,'delete_menus','menus','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(11,'browse_roles','roles','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(12,'read_roles','roles','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(13,'edit_roles','roles','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(14,'add_roles','roles','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(15,'delete_roles','roles','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(16,'browse_users','users','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(17,'read_users','users','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(18,'edit_users','users','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(19,'add_users','users','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(20,'delete_users','users','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(21,'browse_settings','settings','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(22,'read_settings','settings','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(23,'edit_settings','settings','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(24,'add_settings','settings','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(25,'delete_settings','settings','2020-07-04 13:52:53','2020-07-04 13:52:53'),
(26,'browse_hooks',NULL,'2020-07-04 13:52:56','2020-07-04 13:52:56'),
(27,'browse_series','series','2020-07-04 13:57:14','2020-07-04 13:57:14'),
(28,'read_series','series','2020-07-04 13:57:14','2020-07-04 13:57:14'),
(29,'edit_series','series','2020-07-04 13:57:14','2020-07-04 13:57:14'),
(30,'add_series','series','2020-07-04 13:57:14','2020-07-04 13:57:14'),
(31,'delete_series','series','2020-07-04 13:57:14','2020-07-04 13:57:14'),
(32,'browse_episodes','episodes','2020-07-04 14:04:17','2020-07-04 14:04:17'),
(33,'read_episodes','episodes','2020-07-04 14:04:17','2020-07-04 14:04:17'),
(34,'edit_episodes','episodes','2020-07-04 14:04:17','2020-07-04 14:04:17'),
(35,'add_episodes','episodes','2020-07-04 14:04:17','2020-07-04 14:04:17'),
(36,'delete_episodes','episodes','2020-07-04 14:04:17','2020-07-04 14:04:17');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`display_name`,`created_at`,`updated_at`) values 
(1,'admin','Administrator','2020-07-04 13:52:52','2020-07-04 13:52:52'),
(2,'user','Normal User','2020-07-04 13:52:52','2020-07-04 13:52:52');

/*Table structure for table `series` */

DROP TABLE IF EXISTS `series`;

CREATE TABLE `series` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `airing_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `series` */

insert  into `series`(`id`,`title`,`description`,`airing_time`,`created_at`,`updated_at`) values 
(1,'Prison Break S1','What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?','2020-07-02 13:18:51','2020-07-04 11:18:57','2020-07-04 11:19:00'),
(10,'Breaking Bad S2',NULL,'2020-07-07 16:10:16','2020-07-04 16:10:20',NULL),
(11,'Dark S4',NULL,'2020-07-04 16:12:47','2020-07-04 16:12:50',NULL),
(12,'Arrow S1',NULL,'2020-07-04 16:13:03','2020-07-04 16:13:06',NULL),
(13,'The Flash S1',NULL,'2020-07-04 16:13:17','2020-07-04 16:13:19',NULL),
(14,'Gotham S5',NULL,'2020-07-11 16:13:56',NULL,NULL);

/*Table structure for table `series_followings` */

DROP TABLE IF EXISTS `series_followings`;

CREATE TABLE `series_followings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `series_followings` */

insert  into `series_followings`(`id`,`series_id`,`user_id`,`status`,`created_at`,`updated_at`) values 
(1,1,5,0,'2020-07-04 12:38:32','2020-07-04 15:17:06');

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) values 
(1,'site.title','Site Title','Site Title','','text',1,'Site'),
(2,'site.description','Site Description','Site Description','','text',2,'Site'),
(3,'site.logo','Site Logo','','','image',3,'Site'),
(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),
(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),
(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),
(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),
(8,'admin.loader','Admin Loader','','','image',3,'Admin'),
(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),
(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');

/*Table structure for table `translations` */

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `translations` */

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_roles` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`role_id`,`name`,`email`,`avatar`,`email_verified_at`,`password`,`remember_token`,`settings`,`created_at`,`updated_at`,`image`) values 
(5,NULL,'abdullah','abdullah@wewebit.com','users/default.png',NULL,'$2y$10$meI3Ks6eMVbTjKAQxemK4uRTSPK3Bx17m/YWYNNDGUy.fOMNQaKRS',NULL,NULL,'2020-07-04 08:07:25','2020-07-04 08:07:25','1593850045.jpg');

/*Table structure for table `voyager_users` */

DROP TABLE IF EXISTS `voyager_users`;

CREATE TABLE `voyager_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voyager_users_email_unique` (`email`),
  KEY `voyager_users_role_id_foreign` (`role_id`),
  CONSTRAINT `voyager_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `voyager_users` */

insert  into `voyager_users`(`id`,`name`,`email`,`password`,`avatar`,`role_id`,`settings`,`created_at`,`updated_at`) values 
(1,'admin','your@email.com','$2y$10$AXcPjfbDebiyizGXEP7Lle1XaxlPsofHcmMK9K8lTO51ghdKuxd5C','users/default.png',1,NULL,'2020-07-04 16:14:21','2020-07-04 16:14:21');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
