-- SQL Assessment
-- Exercises-- cd

--Retrieve all info from cd.facilities table

SELECT *
FROM cd.facilities;

-- Print all facilities and a list of 
-- cost to members
SELECT name, 
		membercost
FROM cd.facilities;

--facilities that charge a fee to members
SELECT name,
		membercost
FROM cd.facilities
WHERE membercost > 0;

-- facilities that charge a fee
-- fee is 1/50th of monthly maintenance ****
SELECT *
FROM cd.facilities
WHERE membercost > 0
AND (membercost < monthlymaintenance/50);

-- List of activities with the word 'Tennis'

SELECT name
FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- Retrieve details of facilities with IDs 
--1, 5
SELECT *
FROM cd.facilities
WHERE facid IN (1,5);

-- members who joined 
--after start of September 2012
SELECT memid, 
	surname, 
	firstname, 
	joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

-- 1st 10 surnames
--ordered no duplicates
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname
LIMIT 10

-- sign up date of last member
SELECT joindate
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

--Count of facilities 
-- Cost to guest of 10 or more
SELECT COUNT(*), membercost
FROM cd.facilities
WHERE guestcost >= 10; 

--total no of slots booked per facility
-- September 2012
--sort by no of slots

SELECT SUM(slots) AS "Total slots",facid
FROM cd.bookings
WHERE starttime >= '2012-09-01'
AND starttime < '2012-09-30'
GROUP BY facid
ORDER BY SUM(slots);

-- facilities with more than 1000 slots
SELECT facid, SUM(slots) AS "Total_slots"
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

-- list of the start times for bookings by members 
-- named 'David Farrell'?

SELECT b.starttime, m.firstname, m.surname
FROM cd.bookings AS b
INNER JOIN cd.members AS m
ON m.memid = b.memid
WHERE m.firstname ='David'
AND m.surname='Farrell';








