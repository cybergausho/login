-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2024 a las 20:53:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `login`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` int(11) NOT NULL,
  `id_curso` bigint(2) UNSIGNED NOT NULL,
  `id_modalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aux_categoria`
--

CREATE TABLE `aux_categoria` (
  `id_aux_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aux_categoria`
--

INSERT INTO `aux_categoria` (`id_aux_categoria`, `nombre`) VALUES
(1, 'MARINERO'),
(2, 'COCINERO'),
(3, 'BASICO STCW-78'),
(4, 'ACTUALIZACION STCW-78');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aux_duracion`
--

CREATE TABLE `aux_duracion` (
  `id_aux_duracion` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aux_duracion`
--

INSERT INTO `aux_duracion` (`id_aux_duracion`, `nombre`) VALUES
(1, 'HORA'),
(2, 'HORAS'),
(3, 'MES'),
(4, 'MESES'),
(5, 'AÑO'),
(6, 'AÑOS'),
(7, 'CUATRIMESTRE'),
(8, 'TRIMESTRE'),
(9, 'SEMESTRE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aux_formacion`
--

CREATE TABLE `aux_formacion` (
  `id_aux_formacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aux_formacion`
--

INSERT INTO `aux_formacion` (`id_aux_formacion`, `nombre`) VALUES
(1, 'CURSO CORTO'),
(2, 'CURSO REGULAR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aux_inscripciones`
--

CREATE TABLE `aux_inscripciones` (
  `id_aux_inscripcion` int(11) NOT NULL,
  `abierta` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aux_modalidad`
--

CREATE TABLE `aux_modalidad` (
  `id_aux_modalidad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aux_modalidad`
--

INSERT INTO `aux_modalidad` (`id_aux_modalidad`, `nombre`) VALUES
(1, 'PRESENCIAL'),
(2, 'VIRTUAL SINCRONICO'),
(3, 'VIRTUAL ASINCRONICO'),
(4, 'HIBRIDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_modalidad` int(11) NOT NULL,
  `descripcion_corta` varchar(255) NOT NULL,
  `id_formacion` int(11) NOT NULL,
  `duracion_numero` int(11) NOT NULL,
  `id_duracion` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `id_categoria`, `id_modalidad`, `descripcion_corta`, `id_formacion`, `duracion_numero`, `id_duracion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'CURSO BASICO STCW-78', 3, 1, 'Descripcion corta como el pingo de santi', 1, 9, 4, 1, NULL, NULL),
(2, 'CURSO ACTUALIZACION STCW-78', 4, 1, 'Descripshort', 2, 6, 4, 1, NULL, NULL),
(3, 'SEGURIDAD PERSONAL Y RESPONSABILIDADES SOCIALES', 3, 1, 'Responder a situaciones de a la seguridad personal', 1, 1, 5, 1, NULL, NULL),
(4, 'AUXILIAR DE MAQUINAS NAVALES', 1, 1, 'Tripulación de apoyo en Sala de Máquinas del buque', 2, 2, 7, 1, NULL, NULL),
(5, 'AUXILIAR DE LA PUTA MADRE CASCO', 1, 1, 'Tripulación de apoyo en Sala de Máquinas del buque', 2, 2, 7, 1, NULL, NULL),
(6, 'SEGURIDAD PERSONAL CASCO QUE MAL LOCO', 3, 1, 'Responder a situacioUN GARRON\r\n', 1, 1, 5, 1, NULL, NULL),
(7, 'CURSO ASTERISCO ROTO DE SANTAIGO', 4, 1, 'Descripshort', 2, 6, 4, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_extras`
--

CREATE TABLE `curso_extras` (
  `curso_id` bigint(20) UNSIGNED NOT NULL,
  `destinatario` varchar(255) DEFAULT NULL,
  `requisitos` varchar(255) DEFAULT NULL,
  `objetivo` varchar(300) DEFAULT NULL,
  `descripcion_larga` longtext DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `asignatura` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `curso_extras`
--

INSERT INTO `curso_extras` (`curso_id`, `destinatario`, `requisitos`, `objetivo`, `descripcion_larga`, `foto`, `asignatura`, `created_at`, `updated_at`) VALUES
(1, 'PERSONAL CIVIL INTERESADO QUE TENGA PRIMARIO APROBADO.', 'EL PRIMARIO APROBADO.', 'SER UN BASICO STCW-78', 'LOREM IMPSUM LONG TEXT BASICO STCW-78', 'NONE', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edicions`
--

CREATE TABLE `edicions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_curso` bigint(20) UNSIGNED NOT NULL,
  `id_escuela` bigint(20) UNSIGNED NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  `fecha_apertura_inscripcion` date DEFAULT NULL,
  `fecha_cierre_inscripcion` date DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `edicions`
--

INSERT INTO `edicions` (`id`, `id_curso`, `id_escuela`, `fecha_desde`, `fecha_hasta`, `fecha_apertura_inscripcion`, `fecha_cierre_inscripcion`, `id_user`, `estado`, `created_at`, `updated_at`) VALUES
(1, 4, 3, '2024-10-02', '2024-09-28', '2024-09-10', '2024-09-20', 10, 1, NULL, NULL),
(2, 4, 2, '2024-09-02', '2024-09-28', '2024-09-30', '2024-10-03', 7, 1, NULL, NULL),
(3, 4, 3, '2024-09-10', '2024-09-28', '2024-09-30', '2024-10-03', 7, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuelas`
--

CREATE TABLE `escuelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cuatrigrama` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provincia` int(11) DEFAULT NULL,
  `localidad` int(11) DEFAULT NULL,
  `maps` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `escuelas`
--

INSERT INTO `escuelas` (`id`, `cuatrigrama`, `nombre`, `telefono`, `email`, `provincia`, `localidad`, `maps`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'NOMAMES', 'MARINA MERCANTE DEDU', '1178797912', 'marina-mercante@prefecturanaval.edu.ar', 1, 2, NULL, 1, NULL, '2024-09-24 17:32:32'),
(2, 'BBLA', 'EFOCAPEMM BAHIA BLANCA', '1111111111111', 'efocapemm-bahiablanca@gmail.com', 2, 1, NULL, 1, NULL, NULL),
(3, 'SLGR', 'EFOCAPEMM SALTO GRANDE', '222222222', 'efocapemm-slgr@gmail.com', NULL, NULL, NULL, NULL, '2024-09-24 17:26:30', '2024-09-24 17:26:30');

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
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marketing_contacto`
--

CREATE TABLE `marketing_contacto` (
  `id_marketing_contacto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `recibir_novedades` tinyint(1) NOT NULL,
  `destinatario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_20_044442_create_personal_access_tokens_table', 1),
(5, '2024_09_20_150128_create_escuelas_table', 2),
(6, '2024_09_20_150146_create_cursos_table', 2),
(7, '2024_09_20_150205_create_curso_extras_table', 2),
(8, '2024_09_20_150219_create_edicions_table', 2);

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
-- Estructura de tabla para la tabla `preguntas_frecuentes`
--

CREATE TABLE `preguntas_frecuentes` (
  `id_pregunta_frecuente` int(11) NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `respuesta` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas_frecuentes`
--

INSERT INTO `preguntas_frecuentes` (`id_pregunta_frecuente`, `pregunta`, `respuesta`) VALUES
(1, 'Quiero trabajar abordo de un buque como tripulante ¿Dónde debo estudiar?', 'Entre otros establecimientos educativos existentes en nuestro país, la Prefectura Naval Argentina cuenta con 28 Escuelas de Formación y Capacitación para el Personal Embarcado de la Marina Mercante (EFOCAPEMM) distribuidas a lo largo del país, donde, lueg'),
(2, '¿Qué asignaturas integran los programas para obtener el Certificado de Capacidad Náutica de Marinero o Auxiliar de Máquinas?', 'El año lectivo se divide en dos ciclos lectivos de CUATRO (04) meses cada uno.\r\n\r\nEl primero, inicia su cursada durante el mes de marzo a junio denominado ″ciclo común″, está integrado por todos los cursantes del periodo lectivo, y las asignaturas que lo '),
(3, '¿Dónde debo inscribirme para ingresar a la EFOCAPEMM?', 'Para llevar a cabo la inscripción debe acercarse de forma presencial a la Escuela de Formación y Capacitación para el Personal Embarcado de la Marina Mercante (EFOCAPEMM) más cercana a su domicilio.\r\nPara mayor información puede encontrar las Escuelas exi'),
(4, '¿Cuál es el costo de la matrícula de inscripción, cuota mensual y derechos de examen?', 'Cursar el año lectivo en cualquier EFOCAPEMM del país, tanto para MARINERO como para AUXILIAR DE MÁQUINAS, es totalmente GRATUITO, no requiere ningún abono o pago.\r\n\r\nVale aclarar que la emisión del Certificado de Capacidad Náutica respectivo si posee un '),
(5, '¿Qué labores puedo desarrollar como tripulante de un buque con los Certificados de Capacidad Náutica obtenidos luego de cursar en las EFOCAPEMM?', '\r\n\r\nEl Decreto N° 572/94 ″Reglamento de Formación y Capacitación del Personal Embarcado de la Marina Mercante″ (REFOCAPEMM), el cual puede bajarse haciendo click ACA establece los cargos que se pueden desempeñar como tripulante de un buque afectado a la n'),
(6, '¿Cuáles son los requisitos para ingresar a la EFOCAPEMM?', '    Edad mínima de DIECIOCHO (18) años.\r\n\r\n    Tener estudios secundarios completos.\r\n\r\n    No poseer antecedentes profesionales desfavorables comprobados.\r\n\r\n    No registrar antecedentes policiales o judiciales cuya naturaleza indique como no aconsejabl'),
(7, 'Una vez obtenido el Certificado de Capacidad Náutica de Marinero o Auxiliar de Máquinas, ¿Cómo continúa la carrera en la marina mercante?', 'El Decreto N° 572/94 ″Reglamento de Formación y Capacitación del Personal Embarcado de la Marina Mercante″ (REFOCAPEMM), el cual puede bajarse haciendo click ACA, establece los requisitos de ascenso para obtener una habilitación de mayor alcance (Máximos '),
(8, '¿Se pueden realizar los Cursos OMI STCW en las EFOCAPEMM?', 'Sí se pueden realizar los cursos OMI STCW en las EFOCAPEMM, para conocer más detalles al respecto haga click ACA donde encontrará la oferta educativa, fechas, Escuelas donde se dictarán, y sus respectivos contactos (correo electrónico y telefónico). '),
(9, '¿Cuál es el costo para realizar los cursos STCW en una EFOCAPEMM?', 'Los cursos STCW que son desarrollados en las EFOCAPEMM son GRATUITOS. Vale aclarar que la emisión del Certificado correspondiente al curso que apruebe tiene un arancel, el cual será abonado siguiendo las pautas descriptas haciendo click ACA y se puede ver'),
(10, '¿Los certificados de los cursos OMI STCW emitidos por una EFOCAPEMM son de alcance nacional o internacional?', 'Los Certificados STCW emitidos por una EFOCAPEMM son de alcance nacional e internacional, vale decir, deben ser aceptados para embarcar como tripulante en buques que enarbolen pabellón de cualquier bandera.'),
(11, '¿Cuál es la modalidad de cursada?', '\r\nLa oferta educativa desarrollada en las EFOCAPEMM responde a programas debidamente aprobados por la Autoridad de Aplicación del REFOCAPEMM (Subsecretaría de Puertos, Vías Navegables y Marina Mercante - Ministerio de Transporte), en la modalidad ″PRESENC'),
(12, '¿Dónde y/o como convalido mis certificados de los cursos OMI STCW emitidos por una EFOCAPEMM?', '\r\n\r\nLos Certificados STCW expedidos pueden ser convalidados iniciando el trámite - en forma personal - a través de cualquier EFOCAPEMM (aquella donde hizo los cursos u otra escuela distinta), siempre de forma presencial. Otra forma de realizar esta conval'),
(13, '¿Cuál es el costo del trámite para convalidar los certificados de los cursos OMI STCW expedido por una EFOCAPEMM?', 'El trámite para convalidar los Certificados STCW expedidos por una EFOCAPEMM es totalmente GRATUITO. '),
(14, '¿Por qué necesito convalidar los Certificados de los Cursos STCW realizados en una EFOCAPEMM?', 'El requerimiento de convalidar los Certificados de los Cursos STCW realizados en una EFOCAPEMM, es exigido por la Armada Argentina en Expedientes tramitados ante la Subsecretaría de Formación, Capacitación y Titulación del Personal Embarcado de la Marina Mercante. ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
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
(1, 'santiago bolano', 'admin@example.com', NULL, '$2y$12$RbTzIhKCz50CHLzpnBE4z.jD9LcRmYNDd/bhItRXpkICaGC3uWzT.', NULL, '2024-09-20 15:02:46', '2024-09-20 15:02:46'),
(2, 'santiago bolas tristes', 'example@example.com', NULL, '$2y$12$74RUajyXN9PuGXXSFanVWeE3fX9o7.KjuWI..JMlpx5cdnz/Upmfq', NULL, '2024-09-20 15:15:13', '2024-09-20 15:15:13'),
(3, 'santiago', 'santiagosolano036@gmail.com', NULL, '$2y$12$Jijccepa2B7tvta3CWo5PO/auxUoLl4WI2SbDuTcRxiE0Muaha5Xu', NULL, '2024-09-23 15:47:29', '2024-09-23 15:47:29'),
(4, 'santiago', 'tharo-te-pica-el-ano@gmail.com', NULL, '$2y$12$PVvAOrVCAFKosmCjc0cW.OlN8nfAUMIqHoCaaVlMsVsA6pD3ymuU.', NULL, '2024-09-23 16:04:17', '2024-09-23 16:04:17'),
(5, 'THARO', 'THARO-CHUPAPINGO@GMAIL.COM', NULL, '$2y$12$Pt.mRmAZi30DGzevFrlph.nzA2C5BSlSCXpG2E5/BopxxqH6rqSmi', NULL, '2024-09-23 16:09:31', '2024-09-23 16:09:31'),
(6, 'PERRO PERUANO', 'THARO-CARADEPENE@GMAIL.COM', NULL, '$2y$12$vULGewTBmQqrFMkLGaA5z.XgnX5iJ8jlKS7lJjjc1mDEokkgvVfPS', NULL, '2024-09-23 16:15:57', '2024-09-23 16:15:57'),
(7, 'GATO PETERO', 'SAN@GMAIL.COM', NULL, '$2y$12$DjMHG2LlPvkA.kXzRfysSuAxnLN8zYh/ji4JUu2QqfOrzvbcL195W', NULL, '2024-09-23 16:17:33', '2024-09-23 16:17:33'),
(8, 'SANTIAGO', 'SANTIAGO@GMAIL.COM', NULL, '$2y$12$jKX1/rLZcOuYCtOy0xmoROPLmbnvy0caEl2XW6Cjfy4C7VPn.WT0K', NULL, '2024-09-23 16:21:56', '2024-09-23 16:21:56'),
(9, 'SA', 'SA@GMAIL.COM', NULL, '$2y$12$ZC8n/EwVs.QEpNIreS7ieOXt22yX6RzaEnBaN2FViF7fQA3j5Y1bq', NULL, '2024-09-23 16:22:47', '2024-09-23 16:22:47'),
(10, 'GATO PERUANOOOO', 'GATO@GMAIL.COM', NULL, '$2y$12$y43ZB/snf7TkbvUzIVel2.bGZkrwFwdYIhL68EuiNtodzbERLm4l.', NULL, '2024-09-23 16:43:37', '2024-09-23 16:43:37'),
(11, 'Santiago Solano', 'THARO-CHUPAPINGO-PENE@GMAIL.COM', NULL, '$2y$12$DrRRO.weWlrQhvvrrSGuy.BK.knBAp33jicI72IDuvLvBSNyFKiIO', NULL, '2024-09-23 16:45:51', '2024-09-23 16:45:51'),
(12, 'Santiago Solano', 'THAROASDA-CHUPAPINGO@GMAIL.COM', NULL, '$2y$12$Z1gFkksvw0s6TRzQHqcbC.yBle.obudLd11UriFVcsQoQFde6GP7K', NULL, '2024-09-23 16:49:47', '2024-09-23 16:49:47'),
(13, 'Santiago Solano', 'THARO-CHUPAasdasdPINGO@GMAIL.COM', NULL, '$2y$12$jnUDdNwSyGcCxIo9k/DAoOb295DtvWXO.cbyDHq1VLXFjLzJUUs76', NULL, '2024-09-23 16:52:17', '2024-09-23 16:52:17'),
(14, 'Santiago Solano', 'THAASDASDRO-CHUPAPINGO@GMAIL.COM', NULL, '$2y$12$psxIK.9tbGcE/2AftVbD8eYTiIRmLO8OoA4wuXqUycHo3vouATqDG', NULL, '2024-09-23 16:54:08', '2024-09-23 16:54:08'),
(15, 'Santiago Solano', 'THASDASDARO-CHUPAPINGO@GMAIL.COM', NULL, '$2y$12$TRRh36nXU38IN4.MA5YCdOvT41Vl708duvLa9n4IDRZ3EYX/wH4tS', NULL, '2024-09-23 16:57:29', '2024-09-23 16:57:29'),
(16, 'Pedro', 'Pedro@gmail.com', NULL, '$2y$12$LR/kcf0otWjQL.MOtk3qauow5YkGYXKjdQAcQua2hcCWp44SZgLZi', NULL, '2024-09-25 22:03:40', '2024-09-25 22:03:40');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aux_categoria`
--
ALTER TABLE `aux_categoria`
  ADD PRIMARY KEY (`id_aux_categoria`);

--
-- Indices de la tabla `aux_duracion`
--
ALTER TABLE `aux_duracion`
  ADD PRIMARY KEY (`id_aux_duracion`);

--
-- Indices de la tabla `aux_formacion`
--
ALTER TABLE `aux_formacion`
  ADD PRIMARY KEY (`id_aux_formacion`);

--
-- Indices de la tabla `aux_inscripciones`
--
ALTER TABLE `aux_inscripciones`
  ADD PRIMARY KEY (`id_aux_inscripcion`);

--
-- Indices de la tabla `aux_modalidad`
--
ALTER TABLE `aux_modalidad`
  ADD PRIMARY KEY (`id_aux_modalidad`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cursos_categorias` (`id_categoria`),
  ADD KEY `fk_cursos_formacion` (`id_formacion`),
  ADD KEY `fk_cursos_duracion` (`id_duracion`),
  ADD KEY `fk_cursos_modalidad` (`id_modalidad`);

--
-- Indices de la tabla `curso_extras`
--
ALTER TABLE `curso_extras`
  ADD PRIMARY KEY (`curso_id`);

--
-- Indices de la tabla `edicions`
--
ALTER TABLE `edicions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_edicions_cursos` (`id_curso`),
  ADD KEY `fk_edicions_escuelas` (`id_escuela`),
  ADD KEY `fk_edicions_user` (`id_user`);

--
-- Indices de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `escuelas_cuatrigrama_unique` (`cuatrigrama`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marketing_contacto`
--
ALTER TABLE `marketing_contacto`
  ADD PRIMARY KEY (`id_marketing_contacto`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `preguntas_frecuentes`
--
ALTER TABLE `preguntas_frecuentes`
  ADD PRIMARY KEY (`id_pregunta_frecuente`),
  ADD UNIQUE KEY `pregunta` (`pregunta`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aux_categoria`
--
ALTER TABLE `aux_categoria`
  MODIFY `id_aux_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `aux_duracion`
--
ALTER TABLE `aux_duracion`
  MODIFY `id_aux_duracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `aux_formacion`
--
ALTER TABLE `aux_formacion`
  MODIFY `id_aux_formacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `aux_inscripciones`
--
ALTER TABLE `aux_inscripciones`
  MODIFY `id_aux_inscripcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aux_modalidad`
--
ALTER TABLE `aux_modalidad`
  MODIFY `id_aux_modalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `curso_extras`
--
ALTER TABLE `curso_extras`
  MODIFY `curso_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `edicions`
--
ALTER TABLE `edicions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marketing_contacto`
--
ALTER TABLE `marketing_contacto`
  MODIFY `id_marketing_contacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas_frecuentes`
--
ALTER TABLE `preguntas_frecuentes`
  MODIFY `id_pregunta_frecuente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `aux_categoria` (`id_aux_categoria`),
  ADD CONSTRAINT `fk_cursos_duracion` FOREIGN KEY (`id_duracion`) REFERENCES `aux_duracion` (`id_aux_duracion`),
  ADD CONSTRAINT `fk_cursos_formacion` FOREIGN KEY (`id_formacion`) REFERENCES `aux_formacion` (`id_aux_formacion`),
  ADD CONSTRAINT `fk_cursos_modalidad` FOREIGN KEY (`id_modalidad`) REFERENCES `aux_modalidad` (`id_aux_modalidad`);

--
-- Filtros para la tabla `curso_extras`
--
ALTER TABLE `curso_extras`
  ADD CONSTRAINT `fk_curso_extras` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `fk_cursos_extras` FOREIGN KEY (`curso_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `edicions`
--
ALTER TABLE `edicions`
  ADD CONSTRAINT `fk_edicions_cursos` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `fk_edicions_escuelas` FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id`),
  ADD CONSTRAINT `fk_edicions_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
