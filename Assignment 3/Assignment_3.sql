-- Create Department table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) UNIQUE,
    Location VARCHAR(100)
);

-- Sample Insert
INSERT INTO Department VALUES
(10, 'IT', 'Mumbai'),
(20, 'HR', 'Delhi'),
(30, 'Finance', 'Pune');

-- Create Employee table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert Sample Employees
INSERT INTO Employee VALUES
(101, 'Tanmay', 60000, '2023-01-10', 10),
(102, 'Aarav', 45000, '2023-02-12', 20),
(103, 'Priya', 52000, '2023-03-15', 30),
(104, 'Rohan', 75000, '2022-12-09', 10),
(105, 'Neha', 48000, '2022-11-10', 20);

ALTER TABLE Employee ADD Email VARCHAR(100);

INSERT INTO Employee VALUES
(106, 'Suresh', 55000, '2023-05-18', 10),
(107, 'Mahesh', 43000, '2023-06-20', 20),
(108, 'Nisha', 65000, '2023-07-01', 30),
(109, 'Ravi', 70000, '2023-01-28', 10),
(110, 'Aditi', 47000, '2023-03-03', 20);

DELETE FROM Employee;

UPDATE Employee
SET Salary = Salary + 5000
WHERE EmpID = 5;

GRANT SELECT ON Employee TO readonly_user;

🔐 7️⃣ Revoke INSERT privilege
REVOKE INSERT ON Employee FROM temp_user;

INSERT INTO Employee VALUES (111, 'Kiran', 58000, '2024-01-15', 30);
COMMIT;

UPDATE Employee
SET Salary = 65000
WHERE EmpID = 101;
COMMIT;

SAVEPOINT beforeDeptUpdate;

UPDATE Employee
SET DeptID = 20
WHERE EmpID = 104;

ROLLBACK TO beforeDeptUpdate;

TRUNCATE TABLE Employee;

SELECT * FROM Employee WHERE Salary > 50000;

UPDATE Employee
SET Salary = Salary * 1.10
WHERE DeptID = 10;

SELECT DeptID, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DeptID;

SELECT D.DeptID, D.DeptName
FROM Department D
LEFT JOIN Employee E ON D.DeptID = E.DeptID
WHERE E.EmpID IS NULL;

CREATE VIEW MumbaiSales AS
SELECT * FROM Employee
WHERE DeptID = 10 AND DeptID IN (
    SELECT DeptID FROM Department WHERE Location = 'Mumbai'
);

SELECT MAX(Salary) AS HighestSalary FROM Employee;

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);

SELECT * FROM Employee
ORDER BY JoiningDate DESC;

ALTER TABLE Department
CHANGE DeptName DepartmentName VARCHAR(100);
