-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-12-2023 a las 23:44:37
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prog2_nike`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `categorias` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categorias`) VALUES
(1, 'buzos'),
(2, 'remeras'),
(3, 'musculosas'),
(4, 'pantalones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `importe` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `id_usuario`, `fecha`, `importe`) VALUES
(1, 2, '2023-12-11', 16700.00),
(2, 2, '2023-12-11', 9200.00),
(3, 2, '2023-12-11', 9200.00),
(4, 2, '2023-12-11', 9200.00),
(5, 2, '2023-12-11', 9200.00),
(6, 2, '2023-12-11', 9200.00),
(7, 2, '2023-12-11', 9200.00),
(8, 2, '2023-12-11', 9200.00),
(9, 2, '2023-12-13', 10000.00),
(10, 2, '2023-12-13', 10000.00),
(11, 2, '2023-12-14', 10000.00),
(12, 2, '2023-12-14', 10000.00),
(13, 2, '2023-12-14', 10000.00),
(14, 2, '2023-12-14', 10000.00),
(15, 2, '2023-12-14', 10000.00),
(16, 2, '2023-12-14', 10000.00),
(17, 2, '2023-12-14', 10000.00),
(18, 2, '2023-12-14', 10000.00),
(19, 2, '2023-12-14', 10000.00),
(20, 2, '2023-12-14', 10000.00),
(21, 2, '2023-12-14', 10000.00),
(22, 2, '2023-12-14', 10000.00),
(23, 2, '2023-12-14', 10000.00),
(24, 2, '2023-12-14', 10000.00),
(25, 2, '2023-12-14', 10000.00),
(26, 2, '2023-12-14', 10000.00),
(27, 2, '2023-12-14', 10000.00),
(28, 2, '2023-12-14', 10000.00),
(29, 2, '2023-12-14', 10000.00),
(30, 2, '2023-12-14', 10000.00),
(31, 2, '2023-12-14', 10000.00),
(32, 2, '2023-12-14', 85000.00),
(33, 2, '2023-12-14', 85000.00),
(34, 2, '2023-12-20', 10000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id` int(10) UNSIGNED NOT NULL,
  `disciplina` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `disciplinas`
--

INSERT INTO `disciplinas` (`id`, `disciplina`) VALUES
(1, 'trainning');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE `etiquetas` (
  `id` int(10) UNSIGNED NOT NULL,
  `etiquetas` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `etiquetas`
--

INSERT INTO `etiquetas` (`id`, `etiquetas`) VALUES
(1, 'remeras'),
(2, 'pantalones'),
(3, 'musculosas'),
(4, 'buzos'),
(7, 'verano'),
(8, 'invierno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas_x_producto`
--

CREATE TABLE `etiquetas_x_producto` (
  `id` int(10) UNSIGNED NOT NULL,
  `producto_id` int(11) UNSIGNED NOT NULL,
  `etiqueta_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `etiquetas_x_producto`
--

INSERT INTO `etiquetas_x_producto` (`id`, `producto_id`, `etiqueta_id`) VALUES
(3, 1, 4),
(4, 2, 4),
(5, 1, 8),
(6, 2, 8),
(10, 4, 7),
(11, 5, 3),
(14, 6, 7),
(18, 9, 8),
(19, 9, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(10) UNSIGNED NOT NULL,
  `genero` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `genero`) VALUES
(1, 'femenino'),
(2, 'masculino'),
(9, 'unisex');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_x_compra`
--

CREATE TABLE `item_x_compra` (
  `id` int(11) UNSIGNED NOT NULL,
  `compra_id` int(11) UNSIGNED NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `item_x_compra`
--

INSERT INTO `item_x_compra` (`id`, `compra_id`, `item_id`, `cantidad`) VALUES
(1, 1, 5, 1),
(10, 9, 2, 1),
(31, 30, 2, 1),
(32, 31, 2, 1),
(33, 32, 4, 1),
(34, 33, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `talles` varchar(256) NOT NULL,
  `color` varchar(256) NOT NULL,
  `genero_id` int(10) UNSIGNED NOT NULL,
  `disciplinas_id` int(10) UNSIGNED NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `fecha_lanzamiento` date NOT NULL,
  `envio` varchar(256) DEFAULT 'gratis',
  `imagen` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `categoria_id`, `talles`, `color`, `genero_id`, `disciplinas_id`, `precio`, `fecha_lanzamiento`, `envio`, `imagen`) VALUES
(1, 'Buzo Nike Dri-Fit Academy', 'El Buzo Nike Dri-Fit Academy está pensando para quienes aman combinar un look deportivo y uno casual. Está elaborado en poliéster y se adapta fácilmente a tu cuerpo para acompañarte adonde vayas.', 1, 'S, M, L, XL, XXL', 'Negro', 2, 1, 11000.00, '2023-07-15', 'gratis', '1702589448.webp'),
(2, 'Buzo Nike Sportswear Club', 'El Buzo Nike Sportswear Club es un must en tu ropero. No importa si tenés que ir a cenar con amigos, o si tenés que ir a la universidad. Él completa tu look para cualquier ocasión, creando un outfit perfecto para combinar con tus jeans o joggings. Su capucha regulable, puños y su bolsillo canguro, cuidan tus manos y tus oídos los momentos más fríos.', 1, 'S, M, L', 'Gris', 2, 1, 10000.00, '2023-07-15', 'gratis', 'buzoSportswear.webp'),
(3, 'Remera Nike Sportswear', 'Con la Remera Nike Sportswear no necesitarás mucho para lucirte. Tiene un diseño simple y casual pero muy llamativo creado con un cuello redondo, magas cortas y el logo de la marca en el frente de la prenda con un Swoosh rojo que resalta entre la multitud. Además, su confección en un 100%algodón es tan suave que no podrás dejar de usarla.', 2, 'XS, S, M, L, XL, XXL, XXXL', 'Blanco', 2, 1, 5999.00, '2023-07-15', 'gratis', 'remeraSportswear.webp'),
(4, 'Camiseta Nike Dri-Fit Academy', 'Con la Camiseta Nike Dri-Fit Academy tus entrenamientos nunca más serán iguales. Está hecha con un poliéster suave y liviano y con paneles de malla que ayudan a reducir la transpiración para que la hora de tu movimiento sea confortable. Con un diseño deportivo muy elegante para combinar con tus shorts favoritos y que puedas alcanzar tus objetivos e incluso superarlos.', 2, 'S, M, L, XL, XXL', 'Azulado', 2, 1, 85000.00, '2023-07-15', 'gratis', 'camisetaDriFit.webp'),
(5, 'Musculosa adidas All Wrld Sl 2.0', 'La Musculosa adidas All World SI 2.0 es un ícono de comodidad para tus partidos más desafiantes además de envolverte en personalidad. Con un estilo holgado que te da libertad de movimiento y su tela con tecnología AEROREADY, sentirás tanto confort que no vas a querer ir a tus prácticas con otra. Ponétela y convertite en la estrella del juego.', 3, 'S, M, L, XL', 'Negro', 2, 1, 9200.00, '2023-07-15', 'gratis', 'musculosaAllWrld.webp'),
(6, 'Musculosa Under Armour Logo Tank', 'La Musculosa Under Armour Logo Tank es una prenda cómoda para tus momentos de entrenamiento o para tu día a día en épocas de calor. Sus sisas caídas te dan libertad de movimiento y su algodón de confección te da suavidad para todo el tiempo que la lleves puesta. El logo de la marca en el frente de la prenda, le da el toque deportivo final a esta musculosa.', 3, 'S, M, L, XL, XXL', 'Negro', 2, 1, 9999.00, '2023-07-15', 'gratis', 'musculosaUnderArmourLogoTank.webp'),
(7, 'Short Fútbol Nike Dri-Fit Academy', 'El Short Nike Dri-Fit Academy se niega a dejar que el sudor te frene. La tela ligeramente elástica y gracias a la tecnología Dri-FIT elimina el sudor de la piel para que puedas concentrarte en jugar lo mejor posible. El elástico y cordón oculto te brindan el ajuste perfecto. Este producto está fabricado con fibras de poliéster 100 % recicladas.', 4, 'S, M, XL', 'Negro', 2, 1, 7500.00, '2023-07-15', 'gratis', 'shortDriFitAcademy.webp'),
(8, 'Short Nike B Df Trophy', 'Si buscabas versatilidad el Short Nike B Df Trophy es para vos. Está elaborado con una tela liviana y respirable, además de contar con tecnología Dri-Fit, que te mantiene fresco durante más tiempo ya que expulsa el sudor de la piel. Cuenta con elástico y cordón en la cintura para un mejor ajuste y bolsillos a los costados y en el dorso para llevar lo que necesites con vos.', 4, 'S, M, L', 'Negro', 2, 1, 8780.00, '2023-07-15', 'gratis', 'shortTrophy.webp'),
(9, 'Buzo Nike Dri-Fit Swoosh', 'Corre con todo el estilo posible con el Buzo Nike Swoosh Dri-Fit; la tecnología Dri-FIT te mantiene fresca durante más tiempo ya que absorbe el sudor de la piel y lo expulsa. El cierre en el frente te permite regular el flujo del aire y el logo de la espalda es reflectante para que puedas entrenar y correr en cualquier momento del día, sin limitaciones.', 1, 'XS, S, M, L, XL, XXL', 'Negro', 1, 1, 9000.00, '2023-07-15', 'gratis', 'buzoDri-FitSwoosh.webp'),
(10, 'Buzo Nike Pacer', 'Tus jornadas de running están protegidas en todo momento con el Buzo Nike Pacer. Su diseño clásico te permite usarlo cuantas veces quieras en múltiples combinaciones. El diseño entallado te da un look ideal, sin perder de foco el abrigo y la comodidad que están garantizados por su cierre 1/4 para un cierre alto y cuidado de tu cuello y las mangas que se convierten en manoplas. Además, gracias a la tecnología Dri-Fit estarás siempre seca, fresca y cómoda. Agregalo a tu ropero porque tus días lo súper necesitan!', 1, 'S, M, L, XL', 'Negro', 1, 1, 11000.00, '2023-07-15', 'gratis', 'buzoPacer.webp'),
(11, 'Camiseta Nike Paris Saint-Germain Home', 'La Camiseta Nike Paris Saint-Germain Home es una prenda clásica pero imprescindible. Además de envolverte en comodidad con su tejido muy suave, y su ajuste clásico, te permite completar tu look casual para cualquier ocasión deportiva. El logotipo en el frente de la prenda, agrega un detalle único a la prenda además de sumarte el estilo único de la marca.', 2, 'XS, S, M, L, XL, XXL', 'Azul', 1, 1, 14000.00, '2023-07-15', 'gratis', 'remeraPsg.webp'),
(12, 'Remera Nike Sportswear Club', 'La remera Nike Sportswear Club es una prenda clásica pero imprescindible. Además de envolverte en comodidad con su tejido de punto suave, y su ajuste clásico, te permite completar tu look casual para cualquier ocasión. El logotipo en el frente de la prenda, agrega un detalle único a la prenda además de sumarte el estilo único de la marca. Con unos jeans para juntarte con amigas, o con joggers para hacer tus trámites por la ciudad, siempre están muy bien.', 2, 'S, M, L, XL, XXL', 'Rosa', 1, 1, 7500.00, '2023-07-15', 'gratis', 'remeraSportswearClub.webp'),
(13, 'Pantalón Puma Ess Metallic', 'Para vos que disfrutás de tus jornadas de ejercicio al aire libre o relajado en casa, el nuevo Pantalón Puma Ess Metallic, te da un confort único en todas partes gracias a los materiales suaves de su confección y al ajuste que te da libertad de movimientos y te mantiene cálida y enfocada para que no pierdas ni un minuto de tu rutina.\"', 4, 'S, M', 'Negro', 1, 1, 8400.00, '2023-07-15', 'gratis', 'pantalonMetallic.webp'),
(14, 'Pantalón Puma Evostripe', 'Llevá tu estilo urbano y casual con el Pantalón Puma Evostripe ideal para lucir en cualquier lugar al que vayas, su construcción en algodón lo hace cómodo, con bolsillos laterales y cintura con elástico y cordón. Su estilo ajustado te da la libertad de movimientos que necesitás para tus actividades deportivas y casuales, combinalo con tus remeras y zapatillas favoritas.', 4, 'S, M, L', 'Gris', 1, 1, 9300.00, '2023-07-15', 'gratis', 'pantalonEvostripe.webp'),
(15, 'Musculosa Lotto Bn Fitness', 'La Musculosa Lotto Bn Fitness te brindará el confort y comodidad que buscas en tus entrenamientos, y para el resto del día. La tela y diseño con espalda cavada te ayudan a vestirla con cualquier outfit. El logo de la marca, completan tu estilo deportivo que podrás usar con tus shorts o joggings favoritos', 3, 'S, M, L', 'Negro', 1, 1, 5999.00, '2023-07-15', 'gratis', 'musculosaFitness.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(256) NOT NULL,
  `nombre_usuario` varchar(256) NOT NULL,
  `nombre_completo` varchar(256) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `rol` enum('superadmin','admin','usuario') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `nombre_usuario`, `nombre_completo`, `password`, `rol`) VALUES
(1, 'jorge.perez@davinci.edu', 'jperez_dv', 'Jorge Perez', '$2y$10$xVoa7thgvlGPN8w/HBqLcuzdrurN9SOu3e.GOV6vvRvS2WjkEmyxC', 'superadmin'),
(2, 'ezequiel.valdiviezo@davinci.edu', 'eze', 'Ezequiel Valdiviezo', '$2y$10$xVoa7thgvlGPN8w/HBqLcuzdrurN9SOu3e.GOV6vvRvS2WjkEmyxC', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `etiquetas_x_producto`
--
ALTER TABLE `etiquetas_x_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `etiqueta_id` (`etiqueta_id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `item_x_compra`
--
ALTER TABLE `item_x_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_id` (`compra_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genero_id` (`genero_id`),
  ADD KEY `disciplinas_id` (`disciplinas_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `etiquetas_x_producto`
--
ALTER TABLE `etiquetas_x_producto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `item_x_compra`
--
ALTER TABLE `item_x_compra`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `etiquetas_x_producto`
--
ALTER TABLE `etiquetas_x_producto`
  ADD CONSTRAINT `etiquetas_x_producto_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `etiquetas_x_producto_ibfk_2` FOREIGN KEY (`etiqueta_id`) REFERENCES `etiquetas` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `item_x_compra`
--
ALTER TABLE `item_x_compra`
  ADD CONSTRAINT `item_x_compra_ibfk_2` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_x_compra_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`disciplinas_id`) REFERENCES `disciplinas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_4` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
