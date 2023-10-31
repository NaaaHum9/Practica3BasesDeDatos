spool C:\Users\escom\Desktop\Basess\salidaAthele.txt

--clear screen;
set linesize 150
set PAGESIZE 99
set COLSEP '|*|'

--Borrado de tablas 
DROP TABLE Football CASCADE CONSTRAINT;
DROP TABLE Golf CASCADE CONSTRAINT;
DROP TABLE Tennis CASCADE CONSTRAINT;
DROP TABLE Athele CASCADE CONSTRAINT;

--Tablas
CREATE TABLE Athele (
    Ssno VARCHAR2(12),
    Weight NUMBER(38),
    Name VARCHAR(38),
    Gender VARCHAR(2),
    Height NUMBER(10),
    Sport VARCHAR(45)
);

CREATE TABLE Tennis (
    Ssno VARCHAR2(12),
    State_ranking NUMBER(38)
);

CREATE TABLE Golf (
    Ssno VARCHAR2(12),
    Handicap NUMBER(20)
);

CREATE TABLE Football (
    Ssno VARCHAR2(12),
    Position VARCHAR(25)
);

--Restricciones
ALTER TABLE Athele
ADD CONSTRAINT Ssno_PK PRIMARY KEY (Ssno);

ALTER TABLE Tennis
ADD CONSTRAINT Ssno_FKT FOREIGN KEY (Ssno) REFERENCES Athele(Ssno);

ALTER TABLE Golf
ADD CONSTRAINT Ssno_FKG FOREIGN KEY (Ssno) REFERENCES Athele(Ssno);

ALTER TABLE Football
ADD CONSTRAINT Ssno_FKF FOREIGN KEY (Ssno) REFERENCES Athele(Ssno);

-- Insertar datos
INSERT INTO Athele (Ssno, Weight, Name, Gender, Height, Sport)
VALUES ('239-92-0983', 140, 'Kumar', 'M', 5.95, 'Golf');
INSERT INTO Athele (Ssno, Weight, Name, Gender, Height, Sport)
VALUES ('398-08-0928', 200, 'Kelvin', 'M', 6.02, 'Football');
INSERT INTO Athele (Ssno, Weight, Name, Gender, Height, Sport)
VALUES ('322-00-1234', 135, 'Sarah', 'F', 5.6, 'Tennis');
INSERT INTO Athele (Ssno, Weight, Name, Gender, Height, Sport)
VALUES ('873-97-9877', 165, 'Arjun', 'M', 6.01, 'Golf');
INSERT INTO Athele (Ssno, Weight, Name, Gender, Height, Sport)
VALUES ('876-09-9873', 145, 'Deesha', 'F', 5.5, 'Tennis, Golf');

INSERT INTO Tennis (Ssno, State_ranking)
VALUES ('322-00-1234', 23);
INSERT INTO Tennis (Ssno, State_ranking)
VALUES ('876-09-9873', 47);

INSERT INTO Golf (Ssno, Handicap)
VALUES ('239-92-0983', 3);
INSERT INTO Golf (Ssno, Handicap)
VALUES ('873-97-9877', 1);

INSERT INTO Football (Ssno, Position)
VALUES ('398-08-0928', 'Tackle');
INSERT INTO Football (Ssno, Position)
VALUES ('239-92-0983', 'Quarterback');
INSERT INTO Football (Ssno, Position)
VALUES ('398-08-0928', 'Full Back');

--Desplega las tablas
SELECT * FROM Athele;
SELECT * FROM Tennis;
SELECT * FROM Golf;
SELECT * FROM Football;


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
    where table_name in ('Athele', 'Tennis', 'Golf', 'Football');

spool off