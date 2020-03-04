#I made the name varchar for each table 50
#I also change decimal(3,2) to decimal(5,2) on the PRICE colum for a few tables to keep values within range
#I made Team-ID the primary Key of Team and made that a foriegn key to several tables
#I also made employee-ID a primary key in the tables
#I commented on all changes

drop schema if exists NBAdb;
create schema NBAdb;
use NBAdb;

#new
drop table if exists EMPLOYEE;

drop table if exists MASCOT;
drop table if exists PLAYER;
drop table if exists HEADCOACH;
drop table if exists STADIUM;
drop table if exists TEAM;
drop table if exists MINORTEAM;
drop table if exists GENERALMANAGER;
drop table if exists OWNER;
drop table if exists STADIUMWORKER;
drop table if exists GAME;
drop table if exists TVNETWORK;
drop table if exists HAT;
drop table if exists SHIRT;
drop table if exists JERSEY;
drop table if exists CONCESSIONS;


#tables with the primary key must be created b4 they can be refferenced
#by tables with a foreign key ~ thus my reorganization
# TEAMS ################################################
create table TEAM(
TOTALREVENUE decimal(15,2),
NETWORTH decimal(15,2),
NAME varchar(50),
RECORDWINS int,
RECORDLOSS int,
#new
team_ID varchar(10),
primary key(team_ID)
);

create table MINORTEAM(
REVENUE decimal(15,2),
NAME varchar(20),
FRANCHISE varchar(20),
#new
team_ID varchar(10),
foreign key (team_ID) references TEAM(team_ID)
);

##### EMPLOYEES ######################################
#I added employee type to each table
create table MASCOT(
NAME varchar(50),
SALARY 	int,
employeeID varchar(10),
#new
type ENUM('MASCOT', 'PLAYER', 'HEADCOACH','GENERALMANAGER', 'OWNER', 'STADIUMWORKER'),
team_ID varchar(10),
foreign key (team_ID) references TEAM(team_ID),
primary key(employeeID)
);

create table PLAYER(
SALARY int,
PLAYERID varchar(10),
NAME varchar(50),
CONTRACT int,
DATEOFBIRTH date,
REVENUE_GENERATED decimal(10,2),
EFFECIENCY_RATING int,
#new
type ENUM('MASCOT', 'PLAYER', 'HEADCOACH','GENERALMANAGER', 'OWNER', 'STADIUMWORKER'),
team_ID varchar(10),
foreign key (team_ID) references TEAM(team_ID)
);

create table HEADCOACH(
SALARY integer,
COACHID varchar(10),
COACHNAME varchar(50),
CONTRACT int,
DATEOFBIRTH date,
#new
type ENUM('MASCOT', 'PLAYER', 'HEADCOACH','GENERALMANAGER', 'OWNER', 'STADIUMWORKER'),
team_ID varchar(10),
foreign key (team_ID) references TEAM(team_ID)
);

create table GENERALMANAGER(
SALARY	int,
GMID varchar(10),
NAME varchar(20),
DATEOFBIRTH date,
#new
type ENUM('MASCOT', 'PLAYER', 'HEADCOACH','GENERALMANAGER', 'OWNER', 'STADIUMWORKER'),
team_ID varchar(10),
foreign key (team_ID) references TEAM(team_ID)
);

create table OWNER(
SALARY int,
OWNERID varchar(10),
NAME varchar(50),
DATEOFBIRTH date,
#new
type ENUM('MASCOT', 'PLAYER', 'HEADCOACH','GENERALMANAGER', 'OWNER', 'STADIUMWORKER'),
team_ID varchar(10),
foreign key (team_ID) references TEAM(team_ID)
);

create table STADIUMWORKER(
HOURLYPAY decimal(10,2),
WORKERID varchar(10),
#new
type ENUM('MASCOT', 'PLAYER', 'HEADCOACH','GENERALMANAGER', 'OWNER', 'STADIUMWORKER'),
team_ID varchar(10),
foreign key (team_ID) references TEAM(team_ID)
);

## GAME, STADIUM, NETWORK ####################################
create table STADIUM(
STADIUMCOST decimal(12,2),
STADIUMID varchar(10),
CAPACITY int
);

create table GAME(
CONCESSION_REVENUE decimal(12,2),
TICKETSOLD int,
GAME_NO int,
REVENUE decimal(12,2),
ATTENDANCE int
);

create table TVNETWORK(
NETWORK_NAME varchar(50),
NETWORK_ID varchar(15),
YEARLY_CONTRACT int
);

## SALES #########################################################
create table HAT(
PROD_COST decimal(5,2),
PRODUCT_ID varchar(10),
PRICE decimal (5,2),
LOGO varchar(10),
TRANSACTION_ID varchar(10),
REVENUE decimal(14,2)
);

create table SHIRT(
PRODCOST decimal(5,2),
PRODUCTID varchar(10),
PRICE decimal(5,2),
GENDER varchar(10),
TRANSACTIONID varchar(10),
REVENUE decimal(14,2)
);

create table JERSEY(
PROD_COST decimal(5,2),
PRODUCT_ID varchar(10),
PRICE decimal (5,2),
NAME varchar(20),
JERS_NUM int,
TRANSACTION_ID varchar(10),
REVENUE decimal(14,2)
);

create table CONCESSIONS(
TRANSACTION_ID varchar(10),
REVENUE decimal(14,2) 
);

##DATA INSERTION ########################################################################
#I inserted Employee type and TEAM-ID into all the tables
INSERT INTO TEAM VALUE('0000', '1150000000.00', 'Hawks', '29', '53', '46516');

INSERT INTO MASCOT VALUE('Harry' , '30000' , '000001','MASCOT','46516');

INSERT INTO PLAYER VALUE('2516048', '10000', 'Justin Anderson' , '1', '1993-11-19', '150000.23', '72','PLAYER','46516');
INSERT INTO PLAYER VALUE('18089887', '10001', 'Kent Bazemore' , '2', '1989-7-1', '150000.23', '76','PLAYER','46516');
INSERT INTO PLAYER VALUE('2526840', '10002', 'Taruean Prince' , '2', '1994-3-22', '150000.23', '77','PLAYER','46516');
INSERT INTO PLAYER VALUE('1634640', '10003', 'Deandre Bembry' , '2', '1994-7-4', '150000.23', '72','PLAYER','46516');
INSERT INTO PLAYER VALUE('12500000', '10004', 'Miles Plumlee' , '2', '1988-9-1', '150000.23', '71','PLAYER','46516');
INSERT INTO PLAYER VALUE('2299080', '10005', 'John Collins' , '3', '1997-9-23', '150000.23', '84','PLAYER','46516');
INSERT INTO PLAYER VALUE('7200000', '10006', 'Dewayne Dedmon' , '1', '1989-8-12', '150000.23', '77','PLAYER','46516');
INSERT INTO PLAYER VALUE('5356440', '10007', 'Trae Young' , '4', '1998-9-19', '150000.23', '84','PLAYER','46516');
INSERT INTO PLAYER VALUE('2250960', '10008', 'Kevin huerter' , '4', '1998-8-27', '150000.23', '74','PLAYER','46516');
INSERT INTO PLAYER VALUE('1620480', '10009', 'Omari Spellman' , '4', '1997-7-21', '150000.23', '73','PLAYER','46516');
INSERT INTO PLAYER VALUE('236854', '10010', 'Jaylen Adams' , '2', '1996-5-4', '150000.23', '69','PLAYER','46516');
INSERT INTO PLAYER VALUE('4350000', '10011', 'Alex Len' , '2', '1993-6-16', '150000.23', '77','PLAYER','46516');
INSERT INTO PLAYER VALUE('700000', '10012', 'Alex Poythress' , '0', '1993-9-6', '150000.23', '70','PLAYER','46516');
INSERT INTO PLAYER VALUE('2393887', '10013', 'Vince Carter' , '1', '1977-1-26', '150000.23', '73','PLAYER','46516');
INSERT INTO PLAYER VALUE('47371', '10014', 'Isaac Humphries' , '1', '1998-1-5', '150000.23', '72','PLAYER','46516');
INSERT INTO PLAYER VALUE('170916', '10015', 'Deyonta Davis' , '0', '1996-12-2', '150000.23', '71','PLAYER','46516');

INSERT INTO HEADCOACH VALUE('4000000', '000002', 'Lloyd Pier', '3', '1976-5-11','HEADCOACH','46516');

INSERT INTO STADIUM VALUE('20000', '345220', '21000');

INSERT INTO MINORTEAM VALUE('200000', 'Erie Bayhawks', 'Hawks','46516');

INSERT INTO GENERALMANAGER VALUE('6000000', '002345', 'Travis Schlenk', '1976-1-24','GENERALMANAGER','46516');

INSERT INTO OWNER VALUE('34000000', '012032', 'Antony Resseler', '1959-7-16','OWNER','46516');

INSERT INTO STADIUMWORKER VALUE('15.20', '012231','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012232','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012233','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012234','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012235','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012236','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012237','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012238','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012239','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012212','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012222','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012232','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('15.20', '012242','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012252','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012262','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012272','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012282','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012292','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012132','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012232','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012332','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012432','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('17.50', '012532','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('20.20', '012632','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('20.20', '012732','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('20.20', '012832','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('20.20', '012932','STADIUMWORKER','46516');
INSERT INTO STADIUMWORKER VALUE('20.20', '011232','STADIUMWORKER','46516');


INSERT INTO GAME VALUE('32000.34','12000','4','400000', '11289');

INSERT INTO TVNETWORK VALUE('FOX','FOXSOUTHEAST','3000000');

INSERT INTO HAT VALUE('3.12','111001','30.00','HAWK1','000341','913.22');
INSERT INTO HAT VALUE('3.12','111002','30.00','HAWK2','000342','673.22');
INSERT INTO HAT VALUE('3.12','111003','30.00','HAWK3','000343','890.22');


INSERT INTO SHIRT VALUE('2.76','111201','28.00','MALE','000345','923.65');
INSERT INTO SHIRT VALUE('2.76','111202','28.00','FEMALE','000346','725.65');

INSERT INTO JERSEY VALUE('8.50','111301','85.00','Young', '8', '000345', '2048.45');
INSERT INTO JERSEY VALUE('8.50','111302','85.00','Bazemore', '21', '000346', '1248.45');
INSERT INTO JERSEY VALUE('8.50','111303','85.00','Collins', '10', '000347', '1748.45');

INSERT INTO CONCESSIONS VALUE('111400','46233.67');
