SELECT * FROM USUARIO
GO

insert into USUARIO(
Nombre,Apellido,Correo,	Clave) values ('tes nombre','tes apellido', 
'tes@example.com','57776e8a41ff487b37a6b34186486b0e2f886e2cbf12a8e30d56dc67ea778193')
Go

SELECT * FROM CATEGORIA
Go

insert into CATEGORIA(Descripcion) values
('Tecnologia'),
('Muebles'),
('Dormitorio'),
('Deportes')
GO

SELECT * FROM MARCA
GO

insert into MARCA(Descripcion) values
('SONY'),
('BASEUS'),
('ZEBLAZE'),
('AMAZFIT'),
('SAMSUNG'),
('LENOVO')
GO

Select * From DEPARTAMENTO
GO

select * from PROVINCIA
GO
Select * from DISTRITO
GO
insert into DEPARTAMENTO(IdDepartamento, Descripcion) values
('01','Masaya'),
('02','Managua'),
('03','Rivas'),
('04','Jinotepe')
GO 


insert into PROVINCIA(IdProvincia,Descripcion,IdDepartamento) values
('0101','Masaya','01'),
('0102','Catarina','01'),
('0103','Niquinomo','01'),

--Provincia o departamento Managua
('0201','Managua','02'),
('0202','TICUANTEPE','02'),
('0203','CUIDAD SANDINO','02'),

--Provincia o departamento RIVAS
('0301','Rivas','03'),
('0302','Tola','03'),
('0303','Belen','03'),

--Provincia o departamento Jinotepe
('0401','jinotepe','04'),
('0402','San Marcos','04'),
('0403','Diriamba','04')
GO



insert into DISTRITO(IdDistrito,Descripcion,IdProvincia,IdDepartamento) values
--Masaya
('010101','TISMA','0101','01'),
('010102','Catarina','0101','01'),

--Catarina 
('010201','Pacayita ','0102','01'),
('010202','Tunel','0102','01'),
('010203','Cuatro esquina','0102','01'),
('010204','Los ceibo','0102','01'),

--Niquinomo 
('010301','Corozo','0103','01'),
('010302','Portillo','0103','01'),
('010303','Zapton','0103','01'),
('010304','HojaChigue1','0103','01'),
('010305','HojaChigue2','0103','01'),
('010306','Justo Romero','0103','01'),
('010307','La curva','0103','01'),
('010308','las Crusitas','0103','01'),

--Managua comarcas o barrios 
('020301','Distrito 1','0201','02'),
('020302','Distrito 2','0201','02'),
('020303','Distrito 3','0201','02'),
('020304','Distrito 4','0201','02'),
('020305','Distrito 5','0201','02'),
('020306','Distrito 6','0201','02'),
('020307','Distrito 7','0201','02')

-- Distritos o comarcas de Ticuantepe
GO

