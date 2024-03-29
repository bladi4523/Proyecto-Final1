USE [master]
GO
/****** Object:  Database [Final]    Script Date: 28/11/2019 8:51:39 a. m. ******/
CREATE DATABASE [Final]
GO
ALTER DATABASE [Final] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Final].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Final] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Final] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Final] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Final] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Final] SET ARITHABORT OFF 
GO
ALTER DATABASE [Final] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Final] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Final] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Final] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Final] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Final] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Final] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Final] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Final] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Final] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Final] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Final] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Final] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Final] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Final] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Final] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Final] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Final] SET RECOVERY FULL 
GO
ALTER DATABASE [Final] SET  MULTI_USER 
GO
ALTER DATABASE [Final] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Final] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Final] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Final] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Final] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Final', N'ON'
GO
USE [Final]
GO
/****** Object:  Table [dbo].[cargos]    Script Date: 28/11/2019 8:51:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cargos](
	[Id_car] [int] IDENTITY(1,1) NOT NULL,
	[CargosN] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[departamentos]    Script Date: 28/11/2019 8:51:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[departamentos](
	[Id_Dep] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Dep] [int] NULL,
	[Nombre] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Dep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 28/11/2019 8:51:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empleados](
	[Id_Em] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_emp] [varchar](40) NULL,
	[Nombre] [varchar](40) NULL,
	[Apellido] [varchar](40) NULL,
	[Telefono] [varchar](20) NULL,
	[Id_Dep] [int] NOT NULL,
	[Id_car] [int] NOT NULL,
	[Fecha_Ingreso] [date] NULL,
	[Salario] [int] NULL,
	[Estatus] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Em] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[licencias]    Script Date: 28/11/2019 8:51:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[licencias](
	[Id_licen] [int] IDENTITY(1,1) NOT NULL,
	[Id_Em] [int] NULL,
	[FechaDesde] [date] NULL,
	[FechaHasta] [date] NULL,
	[Motivo] [varchar](500) NULL,
	[Comentario] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_licen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nomina]    Script Date: 28/11/2019 8:51:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nomina](
	[Id_Nom] [int] IDENTITY(1,1) NOT NULL,
	[Año] [int] NULL,
	[Mes] [varchar](10) NULL,
	[Monto_Total] [decimal](13, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[permisos]    Script Date: 28/11/2019 8:51:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[permisos](
	[Id_Per] [int] IDENTITY(1,1) NOT NULL,
	[Id_Em] [int] NULL,
	[FechaDesde] [date] NULL,
	[FechaHasta] [date] NULL,
	[Comentario] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Per] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Salida_Empleados]    Script Date: 28/11/2019 8:51:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Salida_Empleados](
	[Id_Sal] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Salida] [varchar](40) NULL,
	[Motivo] [varchar](max) NULL,
	[Fecha_salida] [date] NULL,
	[Id_Em] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Sal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vacaciones]    Script Date: 28/11/2019 8:51:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vacaciones](
	[Id_vac] [int] IDENTITY(1,1) NOT NULL,
	[Id_Em] [int] NULL,
	[FechaDesde] [date] NULL,
	[FechaHasta] [date] NULL,
	[año] [int] NULL,
	[Comentario] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_vac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cargos] ON 

INSERT [dbo].[cargos] ([Id_car], [CargosN]) VALUES (1, N'Gerente')
SET IDENTITY_INSERT [dbo].[cargos] OFF
SET IDENTITY_INSERT [dbo].[departamentos] ON 

INSERT [dbo].[departamentos] ([Id_Dep], [Codigo_Dep], [Nombre]) VALUES (1, 1, N'Contabilidad')
SET IDENTITY_INSERT [dbo].[departamentos] OFF
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([Id_Em], [Codigo_emp], [Nombre], [Apellido], [Telefono], [Id_Dep], [Id_car], [Fecha_Ingreso], [Salario], [Estatus]) VALUES (1, N'B1', N'Bladimir', N'Cleto Diaz', N'8293384515', 1, 1, NULL, 20000, N'Activo')
SET IDENTITY_INSERT [dbo].[empleados] OFF
SET IDENTITY_INSERT [dbo].[Salida_Empleados] ON 

INSERT [dbo].[Salida_Empleados] ([Id_Sal], [Tipo_Salida], [Motivo], [Fecha_salida], [Id_Em]) VALUES (1, N'Renuncia', N'Mal Empleado', NULL, 1)
SET IDENTITY_INSERT [dbo].[Salida_Empleados] OFF
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD FOREIGN KEY([Id_car])
REFERENCES [dbo].[cargos] ([Id_car])
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FRK_DEP] FOREIGN KEY([Id_Dep])
REFERENCES [dbo].[departamentos] ([Id_Dep])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FRK_DEP]
GO
ALTER TABLE [dbo].[licencias]  WITH CHECK ADD FOREIGN KEY([Id_Em])
REFERENCES [dbo].[empleados] ([Id_Em])
GO
ALTER TABLE [dbo].[permisos]  WITH CHECK ADD FOREIGN KEY([Id_Em])
REFERENCES [dbo].[empleados] ([Id_Em])
GO
ALTER TABLE [dbo].[permisos]  WITH CHECK ADD FOREIGN KEY([Id_Em])
REFERENCES [dbo].[empleados] ([Id_Em])
GO
ALTER TABLE [dbo].[Salida_Empleados]  WITH CHECK ADD  CONSTRAINT [FRK_sALIDA] FOREIGN KEY([Id_Em])
REFERENCES [dbo].[empleados] ([Id_Em])
GO
ALTER TABLE [dbo].[Salida_Empleados] CHECK CONSTRAINT [FRK_sALIDA]
GO
ALTER TABLE [dbo].[vacaciones]  WITH CHECK ADD FOREIGN KEY([Id_Em])
REFERENCES [dbo].[empleados] ([Id_Em])
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [CHK_Estatus] CHECK  (([Estatus]='Inactivo' OR [Estatus]='Activo'))
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [CHK_Estatus]
GO
ALTER TABLE [dbo].[Salida_Empleados]  WITH CHECK ADD  CONSTRAINT [CHK_Salida] CHECK  (([Tipo_Salida]='Desahucio' OR [Tipo_Salida]='Despido' OR [Tipo_Salida]='Renuncia'))
GO
ALTER TABLE [dbo].[Salida_Empleados] CHECK CONSTRAINT [CHK_Salida]
GO
/****** Object:  StoredProcedure [dbo].[Calcular_Nomina]    Script Date: 28/11/2019 8:51:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Calcular_Nomina]
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
GO
USE [master]
GO
ALTER DATABASE [Final] SET  READ_WRITE 
GO
