USE [Book Library]
GO
/****** Object:  StoredProcedure [dbo].[up_to_version_4]    Script Date: 1/17/2018 6:31:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[up_to_version_4]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- create a new table
	CREATE TABLE School(
	Sid INT NOT NULL PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Adresa varchar(50))
	
	print('up_to_version_4 - create table School')
END
