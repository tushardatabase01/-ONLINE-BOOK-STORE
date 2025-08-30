# ONLINE-BOOK-STORE
SQL PROJECT ON ONLINE BOOK STORE
📚 Online Book Store – SQL Project
📖 Overview

This project is an SQL-based Online Book Store Database that manages information about books, customers, and orders. It demonstrates how to design relational databases, implement relationships between entities, and perform various SQL queries ranging from basic retrievals to advanced analytical queries.

The project covers:

Database design with Books, Customers, and Orders tables.

Queries for retrieving, filtering, and aggregating data.

Advanced queries to analyze sales, revenue, and customer behavior.

🗂 Database Schema
Tables

Books

Book_ID (Primary Key)

Title

Author

Genre

Published_Year

Price

Stock

Customers

Customer_ID (Primary Key)

Name

Email

Phone

City

Country

Orders

Order_ID (Primary Key)

Customer_ID (Foreign Key → Customers)

Book_ID (Foreign Key → Books)

Order_Date

Quantity

Total_Amount

🔍 SQL Queries Included
✅ Basic Queries

Retrieve all books in a specific genre.

Find books published after a certain year.

List customers from a specific country.

Show orders placed in a specific month.

Calculate total stock of books.

Find the most expensive book.

Show customers who ordered more than one quantity.

Retrieve orders above a certain total amount.

List all available genres.

Find book with lowest stock.

Calculate total revenue from all orders.

🚀 Advanced Queries

Total number of books sold by each genre.

Average price of books in a specific genre.

Customers who placed at least 2 orders.

Most frequently ordered book.

Top 3 most expensive books of a genre.

Total quantity of books sold by each author.

Cities of customers who spent more than a threshold.

Customer who spent the most.

Remaining stock after fulfilling all orders.

🛠 How to Run

Install any SQL database system (MySQL / MariaDB / PostgreSQL).

Create the database and run the provided .sql script.

source SQL PROJECT ON ONLINE BOOK STORE.sql;


Execute the queries inside the file to explore the database.

📌 Learning Outcomes

Understanding of database schema design.

Usage of primary keys, foreign keys, and relationships.

Hands-on practice with SQL queries (CRUD, aggregations, filtering).

Writing analytical queries for business insights.

📎 File Included

SQL PROJECT ON ONLINE BOOK STORE.sql – contains database schema and queries.

