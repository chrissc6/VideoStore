use master;
go
--after 1st run uncomment alter statement
alter database VideoStore set single_user with rollback immediate
go
drop database if exists VideoStore;
go
create database VideoStore;
go
use VideoStore;
go

-- create tables

create table Customer(
ID int not null primary key identity(1,1),
Name nvarchar(30),
Address nvarchar(30) not null default 'NONE',
Phone nvarchar(12),
DateAdded datetime,
TotalRentals decimal(11,2),
TotalSpent decimal(11,2)
);
go

insert into Customer
(Name,Address,Phone,DateAdded,TotalRentals,TotalSpent)
values
('Chris','123 Address','937-555-0000','2019-01-27',0,0),
('Customer2','456 Address','513-555-0000','2019-01-27',0,0)
go

select * from Customer
go



create table Movies (
ID int not null primary key identity(1,1),
Name nvarchar(30),
Price decimal(5,2),
Unit nvarchar(10) not null default 'Each',
Genre nvarchar(30),
Released nvarchar(11),
Rating nvarchar(5),
RunTime nvarchar(10)
);
go


insert into Movies
(Name,Price,Genre,Released,Rating,RunTime)
values
('The Matrix', 1.99,'Action Sci-Fi','1999-03-31','R','2h 12min'),
('TRON',1.99,'Action Adventure Sci-Fi','1982-07-09','PG','1h 36min'),
('TRON Legacy',3,'Action Adventure Fantasy','2010-12-17','PG','2h 5min'),
('Flatland 2',1,'Animation Family Sci-Fi','2012-05-01','NONE','0h 36min'),
('Source Code',2,'Sci-Fi Thriller','2011-04-01','PG-13','1h 33min'),
('Hackers',1.99,'Comedy Crime Drama','1995-09-15','PG-13','1h 47min'),
('War Games',1.99,'Sci-Fi Thriller','1983-06-03','PG','1h 54min'),
('The Social Network',2,'Biography Drama','2010-10-01','PG-13','2h 0min'),
('The Imitation Game',2,'Biography Drama Thriller','2014-12-25','PG-13','1h 54min'),
('Pirates of Silicon Valley',1.99,'Biography Drama History','1999-06-20','NONE','1h 35min'),
('The Net',1,'Action Crime Drama','1995-07-28','PG-13','1h 54min'),
('Primer',1,'Drama Sci-Fi Thriller','2004-10-08','PG-13','1h 17min'),
('Office Space',1.99,'Comedy','1999-02-19','R','1h 29min'),
('Ex Machina',3,'Drama Mystery Sci-Fi','2015-04-24','R','1h 48min'),
('Snowden',3,'Biography Drama Thriller','2016-09-16','R','2h 14min'),
('Algorithm',1,'Crime Drama Thriller','2014-07-19','NONE','1h 31min'),
('Live Free or Die Hard',2,'Action Adventure Thriller','2007-06-27','PG-13','2h 8min'),
('Jobs',2,'Biography Drama','2013-08-16','PG-13','2h 8min'),
('Upgrade',3,'Action Sci-Fi Thriller','2018-06-01','R','1h 40min'),
('Ready Player One',5,'Action Adventure Sci-Fi','2018-03-29','PG-13','2h 20min'),
('Gamer',3,'Action Sci-Fi Thriller','2009-09-04','R','1h 35min'),
('Transcendence',3,'Drama Mystery Romance','2014-04-18','PG-13','1h 59min'),
('Lucy',5,'Action Sci-Fi Thriller','2014-07-25','R','1h 29min'),
('The Internship',2,'Comdey','2013-06-07','PG-13','1h 59min')
go

select * from Movies
go


create table Orders(
ID int not null primary key identity(1,1),
CusID int foreign key references Customer(id),
OrderDate datetime,
TotalPrice decimal(11,2)
);
go

insert into Orders
(CusID,OrderDate)
values
(1,'2019-01-27')

select * from orders
go

create table OrderLines(
ID int not null primary key identity(1,1),
MovID int not null foreign key references Movies(id),
OrdID int not null foreign key references Orders(id),
Quantity int not null default 1,
--Total decimal(11,2) (select sum(movid.price * quantity))
);
go

insert into OrderLines
(MovID,OrdID)
values
(1,1),
(20,1)
go

select * from OrderLines
go