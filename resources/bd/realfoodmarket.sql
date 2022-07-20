-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2022 a las 19:18:11
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `realfoodmarket`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL,
  `ciudad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`idCiudad`, `ciudad`) VALUES
(1, 'Álava'),
(2, 'Albacete'),
(3, 'Alicante'),
(4, 'Almería'),
(5, 'Asturias'),
(6, 'Ávila'),
(7, 'Badajoz'),
(8, 'Barcelona'),
(9, 'Burgos'),
(10, 'Cáceres'),
(11, 'Cádiz'),
(12, 'Cantabria'),
(13, 'Castellón'),
(14, 'Ciudad Real'),
(15, 'Córdoba'),
(16, 'Cuenca'),
(17, 'Gerona'),
(18, 'Granada'),
(19, 'Guadalajara'),
(20, 'Gipúzcoa'),
(21, 'Huelva'),
(22, 'Huesca'),
(23, 'Islas Baleares'),
(24, 'Jaén'),
(25, 'La Coruña'),
(26, 'La Rioja'),
(27, 'Las Palmas'),
(28, 'León'),
(29, 'Lleida'),
(30, 'Lugo'),
(31, 'Madrid'),
(32, 'Málaga'),
(33, 'Murcia'),
(34, 'Navarra'),
(35, 'Ourese'),
(36, 'Palencia'),
(37, 'Pontevedra'),
(38, 'Salamanca'),
(39, 'Santa Cruz de Tenerife'),
(40, 'Segovia'),
(41, 'Sevilla'),
(42, 'Soria'),
(43, 'Tarragona'),
(44, 'Teruel'),
(45, 'Toledo'),
(46, 'Valencia'),
(47, 'Valladolid'),
(48, 'Vizcaya'),
(49, 'Zamora'),
(50, 'Zaragoza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(150) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `pass` text DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `fkCiudad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta`
--

CREATE TABLE `etiqueta` (
  `idEtiqueta` int(11) NOT NULL,
  `etiqueta` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `etiqueta`
--

INSERT INTO `etiqueta` (`idEtiqueta`, `etiqueta`) VALUES
(1, 'Desayuno'),
(2, 'Comida'),
(3, 'Cena'),
(4, 'Snack'),
(5, 'Batidos'),
(6, 'Bebidas'),
(7, 'Caldos y cremas'),
(8, 'Bocadillos'),
(9, 'Carne'),
(10, 'Cereales'),
(11, 'Consumo ocasional'),
(12, 'Ensaladas y bowls'),
(13, 'Guisos'),
(14, 'Hamburguesas'),
(15, 'Helados'),
(16, 'Infantil'),
(17, 'Lácteos'),
(18, 'Legumbres'),
(19, 'Masas y panes'),
(20, 'Pasta'),
(21, 'Pescado y marisco'),
(22, 'Pizzas'),
(23, 'Postres'),
(24, 'Salsas'),
(25, 'Sin gluten'),
(26, 'Sin lactosa'),
(27, 'Rápido'),
(28, 'Tortillas'),
(29, 'Tostadas'),
(30, 'Tupper'),
(31, 'Vegano'),
(32, 'Vegetariano'),
(33, 'Verduras'),
(34, 'Arroz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodoenvio`
--

CREATE TABLE `metodoenvio` (
  `idMetodoEnvio` int(11) NOT NULL,
  `metodoEnvio` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `metodoenvio`
--

INSERT INTO `metodoenvio` (`idMetodoEnvio`, `metodoEnvio`) VALUES
(1, 'Envío Estándar'),
(2, 'Envío Express');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `importeTotal` decimal(5,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fkMetodoEnvio` int(11) DEFAULT NULL,
  `fkCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `ingredientes` text DEFAULT NULL,
  `conservacion` text DEFAULT NULL,
  `medidas` varchar(45) DEFAULT NULL,
  `infoNutricional` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `imagen`, `ingredientes`, `conservacion`, `medidas`, `infoNutricional`) VALUES
(1, 'Crema de Cacao Realfooding Shukran', 'Descubre la nueva crema de cacao, uno de los productos estrella del movimiento Realfood.', '2.99', 'crema_cacao.png', 'Puré de castañas (30%) (castañas (castanea sativa)(72%), agua y sal), dátiles, agua, fibra de achicoria, tahini(pasta de semillas de sésamo), cacao desgrasado (5%), aceite de oliva virgen extra (2%), lecitina de girasol y conservador: sorbato potásico (E202).', 'Mantener entre 0° y 5°C. Una vez abierto mantener en refrigeración y cosumir en los próximos 14 días.', '200g', 'Por 100g\r\nValor energético(Kj) 912 Kj\r\nValor energético(Kcal) 217 Kcal\r\nGrasas 6.7 g\r\nGrasas saturadas1.3 g\r\nHidratos de carbono25.1 g\r\nAzúcares16.7 g\r\nProteínas3.6 g\r\nSal0.14 g'),
(2, 'Hummus Realfooding Shukran', 'Natural 100%. Elaborado con aceite de oliva. Sin aditivos. Sin convervantes.', '1.69', 'hummus.png', 'Garbanzo (65%),agua, tahini(pasta de semillas de sésamo), aceite de oliva (7%), zumo de limón, sal, ajo en polvo, comino y pimentón dulce). Puede contener trazas de sulfitos, apio y soja.', 'Mantener entre 0° y 5°C. Una vez abierto, consumir antes de 48 horas.', '240g ', 'Por 100g\r\nValor energético(Kj) 823.0 Kj\r\nValor energético(Kcal) 198.0 Kcal\r\nGrasas 12.9 g\r\nGrasas saturadas 2.0 g\r\nHidratos de carbono 11.0 g\r\nAzúcares 0.5 g\r\nProteínas 7.6 g\r\nSal 0.8 g'),
(3, 'Mutabal Realfooding Shukran', 'Crema de berenjenas asadas. Elaborado con aceite de oliva virgen extra.', '1.99', 'mutabal.png', 'Berenjena asada (75%) (Berenjena asada (98%), sal y concentrado de zumo de limón), tahini (pasta de semillas de sésamo), agua, aceite de oliva virgen extra (3%), zumo de limón, ajo en polvo, cebolla en polvo y sal.', 'Mantener entre 0° y 5°C. Una vez abierto, consumir antes de 48 horas.', '200g', 'Por 100g\r\nValor energético(Kj) 553.0 Kj\r\nValor energético(Kcal) 134.0 Kcal\r\nGrasas 10.7 g\r\nGrasas saturadas 1.7 g\r\nHidratos de carbono 0.8 g\r\nAzúcares 0.5 g\r\nProteínas 6.7 g\r\nSal 1.0 g'),
(4, 'Guacamole Realfooding Trops', 'Delicioso y saludable. Elaborado con ingredientes naturales con un 90% de aguacate.', '1.99', 'guacamole.png', 'Aguacate (90%), cebolla, limón, ajo, sal, ácido ascórbico, ácido cítrico.', 'Abrir en el momento de consumir. Una vez abierto consumir en 24 horas. Mantener refrigerado entre 2 y 4ºC.', '200g', 'Por 100g\r\nValor energético 125 kcal 523 kJ\r\nProteínas 1,43g\r\nHidratos de carbono 7,23 g\r\nAzúcares 0,77 g\r\nGrasas 10,03 g\r\nGrasas saturadas 1,15 g\r\nSal 1,01 g'),
(5, 'Salmorejo Realfooding', 'Crema fría típica de Andalucía. 100% fresco.', '3.49', 'salmorejo.png', 'Tomate fresco, pimiento fresco, aceite de oliva virgen extra (9 %), Harina de arroz (6%), vinagre (1,3%), ajo (0,9%), sal (0,8%) y pimiento (0,6%).', 'Conservar refrigerado entre 4-6ºC.', '1L', 'Por 100g\r\nValor energético(Kj) 494 Kj\r\nValor energético(Kcal) 123 Kcal\r\nGrasas 9 g\r\nGrasas saturadas 1.5 g\r\nHidratos de carbono 8.6 g\r\nAzúcares 2.1 g\r\nFibra 1.1 g\r\nProteínas 1.1 g\r\nSal 0.88 g'),
(6, 'Gazpacho Realfooding', 'Bebida fresca típica de Andalucía. 100% natural.', '3.49', 'gazpacho.png', 'Tomate fresco, agua, pimiento fresco, pepino fresco, aceite de oliva virgen extra (4,7 %), vinagre de Jerez, ajo y sal marina. Contenido en hortalizas: 81 %.', 'Conservar refrigerado entre 4-6ºC.\r\n', '1L', 'Por 100g\r\nValor energético(Kj) 248 Kj\r\nValor energético(Kcal) 60 Kcal\r\nGrasas 4.8 g\r\nGrasas saturadas 0.8 g\r\nHidratos de carbono 3.0 g\r\nAzúcares 2.3 g\r\nFibra 0.9 g\r\nProteínas 0.7 g\r\nSal 0.81 g'),
(7, 'Pan Realfooding 100% Integral Cristalino', 'Pan cocido elaborado con harina integral de trigo 100%', '2.10', 'pan_integral.png', 'Harina de trigo integral 49%, agua, masa madre de trigo integral 8,7% (harina de trigo integral fermentada, agua), levadura, gluten de trigo, aceite de oliva virgen extra 1%, sal, harina de cebada integral malteada tostada, harina de trigo espelta integral, almidón de trigo, masa madre inactiva de trigo integral, masa madre inactiva de centeno integral. Puede contener trazas de: soja, huevo, leche', 'Producto servido descongelado, días de caducidad una vez servido: 4 días.', '296g', 'Por 100g\r\nValor Energético 1054 kJ 250 kcal\r\nGrasas 3,6 g\r\nde las cuales ácidos grasos saturados 0,6 g\r\nHidratos de Carbono 40g\r\nde los cuales azúcares 0,8g\r\nFibra Alimentaria 6g\r\nProteínas 12g\r\nSal 1,3 g\r\nSodio ​501 mg'),
(8, 'Queso para Untar Natural', 'Queso cremoso blanco. 100% ingredientes naturales.', '1.55', 'queso_cremette_classic.png', 'Leche, proteínas de la leche, cuajo, fermentos lácticos, sal. Origen de la leche: UE.\r\n', 'Conservar entre 2 y 8ºC. Una vez abierto, conservar refrigerado y consumir en 48h. Envasado en líquido de cobertura.', '150g', 'Por 100g\r\nValor energético: 1056 kj/256 kcal\r\nGrasas 24g\r\nGrasas saturadas 17g\r\nHidratos de carbono: 3,2g\r\nAzúcares: 3,2g\r\nProteínas: 6,7g\r\nSal: 0,61g'),
(9, 'Queso para Untar con Finas Hierbas', 'Queso cremoso blanco con finas hierbas', '1.55', 'queso_cremette_finas_hierbas.png', 'Leche, proteínas de la leche, cuajo, fermentos lácticos, hierbas aromáticas, cebolla, ajo, sal, aromas naturales. Origen de la leche UE.', 'Conservar entre 2 y 8ºC.', '150g', 'Por 100g\r\nValor energético: 1018kj/238 kcal\r\nGrasas 22g\r\nGrasas saturadas 15g\r\nHidratos de carbono: 3,1g\r\nAzúcares: 3g\r\nProteínas:7g\r\nSal: 0,63 g'),
(10, 'Queso para Untar con Tomate', 'Queso cremoso blanco con tomate', '1.55', 'queso_cremette_tomate.png', 'Leche, tomate (3,5%), proteínas de la leche, cuajo, fermentos lácticos, sal, cebolla, perejil. Origen de la leche: UE.', 'Conservar entre 2 y 8ºC. Una vez abierto, conservar refrigerado y consumir en 48h. Envasado en líquido de cobertura.', '150g', 'Por 100 g\r\nValor energético 976 kJ 236 kcal\r\nGrasas totales 21 g\r\nDe las cuales saturadas 15 g\r\nHidratos de carbono 4,4 g\r\nDe los cuales azúcares 4,3 g\r\nProteínas 7,3 g\r\nSal 0,62 g'),
(11, 'Kombucha Cola Realfooding', 'Todos los beneficios del té kombucha. No precisa frío para conservación o transporte.', '1.89', 'kombucha_cola.png', 'Agua, azúcar de caña, te negro (0,20%), mate verde(0,20%), hierba de limón, zumo de limón, extracto de malta, te verde (0,09%), aroma natural de cola, infusión de hojas de stecia, canela de ceylan y cultivo de kombucha.', 'Conservar en lugar fresco y seco.', '250ml', 'Por 100 ml\r\nEnergía 36kj/8 kcal\r\nGrasas 0,5 g\r\nGrasas saturadas 0,1 g\r\nHidratos de carbono 2,1 g\r\nAzúcares 1,5 g\r\nProteínas 0,5 g\r\nSal 0,01 g'),
(12, 'Kombucha Naranja Realfooding', 'Todos los beneficios del té kombucha. No precisa frío para conservación o transporte.', '1.89', 'kombucha_naranja.png', 'Agua, azúcar de caña, cúrcuma, hierba de limón, jengibre, zumo de naranja, zumo de limón, té verde, infusión de hojas de stevia, pimienta negra.\r\nCONTIENE <1.2% DE ALCOHOL', 'Conservar en lugar fresco y seco', '250ml', 'Por 100 g\r\nEnergía kJ/ kcal\r\nGrasas <0 g\r\nDe las cuales saturadas <0. g\r\nHidratos de carbono g\r\nDe los cuales azúcares g\r\nFibra alimentaria g\r\nProteínas <0 g\r\nSal <0.0g'),
(13, 'Croissant Realfooding 100% Integral', 'Espectaculares croissants para hacer de tus desayunos un momento de disfrute sin dejar de lado la alimentación saludable', '2.99', 'croissants.png', 'Harina de trigo integral (40%), preparado graso a base de aceite de oliva virgen extra (26%), aceite de oliva virgen extra (12%), grasa vegetal (karité), agua, sal, pasta de dátiles, gluten de trigo, levadura, huevo líquido pasteurizado y agente de tratamiento de las harinas. Puede contener trazas de FRUTOS DE CÁSCARA, LECHE, SOJA.', 'Producto servido descongelado, una vez abierto, consumir en tres días.', '2 unidades', 'Por 100g\r\nValor energético(Kj) 1923 Kj\r\nValor energético(Kcal) 462 Kcal\r\nGrasas 30 g\r\nGrasas saturadas 14 g\r\nHidratos de carbono 34 g\r\nAzúcares 4,4 g\r\nProteínas 9,8 g\r\nSal 1,1 g'),
(14, 'Bebida de Avena Realfooding', '¡Disfruta de esta nueva bebida vegetal de Realfooding!', '1.75', 'bebida_avena.png', 'Agua, avena (15%). Puede contener trazas de frutos de cáscara.', 'Conservar en un lugar fresco y seco. Una vez abierto, puede mantenerse hasta 3 días en frigorífico (4ºC).', '1L', 'Por 100 ml\r\nValor Energético 176 kj/ 41kcal\r\nGrasas 0,8 g de los cuales saturados 0,2 g\r\nHidratos de Carbono 7,8 g de los cuales azúcares 5,6 g\r\nFibra <0,5 g\r\nProteínas 0,7 g\r\nSal 0,08 g'),
(15, 'Bebida de Avena Cacao Realfooding', 'Sabor típico a avena y cacao. Ausencia de sabores extraños.', '2.15', 'bebida_avena_cacao.png', 'Agua, avena (22%), cacao desengrasado en polvo (1,3%), avellanas tostadas (0,7%), estabilizantes (goma de garrofín). Puede contener trazas de frutos de cáscara.', 'Conservar en un lugar fresco y seco. Una vez abierto, puede mantenerse hasta 3 días en frigorífico (4 °C).', '1L', 'Por 100 ml\r\nValor Energético 404 kj/ 96kcal\r\nGrasas 2,5 g de los cuales saturados 0,4 g\r\nHidratos de Carbono 12 g de los cuales azúcares 9 g\r\nFibra 1,6 g\r\nProteínas 2,3 g\r\nSal 0,16 g'),
(16, 'Helado Realfooding Cacao', 'Tarrina de helado de cacao, elaborado con ingredientes naturales.', '5.49', 'helado_cacao.png', 'Agua, leche desnatada en polvo, dátil, cacao (6%), emulsionante (lecitina de girasol), estabilizantes (goma garrofín, goma guar).', 'Conservar a -18 ºC.', '500ml', 'Por 100g\r\nValor energético (kJ/kcal): 612,00 kJ /145,00 kcal\r\nGrasas : 4,26 g\r\nde las cuales saturadas: 1,96 g\r\nHidratos de carbono : 21,20 g\r\nde los cuales azúcares: 16,70 g\r\nFibra alimentaria: 1,22 g\r\nProteínas : 4,95 g\r\nSal: <0,10 g'),
(17, 'Helado Realfooding Vainilla', 'Tarrina de helado de vainilla bourbon con virutas de cacao', '5.79', 'helado_vainilla.png', 'Agua, fibra de raíz de achicoria, leche desnatada en polvo, mantequilla, yema de huevo en polvo, virutas de cacao 100% (1,96%), perla de vainilla bourbon (0,10%), estabilizantes (goma guar, goma garrofín).', 'Conservar a -18 ºC', '500ml', 'Por 100g\r\nValor energético (kJ/kcal): 665,00 kJ /158,00 kcal\r\nGrasas : 5,02 g\r\nde las cuales saturadas : 2,24 g\r\nHidratos de carbono : 23,40 g\r\nde los cuales azúcares : 18,20 g\r\nFibra alimentaria : 1,15 g\r\nProteínas : 4,22 g\r\nSal : <0,10 g');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productopedido`
--

CREATE TABLE `productopedido` (
  `idProductoReceta` int(11) NOT NULL,
  `fkProducto` int(11) DEFAULT NULL,
  `fkPedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoreceta`
--

CREATE TABLE `productoreceta` (
  `idProductoReceta` int(11) NOT NULL,
  `fkProducto` int(11) DEFAULT NULL,
  `fkReceta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `idReceta` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `ingredientes` text DEFAULT NULL,
  `instrucciones` text DEFAULT NULL,
  `imagen` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`idReceta`, `titulo`, `ingredientes`, `instrucciones`, `imagen`) VALUES
(1, 'Tortitas rellenas de crema de cacao', '4-6 tortitas:\r\n- Crema de cacao @shukran_foods #realfooding\r\n- 1 huevo (o 1 cda. de semillas de lino molido + 3 cdas. de agua caliente)\r\n- 100 ml de leche o bebida vegetal\r\n- 2 cdas. de pasta de dátiles\r\n- 70 g de harina de avena (o integral de trigo o espelta)\r\n- 1/4 cdta. de levadura química\r\n- 1/4 cdta. de sal\r\n- Para acompañar: plátano y almendra laminada ', '- Para el relleno, coge un trozo de papel vegetal y echa 1 cucharada grande de crema de cacao. Aplánala dándole forma de moneda grande. Repite hasta tener 4-6, deja en el congelador al menos 30 min.\r\n\r\n- En un bol, bate el huevo con la bebida vegetal y la pasta de dátil. \r\n\r\n- Añade la harina de avena, la levadura, la sal y mezcla todo bien. \r\n\r\n- Pon una sartén antiadherente a fuego medio con un poco de aceite de coco o AOVE. Vierte 2 cucharadas de masa para cada tortita. Cuando aparezcan las primeras burbujas saca las monedas del congelador y pon una en cada tortita. Cubre cada una con 1-2 cdas de masa y dales la vuelta. Cocina 2 min más y listas. \r\n\r\n- Sirve con rodajas de plátano y almendra laminada.  ', 'receta_tortitas_rellenas_crema_cacao'),
(2, 'Zanahorias asadas con mutabal', '2 personas:\r\n- 3 zanahorias peladas y cortadas en bastones\r\n- 1 cda. de aceite de oliva virgen extra\r\n- 1/2 cdta. de comino \r\n- 1/4 cdta. de chile molido o pimentón picante\r\n- 1/4 cdta. de sal y pimienta molida\r\n- 1 tarrina de mutabal \r\n- Semillas de sésamo\r\n- Aceite de oliva virgen extra\r\n- Perejil fresco picado', '- Precalienta el horno a 200ºC.\r\n- Pela y corta las zanahorias en rodajas gruesas. Ponlas en un bol y añade el aceite de oliva, el comino, el chile molido y salpimienta. Mezcla bien y distribuye las zanahorias en una bandeja de horno con un tapete de silicona o forrada con papel vegetal.\r\n- Ásalas a 180ºC durante 20-25 minutos. \r\n- Mientras pon el mutabal en un bol y añade un chorrito de aove, unas semillas de sésamo y perejil fresco picado por encima. \r\n- Saca las zanahorias del horno y ponlas alrededor del mutabal para untar. ', 'receta_zanahorias_asadas_mutabal'),
(3, 'Bocadillo de calamares', '2 bocatas:\r\n- Pan Realfooding\r\n- 2 puñados de anillas de calamar o pota ⁠ - ½ vaso de harina de garbanzo \r\n- 1 cdta. de ajo en polvo\r\n- 1 cda. perejil fresco o seco \r\n- ¼ cdta. de pimienta molida\r\n- ¼ cdta. de sal\r\n- Rúcula u otras hojas\r\nMayonesa saludable\r\n- 1 huevo cocido 12 min\r\n- 4 cdas de aceite de oliva virgen extra\r\n- 3 cdas. de agua\r\n- 1 cda. de zumo de limón\r\n- ½ cdta. de mostaza\r\n- Sal y pimienta molida al gusto', '- Precalienta el horno a 190°C en la función de aire. Forra una bandeja con papel vegetal.\r\n- Mezcla la harina de garbanzo, el ajo, el perejil, la sal y la pimienta. Reboza los calamares en la mezcla y vete colocándolos en la bandeja.\r\n- Pincélalos con AOVE y hornealos a 190°C unos 8 minutos o hasta que estén dorados.\r\n- Para hacer la mayonesa pon todos los ingredientes en el vaso de la batidora, menos el aceite. Tritura un poco y empieza a añadir el aceite en forma de hilo hasta obtener una textura de mayonesa. Pruébala y rectifica de sal.\r\n- Para montar el bocadillo primero tuesta el pan realfooding en un tostador o en sartén. Pon unas hojas de rúcula en la base, encima los calamares y por último la mayonesa. Puedes añadir un poco de salsa picante si quieres y un chorrito de limón', 'receta_bocadillo_calamares'),
(4, 'Tostada de salmorejo y anchoa', '- 1 botella de salmorejo\r\n- 3 rebanadas de pan realfooding\r\n- 1 huevo cocido\r\n- 3 anchoas\r\n- Eneldo u otra hierba aromática', '- Tuesta las rebanadas de pan y unta cada una con un par de cucharadas de salmorejo. Pon encima unos trozos de huevo cocido, una anchoa y si quieres unas hojas de eneldo y un chorrito de aove. ¡A disfrutar!', 'receta_tostada_salmorejo_anchoa'),
(5, 'Wrap de guacamole, pimientos, canónigos y queso', '- 1 tortilla integral\r\n- Guacamole\r\n- Pimientos asados\r\n- Canónigos u otras hojas verdes\r\n- Mozzarella rallada', '- Para montar el wrap, primero haz un corte desde el centro de la tortilla hasta un extremo.\r\n- Coloca un ingrediente en cada cuarto de la tortilla en este orden: guacamole, pimientos, canónigos y mozzarella. Dobla la tortilla 3 veces empezando por el cuarto con el guacamole.\r\n- Puedes cocinar el wrap en una sartén con un poquito de aove y hacerlo vueta y vuelta. Para ayudar a que se derrita el queso tapa la sartén un par de minutos. También puedes meterlo al microondas 1-2 minutos y listo.', 'receta_wrap_guacamole_pimientos_canonigos_queso'),
(6, 'Crepes de avena', '- 1 vaso de harina de avena\r\n- 1 vaso de bebida de avena Realfooding\r\n- 2 cdas. de lino molido\r\n- 1 cdta. de levadura en polvo\r\n- 1 cdta. de extracto de vainilla\r\n- 2 cdas. de crema de cacao realfooding\r\n- 2 cdas. de agua\r\n- Frambuesas', '- Pon en un bol la harina, la bebida vegetal, el lino, la levadura y la vainilla. Bate con unas varillas o con la batidora hasta que no queden grumos. Si tientes tiempo deja reposar la mezcla 15-20 minutos.\r\n-Unta con aceite una sartén antiadherente o crepera y ponla a fuego medio-alto. Echa 1/2 cazo de mezcla para cada crep y mueve la sartén para que se extienda por la superficie.\r\n-Tienen que aparecer burbujitas, si no es así, sube un poco el fuego. Entonces dale la vuelta y deja cocinar un par de minutos más. Haz el resto de crepes y guárdalas tapadas para que no se enfríen.\r\n-Sirve las crepes enrolladas haciendo una torre. Añade por encima la crema de cacao mezclada con el agua para que sea más líquida, y las frambuesas.⠀', 'receta_crepes_avena'),
(7, 'Tostadas con crema de cacao', 'Tostada 1:⁠\r\n- Crema de cacao Realfooding⁠\r\n- Plátano\r\n- Avellanas tostadas\r\n⁠\r\nTostada 2:⁠\r\n- Crema de cacao Realfooding⁠\r\n- Yogur natural⁠\r\n- Frutos rojos\r\n⁠\r\nTostada 3:⁠\r\n- Crema de cacao Realfooding⁠\r\n- AOVE⁠\r\n- Sal en escamas', '- Tostar el pan, untar la crema de cacao y añadir los toppings.', 'receta_tostadas_crema_cacao'),
(8, 'Gazpacho con pico de gallo de melocotón', '- Gazpacho Artesur\r\n- ½ cebolla morada finamente picada\r\n- 1 melocotón cortado en cubos pequeños\r\n- 1 tomate cortado en cubos pequeños\r\n- 1 jalapeño finamente picado (puede ser encurtido)\r\n- 2 cdas de cilantro fresco picado o perejil\r\n- Zumo de ½ lima\r\n- Sal', '- Pica todas las hortalizas y ponlas en un bol. Añade el cilantro, el zumo de lima y una pizca de sal. Mezcla bien y deja reposar en la nevera hasta el momento de servir.\r\n- Sirve el gazpacho en boles y añade un par de cucharadas de pico de gallo en el centro. Decora con una hoja de cilantro o perejil y listo para servir.', 'receta_gazpacho_pico_gallo_melocoton'),
(9, 'Pan de ajo con queso', '- Pan Realfooding\r\n- 2 cdas de aceite de oliva virgen extra\r\n- 2 ajos rallados\r\n- ¼ cdta. de escamas de chile (opcional)\r\n- 2 cdas. de perejil fresco picado u orégano seco\r\n- 2 puñados de mozzarella rallada', '- Precalienta el horno a 200ºC mejor en la función de grill.\r\n- Mezcla en un bol el aceite de oliva virgen extra con los ajos rallados, las escamas de chile, el perejil y la mozzarella.\r\n- Pon las rebanadas de pan en una bandeja apta para horno y pon sobre cada una un poco de la mezcla de ajo y queso.\r\n- Hornea a 200°C unos 5-7 minutos hasta que esté ligeramente dorado.', 'receta_pan_ajo_queso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetaetiqueta`
--

CREATE TABLE `recetaetiqueta` (
  `idRecetaEtiqueta` int(11) NOT NULL,
  `fkReceta` int(11) DEFAULT NULL,
  `fkEtiqueta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recetaetiqueta`
--

INSERT INTO `recetaetiqueta` (`idRecetaEtiqueta`, `fkReceta`, `fkEtiqueta`) VALUES
(1, 3, 8),
(2, 3, 21),
(5, 3, 24),
(6, 3, 3),
(7, 3, 27),
(8, 8, 2),
(9, 8, 3),
(10, 8, 6),
(11, 8, 27),
(12, 8, 33),
(13, 8, 32),
(14, 6, 3),
(15, 6, 18),
(16, 6, 27),
(17, 6, 32),
(18, 1, 1),
(19, 1, 4),
(20, 1, 27),
(21, 1, 32),
(22, 4, 3),
(23, 4, 21),
(24, 4, 27),
(25, 4, 29),
(26, 7, 1),
(27, 7, 4),
(28, 7, 27),
(29, 7, 29),
(30, 7, 32),
(31, 5, 3),
(32, 5, 27),
(33, 5, 32),
(34, 5, 33),
(35, 2, 3),
(36, 2, 4),
(37, 2, 25),
(38, 2, 26),
(39, 2, 31),
(40, 2, 32),
(41, 2, 33),
(42, 9, 8),
(43, 9, 27),
(44, 9, 32),
(45, 9, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fkCiudad` (`fkCiudad`);

--
-- Indices de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`idEtiqueta`);

--
-- Indices de la tabla `metodoenvio`
--
ALTER TABLE `metodoenvio`
  ADD PRIMARY KEY (`idMetodoEnvio`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fkMetodoEnvio` (`fkMetodoEnvio`),
  ADD KEY `fkCliente` (`fkCliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `productopedido`
--
ALTER TABLE `productopedido`
  ADD PRIMARY KEY (`idProductoReceta`),
  ADD KEY `fkProducto` (`fkProducto`),
  ADD KEY `fkPedido` (`fkPedido`);

--
-- Indices de la tabla `productoreceta`
--
ALTER TABLE `productoreceta`
  ADD PRIMARY KEY (`idProductoReceta`),
  ADD KEY `fkProducto` (`fkProducto`),
  ADD KEY `fkReceta` (`fkReceta`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`idReceta`);

--
-- Indices de la tabla `recetaetiqueta`
--
ALTER TABLE `recetaetiqueta`
  ADD PRIMARY KEY (`idRecetaEtiqueta`),
  ADD KEY `fkReceta` (`fkReceta`),
  ADD KEY `fkEtiqueta` (`fkEtiqueta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idCiudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `idEtiqueta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `metodoenvio`
--
ALTER TABLE `metodoenvio`
  MODIFY `idMetodoEnvio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `productopedido`
--
ALTER TABLE `productopedido`
  MODIFY `idProductoReceta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productoreceta`
--
ALTER TABLE `productoreceta`
  MODIFY `idProductoReceta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `idReceta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `recetaetiqueta`
--
ALTER TABLE `recetaetiqueta`
  MODIFY `idRecetaEtiqueta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`fkCiudad`) REFERENCES `ciudad` (`idCiudad`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`fkMetodoEnvio`) REFERENCES `metodoenvio` (`idMetodoEnvio`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`fkCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `productopedido`
--
ALTER TABLE `productopedido`
  ADD CONSTRAINT `productopedido_ibfk_1` FOREIGN KEY (`fkProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `productopedido_ibfk_2` FOREIGN KEY (`fkPedido`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `productoreceta`
--
ALTER TABLE `productoreceta`
  ADD CONSTRAINT `productoreceta_ibfk_1` FOREIGN KEY (`fkProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `productoreceta_ibfk_2` FOREIGN KEY (`fkReceta`) REFERENCES `receta` (`idReceta`);

--
-- Filtros para la tabla `recetaetiqueta`
--
ALTER TABLE `recetaetiqueta`
  ADD CONSTRAINT `recetaetiqueta_ibfk_1` FOREIGN KEY (`fkReceta`) REFERENCES `receta` (`idReceta`),
  ADD CONSTRAINT `recetaetiqueta_ibfk_2` FOREIGN KEY (`fkEtiqueta`) REFERENCES `etiqueta` (`idEtiqueta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
