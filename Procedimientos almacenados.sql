use DBCARRITO
GO

Select * from USUARIO

Select * from Categoria

/* Proc Usuario */

create proc sp_RegistrarUsuario(
@Nombre Varchar(100),
@Apellido Varchar(100),
@Correo Varchar(100),
@Clave Varchar(100),
@Activo bit,
@Mensaje Varchar(500) output,
@Resultado int output			/*resultado devolvera el IdUsuario generado */
)

as 
begin 
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
	begin
	     insert into USUARIO(Nombre,Apellido,Correo,Clave,Actvo) values
		 (@Nombre,@Apellido,@Correo,@Clave,@Actvo)

		 SET @Resultado = SCOPE_IDENTITY()   /*scope_identity nos devuelve el ultimo IdUsuario utilizado */
	end 
	else
	set @Mensaje = 'El correo del usuario ya existe'
end

go

create proc sp_EditarUsuario(
@IdUsuario int,
@Nombre Varchar(100),
@Apellido Varchar(100),
@Correo Varchar(100),
@Actvo bit,
@Mensaje Varchar(500) output,
@Resultado int output			
)

as 
begin 
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo and IdUsuario != @IdUsuario)
	begin
	     update top (1) USUARIO set
		 Nombre= @Nombre,
		 Apellido= @Apellido,
		 Correo= @Correo,
		 Actvo= @Actvo
		where IdUsuario = @IdUsuario

		 SET @Resultado = 1   
	end 
	else
	set @Mensaje = 'El correo del usuario ya existe'
end

/*Proc Categoria */

create proc sp_RegistrarCategoria(
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)
	begin 
		insert into CATEGORIA(Descripcion,Activo) values
		(@Descripcion,@Activo)

		SET @Resultado = SCOPE_IDENTITY()
	     end 
	     else
		set @Mensaje = 'La categoria ya existe'
end 



create proc sp_EditarCategoria(
@IdCategoria int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion and IdCategoria != @IdCategoria)
	begin 
		update top (1) CATEGORIA set
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria

		SET @Resultado = 1
	     end 
	     else
		set @Mensaje = 'La categoria ya existe'
end 

create proc sp_EliminarCategoria(
@IdCategoria int,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM PRODUCTO p
	inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
	WHERE p.IdCategoria = @IdCategoria)
	begin 
		delete top (1) from CATEGORIA where IdCategoria = @IdCategoria
		SET @Resultado = 1
	     end 
	     else
		set @Mensaje = 'La categoria se encuentra relacionada a un producto'
end 

		/*Proc Marca */

create proc sp_RegistrarMarca(
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)
	begin 
		insert into MARCA(Descripcion,Activo) values
		(@Descripcion,@Activo)

		SET @Resultado = SCOPE_IDENTITY()
	  end 
	  else
		set @Mensaje = 'La Marca ya existe'
end 



create proc sp_EditarMarca(
@IdMarca int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion and IdMarca != @IdMarca)
	begin 
		update top (1) MARCA set
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdMarca = @IdMarca

		SET @Resultado = 1
	  end 
	  else
		set @Mensaje = 'La Marca ya existe'
end 

create proc sp_EliminarMarca(
@IdMarca int,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	SET @Resultado = 0 
	IF NOT EXISTS (SELECT * FROM PRODUCTO p
	inner join MARCA c on c.IdMarca = p.IdMarca
	WHERE p.IdMarca = @IdMarca)
	begin 
		delete top (1) from MARCA where IdMarca = @IdMarca
		SET @Resultado = 1
	     end 
	     else
		set @Mensaje = 'La Marca se encuentra relacionada a un producto'
end 

select * from MARCA
go

