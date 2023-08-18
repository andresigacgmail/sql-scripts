/*
insert into Producto (CodigoBarra, Nombre, Marca, Categoria, precio) 
values (50910011, 'ideapad	3','lenovo','tecnologia',1700),
(50910012, 'sony momo tablet lite','sony','tecnologia',300),
(50910013, 'lavadora 21 kg','winia','electrohogar',1749);

select * from Producto;

create proc sp_lista_productos as 
begin 
	select * from Producto;
end



create proc sp_guardar_producto (
	@codigoBarra varchar(50),
	@nombre varchar(50),
	@marca varchar(50),
	@categoria varchar(100),
	@precio decimal(10,2)
) as

begin 
	insert into Producto (CodigoBarra, Nombre, Marca, Categoria, precio) 
	values (@codigoBarra, @nombre, @marca, @categoria, @precio)
end




create proc sp_editar_producto (
	@idProducto numeric,
	@codigoBarra varchar(50) null,
	@nombre varchar(50) null,
	@marca varchar(50) null,
	@categoria varchar(100) null,
	@precio decimal(10,2) null
) as

begin 
	update Producto  set 
	CodigoBarra = ISNULL(@codigoBarra, CodigoBarra),
	Nombre = ISNULL(@nombre, Nombre),
	Marca = ISNULL(@marca, Marca),
	Categoria = ISNULL(@categoria, Categoria),
	precio = ISNULL(@precio, precio)	
	where IdProducto = @idProducto
end

*/

create proc sp_eliminar_producto (
	@idProducto numeric
) as
begin 
	delete from Producto where IdProducto = @idProducto
end

create procedure sp_obtener_producto(@idProducto int) as
begin 
	select * from Producto where IdProducto = @idProducto
end


exec sp_obtener_producto 2;
