use DBCARRITO
GO

select * from USUARIO



create proc sp_RegistrarUsuario(
@Nombre Varchar(100),
@Apellido Varchar(100),
@Correo Varchar(100),
@Clave Varchar(100),
@Actvo bit,
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

