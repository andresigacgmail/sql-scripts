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
select * from municipio where nombre = 'EL RETORNO';
select * from puntoreferencia;

-- alter table municipio add column descripción varchar(200);

select * from information_schema.columns where table_name = 'main_estacion';
select * from main_estacion limit 5;
select * from information_schema.columns where table_name = 'municipio';
select * from information_schema.columns where table_name = 'main_estacion';

select * from main_estacion where nomenclatura = 'CBYR';
select * from main_estacion where nomenclatura = '3MAT';
select * from information_schema.columns where table_name = 'elemento_fisico';
select * from information_schema.table_constraints where constraint_type = 'FOREIGN KEY';
select * from d_estadoverticetipo;
select * from d_coordenadatipo;

select * from view_estaciones_geodesicas limit 5;
select * from d_estadoverticetipo;

select kcu.table_schema || '.' ||kcu.table_name as foreign_table,
       '>-' as rel,
       rel_tco.table_schema || '.' || rel_tco.table_name as primary_table,
       string_agg(kcu.column_name, ', ') as fk_columns,
       kcu.constraint_name
from information_schema.table_constraints tco
join information_schema.key_column_usage kcu
          on tco.constraint_schema = kcu.constraint_schema
          and tco.constraint_name = kcu.constraint_name
join information_schema.referential_constraints rco
          on tco.constraint_schema = rco.constraint_schema
          and tco.constraint_name = rco.constraint_name
join information_schema.table_constraints rel_tco
          on rco.unique_constraint_schema = rel_tco.constraint_schema
          and rco.unique_constraint_name = rel_tco.constraint_name
where tco.constraint_type = 'FOREIGN KEY'
group by kcu.table_schema,
         kcu.table_name,
         rel_tco.table_name,
         rel_tco.table_schema,
         kcu.constraint_name
order by kcu.table_schema,
         kcu.table_name;

select * from municipio where t_id = 654;
select * from information_schema.columns where table_name = 'main_estacion';
select * from main_estacion limit 5;    
select * from materializacion;
select * from information_schema.columns where table_name = 'materializacion';
select * from main_estacion;


select estacion, * from materializacion order by t_id desc limit 5;
select * from information_schema.columns where table_name = 'materializacion';
select * from d_materializaciontipo;
select * from information_schema.columns where table_name = 'd_materializaciontipo';
select * from municipio order by t_id;
select * from d_estadoverticetipo order by t_id;

select * from main_estacion ma join materializacion m on m.estacion = ma.t_id join puntoreferencia pu on pu.estacion = ma.t_id order by ma.t_id desc limit 12;
 
 
 select * from main_estacion ma join materializacion m on m.estacion = ma.t_id order by ma.t_id desc limit 12;

 select ma.t_id, ma.identificador, m.tipo_materializacion, m.fecha_materializacion, m.altura_referencia_antena, m.lugar_materializacion, m.estacion
     from main_estacion ma join materializacion m on m.estacion = ma.t_id order by ma.t_id desc limit 12;

select * from materializacion order by t_id desc limit 12;

select * from main_estacion where identificador = 'B5-TL-1';
--update materializacion set  tipo_materializacion = 2, fecha_materializacion = '1996'  where estacion =  'B5-TL-1';

--select count(*) from main_estacion where latitud = 7.16440000;
select count(*) from materializacion;

select * from materializacion where estacion = 212;
--update materializacion set  tipo_materializacion = 2, fecha_materializacion = '1996-12-12'  where estacion = (select t_id from main_estacion where identificador = 'B5-TL-1');

select * from main_estacion where identificador = 'GPS-VD-001';


select count(*) from main_estacion where altura_msnmm is null;
select * from main_estacion limit 5;
select count(*) from main_estacion where latitud = '7.16440000' and longitud = '6.22100000'; -- 11460  después 9075

select * from main_estacion where identificador = '05001007';
select * from rinex where estacion = 1 order by t_id desc limit 5;
select * from main_estacion where t_id = 1;
select * from main_estacion where identificador = 'BOSC';
select rinex.*, ma.identificador from rinex, main_estacion ma where rinex.estacion = ma.t_id and estacion = 1 order by anio desc ,dia_del_anio desc
    limit 5;

select rinex.*, ma.identificador from rinex, main_estacion ma where rinex.estacion = ma.t_id and estacion = 1  order by anio desc ,dia_del_anio ASC
    limit 5;
    








