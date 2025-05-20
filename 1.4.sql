create database quanlysinhvien;
use quanlysinhvien;
create table class(
	ClassID int primary key auto_increment,
    ClassName varchar(225),
    StartDate date,
    Status int
);
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

create table Student(
	StudentID int primary key auto_increment,
    StudentName varchar(225),
    Address varchar(225),
    Phone varchar(225),
	status int, classID int,
    foreign key (classID) references class(ClassID)
);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

create table Subject(
	SubID int primary key auto_increment,
    SubName varchar(225),
    Credit int,
    status int
);
INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
create table Mark(
	MarkID int primary key auto_increment,
    subID int,
    StudentID int,
    mark int,
    ExamTimes int,
    foreign key (subID) references Subject(SubID),
    foreign key (StudentID) references Student(StudentID)
);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);

SELECT * 
FROM Student
WHERE StudentName LIKE 'h%';

SELECT * 
FROM Class
WHERE MONTH(StartDate) = 12;

SELECT * 
FROM Subject
WHERE Credit BETWEEN 3 AND 5;

UPDATE Student
SET ClassID = 2
WHERE StudentName = 'Hung';

SELECT s.StudentName, sb.SubName, m.Mark
FROM Mark m
JOIN Student s ON m.StudentID = s.StudentID
JOIN Subject sb ON m.SubID = sb.SubID
ORDER BY m.Mark DESC, s.StudentName ASC;

