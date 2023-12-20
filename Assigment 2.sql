CREATE TABLE STUDENTS(
STUDENT_ID INT PRIMARY KEY NOT NULL,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
DATE_OF_BIRTH DATE,
EMAIL VARCHAR(50),
PHONE_NUMBER VARCHAR(50)
)

CREATE TABLE TEACHER(
TEACHER_ID INT PRIMARY KEY NOT NULL,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
EMAIL VARCHAR(50),
)

CREATE TABLE COURSES(
COURSE_ID INT PRIMARY KEY NOT NULL,
COURSE_NAME VARCHAR(50),
CREDITS INT,
TEACHER_ID INT FOREIGN KEY REFERENCES TEACHER(TEACHER_ID) ON DELETE CASCADE
)

CREATE TABLE ENROLLMENTS(
ENROLLMENT_ID INT PRIMARY KEY NOT NULL,
STUDENT_ID INT FOREIGN KEY REFERENCES STUDENTS(STUDENT_ID) ON DELETE CASCADE,
COURSE_ID INT FOREIGN KEY REFERENCES COURSES(COURSE_ID) ON DELETE CASCADE,
ENROLLMENT_DATE DATE
)

CREATE TABLE PAYMENTS(
PAYMENT_ID INT PRIMARY KEY NOT NULL,
STUDENT_ID INT FOREIGN KEY REFERENCES STUDENTS(STUDENT_ID) ON DELETE CASCADE,
AMOUNT FLOAT,
PAYMENT_DATE DATE
)

INSERT INTO STUDENTS (STUDENT_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, EMAIL, PHONE_NUMBER)
VALUES
  (1, 'John', 'Doe', '2000-01-15', 'john.doe@email.com', '1234567890'),
  (2, 'Jane', 'Smith', '1999-05-20', 'jane.smith@email.com', '9876543210'),
  (3, 'Alice', 'Johnson', '2001-08-10', 'alice.johnson@email.com', '5551234567'),
  (4, 'Bob', 'Williams', '1998-12-03', 'bob.williams@email.com', '7778889999'),
  (5, 'Eva', 'Brown', '2002-04-25', 'eva.brown@email.com', '1112223333'),
  (6, 'David', 'Miller', '2003-07-18', 'david.miller@email.com', '4445556666'),
  (7, 'Grace', 'Davis', '1997-11-30', 'grace.davis@email.com', '9991112222'),
  (8, 'Sam', 'Jones', '2004-02-14', 'sam.jones@email.com', '3334445555'),
  (9, 'Olivia', 'Taylor', '1996-09-22', 'olivia.taylor@email.com', '6667778888'),
  (10, 'Daniel', 'Clark', '2005-01-08', 'daniel.clark@email.com', '2223334444')

   INSERT INTO TEACHER (TEACHER_ID, FIRST_NAME, LAST_NAME, EMAIL)
VALUES
  (1, 'Sophia', 'Johnson', 'sophia@email.com'),
  (2, 'Oliver', 'Smith', 'oliver@email.com'),
  (3, 'Emma', 'Williams', 'emma@email.com'),
  (4, 'Liam', 'Davis', 'liam@email.com'),
  (5, 'Ava', 'Anderson', 'ava@email.com'),
  (6, 'Noah', 'Martinez', 'noah@email.com'),
  (7, 'Isabella', 'Brown', 'isabella@email.com'),
  (8, 'Jackson', 'Taylor', 'jackson@email.com'),
  (9, 'Sophia', 'Wilson', 'wilson@email.com'),
  (10, 'Lucas', 'Moore', 'lucas@email.com')

  INSERT INTO COURSES (COURSE_ID, COURSE_NAME, CREDITS, TEACHER_ID)
VALUES
  (1, 'Mathematics', 3, 7),
  (2, 'English Literature', 4, 3),
  (3, 'Physics', 3, 10),
  (4, 'History', 3, 4),
  (5, 'Computer Science', 4, 1),
  (6, 'Chemistry', 3, 5),
  (7, 'Art', 2, 6),
  (8, 'Music', 2, 8),
  (9, 'Biology', 3, 2),
  (10, 'Economics', 4, 9)

  INSERT INTO ENROLLMENTS (ENROLLMENT_ID, STUDENT_ID, COURSE_ID, ENROLLMENT_DATE)
VALUES
  (1, 8, 7, '2023-01-15'),
  (2, 3, 3, '2023-02-20'),
  (3, 5, 9, '2023-03-10'),
  (4, 10, 1, '2023-04-03'),
  (5, 1, 6, '2023-05-25'),
  (6, 7, 2, '2023-06-18'),
  (7, 2, 8, '2023-07-30'),
  (8, 6, 4, '2023-08-14'),
  (9, 4, 10, '2023-09-22'),
  (10, 9, 5, '2023-10-08')

  INSERT INTO PAYMENTS (PAYMENT_ID, STUDENT_ID, AMOUNT, PAYMENT_DATE)
VALUES
  (1, 3, 500.00, '2023-01-20'),
  (2, 7, 600.00, '2023-02-25'),
  (3, 1, 450.00, '2023-03-15'),
  (4, 8, 550.00, '2023-04-05'),
  (5, 2, 700.00, '2023-05-30'),
  (6, 10, 480.00, '2023-06-25'),
  (7, 5, 350.00, '2023-08-02'),
  (8, 9, 400.00, '2023-08-20'),
  (9, 4, 600.00, '2023-09-28'),
  (10, 6, 520.00, '2023-10-15')

  -- Write an SQL query to insert a new student into the "Students" table with the following details:a. First Name: Randy b. Last Name: Savage c. Date of Birth: 1995-08-15 d. Email: randy@example.com e. Phone Number: 5372829911

INSERT INTO STUDENTS VALUES(11,'Randy','Savage','1995-08-15','randy@example.com','537289911')

--Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date

INSERT INTO ENROLLMENTS VALUES(11,2,5,'2022-04-14')

--Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address

UPDATE TEACHER SET EMAIL='isa@email.com' WHERE TEACHER_ID=6

--Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on student and course.


DELETE FROM ENROLLMENTS WHERE STUDENT_ID=1 AND COURSE_ID=6

--Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.

UPDATE COURSES SET TEACHER_ID=7 WHERE COURSE_ID=7

--Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity

DELETE FROM STUDENTS WHERE STUDENT_ID=2

--Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.

UPDATE PAYMENTS SET AMOUNT=900 WHERE PAYMENT_ID=8

--JOINS

--Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.



SELECT FIRST_NAME,LAST_NAME,SUM(AMOUNT) AS TOTAL_PAYMENT
FROM STUDENTS
JOIN PAYMENTS
ON STUDENTS.STUDENT_ID=PAYMENTS.STUDENT_ID
GROUP BY FIRST_NAME,LAST_NAME

--Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table


SELECT COURSES.COURSE_NAME,COUNT(ENROLLMENTS.COURSE_ID) AS COUNT_OF_STUDENTS
FROM ENROLLMENTS
RIGHT JOIN COURSES
ON COURSES.COURSE_ID=ENROLLMENTS.COURSE_ID
GROUP BY COURSES.COURSE_NAME

--Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.

SELECT STUDENTS.FIRST_NAME,STUDENTS.LAST_NAME
FROM STUDENTS
LEFT JOIN ENROLLMENTS
ON STUDENTS.STUDENT_ID=ENROLLMENTS.STUDENT_ID
WHERE ENROLLMENTS.STUDENT_ID IS NULL

--Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.

SELECT STUDENTS.FIRST_NAME,STUDENTS.LAST_NAME,COURSES.COURSE_NAME 
FROM STUDENTS
JOIN ENROLLMENTS
ON STUDENTS.STUDENT_ID=ENROLLMENTS.STUDENT_ID
JOIN COURSES
ON ENROLLMENTS.COURSE_ID=COURSES.COURSE_ID
GROUP BY STUDENTS.FIRST_NAME,STUDENTS.LAST_NAME,COURSES.COURSE_NAME

--Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.

SELECT TEACHER.FIRST_NAME,TEACHER.LAST_NAME,COURSES.COURSE_NAME
FROM TEACHER
JOIN COURSES
ON TEACHER.TEACHER_ID=COURSES.TEACHER_ID

--Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.

SELECT STUDENTS.FIRST_NAME,STUDENTS.LAST_NAME,ENROLLMENTS.ENROLLMENT_DATE
FROM STUDENTS
JOIN ENROLLMENTS
ON STUDENTS.STUDENT_ID=ENROLLMENTS.STUDENT_ID
JOIN COURSES
ON ENROLLMENTS.COURSE_ID=COURSES.COURSE_ID
GROUP BY STUDENTS.FIRST_NAME,STUDENTS.LAST_NAME,ENROLLMENTS.ENROLLMENT_DATE

--Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records

SELECT STUDENTS.FIRST_NAME,STUDENTS.LAST_NAME 
FROM STUDENTS
LEFT JOIN PAYMENTS
ON STUDENTS.STUDENT_ID=PAYMENTS.STUDENT_ID
WHERE PAYMENTS.PAYMENT_ID IS NULL

--Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records


SELECT COURSES.COURSE_NAME 
FROM COURSES
LEFT JOIN ENROLLMENTS
ON COURSES.COURSE_ID=ENROLLMENTS.COURSE_ID
WHERE ENROLLMENTS.ENROLLMENT_ID IS NULL

--Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.

SELECT TEACHER.FIRST_NAME,TEACHER.LAST_NAME
FROM TEACHER
LEFT JOIN COURSES
ON TEACHER.TEACHER_ID=COURSES.TEACHER_ID
WHERE COURSES.COURSE_ID IS NULL

--Aggregate Functions and Subqueries

--Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this
--INSERT INTO ENROLLMENTS VALUES(15,8,5,'2023-12-15')
SELECT COURSE_ID,AVG(E_COUNT)AS AVG_COUNT
FROM(SELECT COURSE_ID,COUNT(STUDENT_ID) AS E_COUNT
FROM ENROLLMENTS
GROUP BY COURSE_ID)AS SUBQUERY
GROUP BY COURSE_ID

--Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.

SELECT TEACHER.FIRST_NAME,TEACHER.LAST_NAME
FROM TEACHER
WHERE TEACHER.TEACHER_ID NOT IN(SELECT TEACHER_ID FROM COURSES)

--Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments

SELECT COURSES.COURSE_NAME,COURSES.COURSE_ID,COUNT(ENROLLMENTS.STUDENT_ID)
FROM COURSES
LEFT JOIN ENROLLMENTS
ON COURSES.COURSE_ID=ENROLLMENTS.COURSE_ID
GROUP BY COURSES.COURSE_NAME,COURSES.COURSE_ID

--Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.

SELECT STUDENTS.STUDENT_ID,STUDENTS.FIRST_NAME,STUDENTS.LAST_NAME,AVG(AMOUNT) AS AVG_PAYMENT
FROM STUDENTS
LEFT JOIN PAYMENTS
ON STUDENTS.STUDENT_ID=PAYMENTS.STUDENT_ID
GROUP BY STUDENTS.STUDENT_ID,STUDENTS.FIRST_NAME,STUDENTS.LAST_NAME