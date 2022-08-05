CREATE TABLE existing_proj_req (
    eprID int IDENTITY(1,1) PRIMARY KEY,
    proj_name varchar(100),
    proj_desc varchar(250),
    proposed_change varchar(250),
    justificatn varchar(250),
    reqmnts varchar(250),
    ini_name varchar(50),
    eprDate datetime not null default(getdate()),

);

Alter procedure usp_epr_details
(
    @proj_name varchar(100)=null,
    @proj_desc varchar(250)=null,
    @proposed_change varchar(250)=null,
    @justificatn varchar(250)=null,
    @reqmnts varchar(250)=null,
    @ini_name varchar(50)=null,
    @FileName varchar(50) =null,
    @ContentType nvarchar(200) =null,
    @Data varbinary(MAX) =null,
	@FileName2 varchar(50) =null,
    @ContentType2 nvarchar(200) =null,
    @Data2 varbinary(MAX) =null,
	@status varchar(15)  =null
)
as
begin
if @status='Insert' 
begin
declare @Existingpr_id int;
insert into existing_proj_req values (@proj_name, @proj_desc, @proposed_change, @justificatn, @reqmnts, @ini_name, getdate());
SET @Existingpr_id = @@Identity
insert into Tbl_Attachment values (@FileName, @ContentType, @Data, 1, @Existingpr_id)
insert into Tbl_Attachment values (@FileName2, @ContentType2, @Data2, 2, @Existingpr_id)
end
end


select * from new_proj_req

select * from Tbl_Req

select * from Tbl_Attachment

select * from Tbl_ImpactAssessment 

select * from Tbl_Project_Workflow 

select * from Tbl_Project_Workflow where ProjectId = 428

select * from Login_table
select * from Login_table where UserID = 171
select * from Login_table where FirstName = 'harshit' or FirstName = 'gouri' or FirstName = 'sanjiv kumar'
--update Tbl_Project_Workflow Set PendingWith=7 where WorkflowId=53


select * from Role_table

select * from TblWorkflowRole
select * from Tbl_Project_Workflow

select * from RoleMapping_table

update RoleMapping_table set RoleID=6 where RoleMappingID=10


--update  Tbl_Project_Workflow set PendingWith=8 ,ActionBy=null,Status='Pending' where WorkflowId=42
select * from RoleMapping_table where UserID in (3,5)

update RoleMapping_table Set RoleID=4 where RoleMappingID=8

-- query for status report table
select a.Newpr_id as projectID, a.ini_name, a.proj_name, a.proj_desc, a.nprDate, c.Username as Approver, b.roleCode, b.Status
from new_proj_req as a inner join Tbl_Project_Workflow as b on a.Newpr_id = b.ProjectId
inner join Login_table as c on b.PendingWith = c.UserID or b.ActionBy = c.UserID and b.Status = 'Complete'
select * from Tbl_Project_Workflow 

-- query for user report table
select a.Newpr_id as projectID, a.ini_name, a.proj_name, a.proj_desc, a.nprDate, c.Username as Approver, b.roleCode, b.Status
from new_proj_req as a inner join Tbl_Project_Workflow as b on a.Newpr_id = b.ProjectId
inner join Login_table as c on (b.PendingWith = c.UserID or b.ActionBy = c.UserID) and (b.PendingWith = 1424 or b.ActionBy = 1424)
select * from Tbl_Project_Workflow 

-- query for workflow table
select b.Username as ActionBy, a.ActionDateTime, a.RoleCode, a.Remarks, a.Status 
from Tbl_Project_Workflow as a inner join Login_table as b on a.ActionBy = b.UserID 
OR a.PendingWith = b.UserID
where a.ProjectId = 385


select lg.Username  from TblWorkflowRole as a INNER  JOIN RoleMapping_table as b on 
a.RoleId=b.RoleID INNER  JOIN Login_table as lg on lg.UserID=b.UserID 
where SequenceNo in (
select SequenceNo + 1 from TblWorkflowRole as a INNER  JOIN RoleMapping_table as b on 
a.RoleId=b.RoleID INNER  JOIN Login_table as lg on lg.UserID=b.UserID 
WHERE lg.UserNTLOGIN ='harshit.chaubey')


select * from TblWorkflowRole as a INNER  JOIN RoleMapping_table as b on 
a.RoleId=b.RoleID INNER  JOIN Login_table as lg on lg.UserID=b.UserID 

select lg.Username,* from TblWorkflowRole as a INNER  JOIN RoleMapping_table as b on 
a.RoleId=b.RoleID INNER  JOIN Login_table as lg on lg.UserID=b.UserID 



select * from RoleMapping_table 

update TblWorkflowRole set SequenceNo =2 where RoleId in (8,
9)


update TblWorkflowRole set SequenceNo =3 where RoleId in (10,
11)



----------------------------
Insert into Login_table_mainbkp(FirstName,LastName,Username,Passwrd,UserNTLOGIN,UserUPN,UserEmailID, Department,Location,Active)
select  FirstName,LastName,Empname,'',OsLoginId,User_Id_domain,Emailid,[Current Department],[Current Location],1
from effs2004..MstEmployee A where
[Current JobClass] in ('G2','G3','G4','G5','G6','G7','G8','G8','G9A','G9B',
'G10A','G10B','G10') and emp_left is null and [current country]='India' 
and [current Business Unit] <>'India Busines'

