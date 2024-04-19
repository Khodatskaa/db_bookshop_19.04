CREATE DATABASE [db_bookshop_19.04];
GO 
USE [db_bookshop_19.04];
GO

CREATE TABLE Countries(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Shops(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(MAX) NOT NULL,
    CountryId INT NOT NULL
);

CREATE TABLE Themes(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Authors(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(MAX) NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,
    CountryId INT NOT NULL
);

CREATE TABLE Books(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL UNIQUE,
    Pages INT NOT NULL CHECK (Pages > 0),
    Price MONEY NOT NULL CHECK (Price >= 0),
    PublishDate DATE NOT NULL CHECK (PublishDate <= CAST(GETDATE() AS DATE)),
    AuthorId INT NOT NULL,
    ThemeId INT NOT NULL
);

CREATE TABLE Sales(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Price MONEY NOT NULL CHECK (Price >= 0),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    SaleDate DATE NOT NULL DEFAULT GETDATE() CHECK (SaleDate <= CAST(GETDATE() AS DATE)),
    BookId INT NOT NULL,
    ShopId INT NOT NULL
);