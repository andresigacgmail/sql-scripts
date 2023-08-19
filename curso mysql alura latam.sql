-- CREATE DATABASE JUGOS_VENTAS;
USE JUGOS_VENTAS;

DROP TABLE IF EXISTS ITEMS_FACTURAS;
DROP TABLE IF EXISTS FACTURAS;
DROP TABLE IF EXISTS TABLA_DE_CLIENTES;
DROP TABLE IF EXISTS TABLA_DE_PRODUCTOS;
DROP TABLE IF EXISTS TABLA_DE_VENDEDORES;

CREATE TABLE TABLA_DE_CLIENTES(
	DNI varchar(11) NOT NULL,
	NOMBRE varchar(100) NULL,
	DIRECCION_1 varchar(150) NULL,
	DIRECCION_2 varchar(150) NULL,
	BARRIO varchar(50) NULL,
	CIUDAD varchar(50) NULL,
	ESTADO varchar(2) NULL,
	CP varchar(8) NULL,
	FECHA_DE_NACIMIENTO date NULL,
	EDAD smallint NULL,
	SEXO varchar(1) NULL,
	LIMITE_DE_CREDITO float NULL,
	VOLUMEN_DE_COMPRA float NULL,
	PRIMERA_COMPRA bit NULL,
	PRIMARY KEY (DNI));
	
CREATE TABLE TABLA_DE_PRODUCTOS(
	CODIGO_DEL_PRODUCTO varchar(10) NOT NULL,
	NOMBRE_DEL_PRODUCTO varchar(50) NULL,	
	TAMANO varchar(10) NULL,
	SABOR varchar(20) NULL,
        ENVASE varchar(20) NULL,
	PRECIO_DE_LISTA float NOT NULL,
    PRIMARY KEY(CODIGO_DEL_PRODUCTO));
	
CREATE TABLE TABLA_DE_VENDEDORES(
	MATRICULA varchar(5) NOT NULL,
	NOMBRE varchar(100) NULL,
	PORCENTAJE_COMISION float NULL,
	FECHA_ADMISION date NULL,
	VACACIONES bit NULL,
	BARRIO varchar(50) NULL,
 PRIMARY KEY(MATRICULA));
 
 CREATE TABLE FACTURAS(
	DNI varchar(11) NOT NULL,
	MATRICULA varchar(5) NOT NULL,
	FECHA_VENTA date NULL,
	NUMERO int NOT NULL,
	IMPUESTO float NOT NULL,
    PRIMARY KEY (NUMERO),
	FOREIGN KEY (MATRICULA) REFERENCES TABLA_DE_VENDEDORES(MATRICULA),
	FOREIGN KEY (DNI) REFERENCES TABLA_DE_CLIENTES(DNI));

CREATE TABLE ITEMS_FACTURAS(
	NUMERO int NOT NULL,
	CODIGO_DEL_PRODUCTO varchar(10) NOT NULL,
	CANTIDAD int NOT NULL,
	PRECIO float NOT NULL,
	PRIMARY KEY (NUMERO, CODIGO_DEL_PRODUCTO),
	FOREIGN KEY (CODIGO_DEL_PRODUCTO) REFERENCES TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO),
	FOREIGN KEY (NUMERO) REFERENCES FACTURAS (NUMERO));


INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('9283760794', 'Edson Calisaya', 'Sta Úrsula Xitla', '', 'Barrio del Niño Jesús', 'Ciudad de México', 'EM', '22002002', '1995-01-07', 25, 'M', 150000, 250000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('7771579779', 'Marcelo Perez', 'F.C. de Cuernavaca 13', '', 'Carola', 'Ciudad de México', 'EM', '88202912', '1992-01-25', 29, 'M', 120000, 200000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('5576228758', 'Patricia Olivera', 'Pachuca 75', '', 'Condesa', 'Ciudad de México', 'EM', '88192029', '1995-01-14', 25, 'F', 70000, 160000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('8502682733', 'Luis Silva', 'Prol. 16 de Septiembre 1156', '', 'Contadero', 'Ciudad de México', 'EM', '82122020', '1995-01-07', 25, 'M', 110000, 190000, 0);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('1471156710', 'Erica Carvajo', 'Heriberto Frías 1107', '', 'Del Valle', 'Ciudad de México', 'EM', '80012212', '1990-01-01', 30, 'F', 170000, 245000, 0);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('3623344710', 'Marcos Rosas', 'Av. Universidad', '', 'Del Valle', 'Ciudad de México', 'EM', '22002012', '1995-01-13', 26, 'M', 110000, 220000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('50534475787', 'Abel Pintos', 'Carr. México-Toluca 1499', '', 'Cuajimalpa', 'Ciudad de México', 'EM', '22000212', '1995-01-11', 25, 'M', 170000, 260000, 0);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('5840119709', 'Gabriel Roca', 'Eje Central Lázaro Cárdenas 911', '', 'Del Valle', 'Ciudad de México', 'EM', '80010221', '1985-01-16', 36, 'M', 140000, 210000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('94387575700', 'Walter Soruco', 'Calz. de Tlalpan 2980', '', 'Ex Hacienda Coapa', 'Ciudad de México', 'EM', '22000201', '1989-01-20', 31, 'M', 60000, 120000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('8719655770', 'Carlos Santivañez', 'Calz. del Hueso 363', '', 'Floresta Coyoacán', 'Ciudad de México', 'EM', '81192002', '1983-01-20', 37, 'M', 200000, 240000, 0);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('5648641702', 'Paolo Mendez', 'Martires de Tacubaya 65', '', 'Héroes de Padierna', 'Ciudad de México', 'EM', '21002020', '1991-01-30', 29, 'M', 120000, 220000, 0);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('492472718', 'Jorge Castro', 'Federal México-Toluca 5690', '', 'Locaxco', 'Ciudad de México', 'EM', '22012002', '1994-01-19', 26, 'M', 75000, 95000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('9275760794', 'Alberto Rodriguez', 'Circunvalación Oblatos 690', '', 'Oblatos', 'Guadalajara', 'JC', '44700000', '1991-12-28', 26, 'M', 75000, 95000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('94387575701', 'María Jimenez', 'Av. Libertadores 457', '', 'Barragán Hernández', 'Guadalajara', 'JC', '44469000', '1995-05-13', 26, 'F', 120000, 300000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA) VALUES ('95939180787', 'Ximena Gómez', 'Jaguares 822', '', 'Alcalde Barranquitas', 'Guadalajara', 'JC',	'44270000', '1992-01-05', 16, 'F', 90000, 18000, 0);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('773912', 'Clean', '1 Litro', 'Naranja', 'Botella PET', 8.01);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('838819', 'Clean', '1,5 Litros', 'Naranja', 'Botella PET', 12.01);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1037797', 'Clean', '2 Litros', 'Naranja', 'Botella PET', 16.01);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('812829', 'Clean', '350 ml', 'Naranja', 'Lata', 2.81);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('479745', 'Clean', '470 ml', 'Naranja', 'Botella de Vidrio', 3.77);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('695594', 'Festival de Sabores', '1,5 Litros', 'Asaí', 'Botella PET', 28.51);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('243083', 'Festival de Sabores', '1,5 Litros', 'Maracuyá', 'Botella PET', 10.51);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1022450', 'Festival de Sabores', '2 Litros', 'Asái', 'Botella PET', 38.01);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('231776', 'Festival de Sabores', '700 ml', 'Asaí', 'Botella de Vidrio', 13.31);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('723457', 'Festival de Sabores', '700 ml', 'Maracuyá', 'Botella de Vidrio', 4.91);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('746596', 'Light', '1,5 Litros', 'Sandía', 'Botella PET', 19.51);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1040107', 'Light', '350 ml', 'Sandía', 'Lata', 4.56);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1002334', 'Línea Citrus', '1 Litro', 'Lima/Limón', 'Botella PET', 7);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1088126', 'Línea Citrus', '1 Litro', 'Limón', 'Botella PET', 7);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1041119', 'Línea Citrus', '700 ml', 'Lima/Limón', 'Botella de Vidrio', 4.9);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1042712', 'Línea Citrus', '700 ml', 'Limón', 'Botella de Vidrio', 4.9);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('520380', 'Pedazos de Frutas', '1 Litro', 'Manzana', 'Botella PET', 12.01);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('788975', 'Pedazos de Frutas', '1,5 Litros', 'Manzana', 'Botella PET', 18.01);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('229900', 'Pedazos de Frutas', '350 ml', 'Manzana', 'Lata', 4.21);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1101035', 'Refrescante', '1 Litro', 'Frutilla/Limón', 'Botella PET', 9.01);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1086543', 'Refrescante', '1 Litro', 'Mango', 'Botella PET', 11.01);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('326779', 'Refrescante', '1,5 Litros', 'Mango', 'Botella PET', 16.51);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('826490', 'Refrescante', '700 ml', 'Frutilla/Limón', 'Botella de Vidrio', 6.31);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1096818', 'Refrescante', '700 ml', 'Mango', 'Botella de Vidrio', 7.71);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('394479', 'Sabor da Montaña', '700 ml', 'Cereza', 'Botella de Vidrio', 8.41);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('783663', 'Sabor da Montaña', '700 ml', 'Frutilla', 'Botella de Vidrio', 7.71);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1000889', 'Sabor da Montaña', '700 ml', 'Uva', 'Botella de Vidrio', 6.31);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('544931', 'Verano', '350 ml', 'Limón', 'Lata', 2.46);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('235653', 'Verano', '350 ml', 'Mango', 'Lata', 3.86);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1051518', 'Verano', '470 ml', 'Limón', 'Botella de Vidrio', 3.3);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1078680', 'Verano', '470 ml', 'Mango', 'Botella de Vidrio', 5.18);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1004327', 'Vida del Campo', '1,5 Litros', 'Sandía', 'Botella PET', 19.51);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1013793', 'Vida del Campo', '2 Litros', 'Cereza/Manzana', 'Botella PET', 24.01);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('290478', 'Vida del Campo', '350 ml', 'Sandía', 'Lata', 4.56);
INSERT INTO TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO, NOMBRE_DEL_PRODUCTO, TAMANO, SABOR, ENVASE, PRECIO_DE_LISTA) VALUES ('1002767', 'Vida del Campo', '700 ml', 'Cereza/Manzana', 'Botella de Vidrio', 8.41);
INSERT TABLA_DE_VENDEDORES (MATRICULA, NOMBRE, PORCENTAJE_COMISION, FECHA_ADMISION, VACACIONES, BARRIO) VALUES ('00235','Miguel Pavón Silva',0.08,'2014-08-15', 0,'Condesa');
INSERT TABLA_DE_VENDEDORES (MATRICULA, NOMBRE, PORCENTAJE_COMISION, FECHA_ADMISION, VACACIONES, BARRIO) VALUES ('00236', 'Claudia Morales',0.08,'2013-09-17', 1,'Del Valle');
INSERT TABLA_DE_VENDEDORES (MATRICULA, NOMBRE, PORCENTAJE_COMISION, FECHA_ADMISION, VACACIONES, BARRIO) VALUES ('00237', 'Concepción Martinez',0.11,'2017-03-18', 1,'Contadero');
INSERT TABLA_DE_VENDEDORES (MATRICULA, NOMBRE, PORCENTAJE_COMISION, FECHA_ADMISION, VACACIONES, BARRIO) VALUES ('00238', 'Patricia Sánchez',0.11,'2016-08-21', 0,'Oblatos');
show tables;
select * from FACTURAS;

