USE [Book Library]
GO
/****** Object:  StoredProcedure [dbo].[insert_rows]    Script Date: 1/17/2018 6:26:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[insert_rows] 
	-- Add the parameters for the stored procedure here
	@nb_of_rows varchar(30),
	@table_name varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @table varchar(100)
	set @table = ('[' + @table_name + ']')

	if @table_name = 'ClientGroups' or @table_name = 'Clients'
	begin
		DBCC CHECKIDENT (@table, RESEED, 0);
	end

    -- Insert statements for procedure here
	if ISNUMERIC(@nb_of_rows) != 1
	BEGIN
		print('Not a number')
		return 1 
	END
	
	SET @nb_of_rows = cast(@nb_of_rows as INT)

	declare @contor int
	set @contor = 1

	declare @client_code varchar(6)
	declare @first_name varchar(50)
	declare @second_name varchar(50)
	declare @cnp varchar(14)
	set @cnp = '204893274320'
	declare @ci varchar(10)
	set @ci = 'XB'
	declare @ci_serie varchar(10)
	declare @adress varchar(100)
	set @adress = 'economica 2'
	declare @city varchar(50)
	set @city = 'Cluj-Napoca'
	declare @district varchar(50)
	set @district = 'Cluj'
	declare @phone varchar(20)
	set @phone = '0752610817'
	declare @email varchar(50)
	set @email = 'taie@scs.csubb.ro'
	declare @registration_date date
	set @registration_date = GETDATE()
	declare @cgid int
	declare @active bit
	set @active = 1
	declare @mentions varchar(200)

	declare @client_group_name varchar(30)

	declare @bid varchar(30)
	set @bid = 1
	declare @cid varchar(30)
	declare @loan_date date
	declare @due_date date
	declare @mentions_loan varchar(30)

	while @contor <= @nb_of_rows
	begin
		if @table_name = 'ClientGroups'
		begin
			set @client_group_name = 'Class' + convert(varchar(7), (@contor+10000))
			insert into ClientGroups (ClientGroupName) values (@client_group_name)
		end
		
		if @table_name = 'Clients'
		begin
			set @client_code = convert(varchar(7), (@contor + 10000))
			set @first_name = 'first name' + convert(varchar(7), @contor)
			set @second_name = 'second name' + convert(varchar(7), @contor)
			set @ci_serie = convert(varchar(7), @contor)
			set @cgid = (select max(CGId) from ClientGroups) - @contor + 1
			set @mentions = 'client' + convert(varchar(7), @contor)
			insert into Clients(ClientCode, FirstName, SecondName, CNP, CI_Serie, CI, Adress, City, District, Phone, Email, RegistrationDate, CGId, Active, Mentions) values (@client_code, @first_name, @second_name, @cnp, @ci_serie, @ci, @adress, @city, @district, @phone, @email, @registration_date, @cgid, @active, @mentions)
		end
		if @table_name = 'Loans'
		begin
			set @cid = (select max(CId) from Clients) - @contor + 1
			set @loan_date = GETDATE()
			set @due_date = GETDATE() + 10
			set @mentions_loan = 'loan' + convert(varchar(7), @contor)
			insert into Loans (BId, CId, LoanDate, DueDate, Mentions) values (@bid, @cid, @loan_date, @due_date, @mentions_loan)
		end

		set @contor = @contor + 1
	end
	
END
