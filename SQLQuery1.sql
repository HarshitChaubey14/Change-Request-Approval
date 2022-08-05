
CREATE TABLE Login_table (
    UserID int IDENTITY(1,1) PRIMARY KEY,
    Username varchar(100),
    Passwrd varchar(100),
    UserNTLOGIN varchar(100),
    UserUPN varchar(100),
    UserEmailID varchar(100),
    Department varchar(100),
    Location varchar(100),
    Active bit
);

select * from Login_table
select * from Role_table
select * from RoleMapping_table

INSERT INTO Login_table VALUES ( 'harshit chaubey', '12345', 'harshit.chaubey','harshit chaubey','harshit@gmail.com','IT','jogeshwari',1 )
INSERT INTO Login_table VALUES ( 'dev jain', '12345', 'dev.jain','dev jain','dev@gmail.com','finance','jogeshwari',1 )
INSERT INTO Login_table VALUES ( 'naman ag', '12345', 'naman.ag','naman ag','naman@gmail.com','HR','jogeshwari',1 )
INSERT INTO Login_table VALUES ( 'Sanjiv Jain', '12345', 'Sanjiv.Jain','Sanjiv Jain','sanjiv@gmail.com','HR','jogeshwari',1 )
INSERT INTO Login_table VALUES ( 'Gauri Prasad', '12345', 'Gauri.Prasad','Gauri Prasad','gauri@gmail.com','HR','jogeshwari',1 )

-----------------------------------------------------------------
CREATE TABLE Role_table (
    RoleID int IDENTITY(1,1) PRIMARY KEY,
    RoleDesc varchar(100)
);

INSERT INTO Role_table VALUES ( 'developer' )
-----------------------------------------------------------------

CREATE TABLE RoleMapping_table (
    RoleMappingID int IDENTITY(1,1) PRIMARY KEY,
    UserID int,
    RoleID int
);

INSERT INTO RoleMapping_table VALUES ( 1,1 )
INSERT INTO RoleMapping_table VALUES ( 1,3 )
INSERT INTO RoleMapping_table VALUES ( 2,1 )
INSERT INTO RoleMapping_table VALUES ( 3,2 )
INSERT INTO RoleMapping_table VALUES ( 4,5 )
INSERT INTO RoleMapping_table VALUES ( 5,5 )


-----------------------------------------------------------------------------
create procedure loginMatch @username varchar(100), @password varchar(100)
AS
Select * from Login_table where Username=@username and Passwrd=@password


create function ufn_GetRoleName 
(  
   @RoleID int
)  
returns nvarchar(100)
as  
begin
   declare @rolename nvarchar(100)
   select @rolename=roledesc from Role_table where roleid=@RoleID
return @rolename  
end


alter function ufn_GetRoleName2
(  
   @UserID int
)  
returns nvarchar(100)
as  
begin
   declare @username nvarchar(100)
   select @username=username from login_table where userid=@UserID
return @username  
end


ALTER TABLE RoleMapping_table
ADD CONSTRAINT FK_RoleMapping
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);