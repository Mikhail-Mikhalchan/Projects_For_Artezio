--Создание БД
CREATE DATABASE [Company]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Company', FILENAME = N'D:\SQL\Company.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Company_log', FILENAME = N'D:\SQL\Company_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

--Создание таблицы с информацией о сотрудниках
CREATE TABLE Employees (
id INT IDENTITY PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Position_id INT NOT NULL,
Salary MONEY NOT NULL
)

--Создание таблицы с информацией о должностях
CREATE TABLE Position (
id INT IDENTITY PRIMARY KEY,
Position NVARCHAR(50) NOT NULL
)

--Уникальное значение поля Position
ALTER TABLE Position
ADD CONSTRAINT UNIQUE_Position
UNIQUE (Position)

--Связь таблиц Employees и Position с помощью внешнего ключа
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Position
FOREIGN KEY (Position_id)
REFERENCES Position(id)

--Добавление значений в таблицу Position
INSERT INTO Position(Position)
VALUES ('Директор')

INSERT INTO Position(Position)
VALUES ('Менеджер')

INSERT INTO Position(Position)
VALUES ('Главный бухгалтер')

INSERT INTO Position(Position)
VALUES ('Бухгалтер кассир')

INSERT INTO Position(Position)
VALUES ('Бухгалтер по зарплате')

--Запрос по таблице Position
SELECT id, Position 'Должность' FROM Position ORDER BY id

--Добавление значений в таблицу Position
INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('Иван', 'Игнатьев', 1, 80000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('Леонид', 'Слуцкий', 2, 50000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('Виктор', 'Гончаренко', 2, 45000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('Марина', 'Грановская', 3, 50000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('Дарья', 'Мельникова', 4, 25000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('Василий', 'Уткин', 5, 29000)

--Запрос по таблице Employees
SELECT FirstName 'Имя', LastName 'Фамилия', p.Position 'Должность', Salary 'Зарплата' FROM Employees e JOIN Position p ON e.Position_id = p.id ORDER BY e.Position_id