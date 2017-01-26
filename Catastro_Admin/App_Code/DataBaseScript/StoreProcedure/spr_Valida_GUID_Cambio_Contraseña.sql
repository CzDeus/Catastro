USE [db_Login]
GO
/****** Object:  StoredProcedure [dbo].[spr_Valida_GUI_Cambio_Contraseña]    Script Date: 08/05/2016 13:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Valida_GUID_Cambio_Contraseña]
	-- Add the parameters for the stored procedure here
	(@id_general_usuario as int, @guid as nvarchar(40))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_General_Usuario FROM tb_Generales_Usuarios_Contraseñas WHERE id_General_Usuario = @id_general_usuario and GUID = @guid;
END