USE [db_Name]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Generales_Cambia_Variable_Contraseña]
	-- Add the parameters for the stored procedure here
	(@id_usuario as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Usuarios_Contraseña
	
		SET cambiar_password = 'True'
	
	WHERE id_usuario = @id_usuario
	
END