USE [db_Name]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Valida_eliminar_usuario] 
	-- Add the parameters for the stored procedure here
	(@id_General_Usuario as int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 id_General_Usuario 
	
	FROM tb_Generales_Accesos_Usuarios 
	
	WHERE id_General_Usuario = @id_General_Usuario
END