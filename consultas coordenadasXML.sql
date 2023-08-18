SELECT * from main_estacion me LEFT join agencia ag on me.agencia = ag.t_id where identificador = '3MAT';
select * from materializacion where lugar_materializacion = 'Casco urbano corregimiento tres metas';


select * from main_estacion;


select * from information_schema.columns where table_name = 'usuario';

select * from medicionnivelacion;
select * from main_estacion ma inner join medicionnivelacion me on ma.t_id = me.estacion;

select * from usuario;
select * from rol; --1 
select * from agencia; --1

--insert into usuario (usuario, nombre, correo_electronico, contrasenia, rol, agencia) values ('fredy.galindo', 'Fredy Guiovanny Galindo', 'fredy.galindo@igac.gov.co','$2y$05$SWn2OaivlKfhAUWjlg8WbuXgIQnMQPcwq4bAuldW04q/rQ23/bp3.',2,1);




