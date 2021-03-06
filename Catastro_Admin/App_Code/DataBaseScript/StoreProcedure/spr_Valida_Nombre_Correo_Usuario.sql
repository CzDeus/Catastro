USE [db_Name]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spr_Valida_Nombre_Correo_Usuario]
	-- Add the parameters for the stored procedure here
(@id_general_usuario as int, @nombre_usuario as nvarchar(30), @correo_usuario as nvarchar(30))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
   DECLARE @existe_usuario as int = 
		(SELECT TOP 1 id_General_Usuario
		FROM tb_Generales_Usuarios
		WHERE id_general_usuario<>@id_general_usuario AND nombre = @nombre_usuario)
	
	DECLARE @existe_correo as int =
		(SELECT TOP 1 id_General_Usuario
		FROM tb_Generales_Usuarios
		WHERE id_general_usuario<>@id_general_usuario AND correo = @correo_usuario)

	if (@existe_usuario is not null AND @existe_usuario > 0 )
		BEGIN
			SELECT 1 as Columna
		END
	
	else
	
		BEGIN
			if (@existe_correo is not null AND @existe_correo > 0 )
				BEGIN
					SELECT 2 as Columna
				END
		END
END