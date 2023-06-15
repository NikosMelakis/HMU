drop database if exists project;
create database project;
use project;

create table Ypokatasthmata
(
id int,
sname varchar(20),
address varchar(20),
num varchar(10),
city varchar(20),
primary key(id)
);

create table PelatesOdhgoi
(
id integer,
bdate date,
carid integer,
fname varchar(20),
lname varchar(20),
address varchar(20),
num varchar(10),
city varchar(20),
primary key(id)
);

create table Ypallhloi
(
id integer,
fname varchar(20),
lname varchar(20),
num varchar(10),
address varchar(20),
city varchar(20),
salary float,
hdate date,
yid integer,
CONSTRAINT foreign key(yid) references Ypokatasthmata(id),
primary key(id)
);

create table Autokinhta
(
cid varchar(8),
price float,
kind varchar(20),
cc integer,
primary key(cid)
);

create table Asfalisthrio
(
id integer,
beginning date,
ending date,
cvalue float,
price float,
primary key(id)
);

create table Atuxhmata
(
id integer,
cdate date,
location varchar(20),
primary key(id)
);

create table ProstateuomenaMeloi
(
yid integer,
fname varchar(20),
sex varchar(6),
age integer,
CONSTRAINT foreign key(yid) references Ypallhloi(id)
);

create table Ypeuthunos
(
yid integer,
aid integer,
pid integer,
auid varchar(8),
CONSTRAINT foreign key(yid) references Ypallhloi(id),
CONSTRAINT foreign key(aid) references Atuxhmata(id),
CONSTRAINT foreign key(pid) references PelatesOdhgoi(id),
CONSTRAINT foreign key(auid) references Autokinhta(cid)
);

create table Thlefwna
(
yid integer,
thlefwna varchar(10),
CONSTRAINT foreign key(yid) references Ypokatasthmata(id)
);

create table Dioikhtikos
(
yid integer,
degree varchar(20),
ddate date,
CONSTRAINT foreign key(yid) references Ypallhloi(id)
);

create table Empeirognwmones
(
uid integer,
wdate integer,
constraint foreign key(uid) references Ypallhloi(id)
);

create table Sunergazetai
(
yid integer,
pid integer,
CONSTRAINT foreign key(yid) references Ypokatasthmata(id),
CONSTRAINT foreign key(pid) references PelatesOdhgoi(id)
);
create table Odhgei
(
auid varchar(8),
pid integer,
constraint foreign key(auid) references Autokinhta(cid),
constraint foreign key(pid) references PelatesOdhgoi(id)
);

create table Anhkei
(
yid integer,
aid integer,
auid varchar(8),
pid integer,
CONSTRAINT foreign key(yid) references Ypokatasthmata(id),
CONSTRAINT foreign key(aid) references Asfalisthrio(id),
CONSTRAINT foreign key(auid) references Autokinhta(cid),
CONSTRAINT foreign key(pid) references PelatesOdhgoi(id)
);

create table Sundeetai
(
aid integer,
auid varchar(8),
pid integer,
CONSTRAINT foreign key(aid) references Atuxhmata(id),
CONSTRAINT foreign key(auid) references Autokinhta(cid),
CONSTRAINT foreign key(pid) references PelatesOdhgoi(id)
);


insert into Ypokatasthmata values
(1, 'Store no1', 'Katexaki', 144, 'Athens'),
(2, 'Store no2', 'El. Venizelou', 97, 'Thesaloniki'),
(3, 'Store no3', 'Kapodistria', 56, 'Patra'),
(4, 'Store no4', 'Malikouti', 14, 'Heraklion'),
(5, 'Store no4', 'Tzanakaki', 25, 'Chania');

insert into PelatesOdhgoi values
(1, '1986-06-21', 1, 'Andreas', 'Georgiou', 'Nearchou', 46, 'Athens'),
(2, '1976-08-12', 2, 'Emmanouil', 'Skounakis', 'Plastira', 89, 'Chania'),
(3, '1992-05-11', 3, 'Stelianos', 'Stulianakis', 'Elyrou', 44, 'Thessaloniki'),
(4, '1989-02-04', 4, 'Konstantinos', 'Palaiologou', 'Papanastasiou', 128, 'Patra'),
(5, '1996-01-28', 5, 'Georgios', 'Sarris', 'Leof. 62 Martiron', 192, 'Heraklion');

insert into Ypallhloi values
(1, 'Konstantinos', 'Vamvakas', '6974589745', 'Tsouderon 24', 'Chania', '605.34', '2018-12-13', 3),
(2, 'Mixail', 'Stauroulidakis', '6982124569', 'Samarias 12', 'Patra', '789.45', '2012-05-11', 2),
(3, 'Georgios', 'Papadopoulos', '6973254123', 'Minoos 127', 'Heraklion', '920.12', '2007-02-04', 4),
(4, 'Ioannis', 'Ziogas', '6942566878', 'Ag. Gianni 67', 'Chania', '1024.30', '2000-05-19', 1),
(5, 'Spiridon', 'Iliopoulos', '6942123124', 'Polutexniou 129', 'Thessaloniki', '1101.74', '1998-07-21', 5),
(6, 'Konstantinos', 'Papadoulakis', '6985401112', 'Papanastasiou 128', 'Athens', '980.45', '1999-08-21', 4),
(7, 'Nikolaos', 'Pavlou', '6932147898', 'EOK 24', 'Thesaloniki', '845.23', '2001-07-30', 3),
(8, 'Katerina', 'Lada', '6932556554', 'Skra 9', 'Athens', '974.55', '2007-04-05', 2),
(9, 'Maria', 'Georgiou', '6987102030', 'Dagli 34', 'Heraklion', '880.40', '2011-11-25', 5),
(10, 'Polyxeni', 'Giatroudaki', '6932448899', 'Samarias 99','Patra', '690.78', '2015-07-06', 1);


insert into Autokinhta values
('XNK-4567', 21150.45, 'Epivatiko', 2000),
('HKH-1221', 24152.89, 'Emporiko', 2500),
('YKZ-5498', 19874.47, 'Epivatiko', 1600),
('REZ-5676', 12457.45, 'Epivatiko', 1200),
('KAD-3269', 18745.12, 'Emporiko', 2200);

insert into Asfalisthrio values
(1054, '2012-04-24', '2012-07-24', 5000, 90.54),
(1247, '2009-01-01', '2018-01-01', 10000, 178.68),
(1458, '2004-05-01', '2004-06-01', 2500, 30.12),
(1788, '2019-01-01', '2020-01-01', 10000, 178.68),
(1812, '2020-11-11', '2020-11-11', 10000, 179.96);

insert into Atuxhmata values
(1, '2009-11-30', 'Heraklion'),
(2, '2019-10-07', 'Thessaloniki'),
(3, '2008-12-31', 'Patra'),
(4, '2014-06-05', 'Athens'),
(5, '2009-07-15', 'Patra');

insert into ProstateuomenaMeloi values
(1, 'Giorgos', 'Male', 15),
(2, 'Vera', 'Female', 5),
(3, 'Panagiota', 'Female', 18),
(4, 'Emmanouil', 'Male', 16),
(5, 'Stylianos', 'Male', 21);

insert into Ypeuthunos values
(1, 2, 1, 'XNK-4567'),
(2, 1, 2, 'HKH-1221'),
(3, 3, 3, 'YKZ-5498'),
(4, 5, 4, 'REZ-5676'),
(5, 4, 5, 'KAD-3269');

insert into Thlefwna values
(1, 2105050550),
(2, 2134908999),
(3, 2187489655),
(4, 2810479999),
(5, 2821078800);

insert into Dioikhtikos values
(1, 'Business Admin', '2016-06-21'),
(2, 'Logistic', '2010-11-15'),
(3, 'Marketing', '2004-03-14'),
(9, 'Informatics', '2009-02-27'),
(10, 'Economics', '2012-07-24');

insert into Empeirognwmones values
(4, 20),
(5, 22),
(6, 21),
(7, 19),
(8, 13);

insert into Sunergazetai values 
(1, 5),
(2, 4),
(3, 3),
(4, 2),
(5, 1);

insert into Odhgei values
('XNK-4567', 1),
('HKH-1221', 2),
('YKZ-5498', 3),
('REZ-5676', 4),
('KAD-3269', 5);

insert into Anhkei values
(1, 1054, 'XNK-4567', 1),
(2, 1247, 'HKH-1221', 2),
(3, 1458, 'YKZ-5498', 3),
(4, 1788, 'REZ-5676', 4),
(5, 1812, 'KAD-3269', 5);

insert into Sundeetai values
(1, 'XNK-4567', 1),
(2, 'HKH-1221', 2),
(3, 'YKZ-5498', 3),
(4, 'REZ-5676', 4),
(5, 'KAD-3269', 5);

-- ΦΑΣΗ 3 --

update Ypallhloi
set salary=salary+(salary*10/100)
where hdate<='2000-01-01';

delete from Anhkei;
delete from Asfalisthrio
where ending<'2015-01-01';




