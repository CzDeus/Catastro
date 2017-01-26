USE [db_Name]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Generales_lee_accesos_por_usuario_catalogo]
	-- Add the parameters for the stored procedure here
	(@id_General_Usuario int)
AS
	
BEGIN

	SELECT tb_Generales_Accesos_Usuarios.id_General_Acceso, orden, nombre_acceso, url
	
	FROM tb_Generales_Accesos_Usuarios 
	
	LEFT OUTER JOIN tb_Generales_Accesos ON tb_Generales_Accesos.id_General_Acceso = tb_Generales_Accesos_Usuarios.id_General_Acceso
	
	WHERE tb_Generales_Accesos_Usuarios.id_General_Usuario = @id_General_Usuario AND 
			tb_Generales_Accesos.id_General_Acceso<>0 AND
			url <> '' 			
			
	ORDER BY tb_Generales_Accesos.orden

END