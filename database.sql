--create database job_test2
create table Account(
 a_id nvarchar(5) primary key,
 username nvarchar(64) not null, [password] nvarchar(32) not null,
 [role] nvarchar(1) not null, email nvarchar(254) not null,
 Q1 nvarchar(50), ansQ1 nvarchar(50),
 Q2 nvarchar(50), ansQ2 nvarchar(50),
)
go
create table Manager(
m_id nvarchar(5) primary key, 
a_id nvarchar(5) references Account(a_id),
m_name nvarchar(100)
)
go
create table Employer(
e_id nvarchar(5) primary key,
e_name nvarchar(100) not null,
e_address nvarchar(95) not null,
e_phone nvarchar(10) not null, 
tax nvarchar(14) not null,
update_status bit,
a_id nvarchar(5) references Account(a_id),
)
go
create table Company(
com_id nvarchar(5) primary key,
com_name nvarchar(100) not null,
com_address nvarchar(95) not null,
com_phone nvarchar(11) not null, 
tax nvarchar(14) not null,
update_status bit,
a_id nvarchar(5) references Account(a_id),
)
create table Candidate(
c_id nvarchar(5) primary key,
c_name nvarchar(100) not null,
c_address nvarchar(95) not null,
c_phone nvarchar(11) not null, 
c_dob date,
tax nvarchar(14), 
a_id nvarchar(5) references Account(a_id),
)
go

create table AdsDetail(
adsD_id nvarchar(6) primary key,
ads_description text not null,
adflick_link text not null,
ads_status bit, update_status bit,
)
go
create table Ads(
ads_id nvarchar(6) primary key,
date_start date, date_end date,
ads_statistic nvarchar(max),
adsD_id nvarchar(6) references AdsDetail(adsD_id),
)
go
CREATE TABLE AdsLog(
adsD_id nvarchar(6) references AdsDetail(adsD_id),
update_date [date] NOT NULL,
close_date [date] NOT NULL,
AdsLog_descripstion TEXT,
)
go
CREATE TABLE PostDetail(
postD_id NVARCHAR(6),
job_name NVARCHAR(50),
[description] TEXT NOT NULL,
salary NVARCHAR(9) NOT NULL,
sector NVARCHAR(20) NOT NULL,
workingHours NVARCHAR(9) NOT NULL,
e_id NVARCHAR(5) references Employer(e_id) on delete set null ,
com_id NVARCHAR(5) references Company(com_id) on delete set null ,
contact_phone NVARCHAR(11) NOT NULL,
contact_address NVARCHAR(95) NOT NULL,
contact_email NVARCHAR(294) NOT NULL,
update_status BIT,
post_status BIT,
city NVARCHAR(17) NOT NULL,
PRIMARY KEY(postD_id)
)
GO
CREATE TABLE Post(
post_id NVARCHAR(5) NOT NULL,
date_start [date] NOT NULL,
date_end [date],

postD_id nvarchar(6) REFERENCES PostDetail(postD_id)
PRIMARY KEY(post_id),
)
GO

CREATE TABLE Feedback(
f_id NVARCHAR(5) NOT NULL,
c_id nvarchar(5) REFERENCES Candidate(c_id),
post_id nvarchar(5) REFERENCES Post(post_id),
fb_detail TEXT NOT NULL,
fb_date [date] NOT NULL,
PRIMARY KEY(f_id)

)
GO
CREATE TABLE PostLog(
postD_id nvarchar(6) REFERENCES PostDetail(postD_id),
update_date [date] NOT NULL,
close_date [date] NOT NULL,
PostLog_descripstion TEXT,

)
create table CV(
cv_id nvarchar(6) primary key,
[name] nvarchar(100), dob date,
gender nvarchar(6) not null,
email nvarchar(254) not null,
phone nvarchar(10) not null,
cv_link text not null,
c_id nvarchar(5) references Candidate(c_id),
post_id nvarchar(5) REFERENCES Post(post_id)
)
go
GO
create table AdsManagement(
	m_id nvarchar(5) references Manager(m_id),
	ads_id nvarchar(6) references Ads(ads_id)
)
GO

--insert data

--set role: 0 is admin
--1 is emp/com
--2 is can
--set account id: 0001 - 999 is admin
--1000 - 4999 is emp/com
--5000 - 9999 is candidate
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A0001',N'admin01',N'a66abb5684c45962d887564f08346e8d',0,N'admin123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A0002',N'admin02',N'a66abb5684c45962d887564f08346e8d',0,N'admin123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A0003',N'admin03',N'a66abb5684c45962d887564f08346e8d',0,N'admin123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A0004',N'admin04',N'a66abb5684c45962d887564f08346e8d',0,N'admin123@gmail.com',null,null,null,null)
go

--com/emp
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1001',N'employer01',N'8b142fed5db4c25c2574e5f4b22621ee',1,N'emp123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1002',N'employer02',N'8b142fed5db4c25c2574e5f4b22621ee',1,N'emp123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1003',N'employer03',N'8b142fed5db4c25c2574e5f4b22621ee',1,N'emp123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1004',N'employer04',N'8b142fed5db4c25c2574e5f4b22621ee',1,N'emp123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1005',N'employer05',N'8b142fed5db4c25c2574e5f4b22621ee',1,N'emp123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1006',N'company01',N'fb94a2c123cdf3e9e42691471bfea19d',1,N'com123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1007',N'company02',N'fb94a2c123cdf3e9e42691471bfea19d',1,N'com123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1008',N'company03',N'fb94a2c123cdf3e9e42691471bfea19d',1,N'com123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1009',N'company04',N'fb94a2c123cdf3e9e42691471bfea19d',1,N'com123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A1010',N'company05',N'fb94a2c123cdf3e9e42691471bfea19d',1,N'com123@gmail.com',null,null,null,null)
go

--candidate
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5001',N'candidate01',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5002',N'candidate02',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5003',N'candidate03',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5004',N'candidate04',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5005',N'candidate05',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5006',N'candidate06',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5007',N'candidate07',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5008',N'candidate08',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5009',N'candidate09',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go
insert into [dbo].[Account]([a_id],[username],[password],[role],[email],[Q1],[ansQ1],[Q2],[ansQ2]) values 
(N'A5010',N'candidate10',N'2b8d8ca9cb1534060c1d82352e3ec709',2,N'can123@gmail.com',null,null,null,null)
go

--insert admin
insert into [dbo].[Manager]([m_id],[a_id],[m_name]) values 
(N'M0001',N'A0001',N'Admin1')
go
insert into [dbo].[Manager]([m_id],[a_id],[m_name]) values 
(N'M0002',N'A0002',N'Admin2')
go
insert into [dbo].[Manager]([m_id],[a_id],[m_name]) values 
(N'M0003',N'A0003',N'Admin3')
go
insert into [dbo].[Manager]([m_id],[a_id],[m_name]) values 
(N'M0004',N'A0004',N'Admin4')
go

--insert emp/com
insert into [dbo].[Employer]([e_id],[e_name],[e_address],[e_phone],[tax],[update_status],[a_id]) values
(N'E0001',N'Pham Hai Dang', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0989456789', N'8300123412', 1,N'A1001')
go
insert into [dbo].[Employer]([e_id],[e_name],[e_address],[e_phone],[tax],[update_status],[a_id]) values
(N'E0002',N'Pham Nam Khanh', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0787456788', N'8300123452', 1,N'A1002')
go
insert into [dbo].[Employer]([e_id],[e_name],[e_address],[e_phone],[tax],[update_status],[a_id]) values
(N'E0003',N'Nguyen Quang Sang', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0787456787', N'8300123432', 1,N'A1003')
go
insert into [dbo].[Employer]([e_id],[e_name],[e_address],[e_phone],[tax],[update_status],[a_id]) values
(N'E0004',N'Nguyen Tran Tuan Minh', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0374456786', N'8300123414', 1,N'A1004')
go
insert into [dbo].[Employer]([e_id],[e_name],[e_address],[e_phone],[tax],[update_status],[a_id]) values
(N'E0005',N'Nguyen Van Hoai', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0983456785', N'8300123472', 1,N'A1005')
go
insert into [dbo].[Employer]([e_id],[e_name],[e_address],[e_phone],[tax],[update_status],[a_id]) values
(N'C0001',N'Nguyen Minh Truong', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0987456783', N'8300123462', 1,N'A1006')
go
insert into [dbo].[Company]([com_id],[com_name],[com_address],[com_phone],[tax],[update_status],[a_id]) values
(N'C0002',N'Dai hoc FPT', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0939456784', N'8300123418', 1,N'A1007')
go
insert into [dbo].[Company]([com_id],[com_name],[com_address],[com_phone],[tax],[update_status],[a_id]) values
(N'C0003',N'FPT Software', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0798456784', N'8300123597', 1,N'A1008')
go
insert into [dbo].[Company]([com_id],[com_name],[com_address],[com_phone],[tax],[update_status],[a_id]) values
(N'C0004',N'FPT Shop', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0732456784', N'8300123442', 1,N'A1009')
go
insert into [dbo].[Company]([com_id],[com_name],[com_address],[com_phone],[tax],[update_status],[a_id]) values
(N'C0005',N'Nha thuoc Long Chau', N'600 Nguyen Van Cu Noi Dai, An Binh, Can Tho', N'0732456784', N'8300124568', 1,N'A1010')
go

--insert candidate

insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0001',N'Pham Van A', N'46TVN AT BT CT', 0907944576,N'2003/03/03',N'8302134567',N'A5001'
)
go
insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0002',N'Pham Van B', N'46TVN AT BT CT', 0907123456,N'2003/03/03',N'8302134127',N'A5002'
)
go
insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0003',N'Pham Van C', N'46TVN AT BT CT', 0907123458,N'2003/03/03',N'8302142567',N'A5003'
)
go
insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0004',N'Pham Van D', N'46TVN AT BT CT', 0907944987,N'2003/03/03',N'833414567',N'A5004'
)
go
insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0005',N'Pham Van E', N'46TVN AT BT CT', 0907947896,N'2003/03/03',N'8302134317',N'A5005'
)
go
insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0006',N'Pham Van F', N'46TVN AT BT CT', 0907945426,N'2003/03/03',N'8302176467',N'A5006'
)
go
insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0007',N'Pham Van G', N'46TVN AT BT CT', 0907943754,N'2003/03/03',N'8302172467',N'A5007'
)
go
insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0008',N'Pham Van H', N'46TVN AT BT CT', 0907941467,N'2003/03/03',N'8307315567',N'A5008'
)
go
insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0009',N'Pham Van I', N'46TVN AT BT CT', 090797246,N'2003/03/03',N'8302175467',N'A5009'
)
go
insert into [dbo].[Candidate]([c_id],[c_name],[c_address],[c_phone],[c_dob],[tax],[a_id]) values (
N'U0010',N'Pham Van J', N'46TVN AT BT CT', 0907941426,N'2003/03/03',N'830211475',N'A5010'
)
go

-- insert Post/PostDetail
go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0001',N'Tim Giup Viec Nha',N'tim nu 18 tuoi de giup viec nha',N'Negosiate',N'dich vu',N'part time',N'E0001',null,N'0125467829',N'164 Ninh Kieu, Binh Thuy',N'Truonce170033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0001',N'PD0001','2022-06-15','2022-09-15')
	 go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0002',N'Tim Giup Viec Nha',N'tim nu 20 tuoi de giup viec nha',N'Negosiate',N'dich vu',N'part time',N'E0002',null,N'0125467729',N'165 Ninh Kieu, Binh Thuy',N'Truonce70033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0002',N'PD0002','2022-05-15','2022-09-15')
	 go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0003',N'Tim Giup Viec Nha',N'tim nam 20 tuoi de giup viec nha',N'Negosiate',N'dich vu',N'part time',N'E0003',null,N'0125467728',N'65 Ninh Kieu, Binh Thuy',N'Truonce0033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0003',N'PD0003','2022-05-5','2022-08-15')
	 go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0004',N'Tim Giup Giao Hang',N'tim nam 20 tuoi de giup viec nha',N'Negosiate',N'dich vu',N'part time',N'E0004',null,N'0125467728',N'5 Ninh Kieu, Binh Thuy',N'Truonce1033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0004',N'PD0004','2022-07-5','2022-10-15')
	 go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0005',N'Tim Giup don nha',N'tim nam 20 tuoi de giup viec nha',N'Negosiate',N'dich vu',N'part time',N'E0005',null,N'0425467728',N'65 An Cu, Binh Thuy',N'Trunce10033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0005',N'PD0005','2023-05-5','2022-08-15')
	 go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0006',N'Tim Giup Cham Vuon',N'tim nam 20 - 24 tuoi de giup viec nha',N'Negosiate',N'dich vu',N'part time',N'E0005',null,N'0125467738',N'6 An Cu, Binh Thuy',N'Tuonce10033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0006',N'PD0006','2023-06-5','2022-08-15')
	 go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0007',N'Tim Nguoi Ban Hang',N'tim nam, nu 20 tuoi de ban hang',N'Negosiate',N'dich vu',N'part time',null,N'C0004',N'0125467728',N'64 Ninh Kieu, Binh Thuy',N'Truonce10033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0007',N'PD0007','2022-05-5','2022-09-15')
	 go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0008',N'Tim Nguoi Ban Hang',N'tim nu 20 tuoi de ban hang',N'Negosiate',N'dich vu',N'part time',null,N'C0002',N'0125447728',N'6 Ninh Kieu, Binh Thuy',N'Khanh10033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0008',N'PD0008','2023-05-5','2023-09-15')
	 go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0009',N'Tim Nguoi Ban Hang',N'tim nam 20 tuoi de ban hang',N'Negosiate',N'dich vu',N'part time',null,N'C0003',N'0145467728',N'4 Ninh Kieu, Binh Thuy',N'Khanh10033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0009',N'PD0009','2023-04-5','2023-09-15')
	 go
INSERT INTO [dbo].[PostDetail]([postD_id],[job_name],[description],[salary],[sector],[workingHours],[e_id],[com_id],[contact_phone],[contact_address],[contact_email],[update_status],[post_status],[city])
     VALUES(N'PD0010',N'Tim Nguoi Ban Hang Toan Thoi Gian',N'tim nam 20 tuoi de ban hang',N'Negosiate',N'dich vu',N'part time',null,N'C0004',N'0145567728',N'46 Ninh Kieu, Binh Thuy',N'Khanh10033@fpt.edu.vn',N'0',N'0',N'Can Tho')
	 go
	  INSERT INTO [dbo].[Post]([post_id],[postD_id],[date_start],[date_end])
     VALUES(N'P0010',N'PD0010',N'2023-04-5',N'2023-12-15')
	 go
	 -- insert PostLog
	  go
	  INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0001','2022-06-15','2022-09-15',null)
	 go
	 INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0002','2022-05-15','2022-09-15',null)
	 go
	 INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0003','2022-05-5','2022-08-15',null)
	 go
	 INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0004','2022-07-5','2022-10-15',null)
	 go
	  INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0005','2023-05-5','2022-08-15',null)
	 go
	 INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0006','2023-06-5','2022-08-15',null)
	 go
	 INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0007','2022-05-5','2022-09-15',null)
	 go
	 INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0008','2023-05-5','2023-09-15',null)
	 go
	 INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0009','2023-04-5','2023-09-15',null)
	 go
	 INSERT INTO [dbo].[PostLog]([postD_id],[update_date],[close_date],[PostLog_descripstion])
     VALUES(N'PD0010','2023-04-5','2023-12-15',null)
	 go
	 -- insert ADS/ADSDetail

      go
	 INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0001',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go
	  INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0002',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go
	  INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0003',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go
	  INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0004',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go
	  INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0005',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go
	  INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0006',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go
	  INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0007',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go
	  INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0008',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go
	 	  INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0009',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go
	  INSERT INTO [dbo].[AdsDetail]([adsD_id],[ads_description],[adflick_link],[ads_status],[update_status])
     VALUES(N'AD0010',N'F88',N'https://drive.google.com/drive/u/0/my-drive',N'0',N'0')
	 go

	 INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0001',N'AD0001','2022-05-5','2022-07-5',N'10000000')
	 go
	  INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0002',N'AD0002','2022-07-6','2022-09-5',N'20000000')
	 go
	  INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0003',N'AD0003','2022-09-6','2022-09-25',N'1000000')
	 go
	  INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0004',N'AD0004','2022-09-26','2022-10-25',N'20000000')
	 go
	  INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0005',N'AD0005','2022-10-26','2022-11-25',N'20000000')
	 go
	   INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0006',N'AD0006','2022-12-26','2023-01-25',N'30000000')
	 go
	INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0007',N'AD0007','2022-1-26','2023-02-25',N'30040000')
	 go
	INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0008',N'AD0008','2022-2-26','2023-03-25',N'30040000')
	 go
	 	INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0009',N'AD0009','2022-3-26','2023-04-25',N'40040000')
	 go
 	INSERT INTO [dbo].[Ads]([ads_id],[adsD_id],[date_start],[date_end],[ads_statistic])
     VALUES(N'A0010',N'AD0010','2022-4-26','2023-7-25',N'60040000')
	 go
	 --insert ADSLog

	 	  go
	  INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0001','2022-05-5','2022-07-5',null)
	 go
	 INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0002','2022-07-6','2022-09-5',null)
	 go
	  INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0003','2022-09-6','2022-09-25',null)
	 go
	 INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0004','2022-09-26','2022-10-25',null)
	 go
	   INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0005','2022-10-26','2022-11-25',null)
	 go
	  INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0006','2022-12-26','2023-01-25',null)
	 go
	 INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0007','2022-1-26','2023-02-25',null)
	 go
	 INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0008','2022-2-26','2023-03-25',null)
	 go
	  INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0009','2022-3-26','2023-04-25',null)
	 go
	 INSERT INTO [dbo].[AdsLog]([adsD_id],[update_date],[close_date],[AdsLog_descripstion])
     VALUES(N'AD0010','2022-4-26','2023-7-25',null)
	 

	 --insert fB
	 go
	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0001',N'P0001',N'U0001','2022-05-8',N'Good Job')
	 go
	 	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0002',N'P0002',N'U0002','2022-07-7',N'Good Job')
	 go
	 
	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0003',N'P0003',N'U0004','2022-08-05',N'Good Job')
	 go
	 	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0004',N'P0004',N'U0005','2022-07-7',N'Good Job')
	 go
	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0005',N'P0005',N'U0006','2023-05-9',N'Good Job')
	 go
	 	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0006',N'P0006',N'U0003','2022-08-10',N'Good Job')
	 go
	 
	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0007',N'P0007',N'U0010','2022-08-15',N'Good Job')
	 go
	 	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0008',N'P0008',N'U0009','2023-09-8',N'Good Job')
	 go
	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0009',N'P0009',N'U0001','2023-09-1',N'Good Job')
	 go
	 	  INSERT INTO [dbo].[Feedback]([f_id],[post_id],[c_id],[fb_date],[fb_detail])
     VALUES(N'F0010',N'P0010',N'U0009','2023-04-6',N'Good Job')
	 go
	 insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0001')
	 go
	  insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0002')
	 go
	  insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0003')
	 go
 insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0004')
	 go
 insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0005')
	 go
 insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0006')
	 go
 insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0007')
	 go
 insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0008')
	 go
 insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0009')
	 go
 insert into [dbo].[AdsManagement]([m_id],[ads_id]) values (N'M0001',N'A0010')
	 go

	 
--insert cv data
insert into [dbo].[CV]([cv_id],[c_id],[post_id],[name],[dob],[gender],[email],[phone],[cv_link]) values
(N'CV0001', N'U0001',N'P0001',N'Pham Nam Khanh', N'2003/03/31', N'Male',N'khanhpnce170161@fpt.edu.vn', N'0907944576',N'https://cv.fullstack.edu.vn/')
go
insert into [dbo].[CV]([cv_id],[c_id],[post_id],[name],[dob],[gender],[email],[phone],[cv_link]) values
(N'CV0002', N'U0002',N'P0002',N'Pham Van B', N'1998/03/21', N'Male',N'hoainv@gmail.com', N'0907942456',N'https://cv.fullstack.edu.vn/')
go
insert into [dbo].[CV]([cv_id],[c_id],[post_id],[name],[dob],[gender],[email],[phone],[cv_link]) values
(N'CV0003', N'U0003',N'P0003',N'Pham Van C', N'1986/03/11', N'Male',N'minhntm@gmail.com', N'090791236',N'https://cv.fullstack.edu.vn/')
go
insert into [dbo].[CV]([cv_id],[c_id],[post_id],[name],[dob],[gender],[email],[phone],[cv_link]) values
(N'CV0004', N'U0004',N'P0004',N'Pham Van E', N'2001/04/12', N'Male',N'case01@gmail.com', N'0907944576',N'https://cv.fullstack.edu.vn/')
go
insert into [dbo].[CV]([cv_id],[c_id],[post_id],[name],[dob],[gender],[email],[phone],[cv_link]) values
(N'CV0005', N'U0005',N'P0005',N'Pham Van F', N'1999/07/16', N'Male',N'case02@gmail.com', N'0907944576',N'https://cv.fullstack.edu.vn/')
go
