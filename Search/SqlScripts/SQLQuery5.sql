alter procedure USP_Tbl_Bank
	@Query varchar(20) ='',
	@Search varchar(20)=''
as
begin
	if(@Query='Read')
		begin
			select * from Tbl_Bank
		end
	if(@Query='Search')
		begin
			select * from Tbl_Bank where [Name] like concat(@Search,'%')  
		end
end