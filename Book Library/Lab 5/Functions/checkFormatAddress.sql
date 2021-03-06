USE [Book Library]
GO
/****** Object:  UserDefinedFunction [dbo].[checkFormatAddress]    Script Date: 1/17/2018 6:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[checkFormatAddress] 
(
	-- Add the parameters for the function here
	@address varchar(MAX)
)
RETURNS BIT
AS
BEGIN
	IF @address IS NULL
		RETURN 1
	IF LTRIM(@address) = ''
		return 0
	IF LEN(@address) < 3 
		RETURN 0

	declare @lungime int
	set @lungime = LEN(@address)

	declare @contor int
	set @contor = 1

	declare @substrin varchar(MAX)
	declare @car char

	while @contor <= @lungime
	begin
		if not SUBSTRING(@address, @contor, 1) like '%[a-zA-Z ,0-9]'
			return 0

		set @contor = @contor + 1
	end
	return 1
END
