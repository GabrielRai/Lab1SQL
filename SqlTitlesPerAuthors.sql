   CREATE OR ALTER VIEW TitlesPerAuthor AS
   SELECT  
        Author.author_firstname + ' ' + Author.author_lastname AS [Name],
    CASE
        WHEN Author.death_date IS NULL THEN DATEDIFF(YEAR, Author.author_birthdate, GETDATE())
        ELSE DATEDIFF(YEAR, Author.author_birthdate, Author.death_date)
    END AS [Age],
      COUNT(DISTINCT Book.isbn) AS TitleCount,
      SUM(Book.book_price * Stock.quantity) AS SumValue

    FROM Author

    JOIN BookAuthors ON Author.author_id = BookAuthors.author_id
    JOIN Book ON Book.isbn = BookAuthors.isbn
    LEFT JOIN Stock ON Stock.isbn = Book.isbn
    
    GROUP BY Author.author_firstname, Author.author_lastname, Author.author_birthdate, Author.death_date