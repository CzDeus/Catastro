USE [db_Name]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spr_Generales_lee_usuarios_por_estatus]
	-- Add the parameters for the stored procedure here
	(@estatus as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_General_Usuario, nombre 
	
	FROM tb_Generales_Usuarios
	
	WHERE @estatus = 0 OR 
		estatus = @estatus
		
	UNION
	
	SELECT 0 as id_General_Usuario, ' Seleccione Usuario...'
	
	ORDER BY nombre
	
	
END
