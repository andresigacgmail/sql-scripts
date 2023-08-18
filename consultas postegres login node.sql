

-- drop table usuario
create table usuario (
    t_id serial UNIQUE,
    usuario VARCHAR(20),
    tipo_documento bigint,
    numero_documento VARCHAR(100),
    nombre VARCHAR(255),
    correo_electronico VARCHAR(100) not null unique,    
    telefono VARCHAR(100),
    numero_contrato VARCHAR(50),
    cargo VARCHAR(255),
    contrasenia TEXT,
    fecha_creacion DATE,
    fecha_vencimiento DATE,
    rol BIGINT,
    agencia BIGINT, 
    primary key (t_id)
);

select * from usuario;

-- drop table rol;
create table rol (
    t_id serial UNIQUE,
    codigo VARCHAR(20),
    descripcion VARCHAR(255),
    PRIMARY KEY (t_id)
);

-- drop table agencia;
create table agencia (
    t_id serial UNIQUE,
    sigla VARCHAR(20),
    nombre VARCHAR(255),
    direccion VARCHAR(250),
    pais VARCHAR(250),
    departamento VARCHAR(250),
    ciudad VARCHAR(250),
    PRIMARY KEY (t_id)
);



-- alter table usuario add CONSTRAINT fk_rol FOREIGN KEY (rol) REFERENCES rol(t_id);
-- alter table usuario add CONSTRAINT fk_agencia FOREIGN KEY (agencia) REFERENCES agencia(t_id);


insert into rol (codigo, descripcion) values ('01','Administrador');
insert into rol (codigo, descripcion) values ('02','Editor');
insert into rol (codigo, descripcion) values ('03','Consulta');

select * from rol;

insert into agencia (sigla, nombre, direccion, pais, departamento, ciudad) values ('IGAC','Instituto Geográfico Agustín Codazzi', 'Carrera 30 No 48-51','Colombia','Bogotá','Bogotá');
insert into agencia (sigla, nombre, direccion, pais, departamento, ciudad) values ('SGC','Servicio Geológico Colombiano', 'Diagonal 53 No. 34 - 53','Colombia','Bogotá','Bogotá');
insert into agencia (sigla, nombre, direccion, pais, departamento, ciudad) values ('CELSIA','CELSIA COLOMBIA S.A. E.S.P.', 'Carrera 43 A 1 A SUR 143','Colombia','Antioquia','Medellín');
insert into agencia (sigla, nombre, direccion, pais, departamento, ciudad) values ('EAAB','Empresa de Acueducto y Alcantarillado de Bogotá', 'Av. Calle 24 No. 37-15','Colombia','Bogotá','Bogotá');
insert into agencia (sigla, nombre, direccion, pais, departamento, ciudad) values ('GALILEO','Galileo Instruments', 'Carrera 13 # 71 - 69','Colombia','Bogotá','Bogotá');
insert into agencia (sigla, nombre, direccion, pais, departamento, ciudad) values ('SENA','Servicio Nacional de Aprendizaje', 'Calle 57 No. 8 - 69','Colombia','Bogotá','Bogotá');
insert into agencia (sigla, nombre) values ('UF','USUARIO_FINAL');

select * from agencia;


insert into usuario (t_id,usuario, tipo_documento, numero_documento,contrasenia, rol, agencia) values (30,'prueba','1','123456','1234',3,7);
select * from usuario;


delete from usuario where t_id =11;


create table municipio (
    t_id serial unique,
    codigo varchar(5),    
    nombre varchar(1000),
    departamento bigint,
    primary key(t_id)
);
select * from municipio;


create table departamento (
    t_id serial unique,
    codigo varchar(2),
    nombre varchar(1000),    
    primary key(t_id)
);

select * from municipio;

create table municipio_cordenadas (
    t_id serial unique,
    latitud varchar(20),
    longitud varchar(20),
    municipio bigint,
    primary key (t_id)
);

select * from municipio_cordenadas;


select mc.t_id as coor_id, latitud, mc.longitud, mc.municipio, m.t_id as municipio_id, m.codigo as municipio_codigo, m.nombre as municipio_nombre, m.departamento, 
    d.t_id as departamento_id, d.codigo as departamento_codigo, d.nombre as departamento_nombre
    from municipio_cordenadas mc inner join municipio m on mc.municipio = m.t_id inner join departamento d on m.departamento = d.t_id 
    where mc.latitud like '4.6%' and mc.longitud like '-74.0%';

select * from municipio_cordenadas mc inner join municipio on mc.municipio = municipio.t_id inner join departamento on municipio.departamento = departamento.t_id where departamento.nombre = 'BOGOTÁ';

select * from municipio where nombre = 'BOGOTÁ, D.C.';

select * from municipio_cordenadas mc inner join municipio on mc.municipio = municipio.t_id inner join departamento on municipio.departamento = departamento.t_id 
    where municipio.nombre = 'BOGOTÁ, D.C.';


select * from municipio_cordenadas where municipio = 535;
select count(*) from municipio;
select count(*) from municipio_cordenadas;
select * from municipio_cordenadas mc inner join municipio m on mc.municipio = m.t_id where m.nombre like 'BOGOTÁ, D.C.' order by mc.municipio;
-- insert into municipio_cordenadas (latitud, longitud, municipio) values ('4.6126','-74.0705',535);



select * from usuario;
select * from municipio;
select * from municipio_cordenadas;
select * from information_schema.columns where table_name = 'municipio_cordenadas';
-- delete from usuario where t_id = 32;


select * from main_estacion;



select * from estadisticas;




select * from information_schema.columns where table_name = 'main_estacion';


select * from main_estacion where nomenclatura = '3';

select nomenclatura, count(nomenclatura) as cuenta from main_estacion group by nomenclatura order by cuenta desc;

select * from main_estacion where nomenclatura = '70508007';

select * from municipio where codigo = '00';
select * from municipio where nombre = 'CHAPARRAL';

select * from servidor;

-- insert into servidor (nombre, direccion_ip_privada, direccion_ip_publica, dominio) 
--     values('SSCTPR04', '10.23.13.15', '20.122.46.175','ssctpr04.igac.gov.co' );

-- update servidor set tipo_protocolo = 5 where t_id = 21;

SELECT jsonb_build_object(
      'type',     'FeatureCollection',
      'features', jsonb_agg(features.Feature)
  )as geojson from (
  SELECT json_build_object(
      'type',       'Feature',
      'id',         t_id,
      'geometry',   ST_AsGeoJSON(ST_MakePoint(longitud,latitud))::json,
      'properties', json_build_object(
          't_id', identificador,
          'nombre', nomenclatura
      )
  ) as Feature
  FROM ccg.estacion where latitud is not null and longitud is not null limit 1000) features;

  select count(*) from main_estacion where altura_elipsoidal = 55.10600000;

  insert into main_estacion (identificador, nomenclatura, estado, tipo_coordenada, orden_precision, agencia, datum, municipio,geom) 
    values ('paola','paola', 1,1,2,1,1,1119, '01010000A0A12400005524940BF29351412E624CE0B9953D410000000000000000');    
  select * from main_estacion where identificador = 'paol';
  select * from main_estacion where identificador = '3MAT' or identificador = 'paol' order by objectid;

  -- update main_estacion set latitud = '231654685' where identificador = 'paol'; 18730

  select * from estaciontipo where estacion = 18730;
  
  insert into estaciontipo (tipo, estacion) values  (1, 18730);
  -- delete from main_estacion where t_id = 18730;

  select * from d_materializacionTipo;
  



  select * from main_estacion where nomenclatura = 'C-T-1449';