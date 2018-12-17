USE [Book Library]
GO
/****** Object:  StoredProcedure [dbo].[down_to_version_4]    Script Date: 1/17/2018 6:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[down_to_version_4]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--remove a foreign key constraint
	ALTER TABLE Languages
	DROP CONSTRAINT fk_Languages
	print('down_to_version_4 - remove foreign key from Languages table')
END
