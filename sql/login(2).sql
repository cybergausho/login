-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2024 a las 20:09:32
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
(1, 'CURSO REGULAR'),
(2, 'CURSO ACTUALIZACIÓN'),
(3, 'CURSO BÁSICO'),
(4, 'CUSO ESPECÍFICO');

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
-- Estructura de tabla para la tabla `aux_roles`
--

CREATE TABLE `aux_roles` (
  `id_aux_roles` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aux_roles`
--

INSERT INTO `aux_roles` (`id_aux_roles`, `nombre`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'unidad academica'),
(4, 'lector');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aux_sitio`
--

CREATE TABLE `aux_sitio` (
  `id_aux_sitio` int(11) NOT NULL,
  `escuela` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aux_sitio`
--

INSERT INTO `aux_sitio` (`id_aux_sitio`, `escuela`) VALUES
(1, 0);

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
  `descripcion_corta` longtext NOT NULL,
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
(30, 'MARINERO', 1, 1, 'Tripulación de apoyo en Puente y cubierta del buque.', 2, 8, 4, 1, NULL, NULL),
(31, 'AUXILIAR DE MAQUINAS NAVALES', 1, 1, 'Tripulación de apoyo en Sala de Máquinas del buque.', 2, 8, 4, 1, NULL, NULL),
(32, 'ACTUALIZACIÓN DE LOS CURSOS BÁSICOS DEL CONVENIO STCW-78 ENMENDADO', 2, 1, 'Actualización del curso STCW 78', 1, 8, 2, 1, NULL, NULL),
(33, 'BÁSICO STCW-78', 3, 1, 'Familiarización para todo tripulante en seguridad, protección y aspectos específicos del buque. ', 1, 57, 2, 1, NULL, NULL),
(34, 'PRIMEROS AUXILIOS', 3, 1, 'Capacitación en el conocimiento y dominio de las técnicas básicas de Primeros Auxilios.', 1, 15, 2, 1, NULL, NULL),
(35, 'FORMACIÓN EN LA PREVENCIÓN Y LUCHA CONTRA INCENDIOS', 3, 1, 'Utilizar los equipos contra incendio de manera correcta.', 1, 10, 2, 1, NULL, NULL),
(36, 'TÉCNICAS DE SUPERVIVENCIA PERSONAL', 3, 1, 'Capacitación y entrenamiento en técnicas de supervivencia personal.', 1, 12, 2, 1, NULL, NULL),
(37, 'SEGURIDAD PERSONAL Y RESPONSABILIDADES SOCIALES', 3, 1, 'Responder a situaciones de a la seguridad personal y responsabilidades sociales.', 1, 12, 2, 1, NULL, NULL),
(38, 'FORMACIÓN DE TOMA DE CONCIENCIA DE LA PROTECCIÓN (PBIP 1)', 3, 1, 'Concienciar temas relacionados con la protección del buque acorde STCW 78 ( enmendado).', 1, 8, 2, 1, NULL, NULL),
(39, 'TÉCNICAS DE SUPERVIVENCIA PERSONAL (ACTUALIZACIÓN)', 2, 1, ' Refresco/Repaso/Actualización cumplido los CINCO (05) años de vigencia de los cursos STCW-78 Enm. Técnicas de Supervivencia Personal Sec.  A-VI/1 p.2 1.1 y Prevención y Lucha Contra Incendios Sec. A-VI/1 p.2 1.2', 1, 8, 2, 1, NULL, NULL),
(40, 'PREVENCIÓN Y LUCHA CONTRA INCENDIOS(ACTUALIZACIÓN)', 2, 1, ' Refresco/Repaso/Actualización cumplido los CINCO (05) años de vigencia de los cursos STCW-78 Enm. Técnicas de Supervivencia Personal Sec.  A-VI/1 p.2 1.1 y Prevención y Lucha Contra Incendios Sec. A-VI/1 p.2 1.2', 1, 8, 2, 1, NULL, NULL),
(41, 'CONTROL DE MULTITUDES Y FORMACIÓN SOBRE SEGURIDAD PARA EL PERSONAL QUE PRESTA  SERVICIOS EN ESPACIOS DESTINADOS A PASAJEROS', 4, 1, 'Competencias para toda persona designada para prestar asistencia a los pasajeros en situaciones de emergencia.', 1, 4, 2, 1, NULL, NULL),
(42, 'GESTIÓN DE EMERGENCIAS Y COMPORTAMIENTO HUMANO Y FORMACIÓN SOBRE SEGURIDAD DE LOS PASAJEROS, LA CARGA E INTEGRIDAD DEL CASCO', 4, 1, 'Conocimientos necesarios para toda persona responsable de la seguridad de los pasajeros en situaciones de emergencias.', 1, 3, 2, 1, NULL, NULL),
(43, 'FAMILIARIZACIÓN CON BUQUES TANQUES, PETROLEROS Y QUIMIQUEROS', 4, 1, ' Conocimientos básicos relativos a la carga o los equipos de manipulación de carga para operaciones de carga en petroleros o quimiqueros.', 1, 28, 2, 1, NULL, NULL),
(44, 'FAMILIARIZACIÓN CON BUQUES TANQUES GASEROS', 4, 1, ' Conocimientos básicos relativas a la carga o los equipos de manipulación de carga en buques tanque para el transporte de gas licuado.', 1, 15, 2, 1, NULL, NULL),
(45, 'FORMACIÓN EN SENSIBILIZACIÓN SOBRE PROTECCIÓN PARA LA GENTE DE MAR QUE TENGA ASIGNADAS TAREAS DE PROTECCIÓN ( PBIP2)', 4, 1, 'Identificar las condiciones de seguridad establecidas en el plan de protección del buque, reconocer riesgos y amenazas para la protección marítima, emplear en forma adecuada el equipamiento y los sistemas de protección del buque y conocer la normativa vigente.', 1, 10, 2, 1, NULL, NULL),
(46, 'COCINERO', 1, 1, 'Tripulación de apoyo en Cocina.', 2, 4, 4, 1, NULL, NULL),
(47, 'CAMARERO', 1, 1, 'Tripulación de apoyo en Cocina.', 2, 4, 4, 1, NULL, NULL),
(48, 'ENFERMERO', 1, 1, 'Tripulación de apoyo en enfermería.', 2, 4, 4, 1, NULL, NULL),
(49, 'PATRÓN MOTORISTA PROFESIONAL DE SEGUNDA', 1, 1, 'Tripulante a cargo de una embarcación habilitada para Servicios Especiales.', 2, 4, 4, 1, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_extras`
--

CREATE TABLE `curso_extras` (
  `curso_id` bigint(20) UNSIGNED NOT NULL,
  `destinatario` varchar(255) DEFAULT NULL,
  `requisitos` longtext DEFAULT NULL,
  `objetivo` longtext DEFAULT NULL,
  `descripcion_larga` longtext DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `asignatura` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `curso_extras`
--

INSERT INTO `curso_extras` (`curso_id`, `destinatario`, `requisitos`, `objetivo`, `descripcion_larga`, `foto`, `asignatura`, `created_at`, `updated_at`) VALUES
(30, 'Ciudadanos en general.', '1 - Edad mínima de DIECIOCHO (18) años de edad, y que hayan aprobado los exámenes de capacitación correspondientes./2 - Tener formación secundaria completa o constancia alumno regular del última año del secundario./3 - No poseer antecedentes profesionales desfavorables comprobados./4 - No registrar antecedentes policiales o judiciales cuya naturaleza indique como no aconsejable su inscripción./5 - Saber nadar y remar.', '1-Realizar tareas de nivel de apoyo, desempeñándose con responsabilidad y profesionalismo como parte de la tripulación./2-Comprender la importancia de las prescripciones nacionales e internacionales relacionadas con la seguridad de la vida humana, de los bienes que se transportan en los buques y de la protección del medio marino para minimizar el impacto derivado del error humano.', 'Gente de mar formada para la guardia en el Puente de navegación del buque y para asistir en diversas maniobras sobre cubierta, quienes cumplen funciones de, por ejemplo, timonel o contramaestre. Se encuentran bajo supervisión del Capitán y Oficiales de Cubierta.', NULL, 'El año lectivo se divide en dos ciclos lectivos de OCHO (08) meses cada uno. 1. El primero, inicia su cursada durante el mes de marzo a junio denominado ¿ciclo común¿, y las asignaturas que lo integra son: a. Nomenclatura Marinera - Reglamentación Marítima - Nociones de Pesca - Inglés - Primeros Auxilios Básicos - Técnicas de Supervivencia Personal - Formación en la Prevención y Lucha contra Incendios - Seguridad Personal y Responsabilidades Sociales y Protección del Buque e Instalaciones Portuarias. 2. El segundo ciclo, de agosto a noviembre es denominado ¿Período Especialización MARINERO¿, y las asignaturas que las integra son: a. Práctica de la Navegación - Conocimientos generales sobre Maniobras - Luces de Navegación, Señalización, Faros y Balizas - Cabuyería y Prácticas con Jarcias de labor.', NULL, NULL),
(31, 'Ciudadanos en general.', 'Edad mínima de DIECIOCHO (18) años de edad, y que hayan aprobado los exámenes de capacitación correspondientes./Tener formación secundaria completa o constancia alumno regular del última año del secundario./No poseer antecedentes profesionales desfavorables comprobados./No registrar antecedentes policiales o judiciales cuya naturaleza indique como no aconsejable su inscripción.Saber nadar y remar.', '1-Realizar tareas de nivel de apoyo, desempeñándose con responsabilidad y profesionalismo como parte de la tripulación./2-Comprender la importancia de las prescripciones nacionales e internacionales relacionadas con la seguridad de la vida humana, de los bienes que se transportan en los buques y de la protección del medio marino para minimizar el impacto derivado del error humano./3-Conocer el equipo que se utilizará a bordo, realizando los procedimientos adecuados para garantizar su correcto funcionamiento, llevando a cabo los preparativos referidos a la guardia, seguridad, medioambiente y emergencia.', 'Gente de mar formada para la guardia en la Sala de Máquinas del buque, quienes cumplen funciones de, por ejemplo, Engrasador.  Se encuentran bajo supervisión del Jefe de Máquinas y Oficiales de Máquinas.', NULL, 'El año lectivo se divide en dos ciclos lectivos de CUATRO (04) meses cada uno. El primero, inicia su cursada durante el mes de marzo a junio denominado ¿ciclo común¿, y las asignaturas que lo integra son: Nomenclatura Marinera - Reglamentación Marítima - Nociones de Pesca - Inglés - Primeros Auxilios Básicos - Técnicas de Supervivencia Personal - Formación en la Prevención y Lucha contra Incendios - Seguridad Personal y Responsabilidades Sociales y Protección del Buque e Instalaciones Portuarias. El segundo ciclo, de agosto a noviembre es denominado ¿Período Especialización AUXILIAR DE MáQUINAS¿, y las asignaturas que las integra son: Motores Marinos - Instrumental de Sala de Máquinas -Lubricación y Refrigeración - Guardia en Sala de Máquinas.', NULL, NULL),
(32, 'Personal de la Marina Mercante y Civiles.', NULL, NULL, 'El curso brinda a la gente de mar los procedimientos básicos para mantener en vigencia las competencias adquiridas con anterioridad para el desempeñ;o adecuado de las funciones asignadas a bordo. Aplicado a Técnicas de supervivencia personal y a Prevención y lucha contra incendios.', NULL, 'Técnicas de Supervivencia Personal y Prevención y Lucha Contra Incendios.', NULL, NULL),
(33, 'Personal de la Marina Mercante y Civiles.', NULL, NULL, 'Todo marinero que preste servicio en cualquier tipo de buque, a quien se le hayan asignado responsabilidades de seguridad, protección y prevención de la contaminación en el funcionamiento del buque, necesita instrucción básica en seguridad. Dicha instrucción abarca técnicas de supervivencia personal, conocimientos básicos de prevención y lucha contra incendios, conocimientos elementales de primeros auxilios y responsabilidades personales y sociales. Este requisito se aplica prácticamente a todos los marineros que prestan servicio en buques mercante, así como a los que están recibiendo formación. Asimismo, cada marino que se enrole por primera vez en un buque deberá recibir formación de familiarización en seguridad, protección y aspectos específicos del buque', NULL, 'Formación en la Prevención y Lucha Contra Incendios, Formación en Toma de Conciencia de la Protección, Primeros Auxilios Básicos, Seguridad Personal y Responsabilidades Sociales, Técnicas de Supervivencia Personal.', NULL, NULL),
(34, 'Personal de la Marina Mercante y Civiles.', NULL, 'El curso brinda a los alumnos las competencias necesarias para reconocer y responder ante situaciones de auxilio, tomando la decision correcta, priorizando la seguridad de la vida, reduciendo el sufrimiento de la victima hasta la llegada del medico facilitando el tratamiento y traslado del paciente.', 'Siguiendo los requerimientos del Convenio Internacional sobre Normas de Formación, Titulación y Guardia para la Gente de Mar (Convenio STCW, enmendado), el alumno deberá estar capacitado y entrenado en el conocimiento y dominio de las técnicas básicas de Primeros Auxilios. Desde el rol que cumpla, empleado o contratado a bordo del buque, o como parte de la dotación del mismo, deberá dar respuesta efectiva a situaciones de auxilio, tomando la decisión correcta y priorizando la seguridad de la vida, reduciendo el sufrimiento de la víctima hasta la llegada del médico.', NULL, NULL, NULL, NULL),
(35, 'Personal de la Marina Mercante y Civiles.', NULL, 'El curso brinda a los alumnos las competencias necesarias para reconocer y responder ante situaciones de prevencion prioritariamente, y lucha contra incendio, lo que permitira tomar las medidas necesarias en cuanto a la seguridad del personal del buque y poder utilizar los equipos contra incendio de manera correcta.', 'Acorde lo requerido por el Convenio Internacional sobre Normas de Formación, Titulación y Guardia para la Gente de Mar - STCW en su forma enmendada (Manila 2010), esta asignatura brinda la capacitación y entrenamiento permanente de la gente de mar, tanto empleada o contratada a bordo del buque en la calidad que sea, como parte de su dotación, en los conocimientos relacionados con la prevención y lucha contra incendios, tendiente a la toma de las medidas necesarias en cuanto a prevención de incendios para la seguridad del personal del buque y de los bienes, así como la adecuada utilización de los equipos.', NULL, NULL, NULL, NULL),
(36, 'Personal de la Marina Mercante y Civiles.', NULL, 'El curso brinda a los alumnos las competencias necesarias para reconocer y responder a situaciones de emergencia y supervivencia en el mar, adquirir habilidades y destrezas en el manejo de tecnicas basicas de supervivencia y familiarizacion con las normas internacionales, conducir desplazamiento de evacuacion con seguridad, comunicarse eficazmente en la interaccion grupal.', 'La capacitación y entrenamiento de todas las personas empleadas o contratadas a bordo de un buque como parte de su dotación, a las que se le asignen cometidos relacionados con la seguridad, prevención de la contaminación en el ámbito de operaciones y en técnicas de supervivencia personal, acorde los lineamientos del Convenio Internacional sobre Normas de Formación, Titulación y Guardia para la Gente de Mar (Convenio STCW enmendado), demanda un proceso que articula teoría y práctica para el logro de una efectiva operatividad a bordo.', NULL, NULL, NULL, NULL),
(37, 'Personal de la Marina Mercante y Civiles.', NULL, 'El curso brinda a los alumnos las competencias necesarias para responder a situaciones vinculadas a la seguridad personal y responsabilidades sociales en lo referente a situaciones de emergencia, equipos y procedimientos asi como en la concientizacion del personal sobre los peligros que existen abordo de los buques.', 'La capacitación y entrenamiento de la gente de mar en seguridad personal y responsabilidades sociales, según los requerimientos del Convenio Internacional sobre Normas de Formación, Titulación y Guardia para la Gente de Mar (Convenio STCW enmendado), les permitirá responder a situaciones de emergencia, uso de equipos y aplicación de procedimientos con conciencia y responsabilidad, alcanzando un desempeño seguro y efectivo.', NULL, NULL, NULL, NULL),
(38, 'Personal de la Marina Mercante y Civiles.', NULL, 'El curso tiene como objetivo concientizar a toda la gente de mar (sin distincion de funciones asignadas a bordo) en temas  relacionados con la protección  del buque acorde STCW 78 en su forma enmendada. Conocer los distintos niveles de proteccion, los planes de protección y el rol de sus responsables. (ACORDE Cap. VI, Regla VI/6, Sección A-VI/6-1     STCW 78   PBIP1)', 'La presente asignatura se orienta a concientizar a la gente de mar, sin distinción de funciones asignadas a bordo, en temas relacionados con la protección del buque, acorde las prescripciones del Capítulo VI, Regla VI/6, Sección A- VI/6-1 del Convenio Internacional de Formación, Titulación y Guardia para la gente de Mar (Convenio STCW enmendado).', NULL, NULL, NULL, NULL),
(39, 'Personal embarcado de la Marina Mercante.', '1-Edad mínima de DIECIOCHO (18) años./2-No poseer antecedentes profesionales desfavorables comprobados./3-No registrar antecedentes policiales o judiciales cuya naturaleza indique como no aconsejable su inscripción./4-Saber nadar y remar.', 'Brindar a la gente de mar las herramientas necesarias para su actualización en conocimientos y procedimientos básicos según los nuevos requerimientos del Código de Formación, Titulación y Guardia para la Gente de Mar.', 'Todo tripulante que preste servicio en cualquier tipo de buque, a quien se le hayan asignado responsabilidades de seguridad, protección y prevención de la contaminación en el funcionamiento del buque, necesita instrucción básica en seguridad. Dicha instrucción abarca técnicas de supervivencia personal, conocimientos básicos de prevención y lucha contra incendios, conocimientos elementales de primeros auxilios y responsabilidades personales y sociales. Este requisito se aplica prácticamente a todos los tripulantes que prestan servicio en buques mercante, así como a los que están recibiendo formación.', NULL, 'Técnicas de Supervivencia Personal.', NULL, NULL),
(40, 'Personal embarcado de la Marina Mercante.', '1-Edad mínima de DIECIOCHO (18) años./2-No poseer antecedentes profesionales desfavorables comprobados./3-No registrar antecedentes policiales o judiciales cuya naturaleza indique como no aconsejable su inscripción./4-Saber nadar y remar.', 'Brindar a la gente de mar las herramientas necesarias para su actualización en conocimientos y procedimientos básicos según los nuevos requerimientos del Código de Formación, Titulación y Guardia para la Gente de Mar.', 'Todo tripulante que preste servicio en cualquier tipo de buque, a quien se le hayan asignado responsabilidades de seguridad, protección y prevención de la contaminación en el funcionamiento del buque, necesita instrucción básica en seguridad. Dicha instrucción abarca técnicas de supervivencia personal, conocimientos básicos de prevención y lucha contra incendios, conocimientos elementales de primeros auxilios y responsabilidades personales y sociales. Este requisito se aplica prácticamente a todos los tripulantes que prestan servicio en buques mercante, así como a los que están recibiendo formación.', NULL, 'Prevención y Lucha contra Incendios.', NULL, NULL),
(41, 'Personal embarcado de la Marina Mercante.', 'Certificado de Capacidad Náutica y Certificado de los Cursos STCW-78 Enmendado.', 'Conocer y poder utilizar los dispositivos salvavidas y planes de control, durante la navegación, en los zafarranchos y las estaciones de embarque según requerimientos del STCW 78 en su forma enmendada.', 'El curso brinda a los alumnos las competencias necesarias para conocer y poder utilizar los dispositivos salvavidas y planes de control, durante la navegación, en los zafarranchos y las estaciones de embarque según requerimientos del STCW 78 en su forma enmendada. El curso además proporciona conocimiento referente al manejo de situaciones de emergencia que afecte al pasajero, conocer las particularidades del comportamiento humano en dichas circunstancias tratando de optimizar las posibilidades de supervivencia de los pasajeros y de la tripulación.', NULL, 'Control de Multitudes.', NULL, NULL),
(42, 'Personal embarcado de la Marina Mercante.', 'Certificado de Capacidad Náutica y Certificado de los Cursos STCW-78 Enmendado.', 'Brinda a la gente de mar las competencias necesarias para la gestión de planes de emergencia abordo de buques para la preservación de la seguridad de los pasajeros y tripulantes según los requerimientos del STCW 78 en su forma enmendada, adquirir habilidades individuales, grupales y organizacionales para la gestión de emergencias y comportamiento humano.', 'El curso brinda a la gente de mar las competencias necesarias para la gestión de planes de emergencia abordo de buques para la preservación de la seguridad de los pasajeros y tripulantes según los requerimientos del STCW 78 en su forma enmendada, adquirir habilidades individuales, grupales y organizacionales para la gestión de emergencias y comportamiento humano.', NULL, 'Gestión de Emergencias y Comportamiento Humano', NULL, NULL),
(43, 'Personal embarcado de la Marina Mercante.', 'Certificado de Capacidad Náutica y Certificados de los Básicos Cursos STCW-78 Enmendado.n', 'El curso brinda a la gente de mar las competencias necesarias para desempeñarse a bordo de este tipo de buques en lo referente a manipulación de los distintos cargamentos en condiciones de seguridad, para la promoción de la protección del medio ambiente marino, y la seguridad de la vida humana en el mar.n', 'El curso brinda a la gente de mar las competencias necesarias para desempeñarse a bordo de este tipo de buques en lo referente a manipulación de los distintos cargamentos en condiciones de seguridad, para la promoción de la protección del medio ambiente marino, y la seguridad de la vida humana en el mar.', NULL, 'Familiarización Buque Tanque Petroleros y Quimiqueros.', NULL, NULL),
(44, 'Personal embarcado de la Marina Mercante.', 'Certificado de Capacidad Náutica y Certificados de los Cursos Básicos STCW-78 Enmendado.', 'El curso brinda a la gente de mar las competencias necesarias para desempeñarse a bordo de este tipo de buques en lo referente a operatoria para el transporte de gas licuado, así como las medidas de salud y seguridad de la vida humana en el mar.n', 'El curso brinda a la gente de mar las competencias necesarias para desempeñarse a bordo de este tipo de buques en lo referente a operatoria para el transporte de gas licuado, así como las medidas de salud y seguridad de la vida humana en el mar.', NULL, 'Familiarización Buque Tanque Gaseros', NULL, NULL),
(45, 'Personal embarcado de la Marina Mercante.', 'Haber aprobado el curso Formación en Toma de Conciencia de la Protección Sec. A-VI/6 p.4n', 'El curso brinda a los alumnos las herramientas necesarias para aquellos tripulantes embarcados que tengan asignados deberes vinculados a la proteccion del buque. El objetivo es poder identificar las condiciones de seguridad establecidas en el plan de proteccion del buque, reconocer riesgos y amenazas para la proteccion maritima, conocer como efectuar inspecciones periodicas en el buque, emplear en forma adecuada el equipamiento y los sistemas de proteccion del buque y conocer la normativa vigente.', 'El curso brinda a los alumnos las herramientas necesarias para aquellos tripulantes embarcados que tengan asignados deberes vinculados a la protección del buque. El objetivo es poder identificar las condiciones de seguridad establecidas en el plan de protección del buque, reconocer riesgos y amenazas para la protección marítima, emplear en forma adecuada el equipamiento y los sistemas de protección del buque y conocer la normativa vigente.', NULL, 'Formación en sensibilización sobre protección para la gente de mar que tenga asignada tareas de protección', NULL, NULL),
(46, 'Ciudadanos en general.', '1-Edad mínima de DIECIOCHO (18) años./2-No poseer antecedentes profesionales desfavorables comprobados./3-No registrar antecedentes policiales o judiciales cuya naturaleza indique como no aconsejable su inscripción./4-Saber nadar y remar./5-Deberá contar con un certificado y/o título habilitante que avale dicha profesión.', '1-Adquirir competencias específicas para realizar tareas de nivel apoyo, desempeñándose con responsabilidad y profesionalismo como parte de la tripulación./2-Comprender la importancia de las prescripciones nacionales e internacionales relacionadas con la seguridad de la vida humana, de los bienes que se transportan en los buques y de la protección del medio marino para minimizar el impacto derivado del error humano./3-Conocer el equipo que se utilizará a bordo, realizando los procedimientos adecuados para garantizar su correcto funcionamiento, llevando a cabo los preparativos referidos a la guardia, seguridad, medioambiente y emergencia.', 'Gente de mar formada para cumplir funciones como camarero/a o cocinero/a abordo de buques de bandera nacional. Se encuentran bajo supervisión del Primer Oficial y Capitán.', NULL, 'Primer ciclo del año lectivo. Inicia su cursada durante el mes de marzo a junio denominado ¿ciclo común¿, y las asignaturas que lo integra son:A-Nomenclatura Marinera - Reglamentación Marítima - Nociones de Pesca - Inglés - Primeros Auxilios Básicos - Técnicas de Supervivencia Personal - Formación en la Prevención y Lucha contra Incendios - Seguridad Personal y Responsabilidades Sociales y Protección del Buque e Instalaciones Portuarias.', NULL, NULL),
(47, 'Ciudadanos en general.', '1-Edad mínima de DIECIOCHO (18) años./2-No poseer antecedentes profesionales desfavorables comprobados./3-No registrar antecedentes policiales o judiciales cuya naturaleza indique como no aconsejable su inscripción./4-Saber nadar y remar./5-Deberá contar con un certificado o título habilitante que avale dicha profesión.', 'Formar profesionales para tripular buques mercantes.', 'Gente de mar formada para cumplir funciones como camarero/a abordo de buques de bandera nacional. Se encuentran bajo supervisión del Primer Oficial y Capitán.', NULL, 'Primer ciclo del año lectivo. Inicia su cursada durante el mes de marzo a junio denominado ¿ciclo común¿, y las asignaturas que lo integra son:Nomenclatura Marinera - Reglamentación Marítima - Nociones de Pesca - Inglés - Primeros Auxilios Básicos - Técnicas de Supervivencia Personal - Formación en la Prevención y Lucha contra Incendios - Seguridad Personal y Responsabilidades Sociales y Protección del Buque e Instalaciones Portuarias.', NULL, NULL),
(48, 'Ciudadanos en general.', '1-Edad mínima de DIECIOCHO (18) años./2-No poseer antecedentes profesionales desfavorables comprobados./3-No registrar antecedentes policiales o judiciales cuya naturaleza indique como no aconsejable su inscripción./4-Saber nadar y remar./5-Deberá contar con un certificado o título habilitante que avale dicha profesión.', '1-Adquirir competencias específicas para realizar tareas de nivel apoyo, desempeñándose con responsabilidad y profesionalismo como parte de la tripulación./2-Comprender la importancia de las prescripciones nacionales e internacionales relacionadas con la seguridad de la vida humana, de los bienes que se transportan en los buques y de la protección del medio marino para minimizar el impacto derivado del error humano./3-Conocer el equipo que se utilizará a bordo, realizando los procedimientos adecuados para garantizar su correcto funcionamiento, llevando a cabo los preparativos referidos a la guardia, seguridad, medioambiente y emergencia.', 'Gente de mar formada para cumplir funciones como enfermero/a abordo de buques de bandera nacional. Se encuentran bajo supervisión del Primer Oficial y Capitán.', NULL, 'Primer ciclo del año lectivo.Inicia su cursada durante el mes de marzo a junio denominado ¿ciclo común¿, y las asignaturas que lo integra son:Nomenclatura Marinera - Reglamentación Marítima - Nociones de Pesca - Inglés - Primeros Auxilios Básicos - Técnicas de Supervivencia Personal - Formación en la Prevención y Lucha contra Incendios - Seguridad Personal y Responsabilidades Sociales y Protección del Buque e Instalaciones Portuarias.', NULL, NULL),
(49, 'Ciudadanos en general.', '1-Edad mínima de VEINTIUN (21) años./2-No poseer antecedentes profesionales desfavorables comprobados./3-No registrar antecedentes policiales o judiciales cuya naturaleza indique como no aconsejable su inscripción./4-Saber nadar y remar./5-Ser Patrón Motorista Profesional de Tercera contar con 1 año de embarco ó Marinero de Zona Especial y acreditar 2 años de embarco./6-Poseer Enseñanza Primaria aprobada.', 'El alumno estará capacitado, entrenado y preparado, para conocer los elementos que comprenden su ámbito de trabajo, poder operarlos con eficacia, contar conforme a sus saberes con las herramientas suficientes para responder al comando del buque en forma satisfactoria./Responder los comandos de buques con certificados especial.', 'El curso brinda a los ciudadanos las competencias necesarias para conducir buques con Servicios Especiales -dedicados a actividades comerciales entre ellas: transporte de pasajeros, carga y pesca artesanal en el ámbito marítimo, fluvial y lacustre.', NULL, 'Nomenclatura marinera. Adelantos tecnológicos Reglamentación marítima Práctica de la navegación Conocimientos generales sobre maniobras Luces de navegación Cabuyería y prácticas con jarcias de labor Motores marinos Seguridad personal y responsabilidades Primeros auxilios básicos Técnicas de supervivencia personal Formación y prevención y lucha contra incendios Protección de buques e Instalaciones Portuarias', NULL, NULL);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuelas`
--

CREATE TABLE `escuelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cuatrigrama` varchar(5) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `emailsecundario` varchar(255) DEFAULT NULL,
  `provincia` int(11) DEFAULT NULL,
  `localidad` int(11) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `maps` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `escuelas`
--

INSERT INTO `escuelas` (`id`, `cuatrigrama`, `nombre`, `telefono`, `email`, `emailsecundario`, `provincia`, `localidad`, `direccion`, `maps`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'NOMAM', 'MARINA MERCANTE DEDU', '1178797912', 'marina-mercante@prefecturanaval.edu.ar', '', 1, 2, '', NULL, 1, NULL, '2024-09-24 17:32:32'),
(2, 'BABA', 'EFOCAPEMM BAHIA BLANCA', '1111111111111', 'efocapemm-bahiablanca@gmail.com', '', 2, 1, '', NULL, 1, NULL, NULL),
(3, 'SLGR', 'EFOCAPEMM SALTO GRANDE', '222222222', 'efocapemm-slgr@gmail.com', '', NULL, NULL, '', NULL, NULL, '2024-09-24 17:26:30', '2024-09-24 17:26:30'),
(33, 'BBLA', 'BAHIA BLANCA', '02914571488', 'bbla-efocapemm@prefecturanaval.gov.ar', 'bbla-efocapemm@prefecturanaval.gov.ar', NULL, NULL, 'Teofilo Salustio entre calle Guarda Costa Rio Iguazu y Islas Maslvinas', 'https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d49782.499660594454!2d-62.30729760109961!3d-38.75438577567906!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sprefectura%20bahia%20blanca!5e0!3m2!1ses-419!2sar!4v1668914112247!5m2!1ses-419!2sar', 1, NULL, NULL),
(34, 'CURU', 'CONCEPCION DEL URUGUAY', '03442-437893', 'curu-efocapemm@prefecturanaval.gov.ar', 'S/D', NULL, NULL, 'Av. Paysandú y Dra. Ratto', 'https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3173.460389034602!2d-58.22420982943941!3d-32.47721811112378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sprefectura%20concepcion%20del%20uruguay!5e0!3m2!1ses-419!2sar!4v1668922652629!5m2!1ses-419!2sar', 1, NULL, NULL),
(35, 'CORR', 'CORRIENTES', '03794-430865', 'corr-efocapemm@prefecturanaval.gov.ar', 'efocapemm@yahoo.com.ar', NULL, NULL, 'Pasaje Manuel Florencio Mantilla Nº 385', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3540.243178578475!2d-58.83772708447019!3d-27.461687682894393!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94456caf5a9ef675%3A0x33a2b81189270a60!2sPrefectura%20Naval%20Argentina%20Prefectura%20Co', 1, NULL, NULL),
(36, 'LIBR', 'PASO DE LOS LIBRES', '03772-424327', 'libr-efocapemm@prefecturanaval.gov.ar', 'efocapemm-pasodeloslibres@outlook.com', NULL, NULL, 'Colon 423', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13860.794015749738!2d-57.097842818074575!3d-29.71400873806936!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94535df2d5e0ed31%3A0xe322b7c348ac5374!2sCentro%20de%20Instrucci%C3%B3n%20Prefectura%20N', 1, NULL, NULL),
(37, 'CLON', 'COLON', '03447-421619', 'clon-efocapemm@prefecturanaval.gov.ar', 'efocapemmclon94@gmail.com', NULL, NULL, 'Pasaje 29 de Octubre 130', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3375.5546845192466!2d-58.138998184380974!3d-32.21622808114496!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95ae3304149839d7%3A0xa9f332debe488e76!2sPrefectura%20De%20Col%C3%B3n!5e0!3m2!1ses-419!2', 1, NULL, NULL),
(38, 'CRIV', 'COMODORO RIVADAVIA', '0297-4473863', 'criv-efocapemm@prefecturanaval.gov.ar', 'sin@datos', NULL, NULL, 'M. Àbasolo y Sarmiento', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4781.21878904464!2d-67.47947514020022!3d-45.85925009137285!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xbde4555aaadda6c1%3A0x1a0a9e11716dd5d4!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses-419!2s', 1, NULL, NULL),
(39, 'DESE', 'PUERTO DESEADO', '0297-4872322', 'dese-efocapemm@prefecturanaval.gov.ar', 'dese-efocapemm@prefecturanaval.gov.ar', NULL, NULL, 'España 2818', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2682.4571949289507!2d-65.91063258400578!3d-47.75318567919458!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xbddd9fe546722339%3A0x6e8eb7aa4e8dc0f6!2sPrefectura%20Puerto%20Deseado%20PNA..!5e0!3m2!1s', 1, NULL, NULL),
(40, 'ELDO', 'ELDORADO', '03754-482230', 'eldo-efocapemm@prefecturanaval.gov.ar', 'uaeldorado@yahoo.com', NULL, NULL, 'Av. 9 de julio 2590', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3572.723212078444!2d-54.6958979!3d-26.4324073!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94f773f895354951%3A0x69f78dcc97575446!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses!2sar!4v1675370323968!5m2!1ses!2sar', 1, NULL, NULL),
(41, 'ENSS', 'ESCUELA NACIONAL DE SALVAMENTO Y BUCEO', '4313-0015', 'enss-efocapemm@prefecturanaval.gov.ar', 'enss-efocapemm@prefecturanaval.gov.ar', NULL, NULL, 'Av. Edison 2280 Dna. E', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3285.1260616124987!2d-58.38285548433207!3d-34.57567668046677!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bccaab7351e305%3A0x5434207a2399482e!2sEscuela%20Nacional%20Superior%20de%20Salvamento%', 1, NULL, NULL),
(42, 'FORM', 'FORMOSA', '0370-4430811', 'form-efocapemm@prefecturanaval.gov.ar', 'efoformpna@hotmail.com', NULL, NULL, 'Av. 25 de Mayo y Rivera Formosa', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3580.4540121973637!2d-58.16531918449185!3d-26.18190538344785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x945ca5dc3720acf5%3A0xf185bbe00e8c409!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses-419!2', 1, NULL, NULL),
(43, 'GOYA', 'GOYA', '0377-421419', 'goya-efocapemm@prefecturanaval.gov.ar', 'efocapemmgoya@hotmail.com', NULL, NULL, 'Av. Caaguazú y 25 de Mayo', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3484.698665568835!2d-59.27502538444026!3d-29.14407718221873!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x944e84b91ab4d50b%3A0x4638993c3d5dfc70!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses-419!2', 1, NULL, NULL),
(44, 'IFOR', 'INSTITUTOS DE FORMACION', '03487-434452', 'ifor-efocapemm@prefecturanaval.gov.ar', 'efocapemm.aesu@gmail.com', NULL, NULL, 'Crucero Gral. Belgrano 302', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3304.2118842192863!2d-59.02449548434237!3d-34.089712080595795!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bb0b641e2d985f%3A0xc070942e7ac7938e!2sINSTITUTOS%20DE%20FORMACI%C3%93N%20PREFECTURA%2', 1, NULL, NULL),
(45, 'LPAZ', 'LA PAZ (ANEXO EFOCAPEMM PARANA)', '03437-423902', 'lpaz-efocapemm@prefecturanaval.gov.ar', 'efocapemm-lpaz@hotmail.com', NULL, NULL, 'Rondeau 1233', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3429.4265759044893!2d-59.64260968441015!3d-30.734517081636607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95b34d915e5572cf%3A0xca7b54e8860ef094!2sPrefectura%20La%20Paz!5e0!3m2!1ses-419!2sar!4v1', 1, NULL, NULL),
(46, 'LPLA', 'LA PLATA', '0221-46444003', 'lpla-efocapemm@prefecturanaval.gov.ar', 'ccrlpla@hotmail.com', NULL, NULL, 'Baradero s/n y Cabecera Dock Central (Berisso)', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d52372.35759392658!2d-57.95681247713625!3d-34.87450673166799!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95a2e57bc41983e9%3A0x7b18282057a2b892!2sESCUELA%20MARINA%20MERCANTE%20LA%20PLATA!5e0!3m2!', 1, NULL, NULL),
(47, 'MADR', 'PUERTO MADRYN', '02804451603', 'madr-efocapemm@prefecturanaval.gov.ar', 'madr-efocapemm@prefecturanaval.gov.ar', NULL, NULL, 'Thompson 50', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2929.2418500435247!2d-65.03735058413938!3d-42.76209017916192!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xbe024a8460fea37d%3A0x523c424e544b3d08!2sPREFECTURA%20PUERTO%20MADRYN!5e0!3m2!1ses-419!2s', 1, NULL, NULL),
(48, 'TIGR', 'TIGRE', '011-4510200', 'tigr-efocapemm@prefecturanaval.gov.ar', 'S/D', NULL, NULL, 'General Mitre 165', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3291.2497709066324!2d-58.58120168433533!3d-34.42041018050737!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bca5bdc005cf4d%3A0x124ee7b080145409!2sPrefectura%20Naval%20Tigre!5e0!3m2!1ses-419!2sar', 1, NULL, NULL),
(49, 'MPLA', 'MAR DEL PLATA', '0223-4800715', 'mpla-efocapemm@prefecturanaval.gov.ar', 'efocapemm.mpla@gmail.com', NULL, NULL, 'Av. de los pescadores 851', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3141.96542006375!2d-57.543995784254584!3d-38.047892079710635!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9584dde89d038bf9%3A0xb8076a432c14e8cc!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses-419!', 1, NULL, NULL),
(50, 'OLVA', 'CALETA OLIVIA', '0297-4851275', 'olva-efocapemm@prefecturanaval.gov.ar', 'olva-efocapemm@prefecturanaval.gov.ar', NULL, NULL, 'Av. de los Martires del Crucero Gral. Belgrano 60', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2749.4025862042963!2d-67.51498648404211!3d-46.44071957912457!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xbde5dfa31617e149%3A0x48fb54633cb81adb!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses-419!', 1, NULL, NULL),
(51, 'PARA', 'PARANA', '0343-4310201', 'para-efocapemm@prefecturanaval.gov.ar', 'sin@datos', NULL, NULL, 'Guemez y Liniers', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3393.867015274497!2d-60.521557084390864!3d-31.719527481304183!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95b4526ec009406d%3A0x84a37118b6eadb0a!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses-419', 1, NULL, NULL),
(52, 'PCOL', 'PUNTA COLORADA', '02934-481154', 'pcol-efocapemm@prefecturanaval.gov.ar', 'prefecturapuntacolorada@hotmail.com', NULL, NULL, 'Manzana 2, Casa 1 Bº 25 de Mayo', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2983.0330043910913!2d-65.36758068416852!3d-41.6117979792443!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95f91dc9b9e8b513%3A0x6ac4f36f34dfb85e!2sPrefectura%20Punta%20Colorada!5e0!3m2!1ses-419!2s', 1, NULL, NULL),
(53, 'POSA', 'POSADAS', '0376-4402269', 'posa-efocapemm@prefecturanaval.gov.ar', 'efocapemmposadas@hotmail.com', NULL, NULL, 'Malvinas Argentinas y Combate Mpororé', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3543.678112364757!2d-55.91660338447205!3d-27.35453008293928!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x945795f538782ec3%3A0xe4fcdfb74be4b434!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses-419!2', 1, NULL, NULL),
(54, 'QUEQ', 'QUEQUEN', '02262-450514', 'queq-efocapemm@prefecturanaval.gov.ar', 'queq-efocapemm@prefecturanaval.gov.ar', NULL, NULL, 'Calle 507 945', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3119.232555026576!2d-58.706264384242175!3d-38.57449217962168!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x958f98259746133f%3A0xf930574793134d71!2sPrefectura%20Quequ%C3%A9n!5e0!3m2!1ses-419!2sar!', 1, NULL, NULL),
(55, 'RAWS', 'RAWSON', '0280-4496004', 'raws-efocapemm@prefecturanaval.gov.ar', 'raws-efocapemm@prefecturanaval.gov.ar', NULL, NULL, 'Marcelino Gonzalez s/n', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2901.8772136422403!2d-65.06331458412458!3d-43.33775837913339!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xbe015560cadcefdd%3A0xb265e53859085d30!2sPrefectura%20Rawson!5e0!3m2!1ses-419!2sar!4v1668', 1, NULL, NULL),
(56, 'RGAL', 'RIO GALLEGOS E ISLAS MALVINAS', '02966-420375', 'rgal-efocapemm@prefecturanaval.gov.ar', 'cencapreg_rgal@hotmail.com', NULL, NULL, 'Pasaje Abuela Paredes 14', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1238.7225118863007!2d-69.21555060893294!3d-51.61505664300646!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xbdb6feb2c5e6ff21%3A0x8b36924bad8bf55!2sPrefectura%20de%20R%C3%ADo%20Gallegos!5e0!3m2!1se', 1, NULL, NULL),
(57, 'ROSA', 'ROSARIO', '0341-4669657', 'rosa-efocapemm@prefecturanaval.gov.ar', 'efocapemmrosario1@gmail.com', NULL, NULL, 'Av Belgrano y Av. Pellegrini S/N zona portuaria', 'https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d13393.471481415809!2d-60.63672964471553!3d-32.94129570675525!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sprefectura%20rosario!5e0!3m2!1ses-419!2sar!4v1668924925119!5m2!1ses-419!2sar', 1, NULL, NULL),
(58, 'SANT', 'SAN ANTONIO OESTE', '02934-421202', 'sant-efocapemm@prefecturanaval.gov.ar', 'sant-efocapemm@prefecturanaval.gov.ar', NULL, NULL, 'Brown 20', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3023.5882873735786!2d-64.94167218419057!3d-40.72707907933027!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95fa373ce481bc37%3A0xe7c538a467768259!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses-419!', 1, NULL, NULL),
(59, 'SCBA', 'SAN CARLOS DE BARILOCHE', '0294-434292', 'scba-efocapemm@prefecturanaval.gov.ar', 'efocascba@yahoo.com', NULL, NULL, 'Elordi 219', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3004.9683089683604!2d-71.29794288418036!3d-41.135217779288126!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x961a7b64fa2c0df9%3A0xa187f021bb32adb5!2sPrefectura%20Naval%20Argentina!5e0!3m2!1ses-419', 1, NULL, NULL),
(60, 'USHU', 'USHUAIA E ISLAS DEL ATLANTICO SUR', '02901-421425', 'ushu-efocapemm@prefecturanaval.gov.ar', 'ctrocrush@yahoo.com.ar', NULL, NULL, 'Yaganes 59', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2299.5743250964983!2d-68.29976808379863!3d-54.80502408031061!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xbc4c22de038eab8d%3A0x18aca6076989061!2sPrefectura%20Naval%20Argentina%2C%20Ushuaia!5e0!3', 1, NULL, NULL),
(61, 'DEDU', 'DEPARTAMENTO MARINA MERCANTE', '+54 114576-7610', 'dedu-mmercante@prefecturanaval.gov.ar', 'dedu.mmercante@gmail.com', NULL, NULL, 'AV. CORRIENTES 345', 'https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d821.0130805149397!2d-58.37154312248763!3d-34.60283842618585!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sdireccion%20de%20educacion%20prefectura!5e0!3m2!1ses-419!2sar!4v1668925616678!5m2!1ses-419!2sar', 1, NULL, NULL);

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
  `rol` int(11) NOT NULL DEFAULT 2,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `rol`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'santiago bolano', 'admin@example.com', NULL, '$2y$12$RbTzIhKCz50CHLzpnBE4z.jD9LcRmYNDd/bhItRXpkICaGC3uWzT.', 2, NULL, '2024-09-20 15:02:46', '2024-09-20 15:02:46'),
(2, 'santiago bolas tristes', 'example@example.com', NULL, '$2y$12$74RUajyXN9PuGXXSFanVWeE3fX9o7.KjuWI..JMlpx5cdnz/Upmfq', 2, NULL, '2024-09-20 15:15:13', '2024-09-20 15:15:13'),
(3, 'santiago', 'santiagosolano036@gmail.com', NULL, '$2y$12$Jijccepa2B7tvta3CWo5PO/auxUoLl4WI2SbDuTcRxiE0Muaha5Xu', 2, NULL, '2024-09-23 15:47:29', '2024-09-23 15:47:29'),
(4, 'santiago', 'tharo-te-pica-el-ano@gmail.com', NULL, '$2y$12$PVvAOrVCAFKosmCjc0cW.OlN8nfAUMIqHoCaaVlMsVsA6pD3ymuU.', 2, NULL, '2024-09-23 16:04:17', '2024-09-23 16:04:17'),
(5, 'THARO', 'THARO-CHUPAPINGO@GMAIL.COM', NULL, '$2y$12$Pt.mRmAZi30DGzevFrlph.nzA2C5BSlSCXpG2E5/BopxxqH6rqSmi', 2, NULL, '2024-09-23 16:09:31', '2024-09-23 16:09:31'),
(6, 'PERRO PERUANO', 'THARO-CARADEPENE@GMAIL.COM', NULL, '$2y$12$vULGewTBmQqrFMkLGaA5z.XgnX5iJ8jlKS7lJjjc1mDEokkgvVfPS', 2, NULL, '2024-09-23 16:15:57', '2024-09-23 16:15:57'),
(7, 'GATO PETERO', 'SAN@GMAIL.COM', NULL, '$2y$12$DjMHG2LlPvkA.kXzRfysSuAxnLN8zYh/ji4JUu2QqfOrzvbcL195W', 2, NULL, '2024-09-23 16:17:33', '2024-09-23 16:17:33'),
(8, 'SANTIAGO', 'SANTIAGO@GMAIL.COM', NULL, '$2y$12$jKX1/rLZcOuYCtOy0xmoROPLmbnvy0caEl2XW6Cjfy4C7VPn.WT0K', 2, NULL, '2024-09-23 16:21:56', '2024-09-23 16:21:56'),
(9, 'SA', 'SA@GMAIL.COM', NULL, '$2y$12$ZC8n/EwVs.QEpNIreS7ieOXt22yX6RzaEnBaN2FViF7fQA3j5Y1bq', 2, NULL, '2024-09-23 16:22:47', '2024-09-23 16:22:47'),
(10, 'GATO PERUANOOOO', 'GATO@GMAIL.COM', NULL, '$2y$12$y43ZB/snf7TkbvUzIVel2.bGZkrwFwdYIhL68EuiNtodzbERLm4l.', 2, NULL, '2024-09-23 16:43:37', '2024-09-23 16:43:37'),
(11, 'Santiago Solano', 'THARO-CHUPAPINGO-PENE@GMAIL.COM', NULL, '$2y$12$DrRRO.weWlrQhvvrrSGuy.BK.knBAp33jicI72IDuvLvBSNyFKiIO', 2, NULL, '2024-09-23 16:45:51', '2024-09-23 16:45:51'),
(12, 'Santiago Solano', 'THAROASDA-CHUPAPINGO@GMAIL.COM', NULL, '$2y$12$Z1gFkksvw0s6TRzQHqcbC.yBle.obudLd11UriFVcsQoQFde6GP7K', 2, NULL, '2024-09-23 16:49:47', '2024-09-23 16:49:47'),
(13, 'Santiago Solano', 'THARO-CHUPAasdasdPINGO@GMAIL.COM', NULL, '$2y$12$jnUDdNwSyGcCxIo9k/DAoOb295DtvWXO.cbyDHq1VLXFjLzJUUs76', 2, NULL, '2024-09-23 16:52:17', '2024-09-23 16:52:17'),
(14, 'Santiago Solano', 'THAASDASDRO-CHUPAPINGO@GMAIL.COM', NULL, '$2y$12$psxIK.9tbGcE/2AftVbD8eYTiIRmLO8OoA4wuXqUycHo3vouATqDG', 2, NULL, '2024-09-23 16:54:08', '2024-09-23 16:54:08'),
(15, 'Santiago Solano', 'THASDASDARO-CHUPAPINGO@GMAIL.COM', NULL, '$2y$12$TRRh36nXU38IN4.MA5YCdOvT41Vl708duvLa9n4IDRZ3EYX/wH4tS', 2, NULL, '2024-09-23 16:57:29', '2024-09-23 16:57:29'),
(16, 'Pedro', 'Pedro@gmail.com', NULL, '$2y$12$LR/kcf0otWjQL.MOtk3qauow5YkGYXKjdQAcQua2hcCWp44SZgLZi', 2, NULL, '2024-09-25 22:03:40', '2024-09-25 22:03:40');

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
-- Indices de la tabla `aux_roles`
--
ALTER TABLE `aux_roles`
  ADD PRIMARY KEY (`id_aux_roles`);

--
-- Indices de la tabla `aux_sitio`
--
ALTER TABLE `aux_sitio`
  ADD PRIMARY KEY (`id_aux_sitio`);

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
  ADD PRIMARY KEY (`curso_id`) USING BTREE;

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
-- AUTO_INCREMENT de la tabla `aux_roles`
--
ALTER TABLE `aux_roles`
  MODIFY `id_aux_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `aux_sitio`
--
ALTER TABLE `aux_sitio`
  MODIFY `id_aux_sitio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `curso_extras`
--
ALTER TABLE `curso_extras`
  MODIFY `curso_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `edicions`
--
ALTER TABLE `edicions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

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
  ADD CONSTRAINT `fk_cursos_extras` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

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
