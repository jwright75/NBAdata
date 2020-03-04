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
REVENUE decimal(14,2),
CONC_NAME varchar(20) 
);
