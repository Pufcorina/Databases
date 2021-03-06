USE [Book Library]
GO
/****** Object:  UserDefinedFunction [dbo].[checkFormatCNP]    Script Date: 1/17/2018 6:05:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[checkFormatCNP]
(
	-- Add the parameters for the function here
	@cnp varchar(max)
)
RETURNS bit
AS
BEGIN
	if dbo.checkFormatNumber(@cnp) = 0
		return 0
	if len(@cnp) != 13
		return 0
	return 1

END
