 select * from municipio;
 select * from information_schema.columns where table_name = 'municipio';
 

--  create table veredas (
--     t_id serial unique,
--     codigo varchar (20),
--     nombre varchar(1000),
--     municipio varchar (20),
--     primary key (t_id),
--     foreign key (municipio) references municipio (codigo)
--  );


-- alter table municipio add CONSTRAINT uq_codigo unique(codigo);


select * from veredas;
select * from information_schema.columns where table_name = 'veredas';


-- insert into veredas (codigo, nombre, municipio) values (1,'prueba','91405');
select * from municipio mu join veredas ver on mu.codigo = ver.municipio;

SELECT count(*) FROM veredas;
select * from veredas order by t_id desc limit 2;
select * from veredas where nombre = 'BARBOSA';

select * from materializacion limit 5;

--alter table materializacion add column fecha_descripcion timestamp;
-- alter table materializacion add column altura_mts decimal;
select * from information_schema.columns where table_name = 'materializacion';

-- select * from egdb_cartografia.gis_owner_centroctrl_prod.view_estaciones_geodesicas_activas_gnss;


-- create table main_estacion(
--     objectid serial unique,
--     t_id serial unique,
--     identificador varchar (40),
--     numero_domo_iers varchar (100),
--     nomenclatura varchar(100),
--     latitud numeric,
--     longitud numeric,
--     altura_elipsoidal numeric,
--     altura_msnmm numeric,
--     fecha_instalacion timestamp,
--     fecha_activacion timestamp,
--     fecha_retiro timestamp,
--     url_log varchar(2500),
--     url_serie_tiempo varchar(2500),
--     estado integer,
--     tipo_coordenada integer,
--     estado_vertice integer,
--     orden_precision integer,
--     observacion varchar(1000),
--     agencia integer,
--     datum integer, 
--     municipio varchar(20),
--     gdb_geomattr_data bytea,
--     primary key (t_id),
--     foreign key (municipio) references municipio (codigo)
-- );
select * from municipio;
select * from information_schema.columns where table_name = 'municipio';
-- create table materializacion (
--     t_id serial unique,
--     tipo_materializacion integer,
--     lugar_materializacion varchar(255),
--     altura_referencia_antena numeric,
--     fecha_materializacion timestamp,
--     tipo_puesta_tierra integer,
--     prufuncidad_varilla numeric,
--     observacion varchar (1000),
--     estacion integer,
--     monumentado_por_1 varchar(60),
--     actualizó varchar(50),
--     descripción_detallada varchar(900),
--     acceso_general varchar(900),
--     registrado_por varchar(40),
--     fecha_descripcion timestamp,
--     ancho_mts numeric,
--     primary key (t_id),
--     foreign key (estacion) references main_estacion (t_id)
-- );


-- create table puntoreferencia (
--     t_id serial unique,
--     objeto varchar(500),
--     azimut integer,
--     distancia numeric,
--     estacion integer,
--     primary key (t_id),
--     foreign key (estacion) references main_estacion (t_id)
-- );
select * from puntoreferencia limit 5;
select * from main_estacion where t_id = '6500';
select * from information_schema.columns where table_name = 'main_estacion';
select * from information_schema.columns where table_name = 'materializacion';
select * from main_estacion limit 2;
select * from information_schema.columns where table_name = 'puntoreferencia';







