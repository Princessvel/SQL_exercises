--PostgresSQL
-- Create a new database called "School"
--two tables: teachers and students.
--choose own constraints
--ensure all have phone nos, ids as PK
--phone nos and emails UNIQUE
CREATE TABLE students( 
			student_id SERIAL PRIMARY KEY, 
			first_name VARCHAR(50),
			last_name VARCHAR(50), 
			homeroom_number INTEGER UNIQUE, 
			phone VARCHAR(20) NOT NULL UNIQUE,
			email VARCHAR(150) UNIQUE,
			graduation_year INTEGER) ;

SELECT *
FROM students;


-- Insert a student named Mark Watney (student_id=1)
--phone number of 777-555-1234 and doesn't have an email. 
--He graduates in 2035 and has 5 as a homeroom number.

INSERT INTO students(student_id, first_name, last_name, 
					homeroom_number,
					phone,email, graduation_year)
VALUES 
(1, 'Mark','Watney',5,'777-555-1234',NULL,2035);

SELECT *
FROM students;

UPDATE students
SET phone = '777-555-1234';

-- The teachers table columns:
--teacher_id, first_name, last_name,
--homeroom_number, department, email, and phone

CREATE TABLE teachers 
				(teacher_id SERIAL PRIMARY KEY, 
				first_name VARCHAR(50), 
				last_name VARCHAR(50),
				homeroom_number INTEGER, 
				department VARCHAR(200), 
				email VARCHAR(200) UNIQUE,
				phone VARCHAR(20) UNIQUE NOT NULL);

-- Jonas Salk (teacher_id = 1), homeroom # 5 
-- from the Biology department. 
--jsalk@school.org and a phone number of 777-555-4321.
INSERT INTO teachers (teacher_id,first_name,last_name,
homeroom_number,
department,email,phone)
VALUES
(1,'Jonas','Salk',5,'Biology','jsalk@school.org','777-555-4321');

SELECT *
FROM teachers;

SELECT *
FROM students;
