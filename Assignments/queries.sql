
/*1. Relational Operators:*/
   -- Example: Retrieve all books published after 2010
   SELECT * FROM Book WHERE Year > 2010;
   
   -- Example: Retrieve all books with a price between 100 and 200
   SELECT * FROM Book WHERE Price BETWEEN 100 AND 200;


/*2. Boolean Operators and Pattern Matching:*/

   -- Example: Retrieve all books with 'Harry Potter' in the title and published by 'Bloomsbury'
   SELECT * FROM Book WHERE Title LIKE '%Harry Potter%' AND Publisher = 'Bloomsbury';
   
   -- Example: Retrieve all books published by 'Penguin' or 'Harper'
   SELECT * FROM Book WHERE Publisher = 'Penguin' OR Publisher = 'Harper';


/*3. Arithmetic Operations and Built-in Functions:*/
   
   -- Example: Calculate the total price of all books with a 10% discount
   SELECT SUM(Price * 0.9) AS Total_Price FROM Book;
   
   -- Example: Round the average price of all books to two decimal places
   SELECT ROUND(AVG(Price), 2) AS Avg_Price FROM Book;


/*4. Group Functions:*/

   -- Example: Calculate the total price of books published in each year
   SELECT Year, SUM(Price) AS Total_Price FROM Book GROUP BY Year;
   
   -- Example: Count the number of books published by each publisher
   SELECT Publisher, COUNT(*) AS Num_Books FROM Book GROUP BY Publisher;
  

/*5. **Processing Date and Time Functions:*/
   
   -- Example: Retrieve all books published after January 1, 2000
   SELECT * FROM Book WHERE Year > 2000;
   
   -- Example: Retrieve the day of the week for each book's publication date
   SELECT Title, DAYNAME(Publication_Date) AS Day_of_Week FROM Book;
   

/*6. **Complex Queries and Set Operators:*/
   
   -- Example: Retrieve the titles of books published by 'Harper' or 'Penguin' with a price greater than 300
   SELECT Title FROM Book WHERE Publisher = 'Harper' OR Publisher = 'Penguin' AND Price > 300;
   
   -- Example: Retrieve the titles of books published by 'Harper' and 'Penguin'
   SELECT Title FROM Book WHERE Publisher = 'Harper' INTERSECT SELECT Title FROM Book WHERE Publisher = 'Penguin';
