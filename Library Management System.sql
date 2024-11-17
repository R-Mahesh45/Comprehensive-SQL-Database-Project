--                   `Library Management System`                   --

show databases;
create database lib;
use lib;

/*
Project Overview
The goal is to create a system to manage a library's inventory of books, track borrowed books, and manage member information.
*/

/* 
Requirements Analysis:

List the requirements such as tracking books, members, borrowing and returning books, and managing fines.
*/

show tables;

-- Books Table: --
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    published_year INT,
    genre VARCHAR(50)
);

-- Members Table: --
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    join_date DATE
);

--  BorrowedBooks Table: -- 
CREATE TABLE BorrowedBooks (
    borrow_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

/* -- Insert Sample Data:

Books Data:-- */

INSERT INTO Books (book_id, title, author, published_year, genre) VALUES
(1, '1984', 'George Orwell', 1949, 'Dystopian'),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction'),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Classics');

-- Members Data: --
INSERT INTO Members (member_id, name, email, join_date) VALUES
(1, 'John Doe', 'john.doe@example.com', '2022-01-15'),
(2, 'Jane Smith', 'jane.smith@example.com', '2022-05-22');

/* 
Borrow and Return Book Operations:

Borrow a Book: */

INSERT INTO BorrowedBooks (borrow_id, book_id, member_id, borrow_date, return_date) VALUES
(1, 1, 1, '2023-11-10', NULL);

-- Return a Book: --
UPDATE BorrowedBooks
SET return_date = '2023-11-17'
WHERE borrow_id = 1;

SELECT * FROM Books;
SELECT * FROM Members;
select * from BorrowedBooks;

SELECT bb.borrow_id, b.title, m.name, bb.borrow_date, bb.return_date
FROM BorrowedBooks bb
JOIN Books b ON bb.book_id = b.book_id
JOIN Members m ON bb.member_id = m.member_id;


INSERT INTO Books (book_id, title, author, published_year, genre) VALUES
(4, 'Alchimest', 'NA', 2000, 'Story'),
(5, 'wings of fire', 'A.P.J.Abdul Kalam', 2014, 'creative/insperational'),
(6, 'atoimc habbits', 'NA', 2004, 'Daliy Life');


INSERT INTO Members (member_id, name, email, join_date) VALUES
(3, 'Mahesh Rathod', 'mahesh.rathod@example.com', '2024-01-15'),
(4, 'kshitija jadhav', 'jadhav.ksi@example.com', '2025-05-22');