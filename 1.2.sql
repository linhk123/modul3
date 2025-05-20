CREATE DATABASE QuanLy_SinhVien;
USE QuanLy_SinhVien;
CREATE TABLE Class(
         ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          ClassName VARCHAR(60) NOT NULL,
          StartDate DATETIME NOT NULL,
          Status BIT
);
CREATE TABLE Student(
          StudentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          StudentName VARCHAR(30) NOT NULL,
          Address VARCHAR(50),
          Phone VARCHAR(20),
          Status BIT,
          ClassId INT NOT NULL,
          FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subject(
         SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         SubName VARCHAR(30) NOT NULL,
         Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
         Status BIT DEFAULT 1
);
CREATE TABLE Mark(
        MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        SubId INT NOT NULL,
        StudentId INT NOT NULL,
        Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
        ExamTimes TINYINT DEFAULT 1,
        UNIQUE (SubId, StudentId),
        FOREIGN KEY (SubId) REFERENCES Subject (SubId),
        FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
 );
 SELECT * FROM Student;
SELECT * FROM Student WHERE Status = true;
SELECT * FROM Subject WHERE Credit < 10;
SELECT S.StudentId, S.StudentName, C.ClassName FROM Student S join Class C on S.ClassId = C.ClassID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';