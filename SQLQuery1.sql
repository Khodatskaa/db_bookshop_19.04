USE [db_bookshop_19.04]
GO

-- Task 1: books with more pages than 500, but less than 650
SELECT *
FROM Books
WHERE Pages > 500 AND Pages < 650;

-- Task 2: books with the first letter of the title or "A," or "From."
SELECT *
FROM Books
WHERE Name LIKE 'A%' OR Name LIKE 'From%' OR Name LIKE 'F%';

-- Task 3: books of the genre "Detective," the number of sold books more than 30 copies
SELECT b.*
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
JOIN Sales s ON b.Id = s.BookId
WHERE t.Name = 'Detective' AND s.Quantity > 30;

-- Task 4: books that have the word "Microsoft" in their title
SELECT *
FROM Books
WHERE Name LIKE '%Microsoft%' AND Name NOT LIKE '%Windows%';

-- Task 5: all books price of one page of which is less than 65 
SELECT CONCAT(b.Name, ', ', t.Name, ', ', a.Name, ' ', a.Surname) AS BookInfo,
       b.Price / b.Pages AS PricePerPage
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
JOIN Authors a ON b.AuthorId = a.Id
WHERE b.Price / b.Pages < 0.65;

-- Task 6: all books whose title consists of 4 words
SELECT *
FROM Books
WHERE LEN(Name) - LEN(REPLACE(Name, ' ', '')) = 3;

-- Task 7: sales information as specified
SELECT b.Name AS BookTitle,
       t.Name AS Subject,
       CONCAT(a.Name, ' ', a.Surname) AS AuthorFullName,
       s.Price AS Price,
       s.Quantity AS SalesQuantity,
       sh.Name AS StoreName
FROM Sales s
JOIN Books b ON s.BookId = b.Id
JOIN Themes t ON b.ThemeId = t.Id
JOIN Authors a ON b.AuthorId = a.Id
JOIN Shops sh ON s.ShopId = sh.Id
WHERE b.Name NOT LIKE '%A%' 
  AND t.Name != 'Programming'
  AND CONCAT(a.Name, ' ', a.Surname) != 'Herbert Shildt'
  AND s.Price BETWEEN 10 AND 20
  AND s.Quantity >= 8
  AND sh.CountryId NOT IN (1, 2); 

-- Task 8: following information in two columns
SELECT 'Number of authors' AS Description, COUNT(*) AS Count FROM Authors
UNION ALL
SELECT 'Number of books', COUNT(*) FROM Books
UNION ALL
SELECT 'Average sale price', AVG(Price) FROM Sales
UNION ALL
SELECT 'Average number of pages', AVG(Pages) FROM Books;

-- Task 9: book themes and page sum of all books by each of them
SELECT t.Name AS Theme, SUM(b.Pages) AS TotalPages
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
GROUP BY t.Name;

-- Task 10: number of all books and the page amount of these books for each of the authors
SELECT CONCAT(a.Name, ' ', a.Surname) AS AuthorFullName,
       COUNT(*) AS BookCount,
       SUM(b.Pages) AS TotalPages
FROM Books b
JOIN Authors a ON b.AuthorId = a.Id
GROUP BY a.Name, a.Surname;

-- Task 11: book subject "Programming" with the largest number of pages
SELECT TOP 1 b.*
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
WHERE t.Name = 'Programming'
ORDER BY b.Pages DESC;

-- Task 12: average number of pages for each topic, which does not exceed 400
SELECT t.Name AS Theme, AVG(b.Pages) AS AvgPages
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
GROUP BY t.Name
HAVING AVG(b.Pages) <= 400;

-- Task 13: sum of pages for each topic
SELECT t.Name AS Theme, SUM(b.Pages) AS TotalPages
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
WHERE b.Pages > 400 AND t.Name IN ('Programming', 'Administration', 'Design')
GROUP BY t.Name;

-- Task 14: information about the work of stores
SELECT b.Name AS BookTitle,
       sh.Name AS StoreName,
       CONCAT(a.Name, ' ', a.Surname) AS SoldBy,
       s.SaleDate,
       s.Quantity AS SoldQuantity
FROM Sales s
JOIN Books b ON s.BookId = b.Id
JOIN Shops sh ON s.ShopId = sh.Id
JOIN Authors a ON b.AuthorId = a.Id;

-- Task 15: most profitable store
SELECT TOP 1 sh.Name AS StoreName, SUM(s.Price * s.Quantity) AS TotalRevenue
FROM Sales s
JOIN Shops sh ON s.ShopId = sh.Id
GROUP BY sh.Name
ORDER BY TotalRevenue DESC;