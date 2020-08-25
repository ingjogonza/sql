-- Función que convierte una fecha en formato juliano 
USE [YOUR_DATABASE_NAME]
GO

/****** Object:  UserDefinedFunction [dbo].[CONVERTIR_FECHA_JULIANA_A_GREGORIANA]    Script Date: 25/08/2020 18:31:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Jorge González>
-- Create date: <12/08/2020>
-- Description:	<Convierte una fecha juliana que viene en string a un string con fecha gregoriana>
-- =============================================
CREATE FUNCTION [dbo].[CONVERTIR_FECHA_JULIANA_A_GREGORIANA] 
(
	-- Add the parameters for the function here
	@fechajuliana VARCHAR(7)
)
RETURNS VARCHAR(10)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @fechagregoriana varchar(10)

	-- Add the T-SQL statements to compute the return value here
	SELECT @fechagregoriana = convert(nvarchar,(DateAdd (day, CAST(@fechajuliana as int)-1000*(CAST(@fechajuliana as int)/1000), convert(datetime, 'Jan 1 ' + str(CAST(@fechajuliana as int)/1000)))),112)

	-- Return the result of the function
	RETURN @fechagregoriana

END
GO

