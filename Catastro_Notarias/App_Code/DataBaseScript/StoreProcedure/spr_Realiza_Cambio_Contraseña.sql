USE [db_NAME]
GO
/****** Object:  StoredProcedure [dbo].[spr_Valida_Bandera_Cambio_Contraseña]    Script Date: 08/03/2016 13:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Realiza_Cambio_Contraseña]
	-- Add the parameters for the stored procedure here
	(@id_general_usuario as int, @password as nvarchar(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE tb_Generales_Usuarios_Contraseñas 
	SET password = @password
	WHERE id_General_Usuario = @id_general_usuario

	SELECT
		nombre AS [Nombre_Usuario]
	FROM tb_Generales_Usuarios
	WHERE id_General_Usuario = @id_General_Usuario

END