-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 20, 2023 at 12:28 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sso`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_15_092027_create_roles_table', 1),
(6, '2022_01_15_092123_create_privileges_table', 1),
(7, '2022_01_15_092347_create_role_privilege_table', 1),
(8, '2022_01_17_020918_create_posts_table', 1),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(12, '2016_06_01_000004_create_oauth_clients_table', 2),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(18, '2023_04_16_075033_create_table_usermenu_table', 3),
(19, '2023_04_16_075536_create_table_access_menu_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('5ed532673cd2f29b91b72458128956e4b1ac79b78276419a97e45be5eb6039e4b09ac44a54864737', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 07:32:49', '2023-04-15 07:32:49', '2024-04-15 14:32:49'),
('de35d850c480273d971dc6604e48141f46ad2ab406023f64a5028fc3ab36497eff4c486f3b4d95ca', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 07:33:15', '2023-04-15 07:33:15', '2024-04-15 14:33:15'),
('a51082b564462fc738ad75cdc5916e07aacf64c591d349e1662a61ea127c5ac269ee6435c4c3d803', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 08:14:48', '2023-04-15 08:14:48', '2024-04-15 15:14:48'),
('e3b26710e6b5f5698063434abbd649175879ba96d803c3fe32f77478f03b702f84cc8fdcb60183c9', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 08:14:52', '2023-04-15 08:14:52', '2024-04-15 15:14:52'),
('bc8c04d88d8d5919c58a49366271f0d31a20b3e54af0ecf48209573db4475bffe9e69baaff17930e', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 20:39:12', '2023-04-15 20:39:12', '2024-04-16 03:39:12'),
('53576c4f41d87e8fb48115d3997575e324212ae6a14297ee205c5d6348b2d2805979d016eca06a5a', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 20:51:28', '2023-04-15 20:51:28', '2024-04-16 03:51:28'),
('72e7f017e6574078d709aec5d9c1fd9ff2f50e79199b3e7a0fa26a895b3398cca1cdef532f869765', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 20:55:43', '2023-04-15 20:55:43', '2024-04-16 03:55:43'),
('1c1b85257ac8d19919c8bfca45a043f35c71dcdfa1d372bec48278f62b1c84a25e42237f0b2c8ddd', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 21:26:45', '2023-04-15 21:26:45', '2024-04-16 04:26:45'),
('0354cd81493927557bd0160e37edac13ef2f88312374db5ef92a166279340cd95c9519cec5b46e6c', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 21:31:07', '2023-04-15 21:31:07', '2024-04-16 04:31:07'),
('76a04c82be9eade97bdc8bd2883b99820569f59bb79a8befe7a966d3fea04d71b13bf73a157d0c33', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 21:45:15', '2023-04-15 21:45:15', '2024-04-16 04:45:15'),
('ca485453a719da320faf1006b8706c89aef7e7d4cad7a0a2a6db1df184109eaf23ca7ae8e7f99148', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 23:54:33', '2023-04-15 23:54:33', '2024-04-16 06:54:33'),
('458cd5c6dc5f715ba8bf3c6dfdbc6ceff5e12f28770871ca5492e55e56b737c29872412caf52f348', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-04-29 06:03:13', '2023-04-29 06:03:13', '2024-04-29 13:03:13'),
('4414a7028a4e85bc2626ee4f690df8364407bd5671556dc30328b39f8dd2d7c5fe3361da9a1127fe', 1, 1, 'LaravelAuthApp', '[]', 0, '2023-05-09 05:23:38', '2023-05-09 05:23:38', '2024-05-09 12:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'XnvwVpyPZNzskk1YZ6rRypNqK6uG5C5okuyU5HDV', NULL, 'http://localhost', 1, 0, 0, '2023-04-15 05:26:28', '2023-04-15 05:26:28'),
(2, NULL, 'Laravel Password Grant Client', 'xs2M5YDvfB2yR4lgyvxtJwlbTG3urzbmTnpUMJ03', 'users', 'http://localhost', 0, 1, 0, '2023-04-15 05:26:28', '2023-04-15 05:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-15 05:26:28', '2023-04-15 05:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `image` text NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_title_unique` (`title`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `body`, `image`, `publish`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Nulla quasi earum laboriosam ad architecto recusandae ipsam.', 'nulla-quasi-earum-laboriosam-ad-architecto-recusandae-ipsam', 'A eum est vitae quia eum laboriosam magnam. Similique veritatis molestias harum sed similique. Quas eos velit itaque dolorem. Aut eos aspernatur consequatur molestiae.', 'https://via.placeholder.com/640x480.png/00cc22?text=cats+magnam', 1, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(2, 1, 'Eveniet ab aliquid enim ducimus cumque deserunt laborum.', 'eveniet-ab-aliquid-enim-ducimus-cumque-deserunt-laborum', 'Voluptatibus blanditiis nostrum consequatur. Labore et sit dolorum enim ab ad. Dolorem ducimus aliquam consectetur ducimus pariatur. Itaque eius fugiat odio.', 'https://via.placeholder.com/640x480.png/001100?text=cats+architecto', 1, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(3, 1, 'Occaecati voluptas ut occaecati non.', 'occaecati-voluptas-ut-occaecati-non', 'Omnis voluptas eos a aut dolorum soluta modi. Beatae hic iure quos sint aperiam doloremque. Quaerat optio maiores fuga reprehenderit. Aliquid dolorem repudiandae officia dolores omnis.', 'https://via.placeholder.com/640x480.png/0033aa?text=cats+necessitatibus', 1, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(4, 3, 'Facilis quia quia omnis soluta et voluptatum ut.', 'facilis-quia-quia-omnis-soluta-et-voluptatum-ut', 'Ut perferendis quae dolorem quis animi. Quas blanditiis est quidem amet ratione. Quisquam voluptatibus accusantium asperiores ducimus maiores asperiores. Ad neque ipsum repudiandae.', 'https://via.placeholder.com/640x480.png/00ee00?text=cats+voluptates', 1, '2023-04-14 18:23:29', '2023-04-14 18:21:00', '2023-04-14 18:23:29'),
(5, 3, 'Alias quaerat id fugiat maiores laborum rerum.', 'alias-quaerat-id-fugiat-maiores-laborum-rerum', 'Necessitatibus illo soluta adipisci voluptatem hic illum est. Ut asperiores quo tempora aut. Reprehenderit voluptate atque magnam nulla.', 'https://via.placeholder.com/640x480.png/00ccbb?text=cats+modi', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(6, 2, 'Omnis sequi iure atque omnis qui blanditiis quidem sint.', 'omnis-sequi-iure-atque-omnis-qui-blanditiis-quidem-sint', 'Necessitatibus animi explicabo consequatur nesciunt. Facilis quia id non ut. Ipsa ipsa mollitia dolor quaerat eaque.', 'https://via.placeholder.com/640x480.png/0055bb?text=cats+et', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(7, 1, 'Quia neque qui et neque.', 'quia-neque-qui-et-neque', 'Consequatur nihil ea dolores doloribus earum est. Quo deserunt sed eius et. Quod placeat a unde voluptatem. Ipsam qui aut odit repellendus dolore.', 'https://via.placeholder.com/640x480.png/006655?text=cats+in', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(8, 3, 'Possimus tempore possimus sit placeat labore.', 'possimus-tempore-possimus-sit-placeat-labore', 'Repudiandae et enim sint fugit voluptatem enim commodi. Beatae quos consequatur ad est qui dicta eos. Eum sint magnam odit nostrum maiores.', 'https://via.placeholder.com/640x480.png/0055aa?text=cats+dolor', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(9, 3, 'In iste et autem non enim.', 'in-iste-et-autem-non-enim', 'Aut eligendi fugit quae officiis. Rem ut enim officiis. Beatae quia velit iste quaerat natus eius repellendus.', 'https://via.placeholder.com/640x480.png/003399?text=cats+fugiat', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(10, 1, 'Dolorem minima et enim non amet quo ab.', 'dolorem-minima-et-enim-non-amet-quo-ab', 'At harum esse non debitis laborum assumenda sequi. Et et magni voluptas voluptates quia. Quis animi nihil nulla quia ut facilis sint. Rerum voluptate facere sapiente qui illo quis.', 'https://via.placeholder.com/640x480.png/0055ff?text=cats+beatae', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(11, 3, 'Consequatur doloribus harum corporis dolores in.', 'consequatur-doloribus-harum-corporis-dolores-in', 'Distinctio in id aliquid voluptatem. Tenetur aut consequatur iste facere ad. Ducimus cum tempora vitae impedit numquam deleniti reprehenderit. Soluta quis iste adipisci ipsam doloremque.', 'https://via.placeholder.com/640x480.png/00aacc?text=cats+numquam', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(12, 2, 'Facere nam ut vero voluptas exercitationem.', 'facere-nam-ut-vero-voluptas-exercitationem', 'Ut et consequatur esse nobis accusamus quod. Sed hic reiciendis ut accusantium nesciunt dolor. Est non eaque porro doloribus alias atque. Sit aperiam quibusdam mollitia vel necessitatibus.', 'https://via.placeholder.com/640x480.png/00dd88?text=cats+quo', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(13, 2, 'Unde odio dolor iusto consequuntur nostrum assumenda.', 'unde-odio-dolor-iusto-consequuntur-nostrum-assumenda', 'Commodi maiores perspiciatis aspernatur nihil voluptatem molestiae aut autem. Ut voluptatibus provident ut repellat. Possimus corrupti alias deserunt vero.', 'https://via.placeholder.com/640x480.png/00bbcc?text=cats+dolorem', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(14, 3, 'Consectetur consequatur et sit est perferendis.', 'consectetur-consequatur-et-sit-est-perferendis', 'Quas quasi odio ut repudiandae voluptatibus nisi sed eaque. Sapiente aliquid maxime voluptatum qui. Deleniti dolor adipisci harum qui vel qui. Illo et eum ipsam expedita ea.', 'https://via.placeholder.com/640x480.png/00ee77?text=cats+modi', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(15, 2, 'Provident similique saepe quaerat consectetur dicta.', 'provident-similique-saepe-quaerat-consectetur-dicta', 'In rerum corrupti eum saepe asperiores eum. Dolore numquam ea asperiores voluptatem maxime illum. Eaque magni molestiae fugiat tenetur tenetur nisi adipisci.', 'https://via.placeholder.com/640x480.png/002288?text=cats+et', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(16, 1, 'Et aspernatur voluptatem voluptas non vitae quo assumenda.', 'et-aspernatur-voluptatem-voluptas-non-vitae-quo-assumenda', 'Doloribus error aliquam ea tempore omnis. Quibusdam vero incidunt enim. Possimus dolorem qui in temporibus id architecto voluptatem. Dolores nemo cumque porro consequuntur culpa.', 'https://via.placeholder.com/640x480.png/00ff22?text=cats+laboriosam', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(17, 1, 'Et assumenda aut at voluptates cupiditate.', 'et-assumenda-aut-at-voluptates-cupiditate', 'Non nostrum est rerum minima illum. Rerum sunt voluptatem in consequatur non. Veniam cumque illum nobis cumque commodi dolor quia quo.', 'https://via.placeholder.com/640x480.png/001111?text=cats+tempore', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(18, 1, 'Nostrum ut excepturi ut est in a.', 'nostrum-ut-excepturi-ut-est-in-a', 'Voluptatem rerum nulla nulla consequuntur. Voluptas voluptas aliquid cupiditate in ducimus. Itaque aliquam et eos a voluptates.', 'https://via.placeholder.com/640x480.png/0099bb?text=cats+magni', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(19, 3, 'Aliquid minima et accusamus vero culpa.', 'aliquid-minima-et-accusamus-vero-culpa', 'Nihil soluta vitae exercitationem est et deleniti. Aut voluptas maiores dicta voluptas recusandae corporis. Odio sunt fugit ipsa sed. Nihil dolor enim est quo.', 'https://via.placeholder.com/640x480.png/00ccff?text=cats+tempore', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(20, 1, 'Impedit dolores illo quis error odit.', 'impedit-dolores-illo-quis-error-odit', 'Laborum quisquam sit iste voluptate omnis eum quibusdam. Nam error quia blanditiis soluta in rem libero. Repellat voluptatibus qui facere dolorem.', 'https://via.placeholder.com/640x480.png/000044?text=cats+voluptatibus', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(21, 1, 'Hic ex et beatae neque in itaque qui.', 'hic-ex-et-beatae-neque-in-itaque-qui', 'Quam et doloremque id molestiae et. Omnis quisquam harum et.', 'https://via.placeholder.com/640x480.png/001111?text=cats+esse', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(22, 1, 'Alias consequuntur nemo illum consequatur voluptatem esse dolorum.', 'alias-consequuntur-nemo-illum-consequatur-voluptatem-esse-dolorum', 'Voluptas aliquid praesentium blanditiis reiciendis et architecto tempore magni. Laborum dolorum minus aspernatur modi nihil omnis dolorum. Odit animi ea illum quia earum consectetur fuga aliquid.', 'https://via.placeholder.com/640x480.png/00bb77?text=cats+amet', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(23, 2, 'Sunt a sed tempora velit.', 'sunt-a-sed-tempora-velit', 'Ea quis nostrum expedita provident sint. Et dolorum consequatur fugiat qui. Possimus dolore sint et aut rerum. Aut quo iure iste.', 'https://via.placeholder.com/640x480.png/00bb99?text=cats+dolore', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(24, 3, 'Ut quod asperiores in veritatis provident commodi.', 'ut-quod-asperiores-in-veritatis-provident-commodi', 'Omnis saepe commodi omnis voluptas. Dolore architecto qui qui harum. Maxime eveniet eum cumque ipsum quis explicabo.', 'https://via.placeholder.com/640x480.png/008855?text=cats+assumenda', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(25, 1, 'Harum qui rem et.', 'harum-qui-rem-et', 'Delectus quasi ducimus sint molestias. Consequatur unde veritatis enim minima odio. Et assumenda pariatur quo quia blanditiis similique.', 'https://via.placeholder.com/640x480.png/005599?text=cats+aut', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(26, 3, 'Nihil minima consectetur sed consectetur aut dignissimos est.', 'nihil-minima-consectetur-sed-consectetur-aut-dignissimos-est', 'Porro nobis quis explicabo ipsum blanditiis excepturi omnis. Voluptatem animi soluta corrupti non eius explicabo sint. Veritatis est qui qui earum consectetur.', 'https://via.placeholder.com/640x480.png/004444?text=cats+dolores', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(27, 2, 'Eveniet quia error consequuntur repudiandae sunt rerum minima.', 'eveniet-quia-error-consequuntur-repudiandae-sunt-rerum-minima', 'Sit quae minima qui numquam ea. Reprehenderit sed fugiat soluta accusamus tenetur adipisci aut. Delectus similique tempora et qui earum cumque sed laborum. Consequatur neque mollitia mollitia.', 'https://via.placeholder.com/640x480.png/00aa22?text=cats+ratione', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(28, 1, 'Temporibus magni voluptas et odio veniam esse.', 'temporibus-magni-voluptas-et-odio-veniam-esse', 'Placeat facilis illo officia ut temporibus sunt. Suscipit maxime voluptatem perferendis ipsam nulla consequatur necessitatibus. Inventore ut minima iste quam. Rerum nobis soluta nihil sit aut nisi.', 'https://via.placeholder.com/640x480.png/00dd11?text=cats+perferendis', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(29, 2, 'Perferendis sequi magnam quas quaerat illo.', 'perferendis-sequi-magnam-quas-quaerat-illo', 'Facere odio consectetur debitis id molestiae dolor. Voluptas cumque nobis quasi iusto aliquam dolore rerum. Ipsam est dolorem sit recusandae molestiae est et amet.', 'https://via.placeholder.com/640x480.png/007733?text=cats+dolores', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(30, 2, 'Est qui id ea aut.', 'est-qui-id-ea-aut', 'Voluptas vel blanditiis quia fugit necessitatibus. Amet expedita cum consequatur amet aliquid harum officiis. In error nulla corporis.', 'https://via.placeholder.com/640x480.png/0066dd?text=cats+omnis', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(31, 1, 'Architecto blanditiis iste ut exercitationem odio maxime.', 'architecto-blanditiis-iste-ut-exercitationem-odio-maxime', 'Vel qui consectetur quisquam est est. Vitae exercitationem aut dolor omnis qui sint quia. Corrupti error minus in illum adipisci tempore pariatur.', 'https://via.placeholder.com/640x480.png/00ee33?text=cats+amet', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(32, 1, 'Debitis aut unde et minus.', 'debitis-aut-unde-et-minus', 'Quia totam cumque eum ut. Rerum facilis aliquam assumenda dolorem eveniet necessitatibus aliquam. Minus ea quasi consectetur nam. Sed tempora quibusdam eveniet ut aspernatur.', 'https://via.placeholder.com/640x480.png/00ccee?text=cats+aut', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(33, 1, 'Tenetur molestiae aperiam laudantium ut et repudiandae.', 'tenetur-molestiae-aperiam-laudantium-ut-et-repudiandae', 'Qui placeat nam vel quia et iusto mollitia. Ducimus nulla molestias consequuntur eum eos. Numquam voluptatem sint illo illum mollitia eligendi optio.', 'https://via.placeholder.com/640x480.png/0066cc?text=cats+perspiciatis', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(34, 3, 'Ut fuga ad et distinctio sunt impedit.', 'ut-fuga-ad-et-distinctio-sunt-impedit', 'Et odio totam et voluptatum numquam. Expedita magni veniam commodi magnam. Animi nihil velit sunt omnis vel dolorum. Nam blanditiis nisi et et corporis repellendus.', 'https://via.placeholder.com/640x480.png/0055ee?text=cats+dolores', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(35, 1, 'Temporibus minima accusamus quae impedit nesciunt ea.', 'temporibus-minima-accusamus-quae-impedit-nesciunt-ea', 'Aut et voluptatem incidunt sint expedita enim fugit. Omnis temporibus laborum laudantium dolor autem. Dolorem provident modi dolore nobis.', 'https://via.placeholder.com/640x480.png/004477?text=cats+id', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(36, 3, 'Voluptatem temporibus accusantium in aliquid et ut qui.', 'voluptatem-temporibus-accusantium-in-aliquid-et-ut-qui', 'Repellendus repudiandae cum consequatur ad iste minima aliquam eum. Ut consequuntur nihil quam autem. Dicta aut dolorem dicta earum error rerum.', 'https://via.placeholder.com/640x480.png/00aa66?text=cats+recusandae', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(37, 2, 'Nostrum voluptatem ut enim consequuntur ullam reiciendis aut.', 'nostrum-voluptatem-ut-enim-consequuntur-ullam-reiciendis-aut', 'Eos ut voluptatem quaerat omnis harum fuga. Tenetur nihil officia explicabo. In adipisci ipsam sed facilis sequi suscipit. Et et quo voluptas illum dolorem voluptates eos. Quasi est et consequuntur.', 'https://via.placeholder.com/640x480.png/001144?text=cats+sunt', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(38, 1, 'Possimus nobis dolores unde voluptas aspernatur ipsum quo hic.', 'possimus-nobis-dolores-unde-voluptas-aspernatur-ipsum-quo-hic', 'Deleniti sit neque tenetur nihil alias nostrum. Commodi ducimus aliquam ut veritatis.', 'https://via.placeholder.com/640x480.png/00eeaa?text=cats+eveniet', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(39, 2, 'Quia qui et expedita.', 'quia-qui-et-expedita', 'Vel sint voluptatem aspernatur assumenda odio quasi. Rerum fugit distinctio perspiciatis sed. Consequatur qui aliquam odio dolorum. In modi facere in rem fugit et.', 'https://via.placeholder.com/640x480.png/00ccaa?text=cats+ut', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(40, 3, 'Qui cum deleniti aperiam et saepe est.', 'qui-cum-deleniti-aperiam-et-saepe-est', 'Perferendis qui rerum accusantium. Voluptatem harum voluptate ut. Reiciendis maiores consequatur eum odit non voluptas id.', 'https://via.placeholder.com/640x480.png/00ff66?text=cats+beatae', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(41, 2, 'Asperiores est optio sed soluta voluptatem.', 'asperiores-est-optio-sed-soluta-voluptatem', 'Sit ut nulla ratione. Est et velit cupiditate voluptatem reprehenderit modi. Doloribus non ipsam aspernatur eveniet beatae dolor.', 'https://via.placeholder.com/640x480.png/00dd99?text=cats+possimus', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(42, 2, 'Aut quibusdam quibusdam id ut.', 'aut-quibusdam-quibusdam-id-ut', 'Nisi sequi vel ducimus corporis occaecati explicabo voluptatem. Quo possimus rerum impedit sint repellendus ullam sint. Sunt quis error et vel.', 'https://via.placeholder.com/640x480.png/00cc22?text=cats+fugit', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(43, 1, 'Magni quam dignissimos dolore in.', 'magni-quam-dignissimos-dolore-in', 'Vitae veritatis non ipsum et odio quam qui suscipit. Saepe tempore quibusdam et ipsum voluptatibus omnis non eum. Rerum facilis molestias enim itaque totam omnis qui. Aut ipsum eos sit ut.', 'https://via.placeholder.com/640x480.png/00ddaa?text=cats+magnam', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(44, 2, 'Ea ex velit fuga architecto nobis.', 'ea-ex-velit-fuga-architecto-nobis', 'Praesentium repellendus omnis maxime similique architecto autem. Praesentium accusamus neque sunt perspiciatis. Sed ex rerum odit nisi earum et dolores.', 'https://via.placeholder.com/640x480.png/00aa99?text=cats+excepturi', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(45, 3, 'Consequuntur et earum dolor provident mollitia non.', 'consequuntur-et-earum-dolor-provident-mollitia-non', 'Repellendus modi qui culpa consequatur sapiente sit. Tempore porro itaque illo aperiam. Excepturi rerum qui omnis excepturi. Repellat maiores nemo sit ex reiciendis.', 'https://via.placeholder.com/640x480.png/0000aa?text=cats+et', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(46, 2, 'Deserunt eum quidem asperiores fugiat deserunt ex.', 'deserunt-eum-quidem-asperiores-fugiat-deserunt-ex', 'Qui alias quas iusto quia molestiae dolores expedita. Officia numquam quibusdam ut voluptatem. Atque qui dolorum magnam odio asperiores recusandae. Praesentium eum vitae nemo.', 'https://via.placeholder.com/640x480.png/0099aa?text=cats+dolor', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(47, 2, 'Incidunt vel incidunt sint.', 'incidunt-vel-incidunt-sint', 'Dicta aut doloremque est et libero sit occaecati. Eos est quo omnis quae. Omnis quo impedit expedita et.', 'https://via.placeholder.com/640x480.png/0011aa?text=cats+accusantium', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(48, 2, 'Sunt non at optio et doloremque eius.', 'sunt-non-at-optio-et-doloremque-eius', 'Minus consequuntur illo doloribus nostrum earum veritatis et. Iste eligendi odit est magni sed rerum. Dolor dicta reprehenderit qui.', 'https://via.placeholder.com/640x480.png/009944?text=cats+eveniet', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(49, 1, 'Iure facilis quibusdam et incidunt quaerat eum.', 'iure-facilis-quibusdam-et-incidunt-quaerat-eum', 'Et qui eaque libero corrupti. Eum deserunt doloremque quisquam praesentium nisi quia.', 'https://via.placeholder.com/640x480.png/00aa00?text=cats+cum', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(50, 3, 'Ut adipisci sed quia sunt consequuntur est.', 'ut-adipisci-sed-quia-sunt-consequuntur-est', 'In ipsam ut ipsa quae. Iste quia repudiandae non perferendis illum et. Enim perferendis sit autem quo animi minima.', 'https://via.placeholder.com/640x480.png/0088aa?text=cats+velit', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(51, 2, 'Odit et ut nulla error non.', 'odit-et-ut-nulla-error-non', 'Perspiciatis accusantium quia delectus delectus quia. Velit vero earum eum libero enim cupiditate eveniet. Quibusdam ipsam cupiditate qui.', 'https://via.placeholder.com/640x480.png/0077ff?text=cats+odio', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(52, 1, 'Quas eaque ut dolor distinctio.', 'quas-eaque-ut-dolor-distinctio', 'Exercitationem iusto libero vel magnam commodi saepe aliquid. Est nihil consequatur accusantium labore velit. Hic fuga enim odio accusantium magni.', 'https://via.placeholder.com/640x480.png/001188?text=cats+aut', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(53, 1, 'Rerum odio cum qui voluptas itaque quasi.', 'rerum-odio-cum-qui-voluptas-itaque-quasi', 'Voluptatem iure nesciunt sed in error a. Et ad aliquid aspernatur. Molestiae enim impedit earum. Incidunt et quaerat unde voluptatem asperiores.', 'https://via.placeholder.com/640x480.png/0011ee?text=cats+ipsam', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(54, 3, 'Velit qui ut recusandae omnis aspernatur assumenda minima.', 'velit-qui-ut-recusandae-omnis-aspernatur-assumenda-minima', 'Saepe sit est cum. Autem possimus asperiores rerum eum sequi ex sint. Consequatur aut enim esse dolorem fugiat qui. Exercitationem nam dolor laborum rerum harum. Consequuntur aliquid vero modi ut.', 'https://via.placeholder.com/640x480.png/008899?text=cats+modi', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(55, 3, 'Esse libero quos molestias recusandae minima quo est rerum.', 'esse-libero-quos-molestias-recusandae-minima-quo-est-rerum', 'Veniam autem deserunt aut aspernatur dignissimos facere repellendus corporis. Unde non suscipit laborum aut. Similique commodi eum ut esse eius aliquam velit consequuntur.', 'https://via.placeholder.com/640x480.png/0088dd?text=cats+commodi', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(56, 1, 'Vel perferendis iusto molestiae dolorem deleniti quos necessitatibus itaque.', 'vel-perferendis-iusto-molestiae-dolorem-deleniti-quos-necessitatibus-itaque', 'Esse qui earum sed. Et a animi quam non neque. Temporibus quia qui ratione et. Amet modi architecto id sit quasi quidem provident animi. At error accusamus et aliquam labore odit.', 'https://via.placeholder.com/640x480.png/0011ee?text=cats+ex', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(57, 3, 'Quis quaerat eius praesentium et et.', 'quis-quaerat-eius-praesentium-et-et', 'Voluptatibus qui autem dolorem nam et mollitia. Et magni ullam praesentium tempore. Nemo officiis quam quis impedit voluptatum id.', 'https://via.placeholder.com/640x480.png/0077cc?text=cats+saepe', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(58, 3, 'Odit sapiente ut est perferendis totam.', 'odit-sapiente-ut-est-perferendis-totam', 'Culpa veniam fugit enim maiores et. Aspernatur qui velit consequatur qui et ratione. Cumque autem qui possimus.', 'https://via.placeholder.com/640x480.png/00ccbb?text=cats+et', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(59, 1, 'Fugit quia hic aliquid consequuntur vitae.', 'fugit-quia-hic-aliquid-consequuntur-vitae', 'In eligendi culpa quia expedita molestiae. Labore unde neque deserunt et aut. Commodi aperiam et in cupiditate quis sint. Vel sequi aut ut nemo consequatur.', 'https://via.placeholder.com/640x480.png/00ddcc?text=cats+illum', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(60, 1, 'Ut at rerum illum aut ea voluptate placeat dolorum.', 'ut-at-rerum-illum-aut-ea-voluptate-placeat-dolorum', 'Qui laborum sed officiis rerum similique earum eum consectetur. Ex quia eos in sint fuga asperiores. Sint sint aliquam corporis.', 'https://via.placeholder.com/640x480.png/002222?text=cats+quidem', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(61, 1, 'At vitae corrupti facere dolorem.', 'at-vitae-corrupti-facere-dolorem', 'Id ex inventore commodi est odit. Sit natus corrupti culpa dolores. Ipsum et ab eaque sit. Vitae sint velit et in illo.', 'https://via.placeholder.com/640x480.png/0055aa?text=cats+libero', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(62, 2, 'Eos delectus laborum perspiciatis nisi aut veniam.', 'eos-delectus-laborum-perspiciatis-nisi-aut-veniam', 'Reiciendis maiores qui accusamus ab possimus. Quae eaque qui quibusdam tenetur. Laborum perspiciatis rerum maxime maxime. Vitae laborum aut aperiam est.', 'https://via.placeholder.com/640x480.png/00aaaa?text=cats+quia', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(63, 2, 'Corrupti quos odio omnis molestias quia distinctio nulla.', 'corrupti-quos-odio-omnis-molestias-quia-distinctio-nulla', 'Minus aut mollitia molestias quae. Sint temporibus eos aut neque tempora delectus harum. Hic voluptatibus iusto autem dolorum ratione ducimus cupiditate. Non placeat aperiam est eum saepe eos.', 'https://via.placeholder.com/640x480.png/00ee66?text=cats+dolorem', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(64, 2, 'Et eius ad error est qui rerum error placeat.', 'et-eius-ad-error-est-qui-rerum-error-placeat', 'Voluptatum modi in tenetur dolor ut ea. Quia dolorum dolor qui officiis. Eius accusamus ad quia labore ut eligendi aut delectus. Blanditiis distinctio sequi maiores.', 'https://via.placeholder.com/640x480.png/0066ee?text=cats+tenetur', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(65, 1, 'Repudiandae ut et molestiae accusantium aperiam.', 'repudiandae-ut-et-molestiae-accusantium-aperiam', 'Ut enim perferendis qui ducimus. Enim ea excepturi cumque id maxime eaque. Consectetur perspiciatis ut blanditiis dolorum.', 'https://via.placeholder.com/640x480.png/008866?text=cats+veritatis', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(66, 1, 'Animi nulla et similique corporis odio.', 'animi-nulla-et-similique-corporis-odio', 'Similique et dolor aut ut reiciendis eligendi. Placeat eum asperiores consectetur et. Dolor dolores eligendi ut.', 'https://via.placeholder.com/640x480.png/0066ff?text=cats+accusantium', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(67, 2, 'Quia ea esse odio cupiditate quis molestiae.', 'quia-ea-esse-odio-cupiditate-quis-molestiae', 'Numquam eius magnam accusantium temporibus quas. Commodi ratione nihil sit sit cumque. Voluptatibus quo magni explicabo ex ipsam voluptate soluta placeat.', 'https://via.placeholder.com/640x480.png/00ee66?text=cats+velit', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(68, 2, 'Nihil vitae corporis quasi saepe.', 'nihil-vitae-corporis-quasi-saepe', 'Aperiam repudiandae necessitatibus fugiat dolorem et velit. Velit voluptas aut corporis et aspernatur id. Molestiae dolorem non placeat sapiente. Quis laudantium voluptas eum dolores ut commodi.', 'https://via.placeholder.com/640x480.png/00dd77?text=cats+enim', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(69, 1, 'Quaerat unde aut nam atque sed velit ipsam.', 'quaerat-unde-aut-nam-atque-sed-velit-ipsam', 'Occaecati consequuntur exercitationem eaque ut corporis. Doloribus optio recusandae blanditiis reiciendis. Temporibus autem id consequatur provident. Voluptatem sint laboriosam voluptatibus.', 'https://via.placeholder.com/640x480.png/0066bb?text=cats+quo', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(70, 3, 'Enim quos rerum consequatur.', 'enim-quos-rerum-consequatur', 'In in possimus tempora quia. Deserunt non laborum fugit alias voluptatem officia sunt. Magnam libero perspiciatis adipisci minus sit. Maiores odit cum animi quos totam id.', 'https://via.placeholder.com/640x480.png/009911?text=cats+atque', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(71, 3, 'Et perspiciatis voluptatem natus excepturi est omnis eos.', 'et-perspiciatis-voluptatem-natus-excepturi-est-omnis-eos', 'Est rerum dolores esse qui consequatur sunt labore consequatur. Quidem consequatur vel sit voluptatum pariatur. Et provident dicta odio.', 'https://via.placeholder.com/640x480.png/00dd11?text=cats+soluta', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(72, 2, 'Eos et sit in nam quibusdam.', 'eos-et-sit-in-nam-quibusdam', 'Velit magnam consequatur omnis odio aut sunt. Iste est corporis ut minus voluptatibus. Quasi eum nisi rerum non enim quibusdam impedit. Rem atque rem voluptatum alias. Ut optio nihil ullam id culpa.', 'https://via.placeholder.com/640x480.png/003355?text=cats+iste', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(73, 2, 'Nisi officia iure amet in amet quibusdam in.', 'nisi-officia-iure-amet-in-amet-quibusdam-in', 'Non iure ea delectus impedit. Ut ex fugit dolore possimus quaerat. Qui voluptas est voluptatem quaerat.', 'https://via.placeholder.com/640x480.png/009900?text=cats+optio', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(74, 3, 'Magnam quod sed dolorum est distinctio autem.', 'magnam-quod-sed-dolorum-est-distinctio-autem', 'Tempore et odio voluptatem pariatur suscipit veniam iure. Ut modi deleniti in consequatur voluptates. Autem culpa harum dolores ab debitis eos.', 'https://via.placeholder.com/640x480.png/004488?text=cats+quis', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(75, 1, 'Voluptas reiciendis illo ea dolor eos repellendus dolore.', 'voluptas-reiciendis-illo-ea-dolor-eos-repellendus-dolore', 'Vel error nisi facere. Enim officiis nisi non aliquam quaerat dolores. Alias autem explicabo quis et praesentium nesciunt.', 'https://via.placeholder.com/640x480.png/002255?text=cats+illo', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(76, 2, 'Eos facere ea tenetur alias temporibus laudantium ut.', 'eos-facere-ea-tenetur-alias-temporibus-laudantium-ut', 'Vero non magni aut error animi porro praesentium. Error voluptatibus autem cum rerum vitae et ipsam qui.', 'https://via.placeholder.com/640x480.png/0088ee?text=cats+est', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(77, 1, 'Exercitationem sint qui molestias et voluptas.', 'exercitationem-sint-qui-molestias-et-voluptas', 'Quasi eius aperiam fugit eaque rerum rem non. Tempora voluptatem eum rerum sed voluptatem. Enim et sint voluptas dolor voluptas fugiat adipisci.', 'https://via.placeholder.com/640x480.png/00bb33?text=cats+fugit', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(78, 3, 'Id ut et ea dignissimos tempore est quis.', 'id-ut-et-ea-dignissimos-tempore-est-quis', 'Animi illo eligendi veritatis. Quisquam doloribus officiis ipsa dolorem molestiae aliquam incidunt sit. Quo corrupti et ea sequi iste iusto nemo. Quam ab beatae vero sint dolorem natus.', 'https://via.placeholder.com/640x480.png/00dddd?text=cats+illum', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(79, 1, 'Atque quaerat quaerat sint dolorum sed.', 'atque-quaerat-quaerat-sint-dolorum-sed', 'Eum iure accusamus libero officiis quia labore. Eum magni et hic et labore. Ad nemo ab est.', 'https://via.placeholder.com/640x480.png/0011ee?text=cats+assumenda', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(80, 1, 'Dignissimos qui ex vel id qui provident quo.', 'dignissimos-qui-ex-vel-id-qui-provident-quo', 'Odio nihil nihil optio debitis aliquid. Pariatur enim iure tempore molestiae aliquam enim rerum ipsum. Perferendis id dicta facilis.', 'https://via.placeholder.com/640x480.png/0077aa?text=cats+rerum', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(81, 1, 'Eaque quod enim temporibus dolores eius.', 'eaque-quod-enim-temporibus-dolores-eius', 'Cumque vel ad voluptatem aliquam ut. Deleniti ut in et. Officiis consequatur laboriosam dolor eaque molestiae fuga consequatur omnis. Qui nihil rerum temporibus quod velit ut est.', 'https://via.placeholder.com/640x480.png/000022?text=cats+quia', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(82, 3, 'Consequuntur nulla rerum asperiores dolorem.', 'consequuntur-nulla-rerum-asperiores-dolorem', 'Vero repudiandae est quis voluptatem dolorem praesentium incidunt. Eum praesentium ullam pariatur aut omnis qui. Fugiat velit aut quasi voluptate. Qui id cupiditate sit voluptatem excepturi et.', 'https://via.placeholder.com/640x480.png/00bb88?text=cats+qui', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(83, 1, 'Accusantium suscipit facere praesentium saepe nam.', 'accusantium-suscipit-facere-praesentium-saepe-nam', 'Est perferendis consequatur voluptatem et eligendi cum. Recusandae amet et provident possimus perferendis. Quae alias ea velit.', 'https://via.placeholder.com/640x480.png/00ff44?text=cats+earum', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(84, 1, 'Quia eaque dolor veniam vitae minus blanditiis vel fuga.', 'quia-eaque-dolor-veniam-vitae-minus-blanditiis-vel-fuga', 'Ab voluptate illo qui voluptatem optio dolorem. Sit velit et molestias et autem. Dolores aperiam ipsa ea nesciunt mollitia.', 'https://via.placeholder.com/640x480.png/00ffbb?text=cats+amet', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(85, 1, 'Dolores consequatur qui accusantium eos hic sunt.', 'dolores-consequatur-qui-accusantium-eos-hic-sunt', 'Quis sapiente adipisci qui incidunt debitis ducimus eligendi qui. Eos sit vel sit et. Ratione quo omnis velit sint natus possimus aut. Aliquam sit perferendis quam beatae harum quasi nulla.', 'https://via.placeholder.com/640x480.png/0000cc?text=cats+ut', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(86, 1, 'At ducimus laboriosam reiciendis soluta qui.', 'at-ducimus-laboriosam-reiciendis-soluta-qui', 'Accusamus qui et vero aperiam cum aut commodi. Possimus qui nobis sed qui nam nemo quidem. Ipsam quas distinctio earum et tempore aut voluptates.', 'https://via.placeholder.com/640x480.png/0033bb?text=cats+ullam', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(87, 1, 'Quasi eaque quia rem dolor recusandae tempora aspernatur earum.', 'quasi-eaque-quia-rem-dolor-recusandae-tempora-aspernatur-earum', 'Id iusto vitae et quisquam quibusdam aut vero. In sit placeat fuga atque repudiandae nam. Accusantium et dolorem quod reprehenderit sit.', 'https://via.placeholder.com/640x480.png/003333?text=cats+rerum', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(88, 1, 'Esse nostrum at est illum magnam enim pariatur ducimus.', 'esse-nostrum-at-est-illum-magnam-enim-pariatur-ducimus', 'Accusantium dolores quia minus ipsa corrupti unde hic. Adipisci illo quia dolorem et.', 'https://via.placeholder.com/640x480.png/002233?text=cats+voluptatem', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(89, 2, 'Ducimus qui non magnam sint.', 'ducimus-qui-non-magnam-sint', 'Quasi quia iste odio et. Praesentium fugit quia est vel. Itaque a ab enim omnis tempora. Similique et qui aut est ea odit.', 'https://via.placeholder.com/640x480.png/007700?text=cats+et', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(90, 2, 'Fuga nisi eum animi eligendi ea.', 'fuga-nisi-eum-animi-eligendi-ea', 'Laudantium possimus blanditiis non enim voluptatem laboriosam. Eveniet cupiditate a eveniet. Occaecati accusamus deserunt error vel non.', 'https://via.placeholder.com/640x480.png/00aa66?text=cats+hic', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(91, 3, 'Dolores suscipit debitis culpa qui aut.', 'dolores-suscipit-debitis-culpa-qui-aut', 'Impedit voluptates totam repellat eum nihil assumenda. Cum et minima aut vitae vel quis rem. Maiores error et illo nihil veniam assumenda. Aliquam architecto quos quaerat quas.', 'https://via.placeholder.com/640x480.png/0044cc?text=cats+et', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(92, 1, 'Ab voluptas voluptatem nesciunt ad numquam enim sint.', 'ab-voluptas-voluptatem-nesciunt-ad-numquam-enim-sint', 'Quos quibusdam rerum provident sed enim alias et. Possimus amet nisi sed qui. Laudantium aperiam vel dolor beatae et.', 'https://via.placeholder.com/640x480.png/00bb00?text=cats+illum', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(93, 1, 'Architecto rerum dolores asperiores sunt at fugiat et.', 'architecto-rerum-dolores-asperiores-sunt-at-fugiat-et', 'Ea iste et quia ratione dolor excepturi. Tenetur harum aliquid labore nihil eveniet laudantium distinctio. Doloremque ipsam aspernatur nisi ea occaecati rerum.', 'https://via.placeholder.com/640x480.png/000022?text=cats+eligendi', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(94, 3, 'Similique sed et et ab dolorem.', 'similique-sed-et-et-ab-dolorem', 'Deserunt ipsa dolores velit nulla consequuntur id corporis magni. Error cum rerum sit natus. Beatae dolorem similique dolorem quo modi fugit.', 'https://via.placeholder.com/640x480.png/005522?text=cats+culpa', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(95, 3, 'Et ut et vel quidem vel non quod nobis.', 'et-ut-et-vel-quidem-vel-non-quod-nobis', 'Ea sapiente explicabo aut sit maxime a. Omnis quasi ad non quis ipsam molestiae. Expedita id quae ut voluptatibus quis recusandae nulla. Omnis perspiciatis reiciendis dolor tenetur unde.', 'https://via.placeholder.com/640x480.png/009999?text=cats+cumque', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(96, 1, 'Perferendis est quia corporis rerum omnis error est.', 'perferendis-est-quia-corporis-rerum-omnis-error-est', 'Ut distinctio voluptatem qui tempore commodi sunt. Itaque voluptas sed aut est. Doloremque delectus dolorem qui itaque corporis amet quod.', 'https://via.placeholder.com/640x480.png/005533?text=cats+alias', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(97, 1, 'Quidem iste voluptas expedita laborum enim.', 'quidem-iste-voluptas-expedita-laborum-enim', 'Non blanditiis non eum. Tempore necessitatibus incidunt sint. Iusto aliquid quod qui eligendi at nobis assumenda aut. Quasi quo neque quod.', 'https://via.placeholder.com/640x480.png/0088ee?text=cats+fugit', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(98, 1, 'Consequatur ex dolores repellendus suscipit.', 'consequatur-ex-dolores-repellendus-suscipit', 'Doloremque cumque voluptatibus aperiam. Recusandae culpa dolores ad vero cupiditate eveniet voluptas. Rem sit incidunt et qui aliquam.', 'https://via.placeholder.com/640x480.png/0022bb?text=cats+qui', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(99, 3, 'Eos quidem libero voluptatibus enim molestiae.', 'eos-quidem-libero-voluptatibus-enim-molestiae', 'Ullam fuga voluptatem adipisci amet. Unde non eos dolor dicta et sit eligendi. Quo quo iusto aut nisi iusto.', 'https://via.placeholder.com/640x480.png/0055bb?text=cats+repellendus', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00'),
(100, 1, 'Maiores et minima rerum magnam temporibus repellat.', 'maiores-et-minima-rerum-magnam-temporibus-repellat', 'Sit fuga quod enim tenetur saepe. Numquam in vitae alias. Et necessitatibus explicabo dolores veritatis tempore rem. Nobis accusamus rerum id quas itaque ducimus dolores harum.', 'https://via.placeholder.com/640x480.png/008833?text=cats+nisi', 0, '2023-04-14 18:21:00', '2023-04-14 18:21:00', '2023-04-14 18:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
CREATE TABLE IF NOT EXISTS `privileges` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `last_update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `description`, `last_update`) VALUES
(1, 'view data', '2023-04-14 18:20:55'),
(2, 'create data', '2023-04-14 18:20:55'),
(3, 'update data', '2023-04-14 18:20:55'),
(4, 'delete data', '2023-04-14 18:20:55'),
(5, 'show data', '2023-04-14 18:20:55'),
(6, 'publish data', '2023-04-14 18:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `last_update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `description`, `last_update`) VALUES
(1, 'admin', '2023-04-14 18:20:55'),
(2, 'author', '2023-04-14 18:20:55'),
(3, 'tees', '2023-05-22 19:52:50'),
(4, 'tew', '2023-05-23 00:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE IF NOT EXISTS `role_privilege` (
  `privilege_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  KEY `role_privilege_privilege_id_foreign` (`privilege_id`),
  KEY `role_privilege_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_privilege`
--

INSERT INTO `role_privilege` (`privilege_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_access_menu`
--

DROP TABLE IF EXISTS `table_access_menu`;
CREATE TABLE IF NOT EXISTS `table_access_menu` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_usermenu_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `is_access` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `is_approve` tinyint(1) DEFAULT NULL,
  `is_reject` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_access_menu_table_usermenu_id_foreign` (`table_usermenu_id`),
  KEY `table_access_menu_role_id_foreign` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_access_menu`
--

INSERT INTO `table_access_menu` (`id`, `table_usermenu_id`, `role_id`, `is_access`, `is_create`, `is_edit`, `is_delete`, `is_approve`, `is_reject`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 0, 0, 0, 0, 0, '2023-04-16 10:27:52', '2023-04-16 10:27:52'),
(2, 2, 1, 1, 1, 1, 1, 0, 0, '2023-04-16 10:29:04', '2023-05-09 04:24:50'),
(3, 3, 1, 1, 0, 0, 0, 0, NULL, '2023-04-16 10:29:37', '2023-04-16 10:29:37'),
(4, 4, 1, 1, 1, 1, 1, 1, 1, '2023-04-16 11:42:38', NULL),
(5, 5, 1, 1, 1, 1, 0, NULL, NULL, NULL, '2023-04-29 23:03:02'),
(6, 6, 1, 1, 0, 0, 0, 0, NULL, NULL, '2023-05-09 04:26:44'),
(7, 7, 1, 1, 1, 1, 1, 1, 1, '2023-04-16 15:06:24', NULL),
(8, 8, 1, 1, 1, 0, 1, 0, NULL, NULL, '2023-05-09 04:24:11'),
(37, 3, 2, 1, 0, 0, 0, NULL, NULL, '2023-04-29 22:53:50', '2023-05-09 05:13:10'),
(36, 2, 2, 1, 0, 0, 0, NULL, NULL, '2023-04-29 22:53:50', '2023-05-09 05:11:30'),
(38, 4, 2, 1, 0, 0, 0, NULL, NULL, '2023-04-29 22:53:50', '2023-05-09 05:13:02'),
(39, 5, 2, 1, 0, 0, 0, NULL, NULL, '2023-04-29 22:53:50', '2023-05-09 05:13:13'),
(40, 6, 2, 0, 0, 0, 0, NULL, NULL, '2023-04-29 22:53:50', '2023-05-09 05:07:02'),
(41, 7, 2, 0, 0, 0, 1, NULL, NULL, '2023-04-29 22:53:50', '2023-05-09 05:07:02'),
(42, 8, 2, 0, 0, 0, 0, NULL, NULL, '2023-04-29 22:53:50', '2023-05-09 05:07:02'),
(43, 9, 1, 1, 1, 1, 1, NULL, NULL, '2023-05-22 20:28:37', '2023-05-22 20:28:37'),
(44, 10, 1, 1, 0, 0, 0, NULL, NULL, '2023-05-23 00:40:07', '2023-05-23 00:40:07'),
(35, 1, 2, 1, 0, 0, 0, NULL, NULL, '2023-04-29 22:53:50', '2023-04-29 22:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `table_usermenu`
--

DROP TABLE IF EXISTS `table_usermenu`;
CREATE TABLE IF NOT EXISTS `table_usermenu` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `iscrud` tinyint(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `is_approve_reject` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_usermenu`
--

INSERT INTO `table_usermenu` (`id`, `parent_id`, `menu`, `icon`, `weight`, `iscrud`, `url`, `type`, `status`, `is_approve_reject`, `created_at`, `updated_at`) VALUES
(1, 0, 'Main', 'fa', 1, 0, NULL, 'devider', 1, 1, '2023-04-19 10:27:37', '2023-05-01 18:53:31'),
(2, 1, 'Dashboard', 'fa', 2, 0, 'dashboard/#index', 'menu', 1, 1, '2023-04-13 10:27:40', '2023-05-07 08:14:13'),
(3, 0, 'Features', 'dashboard', 3, 0, 'dashboard', 'devider', 1, 1, '2023-04-05 10:27:42', '2023-05-09 04:25:06'),
(4, 3, 'Data Master', 'ga', 4, 0, 'sdsd', 'menu', 1, 1, '2023-04-16 11:39:39', '2023-05-01 18:53:15'),
(5, 4, 'Role', 'dd', 5, 0, 'dashboard/#role', 'menu', 1, 1, '2023-04-16 12:51:32', NULL),
(6, 0, 'Setting', 'fga', 6, 0, 'setting', 'devider', 1, 0, '2023-04-16 15:03:55', '2023-05-09 04:25:06'),
(7, 6, 'Hak Akses', 'fafa', 7, 1, NULL, 'menu', 1, 1, '2023-04-16 15:05:50', '2023-05-04 03:25:55'),
(8, 7, 'Menu', NULL, 8, 1, 'dashboard/#menu', 'menu', 1, 1, NULL, '2023-05-01 18:53:15'),
(9, 4, 'privilege', 'fa', 8, 1, '/dashboard/#privilege', 'menu', 1, 1, '2023-05-23 03:27:40', '2023-05-22 20:28:37'),
(10, 4, 'Privilige Management', NULL, 9, 1, 'dashboard/#privilige-management', 'menu', 1, 1, '2023-05-23 07:39:10', '2023-05-23 00:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_update` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `last_update`) VALUES
(1, 2, 'Prof. Kasey Wisoky Sr.', 'leola01@gmail.com', '$2y$10$pJpQPvOamh.ccUEtNT6ifuKs5/c9PtGktQ1d26PmmL1JPOmHm5mji', '2023-04-14 18:20:55'),
(2, 1, 'Tyrique Schmeler', 'lexi36@gmail.com', '$2y$10$HQ0sPR8IfmyVkAfKlJGlne5yOURgvBjUFyk3Ye8YiEB4ZF/CZFMJm', '2023-04-14 18:20:55'),
(3, 1, 'Marques Cronin', 'wmcclure@example.net', '$2y$10$Z848iN6QOamDyAnCXT82DedSToTdOLRmupyYtpLHixB7C/g0x7/nq', '2023-04-14 18:20:55'),
(4, 1, 'Dr. Carmine Ankunding', 'dlabadie@example.net', '$2y$10$AlFW4R2VZLhyssNDQTn0fOq9ZZFnPYGztHhvJaSpIAY6jhabUm2dC', '2023-04-14 18:20:55'),
(5, 1, 'Ms. Virgie Tromp', 'dhansen@example.com', '$2y$10$jY0xY4svVsRIJs/uH2yRE.psRp/haVpr/N52NDu39Vc7KjQ9B1HX6', '2023-04-14 18:20:55'),
(6, 1, 'Meagan Hartmann', 'myriam93@example.org', '$2y$10$VHqH3lpDgU5SbpabkeWpz.V2pNpq3Fw1Hwr3AoGk5JrMtwQapKQa6', '2023-04-14 18:20:55'),
(7, 1, 'Miss Rose Stehr III', 'vladimir28@example.com', '$2y$10$WSToeYInVhcmv3oiXg6VNOwldqlOrWKdmVROPl3F.KkS1lRmIT2dK', '2023-04-14 18:20:55'),
(8, 2, 'Ilene Bradtke', 'genesis19@example.org', '$2y$10$X6H2C85o0PmS3ZzOBaW80uzEXjVYvWxBZgHQ3TuHrw/794DuJwS3.', '2023-04-14 18:20:55'),
(9, 2, 'Marjorie Hermann', 'ibrahim37@example.com', '$2y$10$/826lHVYigSDZdnk5o1H7Op66oFpFlaKxeEzxNQ7tZFRMsPQRqQuq', '2023-04-14 18:20:55'),
(10, 1, 'Joel Wisozk', 'leann.koss@example.net', '$2y$10$8QdKpGWeEwKw/tITvDG5Zef2QqmQ02zw5SA8dHLJOnuCAJExiWiFS', '2023-04-14 18:20:55');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
