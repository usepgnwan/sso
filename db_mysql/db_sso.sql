-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jan 2022 pada 08.31
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sso`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_15_092027_create_roles_table', 1),
(6, '2022_01_15_092123_create_privileges_table', 1),
(7, '2022_01_15_092347_create_role_privilege_table', 1),
(11, '2022_01_17_020918_create_posts_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT 0,
  `published_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `body`, `image`, `publish`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dolores sint nulla enim laborum harum autem.', 'dolores-sint-nulla-enim-laborum-harum-autem', 'Labore est perspiciatis sint. Sit deleniti quisquam velit et. Voluptates quis et sunt ullam.', 'https://via.placeholder.com/640x480.png/007788?text=cats+ipsam', 1, '2022-01-17 03:37:07', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(2, 2, 'Eos rerum provident ipsa sequi a sit vel.', 'eos-rerum-provident-ipsa-sequi-a-sit-vel', 'Praesentium earum ut autem quisquam optio similique accusantium. Corporis cum blanditiis et assumenda possimus illum. Quos enim veniam nulla et animi amet.', 'https://via.placeholder.com/640x480.png/002277?text=cats+officiis', 1, '2022-01-17 03:37:10', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(3, 3, 'Commodi enim accusantium sunt quia iste.', 'commodi-enim-accusantium-sunt-quia-iste', 'Nisi in voluptatum aut quis. Cum nostrum rerum architecto. Sit rerum perspiciatis et beatae ipsum nihil.', 'https://via.placeholder.com/640x480.png/0033bb?text=cats+excepturi', 1, '2022-01-17 03:37:11', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(4, 2, 'Velit beatae omnis explicabo sed autem delectus unde quam.', 'velit-beatae-omnis-explicabo-sed-autem-delectus-unde-quam', 'Tempore qui sequi at rerum optio. Non repellat quia dolorem sed. Aliquam nesciunt velit quo culpa.', 'https://via.placeholder.com/640x480.png/00cc11?text=cats+consequatur', 1, '2022-01-17 03:40:35', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(5, 2, 'Tenetur dignissimos quia dignissimos cupiditate sint cumque voluptatem.', 'tenetur-dignissimos-quia-dignissimos-cupiditate-sint-cumque-voluptatem', 'Sint in a adipisci iste. Sit optio neque nemo dolores. Vel quis quia consequatur pariatur dolorem odio. Voluptas soluta quo quos.', 'https://via.placeholder.com/640x480.png/001100?text=cats+voluptatem', 1, '2022-01-17 04:18:52', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(6, 3, 'Unde suscipit suscipit et architecto.', 'unde-suscipit-suscipit-et-architecto', 'Fugit reiciendis aut est cumque cum doloremque. Et quo expedita dolore. Recusandae enim odit ratione ut nostrum amet.', 'https://via.placeholder.com/640x480.png/00aa77?text=cats+non', 1, '2022-01-17 04:18:54', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(7, 2, 'Qui earum magni possimus.', 'qui-earum-magni-possimus', 'Illum fugit odio vel dolor dolorum possimus et. Ut facilis vitae tempore temporibus assumenda asperiores. Odio nam corrupti quod quia autem ab.', 'https://via.placeholder.com/640x480.png/00aa33?text=cats+est', 1, '2022-01-17 04:18:55', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(8, 3, 'Ipsam voluptatem cupiditate quos vero sit qui est.', 'ipsam-voluptatem-cupiditate-quos-vero-sit-qui-est', 'Suscipit aut adipisci similique rerum dolorem. Voluptatem nam aut labore laborum. Doloremque iure quaerat voluptatem aut ut vero qui.', 'https://via.placeholder.com/640x480.png/00ee99?text=cats+ut', 1, '2022-01-17 04:18:55', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(9, 1, 'Eius sint ab est culpa velit.', 'eius-sint-ab-est-culpa-velit', 'Est dolor repudiandae iste molestiae. Dolore distinctio error veritatis voluptatibus nisi praesentium. Neque rerum rerum saepe repellendus id.', 'https://via.placeholder.com/640x480.png/009944?text=cats+hic', 1, '2022-01-17 04:18:58', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(10, 2, 'Et non ipsa est quia error doloribus quis velit.', 'et-non-ipsa-est-quia-error-doloribus-quis-velit', 'Sunt iusto at tenetur. Omnis praesentium ipsam officiis laudantium sint quos dolor libero. Placeat consectetur temporibus sint ipsam doloremque occaecati.', 'https://via.placeholder.com/640x480.png/00ee55?text=cats+quaerat', 1, '2022-01-17 04:18:56', '2022-01-16 19:23:50', '2022-01-16 19:23:50'),
(11, 3, 'Repellat doloremque sunt repellat ut voluptatem quia corrupti.', 'repellat-doloremque-sunt-repellat-ut-voluptatem-quia-corrupti', 'Repellendus dolores sed vitae maxime velit. Quia sequi odio quos eos occaecati officia dolores. Eos molestias rerum esse explicabo. Similique illo officiis cum repudiandae est.', 'https://via.placeholder.com/640x480.png/00bb44?text=cats+qui', 1, '2022-01-17 04:19:00', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(12, 2, 'Inventore culpa aut vero non magnam est necessitatibus.', 'inventore-culpa-aut-vero-non-magnam-est-necessitatibus', 'Iusto at ea et omnis sed harum aut. Consectetur eveniet ut sit ad omnis aliquid. Officia aut unde cum qui sed.', 'https://via.placeholder.com/640x480.png/00aa00?text=cats+sint', 1, '2022-01-17 04:19:02', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(13, 1, 'Qui reiciendis perferendis fuga ut.', 'qui-reiciendis-perferendis-fuga-ut', 'Est illum qui ab vel optio eos. Omnis iste molestiae quos eveniet facere. Voluptate velit repellendus quaerat molestiae velit temporibus quos.', 'https://via.placeholder.com/640x480.png/007733?text=cats+maxime', 1, '2022-01-17 04:19:03', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(14, 2, 'Atque est et qui dolore.', 'atque-est-et-qui-dolore', 'Fugiat unde quisquam velit consequatur perspiciatis similique nulla. Saepe praesentium voluptatibus impedit eos a. Quo enim ab fugit deserunt sequi praesentium illum esse. Quo aut iure et.', 'https://via.placeholder.com/640x480.png/006677?text=cats+deserunt', 1, '2022-01-17 04:19:04', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(15, 2, 'Rem minus sunt natus quae in unde.', 'rem-minus-sunt-natus-quae-in-unde', 'Impedit impedit id qui optio rerum est. Quasi aliquid molestiae hic qui expedita nobis et doloremque. Doloribus provident dolorem tenetur expedita sunt perferendis quae.', 'https://via.placeholder.com/640x480.png/00bb99?text=cats+tempore', 1, '2022-01-17 04:19:08', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(16, 2, 'Consectetur nihil est odio facilis eos.', 'consectetur-nihil-est-odio-facilis-eos', 'Quia occaecati sint soluta natus voluptatem dolorem. Sit perspiciatis enim vel quos. In voluptatibus deserunt dolor consequatur quibusdam.', 'https://via.placeholder.com/640x480.png/009966?text=cats+in', 1, '2022-01-17 04:19:07', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(17, 3, 'Quia ratione voluptas rem totam.', 'quia-ratione-voluptas-rem-totam', 'Nobis a aspernatur quas iusto nihil omnis. Molestiae voluptatem labore perferendis nam. Quo corrupti consequatur maxime sed.', 'https://via.placeholder.com/640x480.png/00aa44?text=cats+debitis', 1, '2022-01-17 04:19:09', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(18, 3, 'Soluta ex ut nesciunt et dolores.', 'soluta-ex-ut-nesciunt-et-dolores', 'Error veniam odit itaque et. Rerum vel pariatur rerum quia sunt est. Ut et quidem asperiores. Atque saepe nemo at dolorem deserunt modi repudiandae.', 'https://via.placeholder.com/640x480.png/0099ff?text=cats+quisquam', 1, '2022-01-17 04:19:10', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(19, 3, 'Animi illo maiores exercitationem earum.', 'animi-illo-maiores-exercitationem-earum', 'Nulla vel nam ea non quo optio explicabo. Quo et optio molestiae delectus. Eius eveniet aut nesciunt illo labore est molestiae.', 'https://via.placeholder.com/640x480.png/001144?text=cats+et', 1, '2022-01-17 04:19:12', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(20, 2, 'Voluptatem ab eligendi voluptas ratione excepturi et rem.', 'voluptatem-ab-eligendi-voluptas-ratione-excepturi-et-rem', 'Itaque minima aliquam beatae adipisci et. Assumenda esse rerum deleniti libero et veniam adipisci. Enim nesciunt dolor perspiciatis. Tenetur vel ex provident et sint vero minus.', 'https://via.placeholder.com/640x480.png/0088ff?text=cats+optio', 1, '2022-01-17 04:19:13', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(21, 2, 'Dolorum quia nam aut et.', 'dolorum-quia-nam-aut-et', 'Dolor magnam et dolor est impedit. Ea omnis quasi sed. Amet eum voluptatem ullam.', 'https://via.placeholder.com/640x480.png/00ee77?text=cats+temporibus', 1, '2022-01-17 04:19:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(22, 3, 'Quae maxime qui qui libero aspernatur officia architecto ab.', 'quae-maxime-qui-qui-libero-aspernatur-officia-architecto-ab', 'Et numquam dolor vel dicta. Voluptates corrupti optio doloremque placeat ipsam nulla. Occaecati modi deleniti incidunt corrupti harum est.', 'https://via.placeholder.com/640x480.png/00dd22?text=cats+fuga', 1, '2022-01-17 04:19:15', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(23, 1, 'A sapiente recusandae ipsam deserunt assumenda molestiae saepe.', 'a-sapiente-recusandae-ipsam-deserunt-assumenda-molestiae-saepe', 'Cumque autem perferendis exercitationem sequi provident. Doloremque culpa minus rem laborum minima aliquam. Perspiciatis velit maxime numquam sapiente autem veniam molestiae.', 'https://via.placeholder.com/640x480.png/0022cc?text=cats+nihil', 1, '2022-01-17 04:19:16', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(24, 3, 'Eveniet tenetur dolorem a nihil incidunt voluptas nisi.', 'eveniet-tenetur-dolorem-a-nihil-incidunt-voluptas-nisi', 'Facere libero voluptas nihil facilis accusantium et consequatur. Sed dolores illo dolorem asperiores suscipit voluptatem blanditiis molestiae. Quos vitae harum nemo voluptas alias.', 'https://via.placeholder.com/640x480.png/0066cc?text=cats+impedit', 1, '2022-01-17 04:19:20', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(25, 2, 'Et delectus eveniet sint voluptates sit accusantium.', 'et-delectus-eveniet-sint-voluptates-sit-accusantium', 'Quos est dolor animi laboriosam. Quia ut sit velit voluptatibus aut.', 'https://via.placeholder.com/640x480.png/00dd99?text=cats+ut', 1, '2022-01-17 04:19:18', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(26, 2, 'Minus iure et totam numquam.', 'minus-iure-et-totam-numquam', 'Eveniet repellat soluta dolorem qui. Ipsa et perspiciatis iusto aut sed inventore repellat. Et sed omnis ut asperiores nihil illum non corporis. Suscipit sed sit dolore est quisquam laboriosam rerum.', 'https://via.placeholder.com/640x480.png/00cc00?text=cats+ea', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(27, 1, 'Vel vitae voluptates molestiae aliquam consequatur labore.', 'vel-vitae-voluptates-molestiae-aliquam-consequatur-labore', 'Consectetur iste dolores eaque dolore ipsam sequi. Hic quas mollitia enim voluptatibus ut perferendis provident. Sed quis repudiandae omnis.', 'https://via.placeholder.com/640x480.png/00cc00?text=cats+quisquam', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(28, 1, 'Nemo nostrum laudantium repellendus sint porro.', 'nemo-nostrum-laudantium-repellendus-sint-porro', 'Velit amet hic dolores ea ducimus ab. Voluptatem quaerat dicta error eos est est dolores ipsum. Rem provident quis facilis blanditiis aut perferendis.', 'https://via.placeholder.com/640x480.png/00bb22?text=cats+velit', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(29, 1, 'Omnis dolor ut doloribus qui corporis.', 'omnis-dolor-ut-doloribus-qui-corporis', 'Architecto numquam rerum nihil omnis. Blanditiis eaque animi suscipit ducimus iure atque. Amet ut ipsam officiis distinctio perspiciatis assumenda.', 'https://via.placeholder.com/640x480.png/005566?text=cats+sequi', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(30, 2, 'Velit aut qui quis.', 'velit-aut-qui-quis', 'Odio cum enim et explicabo molestiae. Laudantium architecto aut molestiae voluptas qui quos. Quas sed reiciendis voluptas voluptas ut. Et magni quo veritatis rerum magnam dignissimos dolorem.', 'https://via.placeholder.com/640x480.png/001188?text=cats+repellendus', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(31, 2, 'Consequatur ut natus nostrum quia.', 'consequatur-ut-natus-nostrum-quia', 'Et iste quidem consequatur ea eaque nemo. Et quo vel quis natus. Esse sed error sint ratione ut cupiditate. Qui tempore expedita quia rerum ea est natus.', 'https://via.placeholder.com/640x480.png/00dd88?text=cats+veniam', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(32, 2, 'Blanditiis ipsum animi sunt voluptatibus quis.', 'blanditiis-ipsum-animi-sunt-voluptatibus-quis', 'Dolorum aut illum nemo pariatur laboriosam qui. Sed modi eaque ea modi. Neque a optio deleniti tempore. Consequuntur ut libero ut eos.', 'https://via.placeholder.com/640x480.png/009933?text=cats+explicabo', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(33, 1, 'Omnis soluta repellendus temporibus sunt.', 'omnis-soluta-repellendus-temporibus-sunt', 'Omnis eum delectus qui et est ea ratione. Quaerat rerum suscipit tempora nulla illo aut sunt consequuntur. Enim dolorem inventore ut dicta odit saepe perspiciatis.', 'https://via.placeholder.com/640x480.png/0033cc?text=cats+provident', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(34, 2, 'Error et et repellat corporis omnis.', 'error-et-et-repellat-corporis-omnis', 'Quam a eos quae dolor laboriosam tempore delectus perferendis. Quas non illum itaque ea est et et. Veritatis perspiciatis suscipit consequuntur nostrum.', 'https://via.placeholder.com/640x480.png/007788?text=cats+eaque', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(35, 1, 'Et repellendus perferendis corrupti tempore eius.', 'et-repellendus-perferendis-corrupti-tempore-eius', 'Omnis nemo facere consectetur vero voluptas ullam. Ut atque delectus nihil consequuntur quo autem itaque. Nisi ducimus quis voluptatum voluptatem soluta.', 'https://via.placeholder.com/640x480.png/0011ee?text=cats+et', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(36, 2, 'Voluptatibus sequi illo dicta quia doloremque culpa.', 'voluptatibus-sequi-illo-dicta-quia-doloremque-culpa', 'Libero et dolorem totam aperiam at non. Quo aut aperiam sunt corporis harum. Alias libero incidunt earum sunt odio aut. Voluptatem soluta voluptatibus ut perferendis molestiae odio.', 'https://via.placeholder.com/640x480.png/009944?text=cats+eos', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(37, 2, 'Sit adipisci incidunt maxime similique.', 'sit-adipisci-incidunt-maxime-similique', 'Est placeat maxime qui debitis culpa numquam soluta. Quia cupiditate aliquid recusandae magnam reiciendis qui. Mollitia voluptatibus ratione beatae dolorem tempore.', 'https://via.placeholder.com/640x480.png/00dd44?text=cats+ut', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(38, 2, 'Rerum a iste quas sed possimus.', 'rerum-a-iste-quas-sed-possimus', 'Maxime quod non placeat blanditiis temporibus. Aut rem quis aperiam ut. Voluptas perspiciatis eveniet quaerat adipisci autem. Dicta culpa amet laboriosam harum perferendis ipsa eos.', 'https://via.placeholder.com/640x480.png/0088aa?text=cats+et', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(39, 3, 'Ad facere accusantium maiores et totam vel qui.', 'ad-facere-accusantium-maiores-et-totam-vel-qui', 'Animi quia accusantium repudiandae accusamus accusamus rem temporibus. Eaque beatae iste eligendi. Qui qui veniam ipsum aut. Omnis quia occaecati corporis ea incidunt. Molestiae eum error sed sed.', 'https://via.placeholder.com/640x480.png/009911?text=cats+itaque', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(40, 3, 'Nisi autem harum dolores id ullam repudiandae iste id.', 'nisi-autem-harum-dolores-id-ullam-repudiandae-iste-id', 'Deserunt illo ipsam provident provident magnam iure. Vitae reprehenderit a accusamus enim atque saepe. Aspernatur labore id at excepturi aliquid ut voluptate dolore.', 'https://via.placeholder.com/640x480.png/006655?text=cats+est', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(41, 2, 'Iste aut ipsum illum illo.', 'iste-aut-ipsum-illum-illo', 'Et nihil molestias assumenda modi accusamus aliquam unde. Commodi reprehenderit quasi delectus quis. Accusantium illo rem deserunt. Voluptas omnis quia natus reiciendis vel.', 'https://via.placeholder.com/640x480.png/00eedd?text=cats+excepturi', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(42, 3, 'Voluptatum blanditiis consequatur nesciunt dolor.', 'voluptatum-blanditiis-consequatur-nesciunt-dolor', 'Laudantium rem quam autem ad et culpa. Aliquam laborum nam id deserunt iusto.', 'https://via.placeholder.com/640x480.png/005555?text=cats+reiciendis', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(43, 2, 'Facere quas accusantium aperiam natus voluptatem.', 'facere-quas-accusantium-aperiam-natus-voluptatem', 'Non minima deserunt quidem expedita quo ea. Aut qui possimus explicabo autem in rerum quo. Illo minus aut repudiandae et vel ad. Et minima ea eligendi officiis aut nihil vero.', 'https://via.placeholder.com/640x480.png/007722?text=cats+quae', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(44, 1, 'Eligendi id ut enim qui.', 'eligendi-id-ut-enim-qui', 'Minima adipisci quisquam labore mollitia. Culpa molestiae consequuntur voluptatem dolores accusamus incidunt distinctio. Molestias aut ut ut hic ut ut. Nostrum eveniet corporis est modi et.', 'https://via.placeholder.com/640x480.png/006699?text=cats+quidem', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(45, 1, 'Dignissimos non dolorem laborum tempore autem.', 'dignissimos-non-dolorem-laborum-tempore-autem', 'Est sapiente deleniti ipsam. Nesciunt est nam soluta deleniti magni veniam sunt. Consectetur quis est iusto. Voluptatem magnam accusantium in qui aliquam dignissimos.', 'https://via.placeholder.com/640x480.png/0077cc?text=cats+qui', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(46, 3, 'Aut porro rerum voluptas hic rerum est est aut.', 'aut-porro-rerum-voluptas-hic-rerum-est-est-aut', 'Repellat pariatur beatae voluptatem facilis delectus consequatur omnis. Quia temporibus minus nesciunt aliquid doloribus voluptatem velit distinctio. Sapiente natus ea est.', 'https://via.placeholder.com/640x480.png/00ee44?text=cats+tempore', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(47, 1, 'Vitae esse quia omnis.', 'vitae-esse-quia-omnis', 'Illum rem harum veniam quia quidem. Voluptatem et tempora voluptatem. Consequatur quam nobis eligendi maiores quo. Velit ut harum iusto recusandae.', 'https://via.placeholder.com/640x480.png/0044ff?text=cats+maxime', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(48, 1, 'Alias non rem facere sequi.', 'alias-non-rem-facere-sequi', 'Ut ut excepturi id. Totam ullam voluptas est. Error et distinctio consequatur nesciunt in et accusamus.', 'https://via.placeholder.com/640x480.png/00aa55?text=cats+nulla', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(49, 3, 'Voluptate facilis totam sed quo pariatur neque quia.', 'voluptate-facilis-totam-sed-quo-pariatur-neque-quia', 'Explicabo vel occaecati quia. Minus amet ut consectetur et libero nihil est ea. Est dolor et qui odit laboriosam sit culpa. Magni iusto cumque non ipsum. Deserunt rerum non illum minima.', 'https://via.placeholder.com/640x480.png/00ff22?text=cats+est', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14'),
(50, 2, 'Est qui nam blanditiis ea numquam.', 'est-qui-nam-blanditiis-ea-numquam', 'Doloremque itaque quas dolore. Eveniet sequi deserunt sint nesciunt quo ex fugiat. Quis dicta nihil sed animi voluptates iusto iste.', 'https://via.placeholder.com/640x480.png/004499?text=cats+aperiam', 0, '2022-01-16 21:18:14', '2022-01-16 21:18:14', '2022-01-16 21:18:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `privileges`
--

CREATE TABLE `privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `privileges`
--

INSERT INTO `privileges` (`id`, `description`, `last_update`) VALUES
(1, 'view data', '2022-01-16 07:10:19'),
(2, 'create data', '2022-01-16 07:10:19'),
(3, 'update data', '2022-01-16 07:10:19'),
(4, 'delete data', '2022-01-16 07:10:19'),
(5, 'show data', '2022-01-16 07:10:19'),
(6, 'publish data', '2022-01-16 07:10:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `description`, `last_update`) VALUES
(1, 'admin', '2022-01-16 07:10:19'),
(2, 'author', '2022-01-16 07:10:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_privilege`
--

CREATE TABLE `role_privilege` (
  `privilege_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_privilege`
--

INSERT INTO `role_privilege` (`privilege_id`, `role_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `last_update`) VALUES
(1, 1, 'Fannie Sauer', 'beier.micaela@gmail.com', '$2y$10$eoYNqQLe9Ds8NcGn4BHxI.UX3vQGFvvRTxCRUVkPLUey6V79lHMjG', '2022-01-17 02:45:15'),
(2, 2, 'Jazmyn Hartmann', 'kohler.hyman@gmail.com', '$2y$10$tT7NrgDaqR6NkwHTWGjtEOQYFjE/8NQ4IaFtLio17390Tkfa8r3nK', '2022-01-16 14:11:04'),
(3, 2, 'Bryce Beer', 'hstehr@gmail.com', '$2y$10$1Wg6iy.oAzLurOvyWV9xqOMaYn7Qk8Jdszuajl5hhH.V8Jga.Btdy', '2022-01-16 14:11:01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_title_unique` (`title`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indeks untuk tabel `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_privilege`
--
ALTER TABLE `role_privilege`
  ADD KEY `role_privilege_privilege_id_foreign` (`privilege_id`),
  ADD KEY `role_privilege_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `role_privilege`
--
ALTER TABLE `role_privilege`
  ADD CONSTRAINT `role_privilege_privilege_id_foreign` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_privilege_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
