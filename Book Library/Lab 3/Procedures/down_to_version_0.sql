USE [Book Library]
GO
/****** Object:  StoredProcedure [dbo].[down_to_version_0]    Script Date: 1/17/2018 6:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[down_to_version_0]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- modify the type of a column
	ALTER TABLE Clients
	ALTER COLUMN ClientCode int NOT NULL
	print('down_to_version_0 - modify column ClientCode back from varchar(6) to int')
END
