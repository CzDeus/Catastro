USE [db_Name]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spr_Valida_Acceso_Sistema]
	-- Add the parameters for the stored procedure here
	(@nombre_usuario as nvarchar(30), @password as nvarchar(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT tb_Generales_Usuarios.id_General_Usuario, 
		tb_Generales_Usuarios.nombre as nombre
	
	FROM tb_Generales_Usuarios, tb_Generales_Usuarios_Contraseñas
	
	WHERE nombre = @nombre_usuario AND
		password = @password

END