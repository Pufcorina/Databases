USE [Book Library]
GO
/****** Object:  StoredProcedure [dbo].[up_to_version_3]    Script Date: 1/17/2018 6:31:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[up_to_version_3]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- add a default constraint
	ALTER TABLE Clients
	ADD CONSTRAINT city_Cluj DEFAULT 'Cluj' FOR City
	print('up_to_version_3 - set the default value Cluj for each new entry City column')
END
