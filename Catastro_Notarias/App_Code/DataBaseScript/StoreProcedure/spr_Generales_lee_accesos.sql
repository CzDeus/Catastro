USE [db_Name]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_Generales_lee_accesos]
	-- Add the parameters for the stored procedure here

AS
	
BEGIN
	
	SELECT id_General_Acceso, orden, nombre_acceso
	FROM tb_Generales_Accesos
	ORDER BY orden

END