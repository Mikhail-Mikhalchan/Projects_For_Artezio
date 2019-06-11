--Запрос по зарплате
SELECT FirstName 'Имя', LastName 'Фамилия', p.Position 'Должность', Salary 'Зарплата' 
FROM Employees e 
JOIN Position p ON e.Position_id = p.id 
WHERE e.Salary < 30000
ORDER BY e.id

--Запрос по должности
SELECT FirstName 'Имя', LastName 'Фамилия', p.Position 'Должность', Salary 'Зарплата' 
FROM Employees e 
JOIN Position p ON e.Position_id = p.id 
WHERE p.Position = 'Менеджер'
ORDER BY e.id