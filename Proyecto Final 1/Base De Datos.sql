create database Final;
use Final;

drop database Final;
------TABLA EMPLEADO ------------------------------
create table empleados(
Id_Em int identity(1,1) primary key,
Codigo_emp varchar(40),
Nombre varchar(40),
Apellido varchar(40),
Telefono varchar(20),
Id_Dep int not null,
Id_car int not null,
Fecha_Ingreso date,
Salario int,
Estatus varchar(20),
);
 insert into empleados(Codigo_emp, Nombre, Apellido, Telefono, Id_Dep, Id_car, Salario, Estatus) 
 values ('B1','Bladimir','Cleto Diaz','8293384515',1,1,20000, 'Activo');

------Check de Empleados Activos e inactivos-------------------
alter table empleados add constraint CHK_Estatus check (Estatus in('Activo', 'Inactivo'));
go
alter table empleados 
add constraint FRK_DEP foreign key (Id_Dep) references departamentos(Id_Dep);
go
alter table empleados 
add foreign key (Id_car) references cargos(Id_car);

------------------------------------------------------------------------
------ALTER TABLE VENTAS
------ADD FOREIGN KEY (id_Cliente) REFERENCES CLIENTES(id_Cliente);
------------------------------------------------------------------------

------TABLA DEPARTAMENTOS---------------------------
create table departamentos(
Id_Dep int identity(1,1) primary key,
Codigo_Dep int,
Nombre varchar(20),
);
insert into departamentos (Codigo_Dep, Nombre) values(1,'Contabilidad');
------TABLA CARGOS---------------------------------
create table cargos(
Id_car int identity (1,1) primary key,
CargosN varchar(20),
);

insert into cargos (CargosN) values('Gerente');
--------------------------------------------------------
---------------------------------------------------------------------------------------
-----------------------------------M�DULO DE PROCESOS----------------------------------
--------------TABLA NOMINAS-----------------------------

create table nomina(
Id_Nom int identity(1,1) primary key,
Año int,
Mes varchar(10),
Monto_Total decimal(13,2),
)

----------------------------------Calculo Nomina---------------------
go
create procedure Calcular_Nomina
as
begin
	Declare @Año int
	Declare @Mes varchar(10)
	Declare @Monto_Total decimal(13,2)

	select @Monto_Total = sum(empleados.Salario) from empleados where Estatus = 'Activo'

	select @Año = DATENAME(YEAR,SYSDATETIME())

	select @Mes = DATENAME(MONTH, SYSDATETIME())
	------------------------------Nomina------------
	Begin try
		Begin tran

			if exists(select * from nomina where Año= @Año and Mes = @Mes)
			BEGIN
				delete from nomina where Año = @Año and Mes = @Mes
				insert into nomina values (@Año, @Mes, @Monto_Total)
			END


			ELSE 

			insert into nomina values(@Año, @Mes, @Monto_Total)

			commit
	end try
	begin catch 
		rollback				print'Tiene un error'+ERROR_MESSAGE()
		end catch
		End;
	
	select * from nomina

End

go

exec Calcular_Nomina

---------------------------------------------------
----------SALIDA DE EMPLEADOS ---------------------
----------TABLA SALIDAS----------------------------
create table Salida_Empleados(
Id_Sal int identity(1,1) primary key,
Tipo_Salida varchar(40),
Motivo varchar(MAX),
Fecha_salida date,
Id_Em int
)
drop table Salida_Empleados;

insert into Salida_Empleados 
	(Tipo_Salida,Motivo,Id_Em) values('Renuncia','Mal Empleado', 1);

drop table Salida_Empleados;

 alter table Salida_Empleados 
	add constraint FRK_sALIDA foreign key (Id_Em) references empleados(Id_Em);

 alter table Salida_Empleados 
	add constraint CHK_Salida check(Tipo_Salida in('Renuncia','Despido','Desahucio'));
	 
----------------------------------------------------
---------------------------------Salida de empleados------------------
GO
CREATE TRIGGER trg_salidas on Salida_Empleados
after insert
as 
begin
	declare @id int;
		set @id = (Select Id_Em from inserted);

		Update empleados set Estatus = 'Inactivo' where Id_Em = @id;
end;
select*from empleados;
select*from Salida_Empleados;
----------------------------------------------------

------------VACACIONES------------------------------
------------TABLA VACACIONES------------------------
create table vacaciones(
Id_vac int identity(1,1) primary key,
Id_Em int,
FechaDesde date,
FechaHasta date,
año int,
Comentario varchar(max),
);
alter table vacaciones add foreign key (Id_Em) references empleados(Id_Em);

-----------------------------------------------------
--------------PERMISOS-------------------------------
--------------TABLA PERMISOS-------------------------
create table permisos(
Id_Per int identity(1,1) primary key,
Id_Em int,
FechaDesde date,
FechaHasta date,
Comentario varchar(max),
)
 alter table permisos add foreign key (Id_Em) references empleados(Id_Em);

-----------------------LICENCIAS-----------------------
--------------TABLA LICENCIAS--------------
create table licencias(
Id_licen int identity(1,1) primary key,
Id_Em int,
FechaDesde date,
FechaHasta date,
Motivo varchar(500),
Comentario varchar(max),
)

alter table licencias add foreign key (Id_Em) references empleados(Id_Em);
-------------------------------------------------------------------------
