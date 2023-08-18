
drop table fabricante;
drop table producto;

create table fabricante(
    id number,
    nombre varchar(100),
    constraint fabricante_pk primary key (id)
);
describe fabricante;

create table producto (
    id NUMBER,
    nombre varchar(100),
    precio number(7,2) not null,
    id_fabricante number not null,
    constraint producto_pk primary key(id),
    constraint pro_fab_fk foreign key(id_fabricante) references fabricante (id)    
);



select * from fabricante;


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


select * from producto;
select UPPER(nombre), precio from producto;
select Lower(nombre), precio from producto;
select nombre, round(precio)  from producto;
select nombre, trunc(precio)  from producto;

-- los archivos de almacenamiento de la base de datos
select * from dba_data_files;
-- el espacio libre que tiene cada tablespace de las bases de datos
select * from dba_free_space;


select tablespace_name, round( bytes / (1024*1024), 2 ) as mega from dba_free_space;


select tablespace_name tablespace_name, sum(bytes) from dba_data_files group by tablespace_name;

















