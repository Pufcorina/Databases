USE [Book Library]
GO
/****** Object:  UserDefinedFunction [dbo].[checkFormatDate]    Script Date: 1/17/2018 6:05:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[checkFormatDate]
(
	-- Add the parameters for the function here
	@date varchar(MAX)
)
RETURNS BIT
AS
BEGIN
	IF @date IS NULL
		RETURN 1
	IF LEN(@date) < 9 
		RETURN 0
	IF not SUBSTRING(@date,1,4) LIKE '%20[0-9][0-9]' 
	   RETURN 0
	IF not SUBSTRING(@date,6,1) LIKE '%[0-1]' 
	   RETURN 0

	IF SUBSTRING(@date,6,1) = '0'
	BEGIN
		IF NOT SUBSTRING(@date,7,1) LIKE '%[0-9]' 
		BEGIN
			RETURN 0
		END
	END
	ELSE
		IF not SUBSTRING(@date,7,1) LIKE '%[0-2]' 
		BEGIN
			RETURN 0
		END
	IF not SUBSTRING(@date,9,1) LIKE '%[0-3]' 
	   RETURN 0
	IF not SUBSTRING(@date,9,1) LIKE '3' 
	begin
		IF not SUBSTRING(@date,9,2) LIKE '%[0-2][0-9]' 
		RETURN 0
	end
	else
	begin
		IF not SUBSTRING(@date,10,1) LIKE '%[0-1]' 
			return 0
	end
	RETURN 1

END

