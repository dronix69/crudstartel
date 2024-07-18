-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-07-2024 a las 17:57:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crudstartel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificados`
--

CREATE TABLE `certificados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rut` varchar(50) NOT NULL,
  `matricula_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `curso_id` bigint(20) UNSIGNED NOT NULL,
  `codigo_curso` varchar(50) NOT NULL,
  `curso` varchar(20) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `certificado` varchar(255) NOT NULL,
  `fecha_otorgado` date NOT NULL,
  `venta_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `certificados`
--

INSERT INTO `certificados` (`id`, `rut`, `matricula_id`, `nombre`, `apellido`, `curso_id`, `codigo_curso`, `curso`, `tipo`, `fecha_ini`, `fecha_fin`, `certificado`, `fecha_otorgado`, `venta_id`, `created_at`, `updated_at`) VALUES
(7, '21345678-7', 4, 'RAMO', 'VIDAL', 2, 'SIT-2230', 'A-2', 'elearning', '2024-07-16', '2024-07-31', '2435', '2024-07-16', 13, '2024-07-16 22:10:58', '2024-07-16 22:10:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `curso` varchar(255) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `fecha_in` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `curso`, `codigo`, `tipo`, `fecha_in`, `fecha_fin`, `created_at`, `updated_at`) VALUES
(1, 'A-2', 'SIT-1002', 'presencial', '2024-07-03', '2024-07-31', '2024-07-04 03:59:30', '2024-07-04 03:59:30'),
(2, 'A-2', 'SIT-2230', 'elearning', '2024-07-15', '2024-08-15', '2024-07-16 01:00:00', '2024-07-16 01:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exports`
--

CREATE TABLE `exports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_disk` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `exporter` varchar(255) NOT NULL,
  `processed_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_rows` int(10) UNSIGNED NOT NULL,
  `successful_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `exports`
--

INSERT INTO `exports` (`id`, `completed_at`, `file_disk`, `file_name`, `exporter`, `processed_rows`, `total_rows`, `successful_rows`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2024-07-11 00:24:37', 'public', 'export-1-matriculas', 'App\\Filament\\Exports\\MatriculaExporter', 2, 2, 2, 2, '2024-07-11 00:24:37', '2024-07-11 00:24:37'),
(2, '2024-07-11 00:31:11', 'public', 'export-2-matriculas', 'App\\Filament\\Exports\\MatriculaExporter', 2, 2, 2, 2, '2024-07-11 00:31:11', '2024-07-11 00:31:11'),
(3, '2024-07-11 00:34:30', 'public', 'export-3-matriculas', 'App\\Filament\\Exports\\MatriculaExporter', 1, 1, 1, 2, '2024-07-11 00:34:30', '2024-07-11 00:34:30'),
(4, '2024-07-16 22:39:34', 'public', 'export-4-ventas', 'App\\Filament\\Exports\\VentaExporter', 1, 1, 1, 2, '2024-07-16 22:39:34', '2024-07-16 22:39:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_import_rows`
--

CREATE TABLE `failed_import_rows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `import_id` bigint(20) UNSIGNED NOT NULL,
  `validation_error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imports`
--

CREATE TABLE `imports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `importer` varchar(255) NOT NULL,
  `processed_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_rows` int(10) UNSIGNED NOT NULL,
  `successful_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructivos`
--

CREATE TABLE `instructivos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `instructivos`
--

INSERT INTO `instructivos` (`id`, `titulo`, `categoria`, `contenido`, `created_at`, `updated_at`) VALUES
(1, 'Ingresar al Aula Virtual', 'administrativo', '<h2><strong>Como poder ingresar al aula virtual</strong></h2><p><br></p><p><br></p>', '2024-07-10 23:19:18', '2024-07-10 23:19:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9c7dd7f1-c767-4bc3-914e-ccedc7f59872', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5288:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:38:\"App\\Filament\\Exports\\MatriculaExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:24:37\";s:10:\"created_at\";s:19:\"2024-07-10 20:24:37\";s:2:\"id\";i:1;s:9:\"file_name\";s:19:\"export-1-matriculas\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:24:37\";s:10:\"created_at\";s:19:\"2024-07-10 20:24:37\";s:2:\"id\";i:1;s:9:\"file_name\";s:19:\"export-1-matriculas\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-1-matriculas\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:19:\"chainCatchCallbacks\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2295:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:38:\"App\\Filament\\Exports\\MatriculaExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:24:37\";s:10:\"created_at\";s:19:\"2024-07-10 20:24:37\";s:2:\"id\";i:1;s:9:\"file_name\";s:19:\"export-1-matriculas\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:24:37\";s:10:\"created_at\";s:19:\"2024-07-10 20:24:37\";s:2:\"id\";i:1;s:9:\"file_name\";s:19:\"export-1-matriculas\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-1-matriculas\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0options\";a:0:{}}\";}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ca60000000000000000\";}\";s:4:\"hash\";s:44:\"Qw+CrelOtirvqBLBQgrTGT9j9EINqfslFIHTN5HKRkM=\";}}}}', NULL, 1720643077, 1720643077),
('9c7dda4a-5aee-426b-a814-ef8fa397e557', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5288:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:38:\"App\\Filament\\Exports\\MatriculaExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:31:11\";s:10:\"created_at\";s:19:\"2024-07-10 20:31:11\";s:2:\"id\";i:2;s:9:\"file_name\";s:19:\"export-2-matriculas\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:31:11\";s:10:\"created_at\";s:19:\"2024-07-10 20:31:11\";s:2:\"id\";i:2;s:9:\"file_name\";s:19:\"export-2-matriculas\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-2-matriculas\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:2;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:19:\"chainCatchCallbacks\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2295:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:38:\"App\\Filament\\Exports\\MatriculaExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:31:11\";s:10:\"created_at\";s:19:\"2024-07-10 20:31:11\";s:2:\"id\";i:2;s:9:\"file_name\";s:19:\"export-2-matriculas\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:31:11\";s:10:\"created_at\";s:19:\"2024-07-10 20:31:11\";s:2:\"id\";i:2;s:9:\"file_name\";s:19:\"export-2-matriculas\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-2-matriculas\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:2;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0options\";a:0:{}}\";}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ca60000000000000000\";}\";s:4:\"hash\";s:44:\"SH0aTxAGos/zMm+PNZV8GWuqoCdn96Gv0QakNGTZ960=\";}}}}', NULL, 1720643471, 1720643471),
('9c7ddb79-7641-4469-9263-401f46f83c50', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5288:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:38:\"App\\Filament\\Exports\\MatriculaExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:34:30\";s:10:\"created_at\";s:19:\"2024-07-10 20:34:30\";s:2:\"id\";i:3;s:9:\"file_name\";s:19:\"export-3-matriculas\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:34:30\";s:10:\"created_at\";s:19:\"2024-07-10 20:34:30\";s:2:\"id\";i:3;s:9:\"file_name\";s:19:\"export-3-matriculas\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-3-matriculas\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:3;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:19:\"chainCatchCallbacks\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2295:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:38:\"App\\Filament\\Exports\\MatriculaExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:34:30\";s:10:\"created_at\";s:19:\"2024-07-10 20:34:30\";s:2:\"id\";i:3;s:9:\"file_name\";s:19:\"export-3-matriculas\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:38:\"App\\Filament\\Exports\\MatriculaExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-10 20:34:30\";s:10:\"created_at\";s:19:\"2024-07-10 20:34:30\";s:2:\"id\";i:3;s:9:\"file_name\";s:19:\"export-3-matriculas\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-3-matriculas\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:3;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:5:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:3:\"rut\";s:3:\"Rut\";s:6:\"correo\";s:6:\"Correo\";s:8:\"telefono\";s:8:\"Telefono\";}s:10:\"\0*\0options\";a:0:{}}\";}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000cb40000000000000000\";}\";s:4:\"hash\";s:44:\"XTbMj8KQc5IsBAcd/CPFM7KspJ7SFEXSkAJJ3qpAaiQ=\";}}}}', NULL, 1720643670, 1720643670),
('9c8a1a1b-cff2-4d39-beed-87935fae3d84', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5616:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:34:\"App\\Filament\\Exports\\VentaExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:34:\"App\\Filament\\Exports\\VentaExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-16 18:39:34\";s:10:\"created_at\";s:19:\"2024-07-16 18:39:34\";s:2:\"id\";i:4;s:9:\"file_name\";s:15:\"export-4-ventas\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:34:\"App\\Filament\\Exports\\VentaExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-16 18:39:34\";s:10:\"created_at\";s:19:\"2024-07-16 18:39:34\";s:2:\"id\";i:4;s:9:\"file_name\";s:15:\"export-4-ventas\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-4-ventas\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:6:\"boleta\";s:6:\"Boleta\";s:10:\"forma_pago\";s:10:\"Forma pago\";s:10:\"fecha_pago\";s:10:\"Fecha pago\";s:5:\"cuota\";s:5:\"Cuota\";s:5:\"valor\";s:5:\"Valor\";s:5:\"total\";s:5:\"Total\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:4;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:6:\"boleta\";s:6:\"Boleta\";s:10:\"forma_pago\";s:10:\"Forma pago\";s:10:\"fecha_pago\";s:10:\"Fecha pago\";s:5:\"cuota\";s:5:\"Cuota\";s:5:\"valor\";s:5:\"Valor\";s:5:\"total\";s:5:\"Total\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:19:\"chainCatchCallbacks\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2459:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:34:\"App\\Filament\\Exports\\VentaExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:34:\"App\\Filament\\Exports\\VentaExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-16 18:39:34\";s:10:\"created_at\";s:19:\"2024-07-16 18:39:34\";s:2:\"id\";i:4;s:9:\"file_name\";s:15:\"export-4-ventas\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:2;s:8:\"exporter\";s:34:\"App\\Filament\\Exports\\VentaExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:6:\"public\";s:10:\"updated_at\";s:19:\"2024-07-16 18:39:34\";s:10:\"created_at\";s:19:\"2024-07-16 18:39:34\";s:2:\"id\";i:4;s:9:\"file_name\";s:15:\"export-4-ventas\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-4-ventas\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:6:\"boleta\";s:6:\"Boleta\";s:10:\"forma_pago\";s:10:\"Forma pago\";s:10:\"fecha_pago\";s:10:\"Fecha pago\";s:5:\"cuota\";s:5:\"Cuota\";s:5:\"valor\";s:5:\"Valor\";s:5:\"total\";s:5:\"Total\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:4;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:6:\"nombre\";s:6:\"Nombre\";s:8:\"apellido\";s:8:\"Apellido\";s:6:\"boleta\";s:6:\"Boleta\";s:10:\"forma_pago\";s:10:\"Forma pago\";s:10:\"fecha_pago\";s:10:\"Fecha pago\";s:5:\"cuota\";s:5:\"Cuota\";s:5:\"valor\";s:5:\"Valor\";s:5:\"total\";s:5:\"Total\";}s:10:\"\0*\0options\";a:0:{}}\";}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000eac0000000000000000\";}\";s:4:\"hash\";s:44:\"sFRrAXD11Ycty13SqjoLuBfkNXPkaMmpf5mJSdDTm7Q=\";}}}}', NULL, 1721169574, 1721169574);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE `matriculas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha_matricula` date NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `comuna` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `cursos_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`id`, `nombre`, `apellido`, `rut`, `correo`, `telefono`, `edad`, `fecha_matricula`, `fecha_nacimiento`, `direccion`, `comuna`, `codigo`, `cursos_id`, `image_url`, `created_at`, `updated_at`) VALUES
(4, 'RAMO', 'VIDAL', '21345678-7', 'vidal@gmail.com', 966554422, 23, '2024-07-14', '2022-06-08', 'PINOS 222', 'Tolten', 'SAT-20240701', 1, 'image-filament/logoRM.png', '2024-07-15 00:52:29', '2024-07-15 00:52:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2024_07_02_223005_create_cursos_table', 2),
(18, '2014_10_12_000000_create_users_table', 3),
(19, '2014_10_12_100000_create_password_reset_tokens_table', 3),
(20, '2019_08_19_000000_create_failed_jobs_table', 3),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(22, '2024_07_02_223501_create_cursos_table', 3),
(23, '2024_07_02_223509_create_matriculas_table', 3),
(24, '2024_07_02_223517_create_ventas_table', 3),
(25, '2024_07_02_223524_create_certificados_table', 3),
(26, '2024_07_08_010041_create_permission_tables', 4),
(27, '2024_07_10_184124_create_instructivos_table', 5),
(28, '2024_07_10_200636_create_job_batches_table', 6),
(29, '2024_07_10_200649_create_notifications_table', 6),
(30, '2024_07_10_200705_create_imports_table', 6),
(31, '2024_07_10_200706_create_exports_table', 6),
(32, '2024_07_10_200707_create_failed_import_rows_table', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1d33d366-0823-4750-bed4-a27af999eed4', 'Filament\\Notifications\\DatabaseNotification', 'App\\Models\\User', 2, '{\"actions\":[{\"name\":\"download_csv\",\"color\":null,\"event\":null,\"eventData\":[],\"dispatchDirection\":false,\"dispatchToComponent\":null,\"extraAttributes\":[],\"icon\":null,\"iconPosition\":\"before\",\"iconSize\":null,\"isOutlined\":false,\"isDisabled\":false,\"label\":\"Descargar .csv\",\"shouldClose\":false,\"shouldMarkAsRead\":true,\"shouldMarkAsUnread\":false,\"shouldOpenUrlInNewTab\":true,\"size\":\"sm\",\"tooltip\":null,\"url\":\"\\/filament\\/exports\\/4\\/download?format=csv\",\"view\":\"filament-actions::link-action\"},{\"name\":\"download_xlsx\",\"color\":null,\"event\":null,\"eventData\":[],\"dispatchDirection\":false,\"dispatchToComponent\":null,\"extraAttributes\":[],\"icon\":null,\"iconPosition\":\"before\",\"iconSize\":null,\"isOutlined\":false,\"isDisabled\":false,\"label\":\"Descargar .xlsx\",\"shouldClose\":false,\"shouldMarkAsRead\":true,\"shouldMarkAsUnread\":false,\"shouldOpenUrlInNewTab\":true,\"size\":\"sm\",\"tooltip\":null,\"url\":\"\\/filament\\/exports\\/4\\/download?format=xlsx\",\"view\":\"filament-actions::link-action\"}],\"body\":\"Your venta export has completed and 1 row exported.\",\"color\":null,\"duration\":\"persistent\",\"icon\":\"heroicon-o-check-circle\",\"iconColor\":\"success\",\"status\":\"success\",\"title\":\"Exportaci\\u00f3n completada\",\"view\":\"filament-notifications::notification\",\"viewData\":[],\"format\":\"filament\"}', '2024-07-16 22:39:44', '2024-07-16 22:39:34', '2024-07-16 22:39:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Matricula', 'web', '2024-07-08 05:14:04', '2024-07-08 05:16:41'),
(2, 'view-any Certificado', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(3, 'view-any Certificado', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(4, 'view Certificado', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(5, 'view Certificado', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(6, 'create Certificado', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(7, 'create Certificado', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(8, 'update Certificado', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(9, 'update Certificado', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(10, 'delete Certificado', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(11, 'delete Certificado', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(12, 'restore Certificado', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(13, 'restore Certificado', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(14, 'force-delete Certificado', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(15, 'force-delete Certificado', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(16, 'replicate Certificado', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(17, 'replicate Certificado', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(18, 'reorder Certificado', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(19, 'reorder Certificado', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(20, 'view-any Curso', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(21, 'view-any Curso', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(22, 'view Curso', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(23, 'view Curso', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(24, 'create Curso', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(25, 'create Curso', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(26, 'update Curso', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(27, 'update Curso', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(28, 'delete Curso', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(29, 'delete Curso', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(30, 'restore Curso', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(31, 'restore Curso', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(32, 'force-delete Curso', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(33, 'force-delete Curso', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(34, 'replicate Curso', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(35, 'replicate Curso', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(36, 'reorder Curso', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(37, 'reorder Curso', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(38, 'view-any Matricula', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(39, 'view-any Matricula', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(40, 'view Matricula', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(41, 'view Matricula', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(42, 'create Matricula', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(43, 'create Matricula', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(44, 'update Matricula', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(45, 'update Matricula', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(46, 'delete Matricula', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(47, 'delete Matricula', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(48, 'restore Matricula', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(49, 'restore Matricula', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(50, 'force-delete Matricula', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(51, 'force-delete Matricula', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(52, 'replicate Matricula', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(53, 'replicate Matricula', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(54, 'reorder Matricula', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(55, 'reorder Matricula', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(56, 'view-any User', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(57, 'view-any User', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(58, 'view User', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(59, 'view User', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(60, 'create User', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(61, 'create User', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(62, 'update User', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(63, 'update User', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(64, 'delete User', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(65, 'delete User', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(66, 'restore User', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(67, 'restore User', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(68, 'force-delete User', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(69, 'force-delete User', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(70, 'replicate User', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(71, 'replicate User', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(72, 'reorder User', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(73, 'reorder User', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(74, 'view-any Venta', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(75, 'view-any Venta', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(76, 'view Venta', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(77, 'view Venta', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(78, 'create Venta', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(79, 'create Venta', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(80, 'update Venta', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(81, 'update Venta', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(82, 'delete Venta', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(83, 'delete Venta', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(84, 'restore Venta', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(85, 'restore Venta', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(86, 'force-delete Venta', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(87, 'force-delete Venta', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(88, 'replicate Venta', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(89, 'replicate Venta', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(90, 'reorder Venta', 'web', '2024-07-08 05:47:33', '2024-07-08 05:47:33'),
(91, 'reorder Venta', 'api', '2024-07-08 05:47:33', '2024-07-08 05:47:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2024-07-08 05:13:08', '2024-07-08 05:29:18'),
(2, 'Editor', 'web', '2024-07-08 05:13:25', '2024-07-08 05:13:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'demo', 'demo@gmail.com', NULL, '$2y$12$65IonYijWzD76cAlAw8On.KR8ot1EAokSw1NKFmp9api1j2iHqkjq', NULL, '2024-07-04 03:57:59', '2024-07-04 03:57:59'),
(2, 'daniel', 'dan@gmail.com', NULL, '$2y$12$Jv.Pcfxzb8TB30Gmym3Do.LEnzkjpm5n2BlAFKaP.UfC5syvEfdhK', 'Q9kkWmR6Y4WYFGyCzt0c16Hjb4pXIM7yAw3tzhH2WYsO0sQhHCOf02bYqCuw', '2024-07-09 01:56:34', '2024-07-09 01:56:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matricula_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `boleta` int(11) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `fecha_pago` date NOT NULL,
  `cuota` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `cancelado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `matricula_id`, `nombre`, `apellido`, `boleta`, `forma_pago`, `fecha_pago`, `cuota`, `valor`, `total`, `cancelado`, `created_at`, `updated_at`) VALUES
(12, 4, 'RAMO', 'VIDAL', 23455, 'efectivo', '2024-07-14', 2, 200000.00, 100000.00, 0, '2024-07-15 01:16:32', '2024-07-16 00:48:58'),
(13, 4, 'RAMO', 'VIDAL', 24567, 'efectivo', '2024-07-15', 1, 100000.00, 100000.00, 1, '2024-07-16 01:14:46', '2024-07-16 01:14:46');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `certificados`
--
ALTER TABLE `certificados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificados_matricula_id_foreign` (`matricula_id`),
  ADD KEY `certificados_curso_id_foreign` (`curso_id`),
  ADD KEY `certificados_venta_id_foreign` (`venta_id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exports_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_import_rows_import_id_foreign` (`import_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imports_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `instructivos`
--
ALTER TABLE `instructivos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matriculas_cursos_id_foreign` (`cursos_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_matricula_id_foreign` (`matricula_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `certificados`
--
ALTER TABLE `certificados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `exports`
--
ALTER TABLE `exports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imports`
--
ALTER TABLE `imports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instructivos`
--
ALTER TABLE `instructivos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `certificados`
--
ALTER TABLE `certificados`
  ADD CONSTRAINT `certificados_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificados_matricula_id_foreign` FOREIGN KEY (`matricula_id`) REFERENCES `matriculas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificados_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `exports`
--
ALTER TABLE `exports`
  ADD CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_cursos_id_foreign` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_matricula_id_foreign` FOREIGN KEY (`matricula_id`) REFERENCES `matriculas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
