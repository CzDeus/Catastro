USE [db_Login]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Valida_Correo]
	-- Add the parameters for the stored procedure here
	(@correo as nvarchar(30))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_General_Usuario FROM tb_Generales_Usuarios WHERE correo = @correo;
END