--Создание таблицы с информацией о руководителях и подчиненных
CREATE TABLE Employees_Hierarchy (
Major_id INT NULL,
Minor_id INT NULL
)

--ОРГАНИЗАЦИЯ СВЯЗИ МНОГИЕ-КО-МНОГИМ

--Добавление уникального составного ключа, чтобы Руководитель не мог быть сам у себя подчиненным
ALTER TABLE Employees_Hierarchy
ADD CONSTRAINT UNIQUE_Employees_Hierarchy
UNIQUE (Major_id, Minor_id)

--Добавления внешних ключей
ALTER TABLE Employees_Hierarchy
ADD CONSTRAINT FK_PE_Employees_Major_id
FOREIGN KEY (Major_id)
REFERENCES Employees(id)

ALTER TABLE Employees_Hierarchy
ADD CONSTRAINT FK_PE_Employees_Minor_id
FOREIGN KEY (Minor_id)
REFERENCES Employees(id)

--Добавление значений в таблицу Employees_Hierarchy
INSERT INTO Employees_Hierarchy(Major_id, Minor_id)
VALUES (1, 2)

INSERT INTO Employees_Hierarchy(Major_id, Minor_id)
VALUES (1, 3)

INSERT INTO Employees_Hierarchy(Major_id, Minor_id)
VALUES (1, 4)

INSERT INTO Employees_Hierarchy(Major_id, Minor_id)
VALUES (1, 5)

INSERT INTO Employees_Hierarchy(Major_id, Minor_id)
VALUES (1, 6)

INSERT INTO Employees_Hierarchy(Major_id, Minor_id)
VALUES (3, 4)

INSERT INTO Employees_Hierarchy(Major_id, Minor_id)
VALUES (3, 5)

--Самый простой запрос по таблице Employees_Hierarchy
SELECT Major_id 'Руководитель', Minor_id 'Подчиненный' FROM Employees_Hierarchy

--Запрос по таблице Employees_Hierarchy с поиском нужного id
SELECT Major_id 'Руководитель', Minor_id 'Подчиненный' FROM Employees_Hierarchy WHERE Major_id = 3

--УЛУЧШЕННЫЕ ЗАПРОСЫ ПО ТАБЛИЦЕ Employees_Hierarchy

--Поиск по руководителю
SELECT p1.Position 'Должность руководителя', e1.LastName 'Фамилия руководителя', p2.Position 'Должность подчиненного', e2.LastName 'Фамилия подчиненного'
FROM Employees_Hierarchy eh
JOIN Employees e1 ON e1.id = eh.Major_id
JOIN Employees e2 ON e2.id = eh.Minor_id
JOIN Position p1 ON e1.Position_id = p1.id
JOIN Position p2 ON e2.Position_id = p2.id
WHERE /*Ввести id Руководителя*/ eh.Major_id = 3

--Поиск по подчиненному
SELECT p1.Position 'Должность руководителя', e1.LastName 'Фамилия руководителя', p2.Position 'Должность подчиненного', e2.LastName 'Фамилия подчиненного'
FROM Employees_Hierarchy eh
JOIN Employees e1 ON e1.id = eh.Major_id
JOIN Employees e2 ON e2.id = eh.Minor_id
JOIN Position p1 ON e1.Position_id = p1.id
JOIN Position p2 ON e2.Position_id = p2.id
WHERE /*Ввести id Подчиненного*/ eh.Minor_id = 2