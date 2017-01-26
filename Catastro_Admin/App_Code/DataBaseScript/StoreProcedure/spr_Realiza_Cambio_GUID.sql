USE [db_Login]
GO
/****** Object:  StoredProcedure [dbo].[spr_Realiza_Cambio_GUI]    Script Date: 08/05/2016 14:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Realiza_Cambio_GUID]
	-- Add the parameters for the stored procedure here
	(@id_general_usuario as int, @guid as nvarchar(40))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE tb_Generales_Usuarios_Contraseñas SET GUID = @guid WHERE id_General_Usuario = @id_general_usuario;
END