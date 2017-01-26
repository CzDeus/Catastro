USE [db_Name]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spr_Generales_lee_accesos_por_usuario]
	-- Add the parameters for the stored procedure here
	(@id_General_Usuario as int, @ver_no_visualizar as bit, @sistema as nvarchar(2))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tb_Generales_Accesos_Usuarios.id_General_Acceso,
		(CASE WHEN @sistema='**' THEN '01' ELSE '' END) + SUBSTRING(orden,4, 11) as orden, 
		nombre_acceso, 
		url
	
	FROM tb_Generales_Accesos_Usuarios
	
	LEFT OUTER JOIN tb_Generales_Accesos ON tb_Generales_Accesos.id_General_Acceso = tb_Generales_Accesos_Usuarios.id_General_Acceso
	
	WHERE (@sistema='**' OR LEFT(orden,2) = @sistema AND LEN(RTRIM(SUBSTRING(orden,4,11)))>0) AND
		tb_Generales_Accesos_Usuarios.id_General_Usuario = @id_General_Usuario AND 
			tb_Generales_Accesos.id_General_Acceso<>0 AND
			url <> (SELECT CASE @ver_no_visualizar WHEN 'True' THEN '' ELSE 'NO VISUALIZAR' END) 
			
	ORDER BY tb_Generales_Accesos.orden
	
END