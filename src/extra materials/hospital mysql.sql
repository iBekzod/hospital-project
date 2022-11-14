-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.24 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6376
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for hospital
CREATE DATABASE IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;

-- Dumping structure for table hospital.appointments
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('proposed','pending','booked','arrived','fulfilled','cancelled','noshow','entered-in-error','checked-in','waitlist') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'proposed',
  `participant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `performer` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.appointments: ~4 rows (approximately)
DELETE FROM `appointments`;
INSERT INTO `appointments` (`id`, `identifier`, `status`, `participant`, `performer`) VALUES
	('181c37be-d2ca-4f5a-856b-68e029539bfd', 'e3bffc09-3e43-46d4-9680-f314588867a0', 'proposed', 'Practitioner/e84abf7e-13dc-11ed-a75f-d45d646bc9f2,Patient/1bde98b0-13dd-11ed-9c13-d45d646bc9f2', 'd3880af0-13c9-11ed-907a-d45d646bc9f2'),
	('2ecb8e6b-9ee7-4e74-8051-48c1ac4f721b', '7df295b6-7897-4365-9312-6d5d65433bea', 'proposed', 'Practitioner/e84abf7e-13dc-11ed-a75f-d45d646bc9f2,Patient/1bde98b0-13dd-11ed-9c13-d45d646bc9f2', 'd3880af0-13c9-11ed-907a-d45d646bc9f2'),
	('379d9e3c-1c6e-40d5-8059-1d81db620eeb', '4c7faab5-dd88-42e5-9446-e40eec61ae9d', 'arrived', 'Practitioner/e84abf7e-13dc-11ed-a75f-d45d646bc9f2,Patient/1bde98b0-13dd-11ed-9c13-d45d646bc9f2', 'd3880af0-13c9-11ed-907a-d45d646bc9f2'),
	('4d208528-f2ff-48a7-9120-3c7cc2012402', 'aa38edf5-49c3-40a7-b91e-0d9a704324ee', 'proposed', 'Practitioner/e84abf7e-13dc-11ed-a75f-d45d646bc9f2,Patient/1bde98b0-13dd-11ed-9c13-d45d646bc9f2', 'd3880af0-13c9-11ed-907a-d45d646bc9f2'),
	('6502e4a2-8af5-41a5-ad0e-c317e0dc460f', '8a7a396c-0b92-4f7e-87ae-91ddb0785eba', 'proposed', 'Practitioner/e84abf7e-13dc-11ed-a75f-d45d646bc9f2,Patient/1bde98b0-13dd-11ed-9c13-d45d646bc9f2', 'd3880af0-13c9-11ed-907a-d45d646bc9f2'),
	('6780bf2e-b77d-4fc1-bcaf-04128267b33a', 'db313b72-a4f2-45a9-8fb5-acc571801f1e', 'arrived', 'Practitioner/e84abf7e-13dc-11ed-a75f-d45d646bc9f2,Patient/1bde98b0-13dd-11ed-9c13-d45d646bc9f2', 'd3880af0-13c9-11ed-907a-d45d646bc9f2'),
	('8943a09f-9bdd-45fe-948e-506f2b08bdaf', '468a844e-b18f-4b10-b4fb-a60f4a66e8c5', 'proposed', 'Practitioner/e84abf7e-13dc-11ed-a75f-d45d646bc9f2,Patient/1bde98b0-13dd-11ed-9c13-d45d646bc9f2', 'd3880af0-13c9-11ed-907a-d45d646bc9f2');

-- Dumping structure for table hospital.errors
CREATE TABLE IF NOT EXISTS `errors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.errors: ~0 rows (approximately)
DELETE FROM `errors`;
INSERT INTO `errors` (`id`, `timestamp`, `description`, `status`, `title`) VALUES
	(1, '2022-11-14 09:04:07', NULL, '400', 'Resource Error. Indicates the request contains invalid format/values in input.'),
	(2, '2022-11-14 09:05:06', NULL, '400', 'Resource Error. Indicates the request contains invalid format/values in input.'),
	(3, '2022-11-14 09:06:02', NULL, '400', 'Resource Error. Indicates the request contains invalid format/values in input.'),
	(4, '2022-11-14 09:09:13', NULL, '400', 'Resource Error. Indicates the request contains invalid format/values in input.'),
	(5, '2022-11-14 09:09:15', NULL, '400', 'Resource Error. Indicates the request contains invalid format/values in input.'),
	(6, '2022-11-14 09:20:16', NULL, '400', 'Resource Error. Indicates the request contains invalid format/values in input.'),
	(7, '2022-11-14 09:21:02', NULL, '400', 'Resource Error. Indicates the request contains invalid format/values in input.'),
	(8, '2022-11-14 09:31:00', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(9, '2022-11-14 09:40:59', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(10, '2022-11-14 09:41:52', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(11, '2022-11-14 09:42:07', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(12, '2022-11-14 09:42:19', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(13, '2022-11-14 10:58:19', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(14, '2022-11-14 10:58:19', '#0 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(259): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\app\\Http\\Controllers\\API\\AppointmentController.php(130): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): App\\Http\\Controllers\\Api\\AppointmentController->update()\n#3 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction()\n#4 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(260): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#5 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#6 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(727): Illuminate\\Routing\\Route->run()\n#7 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#8 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#10 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\ThrottleRequests.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#11 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\ThrottleRequests.php(102): Illuminate\\Routing\\Middleware\\ThrottleRequests->handleRequest()\n#12 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\ThrottleRequests.php(54): Illuminate\\Routing\\Middleware\\ThrottleRequests->handleRequestUsingNamedLimiter()\n#13 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\ThrottleRequests->handle()\n#14 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Auth\\Middleware\\Authenticate.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Auth\\Middleware\\Authenticate->handle()\n#16 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(728): Illuminate\\Pipeline\\Pipeline->then()\n#18 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(705): Illuminate\\Routing\\Router->runRouteWithinStack()\n#19 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(669): Illuminate\\Routing\\Router->runRoute()\n#20 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Router->dispatchToRoute()\n#21 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Illuminate\\Routing\\Router->dispatch()\n#22 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#23 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#25 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle()\n#26 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\TrimStrings.php(40): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#28 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle()\n#29 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#30 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle()\n#31 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#32 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#33 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Middleware\\HandleCors.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#34 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Http\\Middleware\\HandleCors->handle()\n#35 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Middleware\\TrustProxies.php(39): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#36 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Http\\Middleware\\TrustProxies->handle()\n#37 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#39 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#40 D:\\installs\\OpenServer\\domains\\hospital-app\\src\\public\\index.php(52): Illuminate\\Foundation\\Http\\Kernel->handle()\n#41 {main}', '502', 'System Error. One or more services are not available.'),
	(15, '2022-11-14 10:59:15', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(16, '2022-11-14 10:59:46', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(17, '2022-11-14 11:00:10', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(18, '2022-11-14 11:00:17', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(19, '2022-11-14 11:01:10', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(20, '2022-11-14 11:01:11', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(21, '2022-11-14 11:01:11', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.'),
	(22, '2022-11-14 11:01:11', NULL, '401', 'The resource owner or authorization server denied the request because access token is invalid.');

-- Dumping structure for table hospital.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table hospital.identifiers
CREATE TABLE IF NOT EXISTS `identifiers` (
  `use` enum('usual','official','temp','secondary','old (If known)') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'usual',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.identifiers: ~4 rows (approximately)
DELETE FROM `identifiers`;
INSERT INTO `identifiers` (`use`, `type`, `system`, `value`, `period`, `assigner`) VALUES
	('secondary', 'RI', 'http://some-company.uz', '468a844e-b18f-4b10-b4fb-a60f4a66e8c5', '32b25d87-6e4f-4d86-8c18-4fffcba2eb0b', 'SomeCompany LLC'),
	('secondary', 'RI', 'http://some-company.uz', '4c7faab5-dd88-42e5-9446-e40eec61ae9d', '79e85482-e795-40d1-bf4c-28c32d7a6835', 'SomeCompany LLC'),
	('secondary', 'RI', 'http://some-company.uz', '7df295b6-7897-4365-9312-6d5d65433bea', 'f663dca3-18c0-4a50-9f19-d13de0d5a54f', 'SomeCompany LLC'),
	('secondary', 'RI', 'http://some-company.uz', '8a7a396c-0b92-4f7e-87ae-91ddb0785eba', 'bfb45a59-7367-455c-965f-b6cec17370bd', 'SomeCompany LLC'),
	('secondary', 'RI', 'http://some-company.uz', 'aa38edf5-49c3-40a7-b91e-0d9a704324ee', '470f18af-d863-4c93-8698-3b576df5981a', 'SomeCompany LLC'),
	('secondary', 'RI', 'http://some-company.uz', 'db313b72-a4f2-45a9-8fb5-acc571801f1e', '70a9c938-7030-44a0-9baf-9e7818121101', 'SomeCompany LLC'),
	('secondary', 'RI', 'http://some-company.uz', 'e3bffc09-3e43-46d4-9680-f314588867a0', 'c07bee3e-cf37-40e1-8686-8c20d33eb49f', 'SomeCompany LLC');

-- Dumping structure for table hospital.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(10, '2022_11_11_115436_create_errors_table', 1),
	(11, '2022_11_11_115437_create_organizations_table', 1),
	(12, '2022_11_11_115438_create_practitioners_table', 1),
	(13, '2022_11_11_115439_create_patients_table', 1),
	(14, '2022_11_11_115440_create_periods_table', 1),
	(15, '2022_11_11_115441_create_identifiers_table', 1),
	(16, '2022_11_11_115442_create_appointments_table', 1);

-- Dumping structure for table hospital.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.oauth_access_tokens: ~2 rows (approximately)
DELETE FROM `oauth_access_tokens`;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('96eb57fc6b0cd0ff0292984d14559a4a1e1f99bf79d7147850a0af00b11baed5101499cb3b664db5', 1, 1, 'authToken', '[]', 0, '2022-11-14 07:02:58', '2022-11-14 07:02:58', '2023-11-14 12:02:58'),
	('d802fb942ca8a2e83a4617bb2bc48a2d9268dd38731da9dcc11b26f6272140cfc9e0b25991ff6214', 1, 1, 'authToken', '[]', 1, '2022-11-14 09:06:01', '2022-11-14 09:06:03', '2023-11-14 14:06:01'),
	('d9770d7168ce5e352d52a7dcf522089deb9120f79cd38580e92932ada462affda9b87cb4479f1b12', 4, 1, 'authToken', '[]', 1, '2022-11-14 11:01:10', '2022-11-14 11:01:10', '2023-11-14 16:01:10'),
	('e06368bd1fc64459a4138869a050cb18e70c58a98b12cc1e0f1e99ce6dbb02d36b62f44e6c6fd923', 3, 1, 'authToken', '[]', 0, '2022-11-14 09:06:01', '2022-11-14 09:06:01', '2023-11-14 14:06:01'),
	('f2cd60bb71b0c0508347e72ded22ab1ffc1993fbccebe3aecbf1c17f94acd6c377f4bcf1a737c370', 1, 1, 'authToken', '[]', 0, '2022-11-14 11:01:12', '2022-11-14 11:01:12', '2023-11-14 16:01:12'),
	('f7209540da8f171123b3ac015265f87b365ba1ee32c6897782afcd04b70eb94791ac342fb978e7b2', 2, 1, 'authToken', '[]', 1, '2022-11-14 07:05:02', '2022-11-14 07:05:31', '2023-11-14 12:05:02');

-- Dumping structure for table hospital.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.oauth_auth_codes: ~0 rows (approximately)
DELETE FROM `oauth_auth_codes`;

-- Dumping structure for table hospital.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.oauth_clients: ~2 rows (approximately)
DELETE FROM `oauth_clients`;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'mwJb772XydkgLohLTrSKTkdgdBxK3EvkVHcqnb4s', NULL, 'http://localhost', 1, 0, 0, '2022-11-14 07:02:51', '2022-11-14 07:02:51'),
	(2, NULL, 'Laravel Password Grant Client', 'TESIy60aiQ4jjKtLfoVIbZzPmIj8WEg5gCw7bBww', 'users', 'http://localhost', 0, 1, 0, '2022-11-14 07:02:52', '2022-11-14 07:02:52');

-- Dumping structure for table hospital.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.oauth_personal_access_clients: ~1 rows (approximately)
DELETE FROM `oauth_personal_access_clients`;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2022-11-14 07:02:52', '2022-11-14 07:02:52');

-- Dumping structure for table hospital.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.oauth_refresh_tokens: ~0 rows (approximately)
DELETE FROM `oauth_refresh_tokens`;

-- Dumping structure for table hospital.organizations
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.organizations: ~0 rows (approximately)
DELETE FROM `organizations`;

-- Dumping structure for table hospital.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table hospital.patients
CREATE TABLE IF NOT EXISTS `patients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.patients: ~0 rows (approximately)
DELETE FROM `patients`;

-- Dumping structure for table hospital.periods
CREATE TABLE IF NOT EXISTS `periods` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.periods: ~4 rows (approximately)
DELETE FROM `periods`;
INSERT INTO `periods` (`id`, `start`, `end`) VALUES
	('32b25d87-6e4f-4d86-8c18-4fffcba2eb0b', '2022-05-18 00:00:00', NULL),
	('470f18af-d863-4c93-8698-3b576df5981a', '2022-05-18 00:00:00', NULL),
	('70a9c938-7030-44a0-9baf-9e7818121101', '2022-05-18 00:00:00', NULL),
	('79e85482-e795-40d1-bf4c-28c32d7a6835', '2022-05-18 00:00:00', NULL),
	('bfb45a59-7367-455c-965f-b6cec17370bd', '2022-05-18 00:00:00', NULL),
	('c07bee3e-cf37-40e1-8686-8c20d33eb49f', '2022-05-18 00:00:00', NULL),
	('f663dca3-18c0-4a50-9f19-d13de0d5a54f', '2022-05-18 00:00:00', NULL);

-- Dumping structure for table hospital.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table hospital.practitioners
CREATE TABLE IF NOT EXISTS `practitioners` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.practitioners: ~0 rows (approximately)
DELETE FROM `practitioners`;

-- Dumping structure for table hospital.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hospital.users: ~2 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `unique_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'f888ce4c-3406-46d3-95b0-fd38fc963b40', 'Art47', 'Mona_Rutherford70@gmail.com', NULL, '$2y$10$rJdPxkYdWx.YCA3qE/QZeOfWwl7p.kOvoOvr5zcDhcT3fzantzBqe', NULL, '2022-11-14 06:57:49', '2022-11-14 06:57:49'),
	(2, 'f99c2183-1170-4a7a-a50b-cc1505bfbd45', 'Myah.Purdy73', 'Frederik_Koss@hotmail.com', NULL, '$2y$10$i0nhDdrt1aSiuqYKOyF3xu9UN6FyLCU44b.EiiWw9kpJjW5ZNSbMe', NULL, '2022-11-14 07:05:02', '2022-11-14 07:05:02'),
	(3, '123f9b5a-1f07-4825-8af6-500a576e7b24', 'Estefania0', 'Ignatius_Kuphal55@hotmail.com', NULL, '$2y$10$07/Ap6Dot0l4y2/CWuB1oOEkBJ5TVsbSL.QC86yfTq/WSLnRDNmPO', NULL, '2022-11-14 09:06:00', '2022-11-14 09:06:00'),
	(4, '0224d0bb-27c8-4d9f-af5b-13d69898bdc2', 'Ona_Runolfsdottir', 'Neoma17@gmail.com', NULL, '$2y$10$nHUU4zwF2svd7XpPPrcW7./Qps2aT9hu/nOrS6NfZG.B0WtSvVDpO', NULL, '2022-11-14 11:01:10', '2022-11-14 11:01:10');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
