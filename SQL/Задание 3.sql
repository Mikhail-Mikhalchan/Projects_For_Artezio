--�������� ������� � ����������� � ������������� � �����������
CREATE TABLE Employees_Hierarchy (
Major_id INT NULL,
Minor_id INT NULL
)

--����������� ����� ������-��-������

--���������� ����������� ���������� �����, ����� ������������ �� ��� ���� ��� � ���� �����������
ALTER TABLE Employees_Hierarchy
ADD CONSTRAINT UNIQUE_Employees_Hierarchy
UNIQUE (Major_id, Minor_id)

--���������� ������� ������
ALTER TABLE Employees_Hierarchy
ADD CONSTRAINT FK_PE_Employees_Major_id
FOREIGN KEY (Major_id)
REFERENCES Employees(id)

ALTER TABLE Employees_Hierarchy
ADD CONSTRAINT FK_PE_Employees_Minor_id
FOREIGN KEY (Minor_id)
REFERENCES Employees(id)

--���������� �������� � ������� Employees_Hierarchy
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

--����� ������� ������ �� ������� Employees_Hierarchy
SELECT Major_id '������������', Minor_id '�����������' FROM Employees_Hierarchy

--������ �� ������� Employees_Hierarchy � ������� ������� id
SELECT Major_id '������������', Minor_id '�����������' FROM Employees_Hierarchy WHERE Major_id = 3

--���������� ������� �� ������� Employees_Hierarchy

--����� �� ������������
SELECT p1.Position '��������� ������������', e1.LastName '������� ������������', p2.Position '��������� ������������', e2.LastName '������� ������������'
FROM Employees_Hierarchy eh
JOIN Employees e1 ON e1.id = eh.Major_id
JOIN Employees e2 ON e2.id = eh.Minor_id
JOIN Position p1 ON e1.Position_id = p1.id
JOIN Position p2 ON e2.Position_id = p2.id
WHERE /*������ id ������������*/ eh.Major_id = 3

--����� �� ������������
SELECT p1.Position '��������� ������������', e1.LastName '������� ������������', p2.Position '��������� ������������', e2.LastName '������� ������������'
FROM Employees_Hierarchy eh
JOIN Employees e1 ON e1.id = eh.Major_id
JOIN Employees e2 ON e2.id = eh.Minor_id
JOIN Position p1 ON e1.Position_id = p1.id
JOIN Position p2 ON e2.Position_id = p2.id
WHERE /*������ id ������������*/ eh.Minor_id = 2