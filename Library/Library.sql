/*-------------------------------------------------------
ENSURE THAT THE FOLLOWING CONDITIONS ARE TRUE: 
* There is a book called 'The Lost Tribe' found in the 'Sharpstown' branch. 
* There is a library branch called 'Sharpstown' and one called 'Central'. 
* There are at least 20 books in the BOOK table. 
* There are at least 10 authors in the BOOK_AUTHORS table. 
* Each library branch has at least 10 book titles, and at least two copies of each of those titles. 
* There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them. 
* There are at least 4 branches in the LIBRARY_BRANCH table. 
* There are at least 50 loans in the BOOK_LOANS table.
* There must be at least two books written by 'Stephen King' located at the 'Central' branch.
-------------------------------------------------------*/



/*----------------------------------------------*/
/*  Create the database for the library system  */
/*----------------------------------------------*/

CREATE DATABASE Library;
USE Library;

/*----------------------------------------------*/
/*         Create all database tables           */
/*----------------------------------------------*/

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY IDENTITY(1,1),
	BranchName VARCHAR(20),
	Address VARCHAR(100)
);

CREATE TABLE Publisher (
	PublisherName VARCHAR(100) PRIMARY KEY,
	Address VARCHAR(100),
	Phone VARCHAR(20)
);

CREATE TABLE Books (
	BookID INT PRIMARY KEY,
	Title VARCHAR(100),
	PublisherName VARCHAR(100) FOREIGN KEY REFERENCES Publisher(PublisherName)
);

CREATE TABLE Book_Authors (
	BookID INT FOREIGN KEY REFERENCES Books(BookID),
	AuthorName VARCHAR(100)
);


CREATE TABLE Book_Copies (
	BookID INT FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID),
	Number_Of_Copies INT
);

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY,
	Name VARCHAR(100),
	Address VARCHAR(100),
	Phone VARCHAR(20)
);

CREATE TABLE Book_Loans (
	BookID INT FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID),
	CardNo INT FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE,
	DateDue DATE
);



/*----------------------------------------------*/
/*        Populate all database tables          */
/*----------------------------------------------*/

INSERT INTO Library_Branch (BranchName, Address)
	VALUES
	('Sharpstown','17455 SW Farmington Rd, Ste. 26A, Sharptown, OR 97078'),
	('Central','12505 NW Cornell Rd, Suite 13, Portland, OR 97229'),
	('Beaverton','11200 SW Murray Scholls Pl, Suite 102, Beaverton, OR 97007'),
	('Tigard','13500 SW Hall Blvd, Tigard, OR 97223');

INSERT INTO Publisher (PublisherName, Address, Phone)
	VALUES
	('Move Books','P.O. Box 183, Beacon Falls, CT 06403','203-709-0490'),
	('Scribner','1230 Avenue of the Americas, New York, New York 10020','212-698-7000'),
	('Gallery Books','137 Varick Street, New York NY 10013','212-366-5585'),
	('Self-Taught Media','57 Littlefield Street, Avon MA 02322','508-427-7100'),
	('CreateSpace Independent Publishing Platform','10 East 23rd Street #210, New York, NY 10010','212-777-8395'),
	('Wiley','15 West 26th Street, New York NY 10010','212-857-3113'),
	('Sams Publishing','P O Box 59026, Philadelphia PA 19102','215-413-1917'),
	('McGraw-Hill Education','1221 Ave. of the Americas, New York, N.Y. 10020-1095','212-904-2000'),
	('Apress','233 Spring Street, New York, NY 10013','800-777-4643'),
	('Wrox','12 Parish Drive, Wayne, NJ 07470','201-848-0310'),
	('Microsoft Press','10 East 53rd Street, New York NY 10022','212-207-7541'),
	('Learn Coding Fast','6860 Gulfport Avenue S #950, South Pasadena FL 33707','866-623-6203'),
	('O''Reilly Media','1005 Gravenstein Highway North, Sebastopol, CA 95472','707-827-7000'),
	('CareerCup','1745 Broadway, New York NY 10019','212-782-9000');


INSERT INTO Books (BookID, Title, PublisherName)
	VALUES
	(1001,'The Lost Tribe', 'Move Books'),
	(1002,'Sleeping Beauties','Scribner'),
	(1003,'11/22/63','Gallery Books'),
	(1004,'The Self-Taught Programmer','Self-Taught Media'),
	(1005,'HTML5 for Masterminds','CreateSpace Independent Publishing Platform'),
	(1006,'CSS3 Foundations','Wiley'),
	(1007,'Bootstrap in 24 Hours','Sams Publishing'),
	(1008,'JavaScript and JQuery','Wiley'),  
	(1009,'Ajax: The Complete Reference','McGraw-Hill Education'),  
	(1010,'Visual Studio Code Distilled','Apress'), 
	(1011,'Professional Visual Studio 2017','Wrox'),
	(1012,'SQL in 10 Minutes','Sams Publishing'), 
	(1013,'T-SQL Fundamentals','Microsoft Press'), 
	(1014,'Introducing Microsoft SQL Server 2016','Microsoft Press'),
	(1015,'C#: Learn C# in One Day and Learn It Well','Learn Coding Fast'),
	(1016,'Microsoft .NET - Architecting Applications for the Enterprise','O''Reilly Media'),
	(1017,'Pro ASP.NET Core MVC 2','Apress'), 
	(1018,'Learning Agile: Understanding Scrum, XP, Lean, and Kanban','O''Reilly Media'),
	(1019,'Cracking the Coding Interview','CareerCup'),
	(1020,'Programming Interviews Exposed','Wiley');
				

INSERT INTO Book_Authors (BookID,AuthorName)
	VALUES
	(1001,'C. Taylor-Butler'),
	(1002,'Stephen King'),
	(1003,'Stephen King'),
	(1004,'Cory Althoff'),
	(1005,'J.D. Gauchat'),
	(1006,'Ian Lunn'),
	(1007,'Jennifer Kyrnin'),
	(1008,'Jon Duckett'),
	(1009,'Thomas A. Powell'),
	(1010,'Alessandro Del Sole'),
	(1011,'Bruce Johnson'),
	(1012,'Ben Forta'),
	(1013,'Itzik Ben-Gan'),
	(1014,'Stacia Varga'),
	(1015,'Jamie Chan'),
	(1016,'Dino Esposito'),
	(1017,'Adam Freeman'),
	(1018,'Andrew Stellman'),
	(1019,'Gayle Laakmann McDowell'),
	(1020,'John Mongan');


INSERT INTO Book_Copies (BookID, BranchID, Number_Of_Copies)
	VALUES
	(1001,1,10),
	(1001,2,6),
	(1002,2,11),
	(1003,3,2),
	(1004,4,7),
	(1005,3,4),
	(1006,2,7),
	(1007,1,9),
	(1008,2,10),
	(1009,3,4),
	(1010,4,5),
	(1011,3,8),
	(1012,2,3),
	(1013,1,2),
	(1014,2,9),
	(1015,3,7),
	(1016,4,8),
	(1017,3,5),
	(1018,2,3),
	(1019,1,9),
	(1020,2,2),
	(1001,3,10),
	(1001,4,6),
	(1002,3,11),
	(1003,2,2),
	(1004,1,7),
	(1005,2,4),
	(1006,3,7),
	(1007,4,9),
	(1008,3,10),
	(1009,2,4),
	(1010,1,5),
	(1011,4,8),
	(1012,3,3),
	(1013,4,2),
	(1014,1,9),
	(1015,4,7),
	(1016,1,8),
	(1017,4,5),
	(1018,1,3),
	(1019,4,9),
	(1020,1,2);



INSERT INTO Borrower (CardNo,Name,Address,Phone)
	VALUES
	(2938751,'John Smith','123 NW Washington Ave., Portland, OR, 97201','123-456-7890'), 
	(2938752,'Jane Smith','456 NE Main St., Portland, OR, 97202','234-567-8901'), 
	(2938753,'Jane Doe','789 W Jefferson Blvd., Portland, OR, 97203','345-678-9012'), 
	(2938754,'Adam Baker','135 SE Adams St., Portland, OR, 97204','456-789-0123'), 
	(2938755,'Sam Washington','246 NW Jay Ave., Portland, OR, 97205','567-890-1234'),
	(2938756,'Thomas Adams','579 E Quincy Rd., Portland, OR, 97206','678-901-2345'),
	(2938757,'Joe Miller','468 S Van Buren Blvd., Portland, OR, 97207','789-012-3456'),
	(2938758,'Todd Johnson','357 SW Franklin St., Portland, OR, 97208','890-123-4567'),
	(2938759,'Jon Jones','1212 N Alexander Ave., Portland, OR, 97209','901-234-5678'),
	(2938760,'Beth Carter','6789 E Madison Rd., Portland, OR, 97210','246-813-5790');


INSERT INTO Book_Loans (BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1001,1,2938751,'2018-10-13','2018-11-13'),
	(1002,2,2938752,'2018-10-13','2018-11-13'),
	(1003,3,2938753,'2018-10-13','2018-11-13'),
	(1004,4,2938754,'2018-08-05','2018-09-05'),
	(1005,3,2938755,'2018-09-30','2018-10-31'),
	(1006,2,2938756,'2018-10-01','2018-11-01'),
	(1007,1,2938757,'2018-10-23','2018-11-23'),
	(1008,2,2938758,'2018-10-13','2018-11-13'),
	(1009,3,2938751,'2018-10-13','2018-11-13'),
	(1010,4,2938752,'2018-10-13','2018-11-13'),
	(1011,3,2938753,'2018-10-13','2018-11-13'),
	(1012,2,2938754,'2018-08-05','2018-09-05'),
	(1013,1,2938755,'2018-09-30','2018-10-31'),
	(1014,2,2938756,'2018-10-01','2018-11-01'),
	(1015,3,2938757,'2018-10-23','2018-11-23'),
	(1016,4,2938758,'2018-11-13','2018-12-13'),
	(1017,3,2938751,'2018-11-13','2018-12-13'),
	(1018,2,2938752,'2018-11-13','2018-12-13'),
	(1019,1,2938753,'2018-10-13','2018-11-13'),
	(1020,2,2938754,'2018-08-05','2018-09-05'),
	(1001,1,2938755,'2018-09-30','2018-10-31'),
	(1002,2,2938756,'2018-10-01','2018-11-01'),
	(1003,3,2938757,'2018-10-23','2018-11-23'),
	(1004,4,2938758,'2018-11-13','2018-12-13'),
	(1005,3,2938751,'2018-11-13','2018-12-13'),
	(1006,2,2938752,'2018-11-13','2018-12-13'),
	(1007,1,2938753,'2018-10-13','2018-11-13'),
	(1008,2,2938754,'2018-08-05','2018-09-05'),
	(1009,3,2938755,'2018-09-30','2018-10-31'),
	(1010,4,2938756,'2018-10-01','2018-11-01'),
	(1011,3,2938757,'2018-10-23','2018-11-23'),
	(1012,2,2938758,'2018-11-13','2018-12-13'),
	(1013,1,2938751,'2018-10-13','2018-11-13'),
	(1014,2,2938752,'2018-11-13','2018-12-13'),
	(1015,3,2938753,'2018-11-13','2018-12-13'),
	(1016,4,2938754,'2018-08-05','2018-09-05'),
	(1017,3,2938755,'2018-09-30','2018-10-31'),
	(1018,2,2938756,'2018-10-01','2018-11-01'),
	(1019,1,2938757,'2018-10-23','2018-11-23'),
	(1020,2,2938758,'2018-11-13','2018-12-13'),
	(1001,1,2938751,'2018-10-13','2018-11-13'),
	(1002,2,2938752,'2018-11-13','2018-12-13'),
	(1003,3,2938753,'2018-11-13','2018-12-13'),
	(1004,4,2938754,'2018-08-05','2018-09-05'),
	(1005,3,2938755,'2018-09-30','2018-10-31'),
	(1006,2,2938756,'2018-10-01','2018-11-01'),
	(1007,1,2938757,'2018-10-23','2018-11-23'),
	(1008,2,2938758,'2018-11-13','2018-12-13'),
	(1009,3,2938751,'2018-11-13','2019-12-13'),
	(1010,4,2938752,'2018-11-13','2019-12-13');	





/*----------------------------------------------*/
/*                Query tables                  */
/*----------------------------------------------*/

-- 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? 
SELECT B.Title, L.BranchName, C.Number_Of_Copies FROM Book_Copies AS C
	INNER JOIN Books AS B ON B.BookID = C.BookID
	INNER JOIN Library_Branch AS L ON L.BranchID = C.BranchID
	WHERE B.Title = 'The Lost Tribe' AND L.BranchName = 'Sharpstown';


-- 2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch? 
SELECT B.Title, L.BranchName, C.Number_Of_Copies FROM Book_Copies AS C
	INNER JOIN Books AS B ON B.BookID = C.BookID
	INNER JOIN Library_Branch AS L ON L.BranchID = C.BranchID
	WHERE B.Title = 'The Lost Tribe';


-- 3.) Retrieve the names of all borrowers who do not have any books checked out. 
SELECT P.Name, COUNT(BL.CardNo) AS '# Books Borrowed' FROM Borrower AS P
	LEFT JOIN Book_Loans AS BL ON P.CardNo = BL.CardNo -- requires left join because some borrowers from first Borrower table will not exist in the second Book_Loans table
	GROUP BY P.Name, BL.CardNo
	HAVING COUNT(BL.CardNo) = 0;


-- 4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. 
--     Today is 11/13/18
SELECT B.Title, P.Name, P.Address, LB.BranchName, BL.DateDue FROM Book_Loans AS BL
	INNER JOIN Books AS B ON BL.BookID = B.BookID
	INNER JOIN Borrower AS P ON BL.CardNo = P.CardNo
	INNER JOIN Library_Branch AS LB ON BL.BranchID = LB.BranchID
	WHERE LB.BranchName = 'Sharpstown' AND BL.DateDue = '2018-11-13'; -- Or use CONVERT(date, GETDATE()) to auto update for the real date


-- 5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch. 
SELECT LB.BranchName, COUNT(BL.BranchID) AS '# of Books on Loan' FROM Library_Branch AS LB
	INNER JOIN Book_Loans AS BL ON LB.BranchID = BL.BranchID
	GROUP BY BL.BranchID, LB.BranchName;


-- 6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out. 
SELECT P.Name, P.Address, COUNT(BL.CardNo) AS '# of Books Checked Out' FROM Book_Loans AS BL
	INNER JOIN Borrower AS P ON BL.CardNo = P.CardNo
	GROUP BY BL.CardNo, P.Name, P.Address
	HAVING COUNT(BL.CardNo) > 5;


-- 7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central". 
SELECT BA.AuthorName, B.Title, LB.BranchName, BC.Number_Of_Copies FROM Book_Authors AS BA
	INNER JOIN Books AS B ON BA.BookID = B.BookID
	INNER JOIN Book_Copies AS BC ON BC.BookID = B.BookID
	INNER JOIN Library_Branch AS LB ON LB.BranchID = BC.BranchID
	WHERE BA.AuthorName = 'Stephen King' AND LB.BranchName = 'Central';


	



/*----------------------------------------------*/
/*      Verify Project Conditions Are Met       */
/*----------------------------------------------*/

-- * There is a book called 'The Lost Tribe' found in the 'Sharpstown' branch. 
SELECT LB.BranchName, B.Title, BC.Number_Of_Copies FROM Books AS B
	INNER JOIN Book_Copies AS BC ON B.BookID = BC.BookID
	INNER JOIN Library_Branch AS LB ON BC.BranchID = LB.BranchID
	WHERE B.Title = 'The Lost Tribe' AND LB.BranchName = 'Sharpstown';  --> Yes


-- * There is a library branch called 'Sharpstown' and one called 'Central'. 
SELECT LB.BranchID, LB.BranchName FROM Library_Branch AS LB
	WHERE LB.BranchName = 'Sharpstown' OR LB.BranchName = 'Central';  --> Yes


-- * There are at least 20 books in the BOOK table.
SELECT COUNT(B.Title) AS 'Total # of Books' FROM Books AS B; --> There are 20 books total


-- * There are at least 10 authors in the BOOK_AUTHORS table. 
SELECT COUNT(DISTINCT BA.AuthorName) AS 'Total # of Authors' FROM Book_Authors AS BA  --> There are 19 total authors
	

-- * Each library branch has at least 10 book titles, and at least two copies of each of those titles. 
SELECT LB.BranchName, COUNT(LB.BranchName) AS '# of Book Titles' FROM Library_Branch AS LB
	INNER JOIN Book_Copies AS BC ON LB.BranchID = BC.BranchID
	GROUP BY LB.BranchName
	ORDER BY LB.BranchName;		--> Each branch has either 10 or 11 unique titles


-- * There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them. 
SELECT COUNT(DISTINCT P.Name) AS 'Total # of Borrowers' FROM Borrower AS P;  --> There are 10 total borrowers


-- * There are at least 4 branches in the LIBRARY_BRANCH table. 
SELECT COUNT(DISTINCT LB.BranchName) AS 'Total # of Branches' FROM Library_Branch AS LB;  --> There are 4 total branches


-- * There are at least 50 loans in the BOOK_LOANS table.
SELECT COUNT(*) AS 'Total # of Loans' FROM Book_Loans AS BL;  --> There are 50 total loans


-- * There must be at least two books written by 'Stephen King' located at the 'Central' branch.
SELECT BA.AuthorName, B.Title, LB.BranchName, BC.Number_Of_Copies FROM Book_Authors AS BA
	INNER JOIN Books AS B ON BA.BookID = B.BookID
	INNER JOIN Book_Copies AS BC ON BC.BookID = B.BookID
	INNER JOIN Library_Branch AS LB ON LB.BranchID = BC.BranchID
	WHERE BA.AuthorName = 'Stephen King' AND LB.BranchName = 'Central';





