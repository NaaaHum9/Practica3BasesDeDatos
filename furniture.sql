spool C:\Users\escom\Desktop\Basess\salidaFurniture.txt

--clear screen;
set linesize 150
set PAGESIZE 99
set COLSEP '|*|'

--Borrado de tablas 
DROP TABLE Chair CASCADE CONSTRAINT;
DROP TABLE Desk CASCADE CONSTRAINT;
DROP TABLE Mesas CASCADE CONSTRAINT;
DROP TABLE Furniture CASCADE CONSTRAINT;

--Tablas
CREATE TABLE Furniture (
    FurnitureID VARCHAR2(12),
    Employee_number NUMBER(15),
    Office_no VARCHAR(15),
    Furniture_type VARCHAR(30)
);

CREATE TABLE Mesas (
    FurnitureID VARCHAR2(12),
    Sizes NUMBER(10)
);

CREATE TABLE Desk (
    FurnitureID VARCHAR2(12),
    Drawers NUMBER(10)
);

CREATE TABLE Chair (
    FurnitureID VARCHAR2(12),
    color VARCHAR(10),
    Chair_type VARCHAR(10)
);

--Restricciones
ALTER TABLE Furniture
ADD CONSTRAINT FurnitureID_PK PRIMARY KEY (FurnitureID);

ALTER TABLE Mesas
ADD CONSTRAINT FurnitureID_FKM FOREIGN KEY (FurnitureID) REFERENCES Furniture(FurnitureID);

ALTER TABLE Desk
ADD CONSTRAINT FurnitureID_FKD FOREIGN KEY (FurnitureID) REFERENCES Furniture(FurnitureID);

ALTER TABLE Chair
ADD CONSTRAINT FurnitureID_FKC FOREIGN KEY (FurnitureID) REFERENCES Furniture(FurnitureID);

-- Insertar datos
INSERT INTO Furniture (FurnitureID, Employee_number, Office_no, Furniture_type)
VALUES ('F1', 101, 'Office1', 'Desk');
INSERT INTO Furniture (FurnitureID, Employee_number, Office_no, Furniture_type)
VALUES ('F2', 102, 'Office2', 'Desk');
INSERT INTO Furniture (FurnitureID, Employee_number, Office_no, Furniture_type)
VALUES ('F3', 102, 'Office2', 'Chair');
INSERT INTO Furniture (FurnitureID, Employee_number, Office_no, Furniture_type)
VALUES ('F4', 102, 'Office1', 'Mesas');
INSERT INTO Furniture (FurnitureID, Employee_number, Office_no, Furniture_type)
VALUES ('F5', 102, 'Office2', 'Chair');
INSERT INTO Furniture (FurnitureID, Employee_number, Office_no, Furniture_type)
VALUES ('F6', 102, 'Office1', 'Mesas');

INSERT INTO Mesas (FurnitureID, Sizes)
VALUES ('F4', 120);
INSERT INTO Mesas (FurnitureID, Sizes)
VALUES ('F6', 150);

INSERT INTO Desk (FurnitureID, Drawers)
VALUES ('F1', 3);
INSERT INTO Desk (FurnitureID, Drawers)
VALUES ('F2', 5);

INSERT INTO Chair (FurnitureID, color, Chair_type)
VALUES ('F3', 'Black', 'Executive');
INSERT INTO Chair (FurnitureID, color, Chair_type)
VALUES ('F5', 'Red', 'Conference');


--Desplega las tablas
SELECT * FROM Furniture;
SELECT * FROM Mesas;
SELECT * FROM Desk;
SELECT * FROM Chair;


--Da formato a la salida de datos 
rem desplegar por TABLE_NAME & CONSTRAINT
col owner FORMAT A12
col CONSTRAINT_NAME FORMAT A31
col CONSTRAINT_TYPE FORMAT A10
col table_name FORMAT A25
col status  FORMAT A10

--Despliega las restricciones 
SELECT owner, CONSTRAINT_NAME,
    CONSTRAINT_TYPE, status
    from user_constraints
    where table_name in ('Furniture', 'Mesas', 'Desk', 'Chair');

spool off