--������ �� ��������
SELECT FirstName '���', LastName '�������', p.Position '���������', Salary '��������' 
FROM Employees e 
JOIN Position p ON e.Position_id = p.id 
WHERE e.Salary < 30000
ORDER BY e.id

--������ �� ���������
SELECT FirstName '���', LastName '�������', p.Position '���������', Salary '��������' 
FROM Employees e 
JOIN Position p ON e.Position_id = p.id 
WHERE p.Position = '��������'
ORDER BY e.id