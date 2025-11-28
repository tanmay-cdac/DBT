SELECT SUM(Salary) AS TotalSalary FROM Employees;

SELECT DeptID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID;

SELECT DeptID, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DeptID;

SELECT DeptID, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 5;

SELECT DISTINCT Location FROM Dept;

SELECT MAX(Salary) AS HighestSalary FROM Employees;

SELECT COUNT(*) AS TotalEmployees FROM Employees;

SELECT * FROM Employees
WHERE EmpName LIKE 'A%';

SELECT * FROM Employees
WHERE EmpName LIKE '%n';

SELECT * FROM Employees
WHERE EmpName LIKE '%ra%';


SELECT * FROM Employees
ORDER BY Salary DESC;

SELECT * FROM Employees
ORDER BY DeptID ASC, Salary DESC;


SELECT * FROM Employees
WHERE Salary BETWEEN 30000 AND 60000;

SELECT * FROM Employees
WHERE DeptID IN (10, 20, 30);

SELECT MIN(Salary) AS MinSalary FROM Employees;

SELECT * FROM Employees
WHERE JoiningDate BETWEEN '2020-01-01' AND '2021-12-31';

SELECT * FROM Employees
WHERE Salary IS NULL;

SELECT * FROM Employees
WHERE Salary IS NOT NULL;

SELECT DeptID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DeptID
HAVING SUM(Salary) > 100000;

SELECT DISTINCT EmpName FROM Employees;

SELECT Location, COUNT(*) AS DeptCount
FROM Dept
GROUP BY Location
HAVING COUNT(*) > 1;