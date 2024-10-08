USE [master]
GO
/****** Object:  Database [Medicore]    Script Date: 24/7/2024 6:44:47 p. m. ******/
CREATE DATABASE [Medicore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Medicore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\Medicore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Medicore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\Medicore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Medicore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Medicore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Medicore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Medicore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Medicore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Medicore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Medicore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Medicore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Medicore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Medicore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Medicore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Medicore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Medicore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Medicore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Medicore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Medicore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Medicore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Medicore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Medicore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Medicore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Medicore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Medicore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Medicore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Medicore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Medicore] SET RECOVERY FULL 
GO
ALTER DATABASE [Medicore] SET  MULTI_USER 
GO
ALTER DATABASE [Medicore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Medicore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Medicore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Medicore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Medicore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Medicore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Medicore', N'ON'
GO
ALTER DATABASE [Medicore] SET QUERY_STORE = ON
GO
ALTER DATABASE [Medicore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Medicore]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 24/7/2024 6:44:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Genero] [char](1) NOT NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](100) NULL,
	[SeguroMedico] [varchar](100) NULL,
	[NumeroSeguroSocial] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Especialidad] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[MedicoID] [int] NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Motivo] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Citas_Informacion_Completa]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Citas_Informacion_Completa]
AS
SELECT 
	c.ID AS CitaID,
	p.Nombre AS PacienteNombre,
	p.Apellido AS PacienteApellido, 
    m.Nombre AS MedicoNombre,
	m.Apellido AS MedicoApellido, 
    c.FechaHora,
	c.Motivo
FROM Citas c
JOIN Pacientes p ON c.PacienteID = p.ID
JOIN Medicos m ON c.MedicoID = m.ID;
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[MontoTotal] [decimal](10, 2) NOT NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Facturas_Con_Paciente]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Facturas_Con_Paciente]
AS
SELECT 
	f.ID AS FacturaID,
	p.Nombre AS PacienteNombre,
	p.Apellido AS PacienteApellido, 
	f.Fecha,
	f.MontoTotal,
	f.Descripcion
FROM Facturas f
JOIN Pacientes p ON f.PacienteID = p.ID;
GO
/****** Object:  Table [dbo].[Laboratorios]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultadosLaboratorio]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultadosLaboratorio](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[MedicoID] [int] NOT NULL,
	[LaboratorioID] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[TipoPrueba] [varchar](100) NOT NULL,
	[Resultados] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Resultados_del_Laboratorio]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Resultados_del_Laboratorio]
AS
SELECT 
	r.ID AS ResultadoID,
	p.Nombre AS PacienteNombre,
	p.Apellido AS PacienteApellido, 
	l.Nombre AS LaboratorioNombre,
	r.Fecha,
	r.TipoPrueba,
	r.Resultados
FROM ResultadosLaboratorio r
JOIN Pacientes p ON r.PacienteID = p.ID
JOIN Laboratorios l ON r.LaboratorioID = l.ID;
GO
/****** Object:  Table [dbo].[Hospitalizaciones]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalizaciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[MedicoID] [int] NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[FechaAlta] [datetime] NULL,
	[Motivo] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Hospitalizaciones_con_Informacion_Paciente]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Hospitalizaciones_con_Informacion_Paciente]
AS
SELECT 
	h.ID,
	p.Nombre AS PacienteNombre,
	p.Apellido AS PacienteApellido, 
    m.Nombre AS MedicoNombre,
	m.Apellido AS MedicoApellido, 
    h.FechaIngreso,
	h.FechaAlta,
	h.Motivo
FROM Hospitalizaciones h
JOIN Pacientes p ON h.PacienteID = p.ID
JOIN Medicos m ON h.MedicoID = m.ID;
GO
/****** Object:  View [dbo].[Monto_Total_Pacientes]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Monto_Total_Pacientes]
AS
SELECT 
	p.ID,
	p.Nombre,
	p.Apellido,
SUM(f.MontoTotal) AS MontoTotalFacturado
FROM Pacientes p
JOIN Facturas f 
ON p.ID = f.PacienteID
GROUP BY p.ID, p.Nombre, p.Apellido;
GO
/****** Object:  Table [dbo].[Auditoria_Pacientes]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria_Pacientes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NULL,
	[Accion] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Usuario] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditoriaMedicos]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriaMedicos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MedicoID] [int] NULL,
	[Accion] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Usuario] [nvarchar](100) NULL,
	[DatosAntiguos] [nvarchar](max) NULL,
	[DatosNuevos] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cirugias]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cirugias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[MedicoID] [int] NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[TipoCirugia] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Genero] [char](1) NOT NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](100) NULL,
	[DepartamentoID] [int] NOT NULL,
	[Cargo] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FacturaID] [int] NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[MontoPagado] [decimal](10, 2) NOT NULL,
	[MetodoPago] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescripciones]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescripciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CitaID] [int] NOT NULL,
	[MedicamentoID] [int] NOT NULL,
	[Dosis] [varchar](100) NOT NULL,
	[Duracion] [int] NOT NULL,
	[Instrucciones] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tratamientos]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tratamientos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cirugias] ON 

INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (1, 1, 1, CAST(N'2023-04-01T00:00:00.000' AS DateTime), N'Cirugía Cardiaca', N'Bypass Coronario')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (2, 2, 2, CAST(N'2023-04-02T00:00:00.000' AS DateTime), N'Cirugía Neurológica', N'Resección de Tumor')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (3, 3, 3, CAST(N'2023-04-03T00:00:00.000' AS DateTime), N'Cirugía Pediátrica', N'Apendicectomía')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (4, 4, 4, CAST(N'2023-04-04T00:00:00.000' AS DateTime), N'Cirugía Dermatológica', N'Extracción de Quiste')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (5, 5, 5, CAST(N'2023-04-05T00:00:00.000' AS DateTime), N'Cirugía Oftalmológica', N'Corrección de Cataratas')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (6, 6, 6, CAST(N'2023-04-06T00:00:00.000' AS DateTime), N'Cirugía Ginecológica', N'Histerectomía')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (7, 7, 7, CAST(N'2023-04-07T00:00:00.000' AS DateTime), N'Cirugía Psiquiátrica', N'Estimulación Cerebral Profunda')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (8, 8, 8, CAST(N'2023-04-08T00:00:00.000' AS DateTime), N'Cirugía Oncológica', N'Mastectomía')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (9, 9, 9, CAST(N'2023-04-09T00:00:00.000' AS DateTime), N'Cirugía Traumatológica', N'Reparación de Ligamentos')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (10, 10, 10, CAST(N'2023-04-10T00:00:00.000' AS DateTime), N'Cirugía General', N'Colecistectomía')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (11, 11, 11, CAST(N'2023-04-11T00:00:00.000' AS DateTime), N'Cirugía Interna', N'Herniorrafia')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (12, 12, 12, CAST(N'2023-04-12T00:00:00.000' AS DateTime), N'Cirugía Urológica', N'Prostatectomía')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (13, 13, 13, CAST(N'2023-04-13T00:00:00.000' AS DateTime), N'Cirugía Endocrinológica', N'Tiroidectomía')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (14, 14, 14, CAST(N'2023-04-14T00:00:00.000' AS DateTime), N'Cirugía Neumológica', N'Lobectomía Pulmonar')
INSERT [dbo].[Cirugias] ([ID], [PacienteID], [MedicoID], [FechaHora], [TipoCirugia], [Descripcion]) VALUES (15, 15, 15, CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'Cirugía Reumatológica', N'Reemplazo de Cadera')
SET IDENTITY_INSERT [dbo].[Cirugias] OFF
GO
SET IDENTITY_INSERT [dbo].[Citas] ON 

INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (1, 1, 1, CAST(N'2023-01-01T09:00:00.000' AS DateTime), N'Revisión General')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (2, 2, 2, CAST(N'2023-01-02T10:00:00.000' AS DateTime), N'Chequeo Neurológico')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (3, 3, 3, CAST(N'2023-01-03T11:00:00.000' AS DateTime), N'Consulta Pediátrica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (4, 4, 4, CAST(N'2023-01-04T12:00:00.000' AS DateTime), N'Consulta Dermatológica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (5, 5, 5, CAST(N'2023-01-05T13:00:00.000' AS DateTime), N'Revisión Oftalmológica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (6, 6, 6, CAST(N'2023-01-06T14:00:00.000' AS DateTime), N'Chequeo Ginecológico')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (7, 7, 7, CAST(N'2023-01-07T15:00:00.000' AS DateTime), N'Consulta Psiquiátrica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (8, 8, 8, CAST(N'2023-01-08T16:00:00.000' AS DateTime), N'Consulta Oncológica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (9, 9, 9, CAST(N'2023-01-09T17:00:00.000' AS DateTime), N'Consulta Traumatológica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (10, 10, 10, CAST(N'2023-01-10T18:00:00.000' AS DateTime), N'Consulta Quirúrgica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (11, 11, 11, CAST(N'2023-01-11T09:00:00.000' AS DateTime), N'Chequeo Interno')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (12, 12, 12, CAST(N'2023-01-12T10:00:00.000' AS DateTime), N'Consulta Urológica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (13, 13, 13, CAST(N'2023-01-13T11:00:00.000' AS DateTime), N'Consulta Endocrinológica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (14, 14, 14, CAST(N'2023-01-14T12:00:00.000' AS DateTime), N'Consulta Neumológica')
INSERT [dbo].[Citas] ([ID], [PacienteID], [MedicoID], [FechaHora], [Motivo]) VALUES (15, 15, 15, CAST(N'2023-01-15T13:00:00.000' AS DateTime), N'Consulta Reumatológica')
SET IDENTITY_INSERT [dbo].[Citas] OFF
GO
SET IDENTITY_INSERT [dbo].[Departamentos] ON 

INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (1, N'Administración', N'Departamento encargado de la administración general del hospital.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (2, N'Contabilidad', N'Departamento encargado de la gestión financiera y contable del hospital.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (3, N'Recursos Humanos', N'Departamento encargado de la gestión del personal.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (4, N'Mantenimiento', N'Departamento encargado del mantenimiento de las instalaciones.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (5, N'Seguridad', N'Departamento encargado de la seguridad del hospital.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (6, N'Informática', N'Departamento encargado de la gestión de sistemas y tecnología.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (7, N'Atención al Cliente', N'Departamento encargado de la atención a los pacientes y sus familias.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (8, N'Marketing', N'Departamento encargado de la promoción y publicidad del hospital.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (9, N'Investigación', N'Departamento encargado de la investigación médica.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (10, N'Farmacia', N'Departamento encargado de la gestión de medicamentos.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (11, N'Emergencias', N'Departamento encargado de la atención de urgencias.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (12, N'Consultas Externas', N'Departamento encargado de las consultas ambulatorias.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (13, N'Hospitalización', N'Departamento encargado de la hospitalización de pacientes.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (14, N'Quirófano', N'Departamento encargado de las intervenciones quirúrgicas.')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Descripcion]) VALUES (15, N'Radiología', N'Departamento encargado de las pruebas de imagen.')
SET IDENTITY_INSERT [dbo].[Departamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (1, N'Juan', N'Lopez', CAST(N'1980-04-25' AS Date), N'M', N'Calle Falsa 123', N'555-1122', N'juan.lopez@example.com', 1, N'Administrador')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (2, N'Ana', N'Diaz', CAST(N'1985-06-15' AS Date), N'F', N'Avenida Siempre Viva 742', N'555-2233', N'ana.diaz@example.com', 2, N'Contadora')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (3, N'Pedro', N'Martinez', CAST(N'1978-08-20' AS Date), N'M', N'Boulevard Los Angeles 300', N'555-3344', N'pedro.martinez@example.com', 3, N'Gerente de RRHH')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (4, N'Maria', N'Hernandez', CAST(N'1990-11-11' AS Date), N'F', N'Calle de la Rosa 55', N'555-4455', N'maria.hernandez@example.com', 4, N'Técnico de Mantenimiento')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (5, N'Luis', N'Gonzalez', CAST(N'1983-01-30' AS Date), N'M', N'Avenida Central 8', N'555-5566', N'luis.gonzalez@example.com', 5, N'Jefe de Seguridad')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (6, N'Elena', N'Ruiz', CAST(N'1988-09-05' AS Date), N'F', N'Calle Luna 7', N'555-6677', N'elena.ruiz@example.com', 6, N'Técnico de Sistemas')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (7, N'Carlos', N'Torres', CAST(N'1975-02-18' AS Date), N'M', N'Avenida Sol 200', N'555-7788', N'carlos.torres@example.com', 7, N'Atención al Cliente')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (8, N'Sofia', N'Ramos', CAST(N'1995-07-23' AS Date), N'F', N'Calle Estrella 1', N'555-8899', N'sofia.ramos@example.com', 8, N'Especialista en Marketing')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (9, N'Miguel', N'Perez', CAST(N'1980-03-17' AS Date), N'M', N'Boulevard Oeste 99', N'555-9900', N'miguel.perez@example.com', 9, N'Investigador')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (10, N'Lucia', N'Garcia', CAST(N'1993-06-23' AS Date), N'F', N'Avenida Este 45', N'555-1010', N'lucia.garcia@example.com', 10, N'Farmacéutica')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (11, N'Javier', N'Molina', CAST(N'1972-02-28' AS Date), N'M', N'Calle Norte 67', N'555-1212', N'javier.molina@example.com', 11, N'Paramédico')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (12, N'Laura', N'Vega', CAST(N'1986-10-14' AS Date), N'F', N'Avenida Sur 12', N'555-1313', N'laura.vega@example.com', 12, N'Enfermera')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (13, N'Fernando', N'Reyes', CAST(N'1991-05-22' AS Date), N'M', N'Boulevard Primavera 6', N'555-1414', N'fernando.reyes@example.com', 13, N'Doctor')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (14, N'Isabel', N'Jimenez', CAST(N'1984-07-08' AS Date), N'F', N'Calle Invierno 44', N'555-1515', N'isabel.jimenez@example.com', 14, N'Cirujana')
INSERT [dbo].[Empleados] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [DepartamentoID], [Cargo]) VALUES (15, N'Raul', N'Ortiz', CAST(N'1979-11-30' AS Date), N'M', N'Avenida Verano 77', N'555-1616', N'raul.ortiz@example.com', 15, N'Radiólogo')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (1, 1, CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Consulta General')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (2, 2, CAST(N'2023-02-02T00:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)), N'Chequeo Neurológico')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (3, 3, CAST(N'2023-02-03T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'Consulta Pediátrica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (4, 4, CAST(N'2023-02-04T00:00:00.000' AS DateTime), CAST(250.00 AS Decimal(10, 2)), N'Consulta Dermatológica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (5, 5, CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Revisión Oftalmológica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (6, 6, CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Chequeo Ginecológico')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (7, 7, CAST(N'2023-02-07T00:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)), N'Consulta Psiquiátrica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (8, 8, CAST(N'2023-02-08T00:00:00.000' AS DateTime), CAST(350.00 AS Decimal(10, 2)), N'Consulta Oncológica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (9, 9, CAST(N'2023-02-09T00:00:00.000' AS DateTime), CAST(450.00 AS Decimal(10, 2)), N'Consulta Traumatológica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (10, 10, CAST(N'2023-02-10T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)), N'Consulta Quirúrgica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (11, 11, CAST(N'2023-02-11T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Chequeo Interno')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (12, 12, CAST(N'2023-02-12T00:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)), N'Consulta Urológica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (13, 13, CAST(N'2023-02-13T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'Consulta Endocrinológica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (14, 14, CAST(N'2023-02-14T00:00:00.000' AS DateTime), CAST(250.00 AS Decimal(10, 2)), N'Consulta Neumológica')
INSERT [dbo].[Facturas] ([ID], [PacienteID], [Fecha], [MontoTotal], [Descripcion]) VALUES (15, 15, CAST(N'2023-02-15T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Consulta Reumatológica')
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Hospitalizaciones] ON 

INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (14, 1, 1, CAST(N'2023-03-01T08:00:00.000' AS DateTime), CAST(N'2023-03-05T00:00:00.000' AS DateTime), N'Observación General')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (15, 2, 2, CAST(N'2023-03-02T09:00:00.000' AS DateTime), CAST(N'2023-03-06T00:00:00.000' AS DateTime), N'Tratamiento Neurológico')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (16, 3, 3, CAST(N'2023-03-03T10:00:00.000' AS DateTime), CAST(N'2023-03-07T00:00:00.000' AS DateTime), N'Tratamiento Pediátrico')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (17, 4, 4, CAST(N'2023-03-04T11:00:00.000' AS DateTime), CAST(N'2023-03-08T00:00:00.000' AS DateTime), N'Tratamiento Dermatológico')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (18, 5, 5, CAST(N'2023-03-05T12:00:00.000' AS DateTime), CAST(N'2023-03-09T00:00:00.000' AS DateTime), N'Cirugía Oftalmológica')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (19, 6, 6, CAST(N'2023-03-06T13:00:00.000' AS DateTime), CAST(N'2023-03-10T00:00:00.000' AS DateTime), N'Observación Ginecológica')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (20, 7, 7, CAST(N'2023-03-07T14:00:00.000' AS DateTime), CAST(N'2023-03-11T00:00:00.000' AS DateTime), N'Tratamiento Psiquiátrico')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (21, 8, 8, CAST(N'2023-03-08T15:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), N'Tratamiento Oncológico')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (22, 9, 9, CAST(N'2023-03-09T16:00:00.000' AS DateTime), CAST(N'2023-03-13T00:00:00.000' AS DateTime), N'Tratamiento Traumatológico')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (23, 10, 10, CAST(N'2023-03-10T17:00:00.000' AS DateTime), CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'Cirugía General')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (24, 11, 11, CAST(N'2023-03-11T18:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime), N'Tratamiento Interno')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (25, 12, 12, CAST(N'2023-03-12T19:00:00.000' AS DateTime), CAST(N'2023-03-16T00:00:00.000' AS DateTime), N'Tratamiento Urológico')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (26, 13, 13, CAST(N'2023-03-13T20:00:00.000' AS DateTime), CAST(N'2023-03-17T00:00:00.000' AS DateTime), N'Tratamiento Endocrinológico')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (27, 14, 14, CAST(N'2023-03-14T21:00:00.000' AS DateTime), CAST(N'2023-03-18T00:00:00.000' AS DateTime), N'Tratamiento Neumológico')
INSERT [dbo].[Hospitalizaciones] ([ID], [PacienteID], [MedicoID], [FechaIngreso], [FechaAlta], [Motivo]) VALUES (28, 15, 15, CAST(N'2023-03-15T22:00:00.000' AS DateTime), CAST(N'2023-03-19T00:00:00.000' AS DateTime), N'Tratamiento Reumatológico')
SET IDENTITY_INSERT [dbo].[Hospitalizaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Laboratorios] ON 

INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (1, N'Lab Uno', N'Calle Falsa 456', N'555-2345', N'contacto@labuno.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (2, N'Lab Dos', N'Avenida Siempre Viva 123', N'555-3456', N'contacto@labdos.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (3, N'Lab Tres', N'Boulevard Los Angeles 789', N'555-4567', N'contacto@labtres.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (4, N'Lab Cuatro', N'Calle de la Rosa 101', N'555-5678', N'contacto@labcuatro.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (5, N'Lab Cinco', N'Avenida Central 202', N'555-6789', N'contacto@labcinco.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (6, N'Lab Seis', N'Calle Luna 303', N'555-7890', N'contacto@labseis.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (7, N'Lab Siete', N'Avenida Sol 404', N'555-8901', N'contacto@labsiete.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (8, N'Lab Ocho', N'Calle Estrella 505', N'555-9012', N'contacto@labocho.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (9, N'Lab Nueve', N'Boulevard Oeste 606', N'555-0123', N'contacto@labnueve.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (10, N'Lab Diez', N'Avenida Este 707', N'555-1234', N'contacto@labdiez.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (11, N'Lab Once', N'Calle Norte 808', N'555-2345', N'contacto@labonce.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (12, N'Lab Doce', N'Avenida Sur 909', N'555-3456', N'contacto@labdoce.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (13, N'Lab Trece', N'Boulevard Primavera 1010', N'555-4567', N'contacto@labtrece.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (14, N'Lab Catorce', N'Calle Invierno 1111', N'555-5678', N'contacto@labcatorce.com')
INSERT [dbo].[Laboratorios] ([ID], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (15, N'Lab Quince', N'Avenida Verano 1212', N'555-6789', N'contacto@labquince.com')
SET IDENTITY_INSERT [dbo].[Laboratorios] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicamentos] ON 

INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (1, N'Medicamento A', N'Descripción del Medicamento A', CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (2, N'Medicamento B', N'Descripción del Medicamento B', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (3, N'Medicamento C', N'Descripción del Medicamento C', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (4, N'Medicamento D', N'Descripción del Medicamento D', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (5, N'Medicamento E', N'Descripción del Medicamento E', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (6, N'Medicamento F', N'Descripción del Medicamento F', CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (7, N'Medicamento G', N'Descripción del Medicamento G', CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (8, N'Medicamento H', N'Descripción del Medicamento H', CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (9, N'Medicamento I', N'Descripción del Medicamento I', CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (10, N'Medicamento J', N'Descripción del Medicamento J', CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (11, N'Medicamento K', N'Descripción del Medicamento K', CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (12, N'Medicamento L', N'Descripción del Medicamento L', CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (13, N'Medicamento M', N'Descripción del Medicamento M', CAST(130.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (14, N'Medicamento N', N'Descripción del Medicamento N', CAST(140.00 AS Decimal(10, 2)))
INSERT [dbo].[Medicamentos] ([ID], [Nombre], [Descripcion], [Precio]) VALUES (15, N'Medicamento O', N'Descripción del Medicamento O', CAST(150.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Medicamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicos] ON 

INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (1, N'Ana', N'Fernandez', N'Cardiología', N'555-1111', N'ana.fernandez@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (2, N'Carlos', N'Mendez', N'Neurología', N'555-2222', N'carlos.mendez@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (3, N'Elena', N'Salazar', N'Pediatría', N'555-3333', N'elena.salazar@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (4, N'Javier', N'Gonzalez', N'Dermatología', N'555-4444', N'javier.gonzalez@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (5, N'Laura', N'Perez', N'Oftalmología', N'555-5555', N'laura.perez@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (6, N'Luis', N'Martinez', N'Ginecología', N'555-6666', N'luis.martinez@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (7, N'Maria', N'Ruiz', N'Psiquiatría', N'555-7777', N'maria.ruiz@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (8, N'Miguel', N'Lopez', N'Oncología', N'555-8888', N'miguel.lopez@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (9, N'Patricia', N'Torres', N'Traumatología', N'555-9999', N'patricia.torres@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (10, N'Pedro', N'Ramos', N'Cirugía General', N'555-0000', N'pedro.ramos@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (11, N'Raul', N'Vega', N'Medicina Interna', N'555-1212', N'raul.vega@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (12, N'Rosa', N'Hernandez', N'Urología', N'555-2323', N'rosa.hernandez@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (13, N'Sofia', N'Garcia', N'Endocrinología', N'555-3434', N'sofia.garcia@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (14, N'Vicente', N'Diaz', N'Neumología', N'555-4545', N'vicente.diaz@example.com')
INSERT [dbo].[Medicos] ([ID], [Nombre], [Apellido], [Especialidad], [Telefono], [Correo]) VALUES (15, N'Virginia', N'Jimenez', N'Reumatología', N'555-5656', N'virginia.jimenez@example.com')
SET IDENTITY_INSERT [dbo].[Medicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (1, N'Juan', N'Perez', CAST(N'1985-05-20' AS Date), N'M', N'Calle Falsa 123', N'555-1234', N'juan.perez@example.com', N'Seguro A', N'123-45-6789')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (2, N'Maria', N'Gomez', CAST(N'1990-07-15' AS Date), N'F', N'Avenida Siempre Viva 742', N'555-5678', N'maria.gomez@example.com', N'Seguro B', N'987-65-4321')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (3, N'Pedro', N'Lopez', CAST(N'1978-12-03' AS Date), N'M', N'Boulevard Los Angeles 300', N'555-8765', N'pedro.lopez@example.com', N'Seguro A', N'321-54-9876')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (4, N'Ana', N'Martinez', CAST(N'1983-09-10' AS Date), N'F', N'Calle de la Rosa 55', N'555-2345', N'ana.martinez@example.com', N'Seguro C', N'654-32-1987')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (5, N'Luis', N'Hernandez', CAST(N'1992-01-25' AS Date), N'M', N'Avenida Central 8', N'555-6789', N'luis.hernandez@example.com', N'Seguro B', N'789-12-3456')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (6, N'Elena', N'Diaz', CAST(N'1988-11-12' AS Date), N'F', N'Calle Luna 7', N'555-3456', N'elena.diaz@example.com', N'Seguro A', N'432-65-0987')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (7, N'Carlos', N'Garcia', CAST(N'1975-08-19' AS Date), N'M', N'Avenida Sol 200', N'555-4321', N'carlos.garcia@example.com', N'Seguro C', N'876-54-3210')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (8, N'Sofia', N'Vega', CAST(N'1995-04-05' AS Date), N'F', N'Calle Estrella 1', N'555-7654', N'sofia.vega@example.com', N'Seguro A', N'210-98-7654')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (9, N'Miguel', N'Torres', CAST(N'1980-03-17' AS Date), N'M', N'Boulevard Oeste 99', N'555-5432', N'miguel.torres@example.com', N'Seguro B', N'543-21-0987')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (10, N'Lucia', N'Ramos', CAST(N'1993-06-23' AS Date), N'F', N'Avenida Este 45', N'555-6543', N'lucia.ramos@example.com', N'Seguro C', N'987-65-4321')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (11, N'Javier', N'Molina', CAST(N'1972-02-28' AS Date), N'M', N'Calle Norte 67', N'555-8765', N'javier.molina@example.com', N'Seguro A', N'123-45-6789')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (12, N'Laura', N'Reyes', CAST(N'1986-10-14' AS Date), N'F', N'Avenida Sur 12', N'555-1234', N'laura.reyes@example.com', N'Seguro B', N'321-54-9876')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (13, N'Fernando', N'Jimenez', CAST(N'1991-05-22' AS Date), N'M', N'Boulevard Primavera 6', N'555-9876', N'fernando.jimenez@example.com', N'Seguro C', N'654-32-1987')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (14, N'Isabel', N'Castro', CAST(N'1984-07-08' AS Date), N'F', N'Calle Invierno 44', N'555-2345', N'isabel.castro@example.com', N'Seguro A', N'789-12-3456')
INSERT [dbo].[Pacientes] ([ID], [Nombre], [Apellido], [FechaNacimiento], [Genero], [Direccion], [Telefono], [Correo], [SeguroMedico], [NumeroSeguroSocial]) VALUES (15, N'Raul', N'Ortiz', CAST(N'1979-11-30' AS Date), N'M', N'Avenida Verano 77', N'555-3456', N'raul.ortiz@example.com', N'Seguro B', N'432-65-0987')
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 

INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (1, 1, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Tarjeta de Crédito')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (2, 2, CAST(N'2023-06-02T00:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)), N'Efectivo')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (3, 3, CAST(N'2023-06-03T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'Tarjeta de Débito')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (4, 4, CAST(N'2023-06-04T00:00:00.000' AS DateTime), CAST(250.00 AS Decimal(10, 2)), N'Transferencia Bancaria')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (5, 5, CAST(N'2023-06-05T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Tarjeta de Crédito')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (6, 6, CAST(N'2023-06-06T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Efectivo')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (7, 7, CAST(N'2023-06-07T00:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)), N'Tarjeta de Débito')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (8, 8, CAST(N'2023-06-08T00:00:00.000' AS DateTime), CAST(350.00 AS Decimal(10, 2)), N'Transferencia Bancaria')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (9, 9, CAST(N'2023-06-09T00:00:00.000' AS DateTime), CAST(450.00 AS Decimal(10, 2)), N'Tarjeta de Crédito')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (10, 10, CAST(N'2023-06-10T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)), N'Efectivo')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (11, 11, CAST(N'2023-06-11T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Tarjeta de Débito')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (12, 12, CAST(N'2023-06-12T00:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)), N'Transferencia Bancaria')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (13, 13, CAST(N'2023-06-13T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)), N'Tarjeta de Crédito')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (14, 14, CAST(N'2023-06-14T00:00:00.000' AS DateTime), CAST(250.00 AS Decimal(10, 2)), N'Efectivo')
INSERT [dbo].[Pagos] ([ID], [FacturaID], [FechaPago], [MontoPagado], [MetodoPago]) VALUES (15, 15, CAST(N'2023-06-15T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Tarjeta de Débito')
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Prescripciones] ON 

INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (1, 1, 1, N'1 pastilla', 7, N'Tomar una pastilla diaria')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (2, 2, 2, N'2 pastillas', 10, N'Tomar dos pastillas diarias')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (3, 3, 3, N'1 cápsula', 5, N'Tomar una cápsula cada 12 horas')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (4, 4, 4, N'1 pastilla', 14, N'Tomar una pastilla diaria')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (5, 5, 5, N'1 jarabe', 7, N'Tomar una cucharada de jarabe cada 8 horas')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (6, 6, 6, N'1 pastilla', 7, N'Tomar una pastilla diaria')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (7, 7, 7, N'1 cápsula', 10, N'Tomar una cápsula cada 8 horas')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (8, 8, 8, N'1 pastilla', 7, N'Tomar una pastilla diaria')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (9, 9, 9, N'1 jarabe', 5, N'Tomar una cucharada de jarabe cada 6 horas')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (10, 10, 10, N'1 pastilla', 14, N'Tomar una pastilla diaria')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (11, 11, 11, N'2 cápsulas', 10, N'Tomar dos cápsulas diarias')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (12, 12, 12, N'1 pastilla', 7, N'Tomar una pastilla diaria')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (13, 13, 13, N'1 jarabe', 5, N'Tomar una cucharada de jarabe cada 4 horas')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (14, 14, 14, N'1 cápsula', 10, N'Tomar una cápsula cada 6 horas')
INSERT [dbo].[Prescripciones] ([ID], [CitaID], [MedicamentoID], [Dosis], [Duracion], [Instrucciones]) VALUES (15, 15, 15, N'1 pastilla', 7, N'Tomar una pastilla diaria')
SET IDENTITY_INSERT [dbo].[Prescripciones] OFF
GO
SET IDENTITY_INSERT [dbo].[ResultadosLaboratorio] ON 

INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (1, 1, 1, 1, CAST(N'2023-05-01T00:00:00.000' AS DateTime), N'Análisis de Sangre', N'Resultados Normales')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (2, 2, 2, 2, CAST(N'2023-05-02T00:00:00.000' AS DateTime), N'Resonancia Magnética', N'Sin Anormalidades')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (3, 3, 3, 3, CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Radiografía', N'Fractura Detectada')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (4, 4, 4, 4, CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Ecografía', N'Resultados Normales')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (5, 5, 5, 5, CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Tomografía', N'Resultados Normales')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (6, 6, 6, 6, CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Análisis de Orina', N'Resultados Normales')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (7, 7, 7, 7, CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Electrocardiograma', N'Resultados Normales')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (8, 8, 8, 8, CAST(N'2023-05-08T00:00:00.000' AS DateTime), N'Biopsia', N'Resultados Normales')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (9, 9, 9, 9, CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'Prueba de Esfuerzo', N'Resultados Normales')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (10, 10, 10, 10, CAST(N'2023-05-10T00:00:00.000' AS DateTime), N'Análisis de Sangre', N'Anemia Detectada')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (11, 11, 11, 11, CAST(N'2023-05-11T00:00:00.000' AS DateTime), N'Resonancia Magnética', N'Tumor Detectado')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (12, 12, 12, 12, CAST(N'2023-05-12T00:00:00.000' AS DateTime), N'Radiografía', N'Resultados Normales')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (13, 13, 13, 13, CAST(N'2023-05-13T00:00:00.000' AS DateTime), N'Ecografía', N'Quiste Detectado')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (14, 14, 14, 14, CAST(N'2023-05-14T00:00:00.000' AS DateTime), N'Tomografía', N'Resultados Normales')
INSERT [dbo].[ResultadosLaboratorio] ([ID], [PacienteID], [MedicoID], [LaboratorioID], [Fecha], [TipoPrueba], [Resultados]) VALUES (15, 15, 15, 15, CAST(N'2023-05-15T00:00:00.000' AS DateTime), N'Análisis de Orina', N'Infección Detectada')
SET IDENTITY_INSERT [dbo].[ResultadosLaboratorio] OFF
GO
SET IDENTITY_INSERT [dbo].[Tratamientos] ON 

INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (1, N'Tratamiento A', N'Descripción del Tratamiento A')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (2, N'Tratamiento B', N'Descripción del Tratamiento B')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (3, N'Tratamiento C', N'Descripción del Tratamiento C')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (4, N'Tratamiento D', N'Descripción del Tratamiento D')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (5, N'Tratamiento E', N'Descripción del Tratamiento E')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (6, N'Tratamiento F', N'Descripción del Tratamiento F')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (7, N'Tratamiento G', N'Descripción del Tratamiento G')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (8, N'Tratamiento H', N'Descripción del Tratamiento H')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (9, N'Tratamiento I', N'Descripción del Tratamiento I')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (10, N'Tratamiento J', N'Descripción del Tratamiento J')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (11, N'Tratamiento K', N'Descripción del Tratamiento K')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (12, N'Tratamiento L', N'Descripción del Tratamiento L')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (13, N'Tratamiento M', N'Descripción del Tratamiento M')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (14, N'Tratamiento N', N'Descripción del Tratamiento N')
INSERT [dbo].[Tratamientos] ([ID], [Nombre], [Descripcion]) VALUES (15, N'Tratamiento O', N'Descripción del Tratamiento O')
SET IDENTITY_INSERT [dbo].[Tratamientos] OFF
GO
ALTER TABLE [dbo].[Auditoria_Pacientes] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[AuditoriaMedicos] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Cirugias]  WITH CHECK ADD FOREIGN KEY([MedicoID])
REFERENCES [dbo].[Medicos] ([ID])
GO
ALTER TABLE [dbo].[Cirugias]  WITH CHECK ADD FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([ID])
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD FOREIGN KEY([MedicoID])
REFERENCES [dbo].[Medicos] ([ID])
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([ID])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([DepartamentoID])
REFERENCES [dbo].[Departamentos] ([ID])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([ID])
GO
ALTER TABLE [dbo].[Hospitalizaciones]  WITH CHECK ADD FOREIGN KEY([MedicoID])
REFERENCES [dbo].[Medicos] ([ID])
GO
ALTER TABLE [dbo].[Hospitalizaciones]  WITH CHECK ADD FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([ID])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([FacturaID])
REFERENCES [dbo].[Facturas] ([ID])
GO
ALTER TABLE [dbo].[Prescripciones]  WITH CHECK ADD FOREIGN KEY([CitaID])
REFERENCES [dbo].[Citas] ([ID])
GO
ALTER TABLE [dbo].[Prescripciones]  WITH CHECK ADD FOREIGN KEY([MedicamentoID])
REFERENCES [dbo].[Medicamentos] ([ID])
GO
ALTER TABLE [dbo].[ResultadosLaboratorio]  WITH CHECK ADD FOREIGN KEY([LaboratorioID])
REFERENCES [dbo].[Laboratorios] ([ID])
GO
ALTER TABLE [dbo].[ResultadosLaboratorio]  WITH CHECK ADD FOREIGN KEY([MedicoID])
REFERENCES [dbo].[Medicos] ([ID])
GO
ALTER TABLE [dbo].[ResultadosLaboratorio]  WITH CHECK ADD FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([ID])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD CHECK  (([Genero]='F' OR [Genero]='M'))
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD CHECK  (([Genero]='F' OR [Genero]='M'))
GO
/****** Object:  StoredProcedure [dbo].[spActualizar_Paciente]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para Actualizar Información de un Paciente.
CREATE PROCEDURE [dbo].[spActualizar_Paciente]
    @ID INT,
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @FechaNacimiento DATE,
    @Genero CHAR(1),
    @Direccion VARCHAR(255),
    @Telefono VARCHAR(20),
    @Correo VARCHAR(100),
    @SeguroMedico VARCHAR(100),
    @NumeroSeguroSocial VARCHAR(20)
AS
BEGIN
    UPDATE Pacientes
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        FechaNacimiento = @FechaNacimiento,
        Genero = @Genero,
        Direccion = @Direccion,
        Telefono = @Telefono,
        Correo = @Correo,
        SeguroMedico = @SeguroMedico,
        NumeroSeguroSocial = @NumeroSeguroSocial
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_Medicos]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para Buscar Médicos por Nombre.
CREATE PROCEDURE [dbo].[spBuscar_Medicos]
    @NombreBuscado VARCHAR(100)
AS
BEGIN
    SELECT ID, Nombre, Apellido, Especialidad, Telefono, Correo
    FROM Medicos
    WHERE Nombre LIKE '%' + @NombreBuscado + '%' 
       OR Apellido LIKE '%' + @NombreBuscado + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_Pacientes]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscar_Pacientes]
    @NombreBuscado VARCHAR(100)
AS
BEGIN
    SELECT ID, Nombre, Apellido, FechaNacimiento, Genero, Direccion, Telefono, Correo, SeguroMedico, NumeroSeguroSocial
    FROM Pacientes
    WHERE Nombre LIKE '%' + @NombreBuscado + '%' 
       OR Apellido LIKE '%' + @NombreBuscado + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[spGenerar_Factura_Paciente]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para Generar una Factura para un Paciente.
CREATE PROCEDURE [dbo].[spGenerar_Factura_Paciente]
    @PacienteID INT,
    @Fecha DATETIME,
    @MontoTotal DECIMAL(10, 2),
    @Descripcion TEXT
AS
BEGIN
    INSERT INTO Facturas (PacienteID, Fecha, MontoTotal, Descripcion)
    VALUES (@PacienteID, @Fecha, @MontoTotal, @Descripcion);
END;
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_Nuevo_Paciente]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para Insertar un Nuevo Paciente.
CREATE PROCEDURE [dbo].[spInsertar_Nuevo_Paciente]
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @FechaNacimiento DATE,
    @Genero CHAR(1),
    @Direccion VARCHAR(255),
    @Telefono VARCHAR(20),
    @Correo VARCHAR(100),
    @SeguroMedico VARCHAR(100),
    @NumeroSeguroSocial VARCHAR(20)
AS
BEGIN
    INSERT INTO Pacientes (Nombre, Apellido, FechaNacimiento, Genero, Direccion, Telefono, Correo, SeguroMedico, NumeroSeguroSocial)
    VALUES (@Nombre, @Apellido, @FechaNacimiento, @Genero, @Direccion, @Telefono, @Correo, @SeguroMedico, @NumeroSeguroSocial);
END;
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_Prescripcion]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para Insertar una Prescripción.
CREATE PROCEDURE [dbo].[spInsertar_Prescripcion]
    @CitaID INT,
    @MedicamentoID INT,
    @Dosis VARCHAR(100),
    @Duracion INT,
    @Instrucciones TEXT
AS
BEGIN
    INSERT INTO Prescripciones (CitaID, MedicamentoID, Dosis, Duracion, Instrucciones)
    VALUES (@CitaID, @MedicamentoID, @Dosis, @Duracion, @Instrucciones);
END;
GO
/****** Object:  StoredProcedure [dbo].[spObtener_Pacientes_ConMasDeUna_Cita]    Script Date: 24/7/2024 6:44:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para Obtener Pacientes con Más de una Cita.
CREATE PROCEDURE [dbo].[spObtener_Pacientes_ConMasDeUna_Cita]
AS
BEGIN
    SELECT p.ID, p.Nombre, p.Apellido
    FROM Pacientes p
    JOIN Citas c ON p.ID = c.PacienteID
    GROUP BY p.ID, p.Nombre, p.Apellido
    HAVING COUNT(c.ID) > 1;
END;
GO
USE [master]
GO
ALTER DATABASE [Medicore] SET  READ_WRITE 
GO
