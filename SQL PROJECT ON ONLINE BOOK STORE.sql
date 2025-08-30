create database project;
use project;


-- Books Table
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    Published_Year INT,
    Price DECIMAL(6,2),
    Stock INT
);

-- Customers Table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    City VARCHAR(100),
    Country VARCHAR(100)
);

-- Orders Table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(8,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

select * from orders;
select * from books;
select * from customers;

# 1) Retrieve all books in the 'Fiction' genre

SELECT * FROM books 
WHERE Genre='Fiction';

# 2) Find books Published after the year 1950.

SELECT * FROM books  
WHERE Published_Year > 1950;

# 3 List of all the customers from Canada

SELECT Name, Country FROM customers
WHERE Country = "Canada";

# 4) Show orders placed in November 2023. 
SELECT * FROM orders 
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30' ORDER BY Order_Date ASC;

# 5 RETRIEVE THE TOTAL STOCK OF THE BOOKS AVAILABLE. 
SELECT sum(Stock) as Total_Stock FROM books;


# 6 ) FIND THE DETAILS OF THE MOST EXPENSIVE BOOK
# FOR LIST 
SELECT Title,Author, max(Price) AS Expensive_Book FROM Books GROUP BY Title,Author ORDER BY Expensive_Book DESC;
# FOR  ONLY ONE RESULT
SELECT * FROM BOOKS ORDER BY Price DESC LIMIT 1;

# 7) SHOW ALL CUSTOMERS WHO ORDERED MORE THAN 1 QUANTITY OF A BOOK. 

SELECT * FROM Orders
WHERE Quantity>1 ORDER BY Quantity DESC;


# 8) RETRIEVE ALL ORDERS WHERE TOTAL AMOUNT EXCEEDS $20. 
SELECT * FROM Orders
where Total_Amount >20;

# 9) LIST OF THE ALL GENRE AVAILABLE IN THE BOOKS TABLE 

SELECT DISTINCT Genre FROM Books;

# 10) FIND THE BOOK WITH LOWEST STOCK 
# FOR LIST 
SELECT Title,min(Stock) FROM Books GROUP BY Title;

# FOR ONE 
SELECT * FROM Books ORDER BY Stock ;

# 11) CALCULATE THE TOTAL REVENUE FROM ALL ORDERS 

SELECT sum(Total_Amount) as Total_Revenue from Orders;

## ADVANCED QUETIONS 

# 1 ) RETRIEVE THE TOTAL NUMBER OF BOOKS SOLD BY EACH GENRE (ORDER BY DESC) 

SELECT b.Genre ,SUM(o.Quantity) AS Total_Book_Sold
FROM Orders o join Books b
on o.Book_ID = b.Book_id
GROUP BY b.Genre ORDER BY Total_Book_Sold DESC;

# 2) FIND THE AVERAGE PRICE OF BOOKS IN THE FANTASY GENRE . 

SELECT AVG(Price) AS Avg_Price_of_FANTASY_GENRE 
 FROM Books
 WHERE Genre='Fantasy';
 
 # 3) LIST OF CUSTOMERS FROM WHO PLACED AT LEAST 2 ORDERS . 
 
SELECT 
    c.Customer_ID,
    c.Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM 
    Customers c
JOIN 
    Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY 
    c.Customer_ID, c.Name
HAVING 
    COUNT(o.Order_ID) >= 2
ORDER BY 
    Total_Orders DESC;


# 4) FIND THE MOST FREQUENTLY ORDERED BOOK 
# FOR LIST
SELECT 
    b.Book_ID,
    b.Title,
    b.Author,
    COUNT(o.Order_ID) AS Times_Ordered
FROM 
    Orders o
JOIN 
    Books b ON o.Book_ID = b.Book_ID
GROUP BY 
    b.Book_ID, b.Title, b.Author
ORDER BY 
    Times_Ordered DESC ;
    
    # FOR ONE
SELECT 
    b.Book_ID,
    b.Title,
    b.Author,
    COUNT(o.Order_ID) AS Times_Ordered
FROM 
    Orders o
JOIN 
    Books b ON o.Book_ID = b.Book_ID
GROUP BY 
    b.Book_ID, b.Title, b.Author
ORDER BY 
    Times_Ordered DESC LIMIT 1;

# 5) SHOW THE TOP 3 MOST EXPENSIVE BOOKS OF 'FANTASY ' GENRE

SELECT * FROM Books
WHERE Genre ='Fantasy'
ORDER BY Price DESC LIMIT 3;

# 6) RERIEVE THE TOTAL QUANTITY OF BOOKS SOLD BY EACH AUTHOR. 
SELECT b.Author,SUM(o.Quantity) as Total_Quantity 
FROM Books b join Orders o
on b.Book_ID = o.Book_id
GROUP BY b.AUTHOR 
ORDER BY Total_Quantity DESC;

# 7) LIST THE CITIES WHERE CUSSTOMERS WHO  SPENT OVER $30 ARE LOCATED . 
SELECT DISTINCT c.City,Total_Amount 
FROM customers c JOIN Orders o 
ON c.Customer_ID = o.Customer_ID 
WHERE o.Total_Amount >30
ORDER BY  Total_Amount ;

# 8) FIND THE CUSTOMER WHO SPENT THE MOST ON ORDERS. 
SELECT c.Customer_ID ,C.Name ,SUM(o.Total_Amount) as Total_Spent
From Orders o JOIN Customers c 
on c.Customer_ID = o.Customer_ID 
GROUP BY c.Customer_ID ,C.Name
ORDER BY Total_Spent DESC;

# 9) CALCULATE THE STOCK REMAINING AFTER FULFILLING ALL ORDERS . 

SELECT b.Book_ID,b.Title,b.Stock, COALESCE(SUM(o.Quantity),0) AS Orders_Quantity,
b.Stock-COALESCE(SUM(Quantity),0) AS Remaining_Quantity
FROM books b LEFT JOIN orders o
on b.Book_ID = o.Book_ID 
GROUP BY b.Book_ID
ORDER BY Remaining_Quantity  DESC;
