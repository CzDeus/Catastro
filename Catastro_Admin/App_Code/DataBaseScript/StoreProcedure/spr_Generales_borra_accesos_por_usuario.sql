USE [db_Name]
GO
/****** Object:  StoredProcedure [dbo].[sp_Generales_borra_accesos_por_usuario]    Script Date: 08/01/2016 10:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Generales_borra_accesos_por_usuario]
	-- Add the parameters for the stored procedure here
	(@id_General_Usuario int )
AS
	
BEGIN

	DELETE FROM tb_Generales_Accesos_Usuarios 
	
	WHERE (id_General_Usuario = @id_General_Usuario)

END