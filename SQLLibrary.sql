CREATE DATABASE library
USE library

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT NOT NULL,
	BranchName CHAR(50) NULL,
	Address CHAR(75) NULL,
	PRIMARY KEY (BranchID)
	);

CREATE TABLE PUBLISHER (
	PublisherName CHAR(50) NOT NULL,
	Address CHAR(75) NULL,
	Phone VARCHAR(20) NULL,
	PRIMARY KEY (PublisherName)
	);

CREATE TABLE BOOKS (
	BookID INT NOT NULL,
	Title VARCHAR(50) NULL,
	PublisherName CHAR(50) NULL,
	PRIMARY KEY (BookID),
	CONSTRAINT FK_PUBLISHERBOOKS FOREIGN KEY (PublisherName) REFERENCES PUBLISHER(PublisherName)
	);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NULL,
	AuthorName CHAR(50) NULL,
	CONSTRAINT FK_BOOKSAUTHORS FOREIGN KEY (BookID) REFERENCES BOOKS(BookID)
	);

CREATE TABLE BOOK_COPIES (
	BookID INT NULL,
	BranchID INT NULL,
	Number_Of_Copies INT NULL,
	CONSTRAINT FK_LIBRARY_BRANCHBOOK_COPIES FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH(BranchID),
	CONSTRAINT FK_BOOKSBOOK_COPIES FOREIGN KEY (BookID) REFERENCES BOOKS(BookID)
	);


CREATE TABLE BORROWER (
	CardNo INT NOT NULL,
	Name CHAR(50) NULL,
	Address VARCHAR(75) NULL,
	Phone VARCHAR(20) NULL,
	PRIMARY KEY (CardNo)
	);	

CREATE TABLE BOOK_LOANS (
	BookID INT NULL,
	BranchID INT NULL,
	CardNo INT NULL,
	DateOut DATE NULL,
	DateDue DATE NULL,
	CONSTRAINT FK_BOOKSBOOKLOANS FOREIGN KEY (BookID) REFERENCES BOOKS(BookID),
	CONSTRAINT FK_BORROWEROOKLOANS FOREIGN KEY (CardNo) REFERENCES BORROWER(CardNo)
	);		


	INSERT INTO LIBRARY_BRANCH 
		(BranchID, BranchName, Address)
		VALUES
		(111, 'Central', '123 SW Union Ave. Portland, OR 97217'),
		(222, 'Kenton', '256 NW Uptown Ave. Portland, OR 97224'),
		(333, 'Lovey', '345 SE 122nd Ave. Portland, OR 97080'),
		(444, 'Sharpstown', '478 NE Knife Ave. Portland, OR 97090')
		;

	INSERT INTO PUBLISHER
		(PublisherName, Address, Phone)
		VALUES
		('Nowhere?', '2020 Nowhere Ln. New York, NY 10002', '718-212-5628'),
		('Somewhere', '777 Somewhere Ave. New York, NY 10003', '718-777-7171')
		;

	INSERT INTO BOOKS
		(BookID, Title, PublisherName)
		VALUES
		(001, 'Winner Winner Chicken Dinner', 'Nowhere?'),
		(002, 'Next Great Horror Story', 'Somewhere'),
		(003, 'The Uninvited Third Wheel', 'Somewhere'),
		(004, 'Read this if You Want to Be Great at That!', 'Nowhere?'),
		(005, 'I Know How to Scare You', 'Somewhere'),
		(006, 'Is it an Evil Number?', 'Nowhere?' ),
		(007, 'Seven Heaven', 'Nowhere?' ),
		(008, 'The Eights of Wrath','Somewhere' ),
		(009, 'Forty9ers Fans Read This', 'Somewhere' ),
		(010, 'The Litte Red Ten', 'Somewhere'),
		(011, 'Rivers Eleven', 'Somewhere'),
		(012, 'The Twelve Steps Back Program','Somewhere' ),
		(013, 'This is One Lucky Number', 'Somewhere'),
		(014, 'The Agonies to Teenagehood', 'Somewhere' ),
		(015, 'Fifteen Lit Candles','Nowhere?' ),
		(016, 'Bitter Sixteen',  'Somewhere'),
		(017, 'One More Year' ,'Nowhere?' ),
		(018, 'Your Finally a Legal Age, Now What?','Somewhere'),
		(019, 'I have a lot of books', 'Nowhere?'),
		(020, 'The Lost Tribe', 'Nowhere?'),
		(021, 'BlackJack', 'Somewhere')
		;

	INSERT INTO BOOK_AUTHORS
		(BookID, AuthorName)
		VALUES
		(001, 'Combo Panda'),
		(002, 'Stephen King'),
		(003, 'Owelette'),
		(004, 'Catboy'),
		(005, 'Gekko'),
		(006, 'Gus The Gator' ),
		(007, 'Seven Heaven'),
		(008, 'Mulan' ),
		(009, 'Ariel' ),
		(010, 'kei kei'),
		(011, 'Moana'),
		(012, 'McQueen' ),
		(013, 'Ben Ten'),
		(014, 'Doc McStuffins' ),
		(015, 'Prince Charming' ),
		(016, 'Shrek The Great'),
		(017, 'Aria Stark' ),
		(018, 'Moana'),
		(019, 'Stephen King'),
		(020, 'Gekko'),
		(021, 'Combo Panda')
		;

		INSERT INTO BOOK_COPIES
		(BookID, BranchID, Number_Of_Copies)
		VALUES
		(001,111, 5),(002,111,25),(004,111,5),(005,111,4),(006,111,5),(007,111,5),(008,111,5),(009,111,2),(010,111,2),
		(011,111,5),(012,111,4),(013,111,5),(014,111,6),(015,111,7),(016,111,6),(017,111,5),(018,111,10),(019,111,20),
		(021,111,5),

		(001,222, 5),(004,222,5),(005,222,4),(007,222,5),(008,222,5),(009,222,2),(010,222,2),
		(011,222,5),(012,222,4),(013,222,5),(014,222,6),(015,222,7),(016,222,6),(017,222,5),(018,222,7),

		(001,333, 5),(004,333,5),(005,333,4),(007,333,5),(008,333,5),(009,333,2),(010,333,2),
		(011,333,5),(012,333,4),(013,333,5),(014,333,6),(015,333,7),(016,333,6),(017,333,5),(018,333,7),

		(001,444, 5),(002,444,25),(004,444,5),(005,444,4),(006,444,5),(007,444,5),(008,444,5),(009,444,2),(010,444,2),
		(011,444,5),(012,444,4),(013,444,5),(014,444,6),(015,444,7),(016,444,6),(017,444,5),(018,444,10),(020,444,5),
		(021,444,5)
		;

		INSERT INTO BORROWER
		(CardNo,Name,Address,Phone)
		VALUES
		(5200,'John Jacob', '122 5th St. Portland, OR 97214', '503-727-1111'),
		(5201,'Kara Bear', '354 SW Tenth Place Portland, OR 97217', '971-356-5566'),
		(5202,'Cats Cat', '657 SW Tenth Place Portland, OR 97217', '503-616-5533'),
		(5203,'Jenny Jones', '565 NW Kane Drive Gresham, OR 97080', '503-212-6632'),
		(5204,'Carolyn Smith', '656 SW Tenth Place Portland, OR 97217', '503-444-3333'),
		(5205,'Tara Gary', '452 NW Top Ave. Gresham, OR 97080', '503-317-1456'),
		(5206,'Terry, Jerry', '5566 SW Maryland Lane Gresham, OR 97080', '503-785-2244'),
		(5207,'Debbie Dubs', '456 California Drive. Portland, OR 97214', '503-957-7569'),
		(5208,'Carmine Minecraft', '555 Minecraft Way Portland, OR 97214', '503-442-2255'),
		(5209, 'Maddox Madmax', '554 Maddog Way Portland, OR 97214', '503-448-5522')
		;

		INSERT INTO BOOK_LOANS
		(BookID,BranchID,CardNo,DateOut,DateDue)
		VALUES
		(1,111,5209,'2018-12-31','2019-01-03');
		
		INSERT INTO BOOK_LOANS
		(BookID,BranchID,CardNo,DateOut,DateDue)
		VALUES
		(1,333,5201,'2019-01-03','2019-02-03'),(18,333,5201,'2019-01-03','2019-02-03'),(17,333,5201,'2019-01-03','2019-02-03'),
		(16,333,5201,'2019-01-03','2019-02-03'),(10,333,5201,'2019-01-03','2019-02-03'),(9,333,5201,'2019-01-03','2019-02-03'),
		(11,333,5201,'2019-01-03','2019-02-03'),(13,333,5201,'2019-01-03','2019-02-03'),(5,333,5208,'2019-01-03','2019-02-03'),
		(8,333,5208,'2019-01-03','2019-02-03'),(15,333,5208,'2019-01-03','2019-02-03'),(16,333,5208,'2019-01-03','2019-02-03'),
		(18,111,5206,'2019-01-03','2019-02-03'),(1,111,5206,'2019-01-03','2019-02-03'),(2,111,5206,'2019-01-03','2019-02-03'),
		(4,111,5206,'2019-01-03','2019-02-03'),(5,111,5206,'2019-01-03','2019-02-03'),(6,111,5206,'2019-01-03','2019-02-03'),
		(8,111,5206,'2019-01-03','2019-02-03'),(9,111,5206,'2019-01-03','2019-02-03'),(10,111,5206,'2019-01-03','2019-02-03'),
		(1,222,5202,'2019-01-03','2019-02-03'),(4,222,5202,'2019-01-03','2019-02-03'),(5,222,5202,'2019-01-03','2019-02-03'),
		(7,222,5202,'2019-01-03','2019-02-03'),(8,222,5202,'2019-01-03','2019-02-03'),(9,222,5202,'2019-01-03','2019-02-03'),
		(10,222,5202,'2019-01-03','2019-02-03'),(11,222,5202,'2019-01-03','2019-02-03'),(12,222,5202,'2019-01-03','2019-02-03'),
		(14,222,5205,'2019-01-03','2019-02-03'),(15,222,5205,'2019-01-03','2019-02-03'),(16,222,5205,'2019-01-03','2019-02-03'),
		(1,444,5209,'2019-01-03','2019-02-03'),(2,444,5209,'2019-01-03','2019-02-03'),(4,444,5209,'2019-01-03','2019-02-03'),
		(6,444,5209,'2019-01-03','2019-02-03'),(7,444,5209,'2019-01-03','2019-02-03'),(8,444,5209,'2019-01-03','2019-02-03'),
		(15,444,5207,'2019-01-03','2019-02-03'),(6,444,5207,'2019-01-03','2019-02-03'),(7,444,5207,'2019-01-03','2019-02-03'),
		(14,444,5207,'2019-01-03','2019-02-03'),(16,444,5207,'2019-01-03','2019-02-03'),(12,444,5207,'2019-01-03','2019-02-03'),
		(1,444,5207,'2019-01-03','2019-02-03'),(2,444,5207,'2019-01-03','2019-02-03'),(4,444,5207,'2019-01-03','2019-02-03'),
		(2,444,5204,'2019-01-03','2019-02-03'),(15,444,5204,'2019-01-03','2019-02-03'),(18,444,5204,'2019-01-03','2019-02-03')
		;
		END

		INSERT INTO BOOK_LOANS
		(BookID,BranchID,CardNo,DateOut,DateDue)
		VALUES
		(21,444,5200,'2018-12-15','2019-01-15');
		

		/* DONE 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */
		CREATE PROCEDURE sharpstown_CNT#1
		AS
		BEGIN
			SELECT BOOKS.Title,LIBRARY_BRANCH.BranchName,BOOK_COPIES.Number_Of_Copies
			FROM LIBRARY_BRANCH
			INNER JOIN BOOK_COPIES
			ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
			INNER JOIN BOOKS
			ON BOOK_COPIES.BookID = BOOKS.BookID
			WHERE BOOKS.Title = 'The Lost Tribe' AND LIBRARY_BRANCH.BranchName = 'Sharpstown';
		END
		GO

		/* DONE 2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

		CREATE PROCEDURE LT_ALL#2
		AS
		BEGIN
			SELECT LIBRARY_BRANCH.BranchName,BOOKS.Title,BOOK_COPIES.Number_Of_Copies
			FROM LIBRARY_BRANCH
			right join BOOK_COPIES
			ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
			right join BOOKS
			ON BOOK_COPIES.BookID = BOOKS.BookID
			WHERE BOOKS.Title = 'The Lost Tribe';
		END
		GO


		/* DONE 3.) Retrieve the names of all borrowers who do not have any books checked out.*/

		CREATE PROCEDURE no_books#3
		AS
		BEGIN
			SELECT DISTINCT BORROWER.Name
			FROM BORROWER
			FULL JOIN BOOK_LOANS
			ON BORROWER.CardNo = BOOK_LOANS.CardNo
			FULL JOIN BOOK_COPIES
			ON BOOK_LOANS.BookID = BOOK_COPIES.BookID
			WHERE BOOK_COPIES.BookID IS NULL;
		END
		GO

		/*DONE4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
		retrieve the book title, the borrower's name, and the borrower's address.*/
		CREATE PROCEDURE sharpstowndue#4
		AS
		BEGIN
		SELECT LIBRARY_BRANCH.BranchName, BOOK_LOANS.DateDue, BOOKS.Title, BORROWER.Name, BORROWER.Address
		FROM LIBRARY_BRANCH
		RIGHT JOIN BOOK_LOANS
		ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
		RIGHT JOIN BOOKS 
		ON BOOKS.BookID = BOOK_LOANS.BookID
		RIGHT JOIN BORROWER
		ON BOOK_LOANS.CardNo = BORROWER.CardNo
		WHERE LIBRARY_BRANCH.BranchName = 'Sharpstown'
		AND BOOK_LOANS.DateDue = CAST(GETDATE() AS date);
		END
		GO

		/* DONE 5.) For each library branch, retrieve the branch name and the total number 
		of books loaned out from that branch.*/
		CREATE PROCEDURE branch_books#5
		AS
		BEGIN
			SELECT LIBRARY_BRANCH.BranchName, COUNT(CardNo) BooksONLoan
			FROM LIBRARY_BRANCH 
			INNER JOIN BOOK_LOANS
			ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
			GROUP BY LIBRARY_BRANCH.BranchName;
		END
		GO
	
		/* DONE 6.) Retrieve the names, addresses, and the number of books checked out for all 
		borrowers who have more than five books checked out.*/
		
		CREATE PROCEDURE fiveormore#6
		AS
		BEGIN
			SELECT BORROWER.Name, BORROWER.Address, BORROWER.Phone, COUNT(BookID) BooksOUT 
			FROM BORROWER
			INNER JOIN BOOK_LOANS
			ON BORROWER.CardNo = BOOK_LOANS.CardNo
			GROUP BY BORROWER.Name,BORROWER.Address, BORROWER.Phone
			HAVING  (COUNT(BOOK_LOANS.BookID)) > 5;	
		END
		GO


		/*7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of 
		copies owned by the library branch whose name is "Central".*/
		CREATE PROCEDURE stephenK#7
		AS
		BEGIN
			SELECT LIBRARY_BRANCH.BranchName,BOOKS.Title,BOOK_AUTHORS.AuthorName,BOOK_COPIES.Number_Of_Copies
			FROM BOOKS
			INNER JOIN BOOK_AUTHORS
			ON BOOK_AUTHORS.BookID =  BOOKS.BookID
			JOIN BOOK_COPIES
			ON BOOKS.BookID = BOOK_COPIES.BookID
			JOIN LIBRARY_BRANCH
			ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
			WHERE BOOK_AUTHORS.AuthorName = 'Stephen King' AND LIBRARY_BRANCH.BranchName = 'Central';
		END
		GO

		EXEC [dbo].[sharpstown_CNT#1]
		EXEC [dbo].[LT_ALL#2]
		EXEC [dbo].[no_books#3]
		EXEC [dbo].[sharpstowndue#4]
		EXEC [dbo].[branch_books#5]
		EXEC [dbo].[fiveormore#6]
		EXEC [dbo].[stephenK#7]

	