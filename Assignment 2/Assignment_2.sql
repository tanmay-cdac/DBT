CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author_id INT,
    published_year YEAR,
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE Borrow_Records (
    record_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

ALTER TABLE Books ADD genre VARCHAR(50);

DROP TABLE Borrow_Records;

INSERT INTO Authors VALUES
(1, 'James Clear', 'USA'),
(2, 'Robert C. Martin', 'USA'),
(3, 'Raghu Ramakrishnan', 'India');

INSERT INTO Books VALUES
(101, 'Atomic Habits', 1, 2018, 10, 'Self-Help'),
(102, 'Clean Code', 2, 2008, 5, 'Programming'),
(103, 'Database Systems', 3, 2017, 4, 'Education'),
(104, 'Deep Work', 1, 2016, 6, 'Productivity'),
(105, 'Agile Software Dev', 2, 2003, 3, 'Software Engineering');

INSERT INTO Members VALUES
(1, 'Tanmay Sawant', 'tanmay@example.com', '9876543210'),
(2, 'Rahul Sharma', 'rahul@example.com', '9123456780'),
(3, 'Aarav Patil', 'aarav@example.com', '9988776655');

INSERT INTO Borrow_Records VALUES
(1001, 1, 103, '2025-01-15', NULL),
(1002, 2, 101, '2025-01-20', '2025-02-01'),
(1003, 3, 104, '2025-01-25', NULL),
(1004, 1, 102, '2025-01-30', NULL);

SELECT * FROM Books WHERE published_year > 2015;

ALTER TABLE Borrow_Records
ADD CONSTRAINT fk_book FOREIGN KEY (book_id)
REFERENCES Books(book_id);

SELECT M.member_id, M.name
FROM Members M
JOIN Borrow_Records BR ON M.member_id = BR.member_id
JOIN Books B ON B.book_id = BR.book_id
WHERE B.title = 'Database Systems';


UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 103;

DELETE FROM Members WHERE member_id = 3;

UPDATE Books
SET title = 'Atomic Habits (Updated Edition)'
WHERE book_id = 101;

SELECT B.title, A.name AS author_name
FROM Books B
JOIN Authors A ON B.author_id = A.author_id;

DELETE FROM Books WHERE published_year < 2000;

SELECT B.book_id, B.title
FROM Books B
LEFT JOIN Borrow_Records BR ON B.book_id = BR.book_id
WHERE BR.book_id IS NULL;
