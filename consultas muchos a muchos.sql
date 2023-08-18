
-- drop TABLE Marca;
use tienda;

CREATE TABLE Marca(
    id int IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50),
    Pais varchar(50)
);


CREATE TABLE Cerveza (
    id int IDENTITY(1,1) PRIMARY KEY not NULL,
    Nombre VARCHAR(50) UNIQUE not null,
    idMarca int,

    FOREIGN KEY(idMarca) REFERENCES Marca(id)
);

create table Presentasion (
    id int IDENTITY(1,1) PRIMARY KEY,
    Nombre varchar(50)
);

create table CervezaPresentasion(
    id int IDENTITY(1,1) PRIMARY KEY,
    idCerveza int not null,
    idPresentasion int not NULL
);


insert into Marca VALUES('Erdinger','Alemania'),('Omnipollo','Suecia');
insert into Cerveza VALUES('Pikantus',1),('Anadrome',2),('Noa Pecan',2),('Dunkel',1);
insert into Presentasion values('Lata 330'),('Botella 500');

insert into CervezaPresentasion values (1,2),(2,1),(3,1),(4,2);
insert into CervezaPresentasion VALUES(1, 1);


select Nombre from Cerveza where Nombre LIKE 'pika%';

select * from Cerveza;
SELECT * from Presentasion;
select * from CervezaPresentasion;


SELECT * from Cerveza where id=1;
select * from Cerveza where id in (1,2);
select * from Presentasion where id  in  (select idPresentasion from CervezaPresentasion where idCerveza = 1);
select * from cervezapresentasion;


select idPresentasion, idCerveza, c.Nombre as cervesa, p.Nombre as presentasion
FROM Cerveza as c
JOIN CervezaPresentasion ON  c.id = CervezaPresentasion.idCerveza 
JOIN Presentasion as p ON p.id = CervezaPresentasion.idPresentasion
where c.id = 1;

select idPresentasion, idCerveza, c.Nombre as cervesa, p.Nombre as presentasion
FROM Cerveza as c
JOIN CervezaPresentasion ON  c.id = CervezaPresentasion.idCerveza 
JOIN Presentasion as p ON p.id = CervezaPresentasion.idPresentasion
where c.Nombre LIKE 'pi%' or c.Nombre LIKE 'an%';



select idPresentasion, idCerveza, c.Nombre as cervesa, p.Nombre as presentasion, m.Nombre as marca
FROM Cerveza as c
JOIN CervezaPresentasion ON  c.id = CervezaPresentasion.idCerveza 
JOIN Presentasion as p ON p.id = CervezaPresentasion.idPresentasion
JOIN Marca as m on m.id = c.idMarca
where c.id = 1;

-- order aleatorio (newid())
select * from cerveza order by newid();

select * from cerveza;

select idMarca, count(idMarca) from cerveza group by idMarca order by count(idMarca); 
select idMarca, count(idMarca) as total from cerveza group by idMarca order by total; 


select * from [cerveza];
-- saltandose los primeros 2 registros
select * from cerveza order by id OFFSET 2 ROWS;

-- obtine un rango, desde el segundo registro, obtiene los siguientes 2 registros
select * from cerveza order by id OFFSET 1 ROWS  
    FETCH NEXT 2 ROWS ONLY;

-- estadisticas
select top 5 * from sys.dm_db_resource_stats;
select * from sys.dm_db_resource_stats;

sp_help cerveza;

create or replace view stats as
    select * from sys.dm_db_resource_stats;

select * from stats;

select * from sys.views;

sp_help stats;














