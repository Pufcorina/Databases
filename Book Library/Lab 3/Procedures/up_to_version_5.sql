USE [Book Library]
GO
/****** Object:  StoredProcedure [dbo].[up_to_version_5]    Script Date: 1/17/2018 6:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[up_to_version_5]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--create a foreign key constraint
	ALTER TABLE Languages
	ADD CONSTRAINT fk_Languages FOREIGN KEY(CId) REFERENCES Clients(CId)
	print('up_to_version_5 - create a foreign key from Clienst (CID) in Languages table ')
END
