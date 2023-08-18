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
select * from puntoreferencia limit 5;
select * from main_estacion where t_id = '6500';





