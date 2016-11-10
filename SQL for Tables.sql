-- Drops tables to avoid potential overlap --

DROP TABLE IF EXISTS peopleInvolved;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS spouse;
DROP TABLE IF EXISTS movieData;

-- People Involved Table --
CREATE TABLE peopleInvolved (
	pid		CHAR(12) UNIQUE NOT NULL,
	firstName	TEXT NOT NULL,
	lastName	TEXT NOT NULL,
	dateOfBirth	DATE NOT NULL,
	address		TEXT NOT NULL,
	hairColor	TEXT NOT NULL,
	eyeColor	TEXT NOT NULL,
	heightINCHES	INTEGER NOT NULL,
	weightLBS	INTEGER NOT NULL,
	favColor	TEXT,
	primary key(pid)	
);

-- Insert into People --
INSERT INTO peopleInvolved (pid, firstName, lastName, dateOfBirth, address, hairColor, eyeColor, heightINCHES, weightLBS, favColor)
	VALUES('mmlFs0qJkHS4', 'Siavash', 'Clair', '1960-02-23', '8374 Chestnut Avenue Newington, CT 06111','Black', 'Brown','66', '141', 'Red');

INSERT INTO peopleInvolved (pid, firstName, lastName, dateOfBirth, address, hairColor, eyeColor, heightINCHES, weightLBS, favColor)
	VALUES('maYFd5HRfDZ0', 'Kevin', 'Abessa', '1960-11-02','5132 Front Street Loganville, GA 30052','Brown', 'Green','69','154','Black');

INSERT INTO peopleInvolved (pid, firstName, lastName, dateOfBirth, address, hairColor, eyeColor, heightINCHES, weightLBS, favColor)
	VALUES('OIvttlEWR62f', 'Cyneheard', 'Giannino', '1960-12-01', '4517 Route 11 Lawrenceville, GA 30043', 'Blonde','Grey','73','182','Blue');
	
INSERT INTO peopleInvolved (pid, firstName, lastName, dateOfBirth, address, hairColor, eyeColor, heightINCHES, weightLBS, favColor)
	VALUES('oQ86zGEowZOb', 'Sean', 'Connery', '1930-08-25', 'Sean Connery Creative Artists Agency 2000 Avenue of the Stars Los Angeles, CA 90067 USA','Black','Dark Brown','74','185','Grey');

INSERT INTO peopleInvolved (pid, firstName, lastName, dateOfBirth, address, hairColor, eyeColor, heightINCHES, weightLBS, favColor)
	VALUES('g4UYAJq99kHX', 'Kristofor', 'Viktoras', '1940-06-04', '2623 Colonial Avenue Battle Creek, MI 49015','Red', 'Green','70','161','Violet');

SELECT * FROM peopleInvolved;



-- Actors Table --
CREATE TABLE actors (
	pid		CHAR(12) NOT NULL REFERENCES peopleInvolved(pid),
	actorsGuildAnniDate		DATE,
	primary key(pid)
);

-- Insert into Actors Table --
INSERT INTO actors (pid, actorsGuildAnniDate)
	VALUES('maYFd5HRfDZ0', '1980-12-10');

INSERT INTO actors (pid, actorsGuildAnniDate)
	VALUES('oQ86zGEowZOb', '1980-11-20');

INSERT INTO actors (pid, actorsGuildAnniDate)
	VALUES('mmlFs0qJkHS4', '1976-06-18');

SELECT * FROM actors;


-- Directors Table --
CREATE TABLE directors (
	pid		CHAR(12) NOT NULL REFERENCES peopleInvolved(pid),
	filmSchool	TEXT,
	directorsGuildAnniDate		DATE,
	favLenMaker	TEXT,
	primary key(pid)	
);

-- Insert into Directors Table --
INSERT INTO directors (pid, filmSchool, directorsGuildAnniDate, favLenMaker)
	VALUES('mmlFs0qJkHS4', 'University of Southern California', '1976-09-28', 'Canon');

INSERT INTO directors (pid, filmSchool, directorsGuildAnniDate, favLenMaker)
	VALUES('OIvttlEWR62f', 'New York University', '1977-06-14', 'Sony');

INSERT INTO directors (pid, filmSchool, directorsGuildAnniDate, favLenMaker)
	VALUES('maYFd5HRfDZ0', 'University of California, Los Angeles', '1975-03-20', 'Nikon');

INSERT INTO directors (pid, filmSchool, directorsGuildAnniDate, favLenMaker)
	VALUES('g4UYAJq99kHX', 'American Film Institute', '1976-09-29', 'Optic');

INSERT INTO directors (pid, filmSchool, directorsGuildAnniDate, favLenMaker)
	VALUES('oQ86zGEowZOb', 'California Institute of the Arts', '1979-09-30', 'Fuji Film');

SELECT * FROM directors;



-- Spouse Table --
CREATE TABLE spouse (
	pid		CHAR(12) NOT NULL REFERENCES peopleInvolved(pid),
	spouseFN	TEXT NOT NULL,
	spouseLN	TEXT NOT NULL,
	primary key(pid)
);

-- Insert into Spouse Table --

INSERT INTO spouse (pid, spouseFN, spouseLN)
	VALUES('mmlFs0qJkHS4', 'Charles', 'Manish');
	
INSERT INTO spouse (pid, spouseFN, spouseLN)
	VALUES('oQ86zGEowZOb', 'Micheline', 'Roquebrune');

SELECT * FROM spouse;



-- Movie Data Table --
CREATE TABLE movieData (
	mid		CHAR(12) NOT NULL,
	name		TEXT NOT NULL,
	yearReleased	DATE NOT NULL,
	mpaaNum		INTEGER,
	domBoxSales	INTEGER NOT NULL,
	forBoxSales	INTEGER NOT NULL,
	dvdbluSales	INTEGER NOT NULL,
	primary key(mid)
);

-- Insert into Movie Data Table --
INSERT INTO movieDATA (mid, mpaaNum, name, releaseDate, dbosUSD, fbosUSD, dvdbluSales)
	VALUES('2zTdAWwkh6h5', 'Goldfinger','1964-09-17','379','51081062', '73800000', '3000000');

INSERT INTO movieDATA (mid, mpaaNum, name, releaseDate, dbosUSD, fbosUSD, dvdbluSales)
	VALUES('QzyM1c45obgR', 'If Chickens Flew','2016-04-04','684','35115402', '81957477', '51244781');

INSERT INTO movieDATA (mid, mpaaNum, name, releaseDate, dbosUSD, fbosUSD, dvdbluSales)
	VALUES('79RLd2JgkT3w', 'Lamps', '1980-10-05','513','68887855', '78045168', '65985695');

INSERT INTO movieDATA (mid, mpaaNum, name, releaseDate, dbosUSD, fbosUSD, dvdbluSales)
	VALUES('r2usYTt3v2Y4', 'Overboard', '1987-12-16','12','94372486', '42056139', '94323561');

SELECT * FROM movieData;



-- Cast/Crew Table --
CREATE TABLE castCrew (
	pid	CHAR(12) NOT NULL REFERENCES peopleInvolved(pid),
	mid	CHAR(12) NOT NULL REFERENCES movieData(mid),
	role	TEXT NOT NULL,
	primary key(pid, mid, role)
);

--Insert into Cast/Crew Table --
INSERT INTO castCrew (pid, mid, role)
	VALUES('oQ86zGEowZOb', '2zTdAWwkh6h5', 'Actor');

INSERT INTO castCrew (pid, mid, role)
	VALUES('maYFd5HRfDZ0', 'QzyM1c45obgR', 'Actor');

INSERT INTO castCrew (pid, mid, role)
	VALUES('mmlFs0qJkHS4', '2zTdAWwkh6h5', 'Director');

INSERT INTO castCrew (pid, mid, role)
	VALUES('OIvttlEWR62f', 'QzyM1c45obgR', 'Director');

INSERT INTO castCrew (pid, mid, role)
	VALUES('maYFd5HRfDZ0', 'QzyM1c45obgR', 'Director');

INSERT INTO castCrew (pid, mid, role)
	VALUES('oQ86zGEowZOb', 'QzyM1c45obgR', 'Actor');

INSERT INTO castCrew (pid, mid, role)
	VALUES('g4UYAJq99kHX', '79RLd2JgkT3w', 'Director');

INSERT INTO castCrew (pid, mid, role)
	VALUES('oQ86zGEowZOb', 'r2usYTt3v2Y4', 'Director');

SELECT * FROM castCrew;


-- Test Queries --
SELECT * 
  FROM peopleInvolved;

SELECT * 
  FROM peopleInvolved p, actors a
 WHERE p.pid = a.pid;

SELECT * 
  FROM peopleInvolved p, directors d
 WHERE p.pid = d.pid;

SELECT * 
  FROM movieData;

SELECT * FROM peopleInvolved LEFT OUTER JOIN spouse ON peopleInvolved.pid = spouse.pid;


-- Write a query to show all the directors with whom actor “Sean Connery” has worked. --
SELECT * 
  FROM peopleInvolved p,directors d 
 WHERE p.pid = d.pid 
   AND p.pid != 'oQ86zGEowZOb'
   AND d.pid 
    IN (SELECT pid 
	  FROM castCrew 
	 WHERE role = 'Director' 
	   AND mid 
	    IN (SELECT mid 
		  FROM castCrew 
		 WHERE pid = 'oQ86zGEowZOb'));