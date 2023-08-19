create database tienda;

create  table fabricante(
    id serial primary key,
    nombre varchar (100) not NULL
);

create table producto (
    id serial primary key,
    nombre varchar(100) not null,
    precio decimal not null,
    id_fabricante int not null,
    foreign key (id_fabricante) references fabricante(id)
);



INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



select upper(nombre), precio from producto;

select lower(nombre), precio from producto;

select nombre, upper( substring(nombre from 1 for 2) ) from fabricante;

select nombre, round( precio ) from producto;

select nombre, trunc( precio) from producto;

select id_fabricante from producto where
producto.id_fabricante
in( select id from fabricante) group by id_fabricante order by id_fabricante;

select nombre from fabricante order by nombre asc;

select nombre from fabricante order by nombre desc;

select nombre from producto order by nombre asc, precio desc;

select * from fabricante limit 5;

select * from fabricante limit 2 offset 3;

select nombre, precio from producto order by precio limit 1;

select nombre, precio from producto order by precio desc limit 1;

select nombre from producto where id_fabricante = 2;

select nombre, precio from producto where precio <= 120;

select nombre, precio from producto where precio >= 400;

select nombre, precio from producto where not precio >= 400;

select nombre, precio from producto where precio >= 80 and precio <= 300;

select nombre, precio from producto where precio between 80 and  300;

select nombre, precio from producto where precio > 200 and id_fabricante = 6;

select * from producto where
    id_fabricante = 1 or id_fabricante = 3 or id_fabricante = 5;

select * from producto where id_fabricante in(1,3,5);

select nombre, precio, precio * 100 as centimo from producto;

select nombre from fabricante where nombre like 'S%';

select nombre from fabricante where nombre like '%e';

select nombre from fabricante where nombre like '%w%';

select nombre from fabricante where nombre like '____';

select nombre from producto where nombre like '%Portátil%';

select nombre, precio from producto where nombre like '%Monitor%' and precio < 215;

select nombre, precio from producto where precio >= 180 order by precio desc, nombre asc;

-- inner join

select p.nombre, p.precio, f.nombre from producto p
    inner join fabricante f on p.id_fabricante = f.id;

select p.nombre, p.precio, f.nombre from producto p
    inner join fabricante f on p.id_fabricante = f.id order by f.nombre;

select p.id, p.nombre, f.id, f.nombre from producto p
    inner join fabricante f on p.id_fabricante = f.id;

select p.nombre, p.precio, f.nombre from producto p inner join fabricante f
    on p.id_fabricante = f.id  order by precio asc limit 1;

select p.nombre, p.precio, f.nombre from producto p
    inner join fabricante f on f.id = p.id_fabricante order by precio desc limit 1;

select * from producto p inner join fabricante f on f.id = p.id_fabricante
         where f.nombre = 'Lenovo';

select * from producto p inner join fabricante f on f.id = p.id_fabricante
    where f.nombre = 'Crucial' and p.precio > 200;

select * from producto p inner join fabricante f on f.id = p.id_fabricante
    where f.nombre = 'Asus' or f.nombre ='Hewlett-Packard' or f.nombre = 'Seagate';

select * from producto p inner join fabricante f on f.id = p.id_fabricante
    where f.nombre in( 'Asus' ,'Hewlett-Packard', 'Seagate');

select p.nombre, p.precio, f.nombre from producto p inner join fabricante f
    on p.id_fabricante = f.id where f.nombre like '%e';

select * from pg_stat_activity;


select p.nombre, p.precio, f.nombre from producto p inner join fabricante f 
    on p.id_fabricante = f.id where f.nombre like '%w%';

select p.nombre, p.precio, f.nombre as fabricante_nombre from producto p 
    inner join fabricante f on p.id_fabricante = f.id where p.precio >= 180
    order by 2 desc, 1 asc;

select f.id, f.nombre from producto p inner join fabricante f 
    on p.id_fabricante = f.id group by f.id order by f.id;

-- left and rigth join

select * from fabricante f left join producto p on f.id = p.id_fabricante;

select * from fabricante f left join producto p on f.id = p.id_fabricante where p.id is null;

-- consultas resumen

select count(*) from producto;

select count(*) from fabricante;

select count(p.id_fabricante) from (select distinct id_fabricante from producto) p;

select  sum(precio) / count(precio)  as media from producto;

select min(precio) from producto;

select max(precio) from producto;

select nombre, precio from producto order by precio asc limit 1;

select nombre, precio from producto order by precio desc limit 1;

select sum(precio) from producto;

select count(*) from producto p inner join fabricante f on p.id_fabricante = f.id where f.nombre = 'Asus';

select sum(precio) / count(*) from producto p inner join fabricante f on p.id_fabricante = f.id where f.nombre = 'Asus';
select avg(precio) from producto p inner join fabricante f on p.id_fabricante = f.id where f.nombre = 'Asus';

select * from producto p inner join fabricante f on p.id_fabricante = f.id where f.nombre = 'Asus' order by precio limit 1;

select * from producto p inner join fabricante f on p.id_fabricante = f.id 
    where f.nombre = 'Asus' order by precio desc limit 1;

select sum(precio) from producto p inner join fabricante f on p.id_fabricante = f.id where f.nombre = 'Asus';

select max(precio), min(precio), avg(precio), count(*) from producto p inner join fabricante f 
    on p.id_fabricante = f.id where f.nombre = 'Crucial';

select f.nombre, count(p.id) as "cantidad productos" from fabricante f left join producto p 
    on f.id = p.id_fabricante group by f.nombre order by "cantidad productos" desc;

-- 17


create table prueba(
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    apellido_dos VARCHAR(50)
);


insert into prueba (nombre, apellido_dos) values ('pepe','igss');
insert into prueba (nombre, apellido_dos) values ('dutch','saag');
insert into prueba (nombre, apellido_dos) values ('jultz','beintz');
insert into prueba (nombre, apellido_dos) values ('fetch','strugh');

select * from prueba;

update prueba set apellido = apellido_dos where apellido is NULL;
update prueba set apellido = null where apellido is not NULL;

select * from information_schema.columns where table_name = 'producto';



