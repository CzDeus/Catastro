create database db_Name;
use db_Name;

create table tb_Generales_Accesos(
	id_General_Acceso int identity not null,
	funcion nchar(5),
	orden nchar(15),
	nombre_acceso nchar(50),
	imagen_acceso nchar(50),
	url nchar(100),
	nombre_sistema nchar(20),
	constraint PK_tbGeneralesAccesos_idGeneralAcceso primary key(id_General_Acceso)
);

create table tb_Generales_Usuarios(
	id_General_Usuario int identity not null,
	nombre nvarchar(30) not null,
	estatus int not null,
	correo nvarchar(30),
	constraint PK_tbGeneralesUsuarios_idGeneralUsuario primary key(id_General_Usuario)
);

create table tb_Generales_Usuarios_Contraseñas(
	id_General_Usuario_Contraseña int identity not null,
	id_General_Usuario int not null,
	password nvarchar(10) not null,
	GUID nvarchar(40),
	constraint PK_tbGeneralesUsuariosContraseñas_idGeneralUsuarioContraseña primary key(id_General_Usuario_Contraseña)
);

create table tb_Generales_Accesos_Usuarios(
	id_General_Acceso_Usuario int identity not null,
	id_General_Usuario int not null,
	id_General_Acceso int not null,
	constraint PK_tbGeneralesAccesosUsuarios_idGeneralAccesoUsuario primary key(id_General_Acceso_Usuario)
);