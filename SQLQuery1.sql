USE [db_bookshop_19.04]
GO

INSERT INTO Countries (Name)
VALUES ('Ukraine'), ('Russia'), ('USA');

INSERT INTO Shops (Name, CountryId)
VALUES ('Bookstore Ukraine', 1),
       ('Bookstore Russia', 2),
       ('Bookstore USA', 3);

INSERT INTO Themes (Name)
VALUES ('Programming'), ('Administration'), ('Design'), ('Detective');

INSERT INTO Authors (Name, Surname, CountryId)
VALUES ('John', 'Doe', 3),
       ('Jane', 'Smith', 1),
       ('Alex', 'Johnson', 2);

INSERT INTO Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
VALUES ('Introduction to Programming', 600, 25.99, '2023-01-01', 1, 1),
       ('Database Administration Guide', 450, 20.50, '2022-06-15', 3, 2),
       ('Graphic Design Basics', 300, 15.75, '2023-03-10', 2, 3),
       ('Mystery of the Missing Key', 550, 18.99, '2023-05-20', 1, 4),
       ('Advanced C# Programming', 700, 30.00, '2022-12-05', 1, 1),
       ('Linux System Administration', 400, 22.25, '2022-08-30', 3, 2);

INSERT INTO Sales (Price, Quantity, SaleDate, BookId, ShopId)
VALUES (25.99, 20, '2024-04-19', 1, 1),
       (18.99, 15, '2024-04-18', 4, 2),
       (22.25, 10, '2024-04-17', 6, 3),
       (30.00, 25, '2024-04-16', 5, 1),
       (15.75, 30, '2024-04-15', 3, 2),
       (20.50, 12, '2024-04-14', 2, 3),
       (18.99, 20, '2024-04-13', 4, 1),
       (22.25, 18, '2024-04-12', 6, 2),
       (30.00, 22, '2024-04-11', 5, 3);
