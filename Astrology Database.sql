----------------------------------------------------------------------------------------
-- Postgres create, load, and query script for Astrology  Database.
--
-- SQL statements for the Astrology Database
-- 
-- Modified by Reyhan Ayhan.
-- 
-- Tested on Postgres 9.3.2    (For earlier versions, you may need
--   to remove the "if exists" clause from the DROP TABLE commands.)
----------------------------------------------------------------------------------------

DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS zodiac;
DROP TABLE IF EXISTS sun;
DROP TABLE IF EXISTS venus;
DROP TABLE IF EXISTS mercury;
DROP TABLE IF EXISTS moon;
DROP TABLE IF EXISTS mars;
DROP TABLE IF EXISTS venus;
DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS ascending;
DROP TABLE IF EXISTS secondHouse;
DROP TABLE IF EXISTS thirdHouse;
DROP TABLE IF EXISTS fourthHouse;
DROP TABLE IF EXISTS fifthHouse;
DROP TABLE IF EXISTS sixthHouse;


-- People --
CREATE TABLE people (
  pid         serial not null unique,
  firstName   varchar(50),
  lastName    varchar(50),
  gender      char(1),
  city	      varchar(50),
  country     varchar(50),
  month	      varchar(50),
  date	      varchar(50),
  year	      int not null,
  time        time not null,
  am_Or_pm    char(2),
  CONSTRAINT valid_gender CHECK (gender = 'M' OR gender = 'F'),
  CONSTRAINT valid_am_OR_pm CHECK (am_Or_pm = 'AM' OR  am_Or_pm ='PM'),
 primary key(pid)
);

drop table people;

ALTER TABLE zodiac DROP COLUMN pid;
ALTER TABLE people ALTER COLUMN pid TYPE serial not null unique;
ALTER TABLE people ADD COLUMN pid serial not null unique;


-- Zodiac --
CREATE TABLE zodiac (
  pid            serial not null unique references people(pid),
  sunSign        varchar(50) not null references sun(sunSign),
  moonSign       varchar(50) not null references moon(moonSign),
  mercurySign    varchar(50) not null references mercury(mercurySign),
  venusSign      varchar(50) not null references venus(venusSign),
  marsSign       varchar(50) not null references mars(marsSign),
 primary key(pid),
 foreign key(sunSign) references sun(sunSign),
 foreign key(moonSign) references moon(moonSign),
 foreign key(mercurySign) references mercury(mercurySign),
 foreign key(venusSign) references venus(venusSign),
 foreign key(marsSign) references mars(marsSign)
); 

drop table zodiac;

-- Sun --
CREATE TABLE sun (
  sunSign     text not null,
  description text,   
  degree     int,
 primary key(sunSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table sun;

ALTER TABLE houses DROP COLUMN pid;
ALTER TABLE people ALTER COLUMN dob TYPE dob;
ALTER TABLE people ADD COLUMN date int not null;

-- Venus -- 
CREATE TABLE venus (
  venusSign     text not null,
  description text,   
  degree       int,
 primary key(venusSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table venus;

-- Mars -- 
CREATE TABLE mars (
  marsSign     text not null,
  description text,   
  degree     int,
 primary key(marsSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table mars;

-- Moon -- 
CREATE TABLE moon (
  moonSign     text not null,
  description text,   
  degree     int,
 primary key(moonSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table moon;
-- Mercury -- 
CREATE TABLE mercury (
  mercurySign     text not null,
  description text,   
  degree     int,
 primary key(mercurySign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table mercury;

-- Houses --
CREATE TABLE houses (
 pid            serial not null unique references people(pid),
  sunSign        varchar(50) not null references sun(sunSign),
  moonSign       varchar(50) not null references moon(moonSign),
  mercurySign    varchar(50) not null references mercury(mercurySign),
  venusSign      varchar(50) not null references venus(venusSign),
  marsSign       varchar(50) not null references mars(marsSign),
 primary key(pid),
 foreign key(sunSign) references sun(sunSign),
 foreign key(moonSign) references moon(moonSign),
 foreign key(mercurySign) references mercury(mercurySign),
 foreign key(venusSign) references venus(venusSign),
 foreign key(marsSign) references mars(marsSign)
);       

drop table houses;
 
-- Ascending --
CREATE TABLE ascending (
  ascendingSign text not null,
  description text,   
  degree     int,
 primary key(ascendingSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table ascending;

-- secHouse --
CREATE TABLE secHouse (
  secSign     text not null,
  description text,   
  degree     int,
 primary key(secSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table secHouse;

-- thirdHouse --
CREATE TABLE thirdHouse (
  thirdSign     text not null,
  description text,   
  degree     int,
 primary key(thirdSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table thirdHouse;

-- fourthHouse --
CREATE TABLE fourthHouse (
  fourthSign     text not null,
  description text,   
  degree     int,
 primary key(fourthSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table fourthHouse;

-- fifthHouse --
CREATE TABLE fifthHouse (
  fifthSign     text not null,
  description text,   
  degree     int,
 primary key(fifthSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table fifthHouse;


-- sixthHouse --
CREATE TABLE sixthHouse (
  sixthSign     text not null,
  description text,   
  degree     int,
 primary key(sixthSign),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

drop table sixthHouse;

-- SQL statements for loading example data into the CAP3 database
-- Connect to your Postgres server and set the active database to CAP3. Then . . .

-- People --

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('01', 'Reyhan', 'Ayhan', 'F', 'New York City', 'United States', 
  'September', '16', '1996', '4:44', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('02', 'Sara', 'Ramirez', 'F', 'Salt Lake City', 'United States', 
  'September', '02', '1985', '2:00', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('03', 'Michelle', 'Castelli', 'F', 'Boston', 'United States', 
  'August', '28', '1990', '6:30', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('04', 'Cynthia', null, 'F', 'Los Angeles', 'United States', 
  'August', '30', '1958', '3:20', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('05', 'Matthew', null, 'M', 'Richmond', 'United States', 
  'September', '19', '1966', '2:25', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('06', null, null, null, 'San Francisco', 'United States', 
  'August', '30', '1958', '3:20', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('07', 'Jimmy', 'Shay', 'M', 'Providence', 'United States', 
  'October', '23', '1958', '7:34', 'AM');

  INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('08', 'Liam', null, null, 'Tampa', 'United States', 
  'November', '1', '1991', '6:15', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('09', null, null, 'M', 'Boston', 'United States', 
  'December', '3', '1962', '5:53', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('10', 'Chris', null, 'M', 'Paris', 'France', 
  'December', '3', '1998', '2:20', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('11', 'Samantha', 'Levering', 'F', 'Cleveland', 'United States', 
  'December', '14', '1978', '2:47', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('12', 'Matthew', null, 'M', 'Dallas', 'United States', 
  'December 25', '22', '1994', '4:13', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('13', 'Jesus', null, 'M', 'Bethlehem', 'United States', 
  'December', '25', '0004', '12:00', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('14', 'Rain', 'Forestt', 'M', 'San Jose', 'Costa Rica', 
  'January', '3', '1950', '6:12', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('15', 'Roger', 'Ayhan', 'M', 'New York City', 'United States', 
  'December', '16', '1992', '1:25', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('16', 'Alan', 'Labouseur', 'M', 'Poughkeepsie', 'United States', 
  'January', '23', '1982', '1:25', 'PM');
  
--your chart will be slightly off due to not having information regarding your location, time, and year of birth.

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('17', 'Chris', null, 'M', 'Miami', 'United States', 
  'February', '22', '1958', '9:10', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('18', 'Ana', 'Leon', 'F', 'Richmond', 'United States', 
  'March', '7', '1995', '7:10', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('19', 'Sierra', null, 'F', 'Chicago', 'United States', 
  'March', '17', '1999', '1:18', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('20', 'Lara', null, 'F', 'San Antonio', 'United States', 
  'April', '5', '1983', '5:00', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('21', null, null, null, 'Sacarmento', 'United States', 
  'April', '28', '1997', '3:25', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('22', 'Quinn', null, 'F', 'Albany', 'United States', 
  'May', '8', '1991', '6:14', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('23', 'Jermaine', 'Cole', 'M', 'Charlottesville', 'United States', 
  'February', '28', '1985', '8:11', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('24', null, null, null, 'Newark', 'United States', 
  'May', '14', '1953', '4:00', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('25', 'Bezat', null, 'M', 'Istanbul', 'United States', 
  'June', '2', '1993', '8:10', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('26', 'Matthew', 'Lira', 'M', 'Rio', 'United States', 
  'June', '17', '1965', '8:22', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('27', 'Sarah', null, 'F', 'Chicago', 'United States', 
  'July', '3', '1952', '6:14', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('28', 'Leyla', null, null, 'Athens', 'United States', 
  'July', '30', '1962', '6:17', 'PM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('29', 'Richard', null, null, 'San Juan', 'United States', 
  'August', '3', '1991', '5:10', 'AM');

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('30', 'IDontGotNoName', null, 'M', 'Miami', 'United States', 
  'August', '10', '1990', '3:17', 'AM');


-- Zodiac --

CREATE TABLE zodiac (
  pid            int not null  references people(pid),
  sunSign        text not null references sun(sunSign),
  moonSign       text not null references moon(moonSign),
  mercurySign    text not null references mercury(mercurySign),
  venusSign      text not null references venus(venusSign),
  marsSign       text not null references mars(marsSign),
 primary key(pid)
); 

--cardinals 

 drop table zodiac;

-- elements, 
-- yes (if libra, capricorn, 
-- mutuable or fixed

 INSERT INTO zodiac(pid, sunSign, moonSign, mercurySign, venusSign, marsSign)
 VALUES('01','Virgo', 'Scorpio', 'Virgo', 'Leo', 'Leo');



  

  