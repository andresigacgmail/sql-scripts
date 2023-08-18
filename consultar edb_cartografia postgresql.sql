

select * from gis_owner_centroctrl_prod.rol;
select * from gis_owner_centroctrl_prod.usuario limit 5;
select * from gis_owner_centroctrl_prod.usuario where usuario = 'prueba';
-- update gis_owner_centroctrl_prod.usuario set rol = 3 where t_id = 30;


select * from gis_owner_centroctrl_prod.agencia;
-- insert into gis_owner_centroctrl_prod.agencia (sigla, nombre) values ('UF','USUARIO_FINAL');

-- insert into gis_owner_centroctrl_prod.usuario (usuario, contrasenia, tipo_documento, rol, numero_documento, agencia) values ('prueba', '1234', 1, 1, 123456, 1);

-- create table juan(
--     nombre VARCHAR(60)
-- );
-- DROP TABLE juan;

-- SELECT * from gis_owner_centroctrl_prod.juan;

-- alter table juan add column last int;


-- create table estadisticas (
--   id serial not null ,
--   actualizado timestamp DEFAULT NULL,
--   creado timestamp DEFAULT NULL,
--   disco_disponible DECIMAL(10,2) NOT NULL,
--   disco_total DECIMAL(10,2) NOT NULL,
--   disco_uso DECIMAL(10,2) NOT NULL,
--   id_servidor int NOT NULL,
--   memoria_disponible DECIMAL(10,2) NOT NULL,
--   memoria_total DECIMAL(10,2) NOT NULL,
--   memoria_uso DECIMAL(10,2) NOT NULL,
--   primary key(id)
-- );

-- drop table estadisticas;
select * from gis_owner_centroctrl_prod.estadisticas;
-- delete from gis_owner_centroctrl_prod.estadisticas;

select * from gis_owner_centroctrl_prod.servidor;

SELECT * FROM gis_owner_centroctrl_prod.estadisticas e WHERE e.id_servidor = 1 order by e.creado desc limit 5;
select distinct( cast ( extract(year from creado) as int) ) as year from estadisticas e WHERE e.id_servidor = 1;
SELECT * FROM estadisticas WHERE id_servidor = 1 and extract(year from creado) = '2023';
SELECT * FROM estadisticas WHERE id_servidor = 1 and extract(year from creado) = '2023' and extract(month from creado) = '04' ORDER by creado desc LIMIT 1;



SELECT * FROM estadisticas WHERE id_servidor = 1 and extract(year from creado) = 2023 and extract(month from creado) = 04;

SELECT * FROM estadisticas WHERE id_servidor = 2 and extract(year from creado) = '2023' and extract(month from creado) = '04' and extract(day from creado) = '10';



select * from gis_owner_centroctrl_prod.rol;
select * from gis_owner_centroctrl_prod.usuario limit 5;
select * from gis_owner_centroctrl_prod.usuario where usuario = 'prueba';

select * from funcionalidad;


select * from agencia;
select * from information_schema.columns where table_name = 'usuario';
-- alter table usuario drop column "CampoPrueba";
-- select 'CampoPrueba' from usuario;
SELECT * from usuario;

select * from information_schema.columns where table_name = 'agencia';
select * from information_schema.columns where table_name = 'main_estacion';

