
CREATE TABLE `estadisticas` (
  `id` bigint(20) NOT NULL,
  `actualizado` datetime DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  `disco_disponible` double NOT NULL,
  `disco_total` double NOT NULL,
  `disco_uso` double NOT NULL,
  `id_servidor` int(11) NOT NULL,
  `memoria_disponible` double NOT NULL,
  `memoria_total` double NOT NULL,
  `memoria_uso` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indices de la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;



