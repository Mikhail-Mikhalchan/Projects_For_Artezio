--�������� ��
CREATE DATABASE [Company]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Company', FILENAME = N'D:\SQL\Company.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Company_log', FILENAME = N'D:\SQL\Company_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

--�������� ������� � ����������� � �����������
CREATE TABLE Employees (
id INT IDENTITY PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Position_id INT NOT NULL,
Salary MONEY NOT NULL
)

--�������� ������� � ����������� � ����������
CREATE TABLE Position (
id INT IDENTITY PRIMARY KEY,
Position NVARCHAR(50) NOT NULL
)

--���������� �������� ���� Position
ALTER TABLE Position
ADD CONSTRAINT UNIQUE_Position
UNIQUE (Position)

--����� ������ Employees � Position � ������� �������� �����
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Position
FOREIGN KEY (Position_id)
REFERENCES Position(id)

--���������� �������� � ������� Position
INSERT INTO Position(Position)
VALUES ('��������')

INSERT INTO Position(Position)
VALUES ('��������')

INSERT INTO Position(Position)
VALUES ('������� ���������')

INSERT INTO Position(Position)
VALUES ('��������� ������')

INSERT INTO Position(Position)
VALUES ('��������� �� ��������')

--������ �� ������� Position
SELECT id, Position '���������' FROM Position ORDER BY id

--���������� �������� � ������� Position
INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('����', '��������', 1, 80000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('������', '�������', 2, 50000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('������', '����������', 2, 45000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('������', '����������', 3, 50000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('�����', '����������', 4, 25000)

INSERT INTO Employees (FirstName, LastName, Position_id, Salary)
VALUES ('�������', '�����', 5, 29000)

--������ �� ������� Employees
SELECT FirstName '���', LastName '�������', p.Position '���������', Salary '��������' FROM Employees e JOIN Position p ON e.Position_id = p.id ORDER BY e.Position_id