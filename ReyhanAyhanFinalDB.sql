----------------------------------------------------------------------------------------
-- Postgres create, load, and query script for The Database of the Zodiac.
--
-- SQL statements for the The DB of the Zodiac
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
  city	      varchar(50) not null,
  country     varchar(50) not null,
  month	      varchar(50) not null,
  date	      varchar(50) not null,
  year	      int not null,
  time        time,
  am_Or_pm    char(2),
  CONSTRAINT valid_gender CHECK (gender = 'M' OR gender = 'F'),
  CONSTRAINT valid_am_OR_pm CHECK (am_Or_pm = 'AM' OR  am_Or_pm ='PM'),
 primary key(pid)
);

-- Zodiac --
CREATE TABLE Zodiac (
  pid      serial not null unique references people(pid),
  zid      serial not null unique,
 primary key(zid)
); 

-- Sun --
CREATE TABLE sun (
  sun_id  serial not null unique,
  zid     serial not null unique references zodiac(zid),
  sign    varchar(50) not null,
  degree     int not null,
  strongQualities text not null, 
  weakQualities   text not null,  
 primary key(sun_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);


-- Venus -- 
CREATE TABLE venus (
  venus_id serial not null unique,
  zid     serial not null unique references zodiac(zid),
  sign    varchar(50) not null,
  degree     int not null,
  description text not null, 
 primary key(venus_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

-- Mars -- 
CREATE TABLE mars (
  mars_id serial not null unique,
  zid     serial not null unique references zodiac(zid),
  sign    varchar(50) not null,
  degree     int not null,
  description text not null,   
 primary key(mars_id)
);

-- Moon -- 
CREATE TABLE moon (
  moon_id serial not null unique,
  zid     serial not null unique references zodiac(zid),
  sign    varchar(50) not null,
  degree     int not null,
  description text not null, 
 primary key(moon_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

-- Mercury -- 
CREATE TABLE mercury (
  merc_id serial not null unique,
  zid     serial not null unique references zodiac(zid),
  sign    varchar(50) not null,
  degree     int,
  description text,   
 primary key(merc_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

-- Houses --
CREATE TABLE Houses (
  pid     serial unique references people(pid),
  hid     serial unique,
 primary key(pid)
);       

-- Ascending Table --
CREATE TABLE ascendingHouse (
  asc_id   serial not null unique,
  hid      serial unique references houses(hid),
  sign     text,
  degree     int, 
 primary key(asc_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);


-- Second House --
CREATE TABLE secHouse (
  sec_id   serial not null unique,
  hid      serial unique references houses(hid),
  sign     text,
  degree     int, 
 primary key(sec_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);


-- Third House --
CREATE TABLE thirdHouse (
  third_id   serial not null unique,
  hid      serial unique references houses(hid),
  sign     text,
  degree     int,   
 primary key(third_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);


-- Midheaven House --
CREATE TABLE midHouse (
  mid_id   serial not null unique,
  hid      serial unique references houses(hid),
  sign     text,
  degree     int,  
 primary key(mid_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);


-- Eleventh House --
CREATE TABLE eleHouse (
  ele_id   serial not null unique,
  hid      serial unique references houses(hid),
  sign     text,
  degree     int,  
 primary key(ele_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);

-- Twelfth House --
CREATE TABLE twelHouse (
  twel_id  serial not null unique,
  hid      serial unique references houses(hid),
  sign     text,
  degree     int,  
 primary key(twel_id),
 CONSTRAINT valid_degree CHECK (degree BETWEEN 0 and 30)
);




-- Inserted Data --
-- 1
INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('01', 'Reyhan', 'Ayhan', 'F', 'New York City', 'United States', 
  'September', '16', '1996', '4:44', 'AM');


 
 INSERT INTO Zodiac(pid, zid)
 VALUES(1,1);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(1, 1, 'Virgo', 23, 'Modest and shy 
Meticulous and reliable 
Practical and diligent 
Intelligent and analytical', 'Fussy and a worrier 
Overcritical and harsh 
Perfectionist and conservative');



 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(1,1, 'Virgo', 26, 'Those with Mercury in Virgo still prefers to take a little more time in order to
 maintain a higher accuracy level.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(1,1, 'Leo', 4, 'Those with Mars in Leo choose their goals and battles carefully so they are not embarrassed 
by failure, and so they do not waste valuable energy.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(1,1, 'Scorpio', 2, 'Not the easiest sign position for a moon, the moon in Scorpio seeks to satisfy their deepest needs 
through relationships with other people.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(1, 1, 'Leo', 9, 'People with Venus in Leo are attracted to people with big
 personalities who are outgoing and entertaining.');
 
 INSERT INTO Houses(pid, hid)
 VALUES(1,1);

 INSERT INTO ascendingHouse(asc_id,hid, sign, degree)
 VALUES(1, 1,'Leo', 22);

 INSERT INTO secHouse(sec_id, hid, sign, degree)
 VALUES(1,1, 'Virgo', 14);

 INSERT INTO thirdHouse(third_id,hid, sign, degree)
 VALUES(1,1, 'Libra', 12);

 INSERT INTO midHouse(mid_id, hid, sign, degree)
 VALUES(1,1, 'Taurus', 15);

 INSERT INTO eleHouse(ele_id,hid, sign, degree)
 VALUES(1,1, 'Gemini', 20);

 INSERT INTO twelHouse(twel_id,hid, sign, degree)
 VALUES(1, 1, 'Cancer', 23);


 --2
INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES('02', 'Sara', 'Ramirez', 'F', 'Salt Lake City', 'United States', 
  'September', '02', '1985', null, null);
 
 INSERT INTO Zodiac(pid, zid)
 VALUES(2,2);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(2, 2, 'Virgo', 9, 'Modest and shy 
Meticulous and reliable 
Practical and diligent 
Intelligent and analytical', 'Fussy and a worrier 
Overcritical and harsh 
Perfectionist and conservative');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(2, 2, 'Leo', 22, 'Mercury in Leo people are dramatic speakers. 
They often speak loudly and use their hands when they talk.');

 INSERT INTO mars(mars_id,zid, sign, degree, description)
 VALUES(2, 2,'Leo', 4, 'Those with Mars in Leo choose their goals and battles carefully so they are not embarrassed 
by failure, and so they do not waste valuable energy.');

 INSERT INTO moon(moon_id,zid, sign, degree, description)
 VALUES(2, 2,'Aries', 2, 'Look for the Mars in Aries person to come on strong and fast. Like an explosion, they 
feel ignited when they see an object of their desire.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(2, 2, 'Leo', 9, 'People with Venus in Leo are attracted to people with big
 personalities who are outgoing and entertaining.');


 --3
INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(3, 'Michelle', 'Castelli', 'F', 'Boston', 'United States', 
  'August', '28', '1990', '6:30', 'PM');

 INSERT INTO zodiac(pid, zid)
 VALUES(3,3);

INSERT INTO sun(sun_id,zid, sign, degree, strongQualities, weakQualities)
 VALUES(3, 3, 'Virgo', 9, 'Modest and shy 
Meticulous and reliable 
Practical and diligent 
Intelligent and analytical', 'Fussy and a worrier 
Overcritical and harsh 
Perfectionist and conservative');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(3, 3,'Virgo', 23, 'Those with Mercury in Virgo still prefers to take a little more time in order to
 maintain a higher accuracy level.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(3, 3, 'Taurus', 28, 'The slow, well planned approach is the Mars in Taurus style.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(3,3,  'Sagittarius', 12, 'Free-spirited people who always find a way to live life on their terms. Those with their moon in Sagittarius refuse to 
be boxed into any predefined lifestyle.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(3,3, 'Leo', 18, 'People with Venus in Leo are attracted to people
 with big personalities who are outgoing and entertaining.');

  INSERT INTO Houses(pid, hid)
 VALUES(3,3);

 INSERT INTO ascendingHouse(asc_id, hid, sign, degree)
 VALUES(3, 3, 'Aquarius', 15);

 INSERT INTO secHouse(sec_id, hid, sign, degree)
 VALUES(3, 3, 'Aries', 4);

 INSERT INTO thirdHouse(third_id, hid, sign, degree)
 VALUES(3,3, 'Taurus', 10);

 INSERT INTO midHouse(mid_id, hid, sign, degree)
 VALUES(3, 3, 'Sagittarius', 5);

 INSERT INTO eleHouse(ele_id, hid, sign, degree)
 VALUES(3, 3, 'Sagittarius', 5);

 INSERT INTO twelHouse(twel_id, hid, sign, degree)
 VALUES(3, 3, 'Capricorn', 17);

 --4
 INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(4, 'Cynthia', null, 'F', 'Los Angeles', 'United States', 
  'August', '30', '1958', '3:20', 'AM');

 INSERT INTO zodiac(pid, zid)
 VALUES(4,4);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(4, 4, 'Virgo', 6, 'Modest and shy 
Meticulous and reliable 
Practical and diligent 
Intelligent and analytical', 'Fussy and a worrier 
Overcritical and harsh 
Perfectionist and conservative');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(4, 4, 'Leo', 25, 'Mercury in Leo people are dramatic speakers. 
They often speak loudly and use their hands when they talk.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(4, 4, 'Taurus', 22, 'The slow, well planned approach is the Mars in Taurus style.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(4,4, 'Pisces', 12, 'They are extremely sensitive to their environment,
 feeling their way through life, as a water sign does; but, they have a vague, overall sense of things.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(4, 4, 'Leo', 17, 'People with Venus in Leo are attracted to people
 with big personalities who are outgoing and entertaining.');

 INSERT INTO Houses(pid, hid)
 VALUES(4, 4);

 INSERT INTO ascendingHouse(asc_id, hid, sign, degree)
 VALUES(4, 4, 'Cancer', 27);

 INSERT INTO secHouse(sec_id, hid, sign, degree)
 VALUES(4, 4, 'Leo', 19);

 INSERT INTO thirdHouse(third_id, hid, sign, degree)
 VALUES(4, 4, 'Virgo', 15);

 INSERT INTO midHouse(mid_id, hid, sign, degree)
 VALUES(4, 4,'Aries', 16);

 INSERT INTO eleHouse(ele_id, hid, sign, degree)
 VALUES(4, 4,'Taurus', 21);

 INSERT INTO twelHouse(twel_id, hid, sign, degree)
 VALUES(4, 4, 'Gemini', 26);

--5
INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(5, 'Matthew', null, 'M', 'Richmond', 'United States', 
  'May', '19', '1966', '2:25', 'AM');

 INSERT INTO zodiac(pid, zid)
 VALUES(5,5);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(5, 5, 'Taurus', 27, 'Patient and reliable
Warmhearted and loving
Persistent and determined
Placid and security loving',
'Jealous and possessive
Resentful and inflexible
Self-indulgent and greedy');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(5, 5, 'Taurus', 18, 'Patient in learning and careful in speaking, 
Mercury in Taurus does not rush.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(5, 5, 'Taurus', 23, 'The slow, well planned approach is the Mars in Taurus style.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(5, 5, 'Taurus', 14, 'A style and manner that is subtle and pleasant makes the moon in Taurus 
person easy-going with a comforting presence.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(5, 5, 'Aries', 15, 'An attraction to assertive and 
forward people is found when Venus is in Aries.');

 INSERT INTO Houses(pid, hid)
 VALUES(5, 5);

 INSERT INTO ascendingHouse(asc_id, hid, sign, degree)
 VALUES(5, 5, 'Pisces', 6);

 INSERT INTO secHouse(sec_id, hid, sign, degree)
 VALUES(5, 5, 'Aries', 21);

 INSERT INTO thirdHouse(third_id, hid, sign, degree)
 VALUES(5, 5, 'Taurus', 22);

 INSERT INTO midHouse(mid_id, hid, sign, degree)
 VALUES(5, 5, 'Sagittarius', 16);

 INSERT INTO eleHouse(ele_id, hid, sign, degree)
 VALUES(5, 5, 'Capricorn', 8);

 INSERT INTO twelHouse(twel_id, hid, sign, degree)
 VALUES(5, 5, 'Aquarius', 2);

--6

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(6, null, null, null, 'San Francisco', 'United States', 
  'May', '27', '1958', null, null);

  delete from people where pid = 6;

 INSERT INTO zodiac(pid, zid)
 VALUES(6, 6);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(6, 6, 'Gemini', 5, 'Adaptable and versatile
Communicative and witty
Intellectual and eloquent
Youthful and lively',
'Nervous and tense
Superficial and inconsistent
Cunning and inquisitive');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(6, 6, 'Taurus', 18, 'Patient in learning and careful in speaking, 
 Mercury in Taurus does not rush.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(6, 6, 'Pisces', 23, 'Aquarius plays by its own rules. These rules are based on freedom, equality and what is 
best for the group or society.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(6, 6, 'Virgo', 14, 'The moon in Virgo person is acutely aware of everything around them. They are observers and very curious 
about everyone and everything they encounter.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(6, 6, 'Aries', 15, 'An attraction to assertive and 
forward people is found when Venus is in Aries.');

 --7
 INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(7, 'Jimmy', 'Shay', 'M', 'Providence', 'United States', 
  'October', '23', '1960', '7:34', 'AM');



 INSERT INTO zodiac(pid, zid)
 VALUES(7, 7);

  INSERT INTO sun(sun_id,zid, sign, degree, strongQualities, weakQualities)
 VALUES(7,7, 'Scorpio', 0, 'Determined and forceful 
Emotional and intuitive 
Powerful and passionate 
Exciting and magnetic',
'Jealous and resentful 
Compulsive and obsessive 
Secretive and obstinate');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(7, 7, 'Scorpio', 22, 'Deep thought processes that focus on intent 
and underlying forces are the essence of Mercury in Scorpio.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(7, 7, 'Cancer', 13, 'The most careful of the signs, Cancer rarely 
moves directly toward the things it wants.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(7, 7, 'Sagittarius', 9, 'Free-spirited people who always find a way to live life on their terms. Those with their moon in Sagittarius refuse to 
be boxed into any predefined lifestyle.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(7, 7, 'Sagittarius', 2, 'People with their Venus in Sagittarius are attracted to people who are open, 
honest and live life to the fullest.');

 INSERT INTO Houses(pid, hid)
 VALUES(7, 7);

 INSERT INTO ascendingHouse(asc_id, hid, sign, degree)
 VALUES(6,7, 'Pisces', 6);

 INSERT INTO secHouse(sec_id, hid, sign, degree)
 VALUES(6,7, 'Aries', 21);

 INSERT INTO thirdHouse(third_id, hid, sign, degree)
 VALUES(6,7, 'Taurus', 22);

 INSERT INTO midHouse(mid_id, hid, sign, degree)
 VALUES(6,7, 'Sagittarius', 16);

 INSERT INTO eleHouse(ele_id, hid, sign, degree)
 VALUES(6,7, 'Capricorn', 8);

 INSERT INTO twelHouse(twel_id, hid, sign, degree)
 VALUES(6, 7, 'Aquarius', 2);


8--
  INSERT INTO People( pid, firstName, lastName, gender, city, 
  country, month, date, year, time, am_Or_pm)
  VALUES(8, 'Liam', null, null, 'Tampa', 'United States', 
  'November', '1', '1991', '6:15', 'PM');
  
 INSERT INTO zodiac(pid, zid)
 VALUES(8, 8);

  INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(8, 8, 'Scorpio', 9, 'Determined and forceful 
Emotional and intuitive 
Powerful and passionate 
Exciting and magnetic',
'Jealous and resentful 
Compulsive and obsessive 
Secretive and obstinate');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(8, 8, 'Scorpio', 26, 'Deep thought processes that focus on intent 
and underlying forces are the essence of Mercury in Scorpio.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(8, 8, 'Scorpio', 26, 'Losing is not an option for the Mars in Scorpio person. These people are willing to invest every bit of the time, 
 effort and passion it takes into achieving their goals.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(8, 8, 'Virgo', 13, 'The moon in Virgo person is acutely aware of everything around them. They are observers and very curious 
about everyone and everything they encounter.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(8, 8, 'Virgo', 22, 'Anything or anyone with a subtle, 
refined quality is attractive to the person with Venus in Virgo.');

 INSERT INTO Houses(pid, hid)
 VALUES(8, 8);

 INSERT INTO ascendingHouse(asc_id, hid, sign, degree)
 VALUES(6, 8, 'Taurus', 19);

 INSERT INTO secHouse(sec_id, hid, sign, degree)
 VALUES(6, 8, 'Gemini', 16);

 INSERT INTO thirdHouse(third_id, hid, sign, degree)
 VALUES(6,8, 'Cancer', 10);

 INSERT INTO midHouse(mid_id, hid, sign, degree)
 VALUES(6, 8, 'Leo', 4);

 INSERT INTO eleHouse(ele_id, hid, sign, degree)
 VALUES(6, 8, 'Pisces', 3);

 INSERT INTO twelHouse(twel_id, hid, sign, degree)
 VALUES(6, 8, 'Aries', 9);

 --9

 INSERT INTO People(pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(9, null, null, 'M', 'Boston', 'United States', 
  'December', '3', '1962', '5:53', 'AM');

delete from people where pid = 9;

  INSERT INTO zodiac(pid, zid)
 VALUES(9, 9);

  INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(9, 9, 'Sagittarius', 10, 'Optimistic and freedom-loving 
Jovial and good-humored 
Honest and straightforward 
Intellectual and philosophical',
'Blindly optimistic and careless 
Irresponsible and superficial 
Tactless and restless');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(9, 9, 'Sagittarius', 15, 'The term "think big" is never more appropriate than 
when discussing Mercury in Sagittarius.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(9, 9,'Scorpio', 26, 'Losing is not an option for the Mars in Scorpio person. These people are willing to invest every bit of the time, effort 
and passion it takes into achieving their goals.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(9, 9, 'Virgo', 13, 'The moon in Virgo person is acutely aware of everything around them. They are observers and very curious 
about everyone and everything they encounter.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(9, 9, 'Virgo', 22, 'Anything or anyone with a subtle, 
refined quality is attractive to the person with Venus in Virgo.');

 INSERT INTO Houses(pid, hid)
 VALUES(9, 9);

 INSERT INTO ascendingHouse(asc_id, hid, sign, degree)
 VALUES(7, 9, 'Scorpio', 27);

 INSERT INTO secHouse(sec_id, hid, sign, degree)
 VALUES(7, 9, 'Sagittarius', 28);

 INSERT INTO thirdHouse(third_id, hid, sign, degree)
 VALUES(7, 9, 'Aquarius', 5);

 INSERT INTO midHouse(mid_id, hid, sign, degree)
 VALUES(7, 9, 'Virgo', 12);

 INSERT INTO eleHouse(ele_id, hid, sign, degree)
 VALUES(7, 9, 'Libra', 13);

 INSERT INTO twelHouse(twel_id, hid, sign, degree)
 VALUES(7, 9, 'Scorpio', 7);

 --10

 INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(10, 'Chris', null, 'M', 'Paris', 'France', 
  'December', '3', '1998', null, null);

  INSERT INTO zodiac(pid, zid)
 VALUES(10, 10);

  INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(10, 10, 'Sagittarius', 10, 'Optimistic and freedom-loving 
Jovial and good-humored 
Honest and straightforward 
Intellectual and philosophical',
'Blindly optimistic and careless 
Irresponsible and superficial 
Tactless and restless');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(10, 10, 'Sagittarius', 10, 'The term "think big" is never more appropriate than 
when discussing Mercury in Sagittarius.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(10, 10, 'Libra', 3, 'Libra is the sign that considers the needs and wants of others.
This creates a dynamic of opposing forces, which can be as frustrating as it is effective.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(10, 10, 'Gemini', 4, 'The person with a Gemini moon is truly forever young. Gemini is the lightest of the signs and keeps 
a person curious and active well into old age.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(10, 10, 'Sagittarius', 19, 'People with their Venus in Sagittarius are attracted to people who are open, 
honest and live life to the fullest.');

--11
INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(11, 'Jesus', null, 'M', 'Bethlehem', 'Israel', 
  'December', '25', '1900', null, null);

  INSERT INTO zodiac(pid, zid)
 VALUES(11, 11);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(11, 11, 'Capricorn', 2, 'Practical and prudent 
Ambitious and disciplined 
Patient and careful 
Humorous and reserved',
'Pessimistic and fatalistic 
Miserly and grudging');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(11, 11, 'Sagittarius', 17, 'The term "think big" is never more appropriate than 
when discussing Mercury in Sagittarius.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(11, 11, 'Libra', 3, 'Libra is the sign that considers the needs and wants of others.
This creates a dynamic of opposing forces, which can be as frustrating as it is effective.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(11, 11, 'Aquarius', 11, 'An Aquarius moon operates on a different level from the rest of the world. Their high level of detachment gives them a point of view that seems to put them above all of the drama in their view of
other people and the world in general.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(11, 11, 'Sagittarius', 2,'People with their Venus in Sagittarius are attracted to people who are open, 
honest and live life to the fullest.');


--12
INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(12, 'Alan', 'Labouseur', 'M', 'Poughkeepsie', 'United States', 
  'January', '23', '1982', NULL, NULL);

  INSERT INTO zodiac(pid, zid)
 VALUES(12, 12);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(12, 12, 'Aquarius', 3, 'Friendly and humanitarian 
Honest and loyal 
Original and inventive 
Independent and intellectual', 'Intractable and contrary 
Perverse and unpredictable 
Unemotional and detached');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(12, 12, 'Aquarius', 18, 'Mercury in Aquarius can be the most flexible and the 
most rigid thinker at the same time.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(12, 12, 'Libra', 3, 'Libra is the sign that considers the needs and wants of others.
This creates a dynamic of opposing forces, which can be as frustrating as it is effective.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(12, 12, 'Aquarius', 11, 'An Aquarius moon operates on a different level from the rest of the world. Their high level of detachment gives them a point of view that seems to put them above all of the drama in their view of
other people and the world in general.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(12, 12, 'Sagittarius', 2,'People with their Venus in Sagittarius are attracted to people who are open, 
honest and live life to the fullest.');


--13
INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(13, 'IDontGotNoName', null, 'M', 'Miami', 'United States', 
  'August', '10', '1990', '3:17', 'AM');

  INSERT INTO zodiac(pid, zid)
 VALUES(13, 13);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(13, 13, 'Leo', 17, 'Generous and warmhearted
Creative and enthusiastic
Broad-minded and expansive
Faithful and loving',
'Pompous and patronizing
Bossy and interfering
Dogmatic and intolerant');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(13, 13, 'Virgo', 14, 'Those with Mercury in Virgo still prefers to take a little more time in order to
 maintain a higher accuracy level.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(13, 13, 'Taurus', 18, 'The slow, well planned approach is the Mars in Taurus style.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(13, 13, 'Aries', 3, 'Those born with their moon in Aries feel a constant internal need to play the role of 
conductor in the orchestras of their worlds.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(13, 13, 'Cancer', 25,'The Venus in Cancer person is attracted to 
people who can care for them not only emotionally but physically.');

 INSERT INTO Houses(pid, hid)
 VALUES(13, 13);

 INSERT INTO ascendingHouse(asc_id, hid, sign, degree)
 VALUES(8, 13, 'Gemini', 29);

 INSERT INTO secHouse(sec_id, hid, sign, degree)
 VALUES(8, 13, 'Cancer', 22);

 INSERT INTO thirdHouse(third_id, hid, sign, degree)
 VALUES(8, 13, 'Leo', 17);

 INSERT INTO midHouse(mid_id, hid, sign, degree)
 VALUES(8, 13, 'Pisces', 16);

 INSERT INTO eleHouse(ele_id, hid, sign, degree)
 VALUES(8, 13, 'Aries', 20);

 INSERT INTO twelHouse(twel_id, hid, sign, degree)
 VALUES(8, 13, 'Taurus', 26);

 

 --14

INSERT INTO People( pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(14, 'Harambe', null, 'M', 'Miami', 'United States', 
  'August', '10', '1990', '3:17', 'AM');

  INSERT INTO zodiac(pid, zid)
 VALUES(14, 14);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(14, 14, 'Gemini', 5, 'Adaptable and versatile
Communicative and witty
Intellectual and eloquent
Youthful and lively','Nervous and tense
Superficial and inconsistent
Cunning and inquisitive' );

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(14, 14, 'Gemini', 7, 'When Mercury is in its own sign of Gemini, 
a person has the ability to think quickly and with agility.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(14, 14, 'Libra', 24, 'Libra is the sign that considers the needs and wants of others.
This creates a dynamic of opposing forces, which can be as frustrating as it is effective.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(14, 14, 'Scorpio', 3, 'Not the easiest sign position for a moon, the moon in Scorpio seeks to satisfy their deepest needs 
through relationships with other people.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(14, 14, 'Cancer', 20,'The Venus in Cancer person is attracted to 
people who can care for them not only emotionally but physically.');



 --15

INSERT INTO People(pid, firstName, lastName, gender, city, 
country, month, date, year, time, am_Or_pm)
  VALUES(15, 'Sean', 'Connery', 'M', 'Miami', 'United States', 
  'August', '25', '1930', '6:05', 'PM');
select *
FROM mercury

delete from moon where zid = '15';

  INSERT INTO zodiac(pid, zid)
 VALUES(15, 15);

 INSERT INTO sun(sun_id, zid, sign, degree, strongQualities, weakQualities)
 VALUES(15, 15, 'Virgo', 1, 'Modest and shy 
Meticulous and reliable 
Practical and diligent 
Intelligent and analytical',
'Fussy and a worrier 
Overcritical and harsh 
Perfectionist and conservative');

 INSERT INTO mercury(merc_id, zid, sign, degree, description)
 VALUES(15, 15, 'Virgo', 29, 'Those with Mercury in Virgo still prefers to take a little more time in order to
 maintain a higher accuracy level.');

 INSERT INTO mars(mars_id, zid, sign, degree, description)
 VALUES(15, 15,'Gemini', 28, 'It is difficult to notice when the Mars in Gemini person is going after something they want.They are a 
bit scattered and easily distracted in pursuing their goals.');

 INSERT INTO moon(moon_id, zid, sign, degree, description)
 VALUES(15, 15, 'Virgo', 23, 'The moon in Virgo person is acutely aware of everything around them. They are observers and very curious 
about everyone and everything they encounter.');

 INSERT INTO venus(venus_id, zid, sign, degree, description)
 VALUES(15, 15, 'Libra', 17,'The Venus in Libra person is attracted to 
anything refined, classically beautiful, peaceful, and kind.');

 INSERT INTO Houses(pid, hid)
 VALUES(15, 15);

 INSERT INTO ascendingHouse(asc_id, hid, sign, degree)
 VALUES(9, 15, 'Capricorn', 6);

 INSERT INTO secHouse(sec_id, hid, sign, degree)
 VALUES(9, 15, 'Pisces', 26);

 INSERT INTO thirdHouse(third_id, hid, sign, degree)
 VALUES(9, 15, 'Aries', 22);

 INSERT INTO midHouse(mid_id, hid, sign, degree)
 VALUES(9, 15, 'Scorpio', 18);

 INSERT INTO eleHouse(ele_id, hid, sign, degree)
 VALUES(9, 15, 'Sagittarius', 6);

 INSERT INTO twelHouse(twel_id, hid, sign, degree)
 VALUES(9, 15, 'Sagittarius', 20);


 
--Views--

--Gets every individual's Venus sign
CREATE OR REPLACE VIEW getVenus AS
SELECT p.pid, v.sign , firstName, lastname 
FROM people p
INNER JOIN zodiac z
ON p.pid = z.pid
INNER JOIN venus v
ON v.venus_id = z.zid;

select *
from getVenus;

--Returns the firstname 
CREATE OR REPLACE VIEW signCity AS
SELECT p.pid, p.firstname, s.sign, p.city
FROM   people p
INNER JOIN zodiac z
ON p.pid = z.pid
INNER JOIN sun s
ON z.zid = s.zid
ORDER BY p.city ;

select *
FROM signCity;





--Reports--

--Returns all the people with their ascending and secondhouse sign
select p.firstname, p.lastname, p.pid, p.time, a.sign as Ascending_Sign, sc.sign as Second_Sign
FROM people p
INNER JOIN zodiac z
ON p.pid = z.pid
INNER JOIN sun s
ON z.zid = s.sun_id
INNER JOIN venus v
ON z.zid = v.venus_id
LEFT OUTER JOIN ascendingHouse a
ON z.zid = a.asc_id
LEFT OUTER JOIN secHouse sc
ON z.zid = sc.sec_id ;

select*
from people;

--Displays person's name, their sun sign, mercury sign, venus sign in one table
SELECT p.firstname, s.sign, m.sign, v.sign
FROM people p, zodiac z, sun s, mercury m, venus v
WHERE p.pid = z.zid AND z.zid = s.sun_id
AND z.zid = m.merc_id AND z.zid = v.venus_id
ORDER BY p.firstname;


--Stored Procedures--

--Calculates the number of users with a Virgo sun sign.
CREATE OR REPLACE FUNCTION virgoFrequency (varchar(100), REFCURSOR)
RETURNS refcursor as $$
DECLARE
	peopleNameInput varchar(100) := $1;
	resultset REFCURSOR := $2;
BEGIN
	open resultset for
	SELECT count(peopleNameInput)
	FROM people p
	INNER JOIN zodiac z
	ON p.pid = z.pid
	INNER JOIN sun s
	ON z.zid = s.sun_id
	WHERE peopleNameInput = p.firstname;
    return resultset;
end;
$$
language plpgsql;

SELECT virgoFrequency('Reyhan', 'results');
FETCH ALL FROM results;

--Triggers

--Checks whether or not the year of birth enter is valid and able to use in order to calculate a birth chart.
CREATE OR REPLACE FUNCTION monthCheck() RETURNS TRIGGER AS $people$

	BEGIN 
	    IF NEW.year < (1900)
	THEN
	RAISE EXCEPTION 'Exceeds year to calculate accurate natal chart %', NEW.year
	USING HINT = 'Please choose a year above: '  || (1900);
	END IF;
	return NEW;
     END;
     $people$ LANGUAGE plpgsql;

CREATE TRIGGER triggerMonthCheck AFTER INSERT OR UPDATE
ON people
FOR EACH ROW EXECUTE PROCEDURE monthCheck();

INSERT INTO people(pid, firstname, lastname, gender, city, country, month, date, year, time, am_or_pm) VALUES 
	(16, 'sarah', 'henderson', 'F', 'Salt Lake City', 'United States', 'January', '16', '1890', null, 'AM'); 


--Security


DROP ROLE HOUSESCONTROL;
CREATE ROLE admin;
REVOKE ALL PRIVILEGES ON People FROM admin;
REVOKE ALL PRIVILEGES ON Zodiac FROM admin;
REVOKE ALL PRIVILEGES ON Sun FROM admin;
REVOKE ALL PRIVILEGES ON Moon FROM admin;
REVOKE ALL PRIVILEGES ON Venus FROM admin;
REVOKE ALL PRIVILEGES ON Mercury FROM admin;
REVOKE ALL PRIVILEGES ON Houses FROM admin;
REVOKE ALL PRIVILEGES ON AscendingHouse FROM admin;
REVOKE ALL PRIVILEGES ON SecHouse FROM admin;
REVOKE ALL PRIVILEGES ON ThirdHouse FROM admin;
REVOKE ALL PRIVILEGES ON MidHouse FROM admin;
REVOKE ALL PRIVILEGES ON EleHouse FROM admin;
REVOKE ALL PRIVILEGES ON TwelHouse FROM admin;


GRANT ALL PRIVILEGES ON People TO admin;
GRANT ALL PRIVILEGES ON Zodiac TO admin;
GRANT ALL PRIVILEGES ON Sun TO admin;
GRANT ALL PRIVILEGES ON Moon TO admin;
GRANT ALL PRIVILEGES ON Venus TO admin;
GRANT ALL PRIVILEGES ON Mercury TO admin;
GRANT ALL PRIVILEGES ON Houses TO admin;
GRANT ALL PRIVILEGES ON AscendingHouse TO admin;
GRANT ALL PRIVILEGES ON SecHouse TO admin;
GRANT ALL PRIVILEGES ON ThirdHouse TO admin;
GRANT ALL PRIVILEGES ON MidHouse TO admin;
GRANT ALL PRIVILEGES ON EleHouse TO admin;
GRANT ALL PRIVILEGES ON TwelHouse TO admin;


CREATE ROLE HousesControl;
REVOKE ALL PRIVILEGES ON People FROM HousesControl;
REVOKE ALL PRIVILEGES ON Zodiac FROM HousesControl;
REVOKE ALL PRIVILEGES ON Sun FROM HousesControl;
REVOKE ALL PRIVILEGES ON Moon FROM HousesControl;
REVOKE ALL PRIVILEGES ON Venus FROM HousesControl;
REVOKE ALL PRIVILEGES ON Mercury FROM HousesControl;
REVOKE ALL PRIVILEGES ON Houses FROM HousesControl;
REVOKE ALL PRIVILEGES ON AscendingHouse FROM HousesControl;
REVOKE ALL PRIVILEGES ON SecHouse FROM HousesControl;
REVOKE ALL PRIVILEGES ON ThirdHouse FROM HousesControl;
REVOKE ALL PRIVILEGES ON MidHouse FROM HousesControl;
REVOKE ALL PRIVILEGES ON EleHouse FROM HousesControl;
REVOKE ALL PRIVILEGES ON TwelHouse FROM HousesControl;


GRANT ALL PRIVILEGES ON People TO HousesControl;
GRANT ALL PRIVILEGES ON Houses TO HousesControl;
GRANT ALL PRIVILEGES ON AscendingHouse TO HousesControl;
GRANT ALL PRIVILEGES ON SecHouse TO HousesControl;
GRANT ALL PRIVILEGES ON ThirdHouse TO HousesControl;
GRANT ALL PRIVILEGES ON MidHouse TO HousesControl;
GRANT ALL PRIVILEGES ON EleHouse TO HousesControl;
GRANT ALL PRIVILEGES ON TwelHouse TO HousesControl;


CREATE ROLE mainSigns;
REVOKE ALL PRIVILEGES ON People FROM mainSigns;
REVOKE ALL PRIVILEGES ON Zodiac FROM mainSigns;
REVOKE ALL PRIVILEGES ON Sun FROM mainSigns;
REVOKE ALL PRIVILEGES ON Moon FROM mainSigns;
REVOKE ALL PRIVILEGES ON Venus FROM mainSigns;
REVOKE ALL PRIVILEGES ON Mercury FROM mainSigns;
REVOKE ALL PRIVILEGES ON Houses FROM mainSigns;
REVOKE ALL PRIVILEGES ON AscendingHouse FROM mainSigns;
REVOKE ALL PRIVILEGES ON SecHouse FROM mainSigns;
REVOKE ALL PRIVILEGES ON ThirdHouse FROM mainSigns;
REVOKE ALL PRIVILEGES ON MidHouse FROM mainSigns;
REVOKE ALL PRIVILEGES ON EleHouse FROM mainSigns;
REVOKE ALL PRIVILEGES ON TwelHouse FROM mainSigns;


GRANT SELECT, UPDATE ON People TO mainSigns;
GRANT SELECT, UPDATE ON Zodiac TO mainSigns;
GRANT SELECT, UPDATE ON Sun TO mainSigns;
GRANT SELECT, UPDATE ON Moon TO mainSigns;
GRANT SELECT, UPDATE ON Houses TO mainSigns;
GRANT SELECT, UPDATE ON AscendingHouse TO mainSigns;
GRANT SELECT, UPDATE ON SecHouse TO mainSigns;
GRANT SELECT, UPDATE ON ThirdHouse TO mainSigns;
GRANT SELECT, UPDATE ON MidHouse TO mainSigns;
GRANT SELECT, UPDATE ON EleHouse TO mainSigns;
GRANT SELECT, UPDATE ON TwelHouse TO mainSigns;







 

