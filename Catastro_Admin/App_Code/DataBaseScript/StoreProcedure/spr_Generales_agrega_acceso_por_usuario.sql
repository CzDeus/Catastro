USE [db_Name]
GO
/****** Object:  StoredProcedure [dbo].[sp_Generales_agrega_acceso_por_usuario]    Script Date: 08/01/2016 10:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Generales_agrega_acceso_por_usuario]
	-- Add the parameters for the stored procedure here
	(@id_General_Usuario int,
	@id_General_Acceso int )
AS
	
BEGIN

	DECLARE @v_existe as int = (SELECT id_General_Acceso
								FROM tb_Generales_Accesos_Usuarios
								WHERE id_General_Usuario=@id_General_Usuario AND id_General_Acceso=@id_General_Acceso)

	if @v_existe is null OR @v_existe=0
		BEGIN
		
			INSERT INTO tb_Generales_Accesos_Usuarios (id_General_Usuario, id_General_Acceso)
			VALUES (@id_General_Usuario, @id_General_Acceso)
			
		END
	
END