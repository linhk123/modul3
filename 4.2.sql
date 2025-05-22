USE QuanLy_SinhVien;

SELECT *
FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

SELECT DISTINCT Sub.*
FROM Subject Sub
JOIN Mark M ON Sub.SubId = M.SubId
WHERE M.Mark = (SELECT MAX(Mark) FROM Mark);

SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS AverageMark
FROM Student S
JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
ORDER BY AverageMark DESC;
