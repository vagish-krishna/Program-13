USE CollegeDB;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(10, 'Computer Science'),
(20, 'Mathematics');


CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Faculty (FacultyID, FacultyName, DepartmentID)
VALUES
(501, 'Dr. Ravi', 10),
(502, 'Dr. Meena', 20);


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

INSERT INTO Student (StudentID, StudentName)
VALUES
(1001, 'Arun'),
(1002, 'Priya'),
(1003, 'Kumar');


CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

INSERT INTO Course (CourseID, CourseName, FacultyID)
VALUES
(201, 'Database Systems', 501),
(202, 'Data Structures', 501),
(203, 'Mathematics', 502);


CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO StudentCourse (StudentID, CourseID)
VALUES
(1001, 201),
(1001, 202),
(1002, 203),
(1003, 201);


SELECT
    Student.StudentID,
    Student.StudentName,
    Course.CourseName,
    Faculty.FacultyName,
    Department.DepartmentName
FROM Student
INNER JOIN StudentCourse
    ON Student.StudentID = StudentCourse.StudentID
INNER JOIN Course
    ON StudentCourse.CourseID = Course.CourseID
INNER JOIN Faculty
    ON Course.FacultyID = Faculty.FacultyID
INNER JOIN Department
    ON Faculty.DepartmentID = Department.DepartmentID;
