CREATE DATABASE Company;
Use Company;

CREATE TABLE Departamento (
  ndepto varchar(45) NOT NULL,
  nombre varchar(45) NOT NULL,
  nssAdmin varchar(45) NULL,
  fechaInicio varchar(45) NOT NULL,
  PRIMARY KEY (ndepto)
);

CREATE TABLE Empleado (
  nss varchar(45) NOT NULL,
  nombre varchar(45) NOT NULL,
  direccion varchar(45) NOT NULL,
  salario int(11) NOT NULL,
  fechaNacimiento varchar(45) NOT NULL,
  sexo varchar(45) NOT NULL,
  nssSup varchar(45) NULL,
  nDepto varchar(45) NULL,
  PRIMARY KEY (nss),
  FOREIGN KEY (nDepto) REFERENCES Departamento (ndepto) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (nssSup) REFERENCES Empleado (nss) ON DELETE NO ACTION ON UPDATE NO ACTION
);

ALTER TABLE Departamento add 
FOREIGN KEY
(nssAdmin) REFERENCES Empleado
(nss);

CREATE TABLE Proyecto (
  nProyecto varchar(45) NOT NULL,
  nombre varchar(45) NOT NULL,
  localidad varchar(45) NOT NULL,
  nDepto varchar(45) NOT NULL,
  PRIMARY KEY (nProyecto),
  FOREIGN KEY (nDepto) REFERENCES Departamento (ndepto) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Dependiente (
  nombre varchar(45) NOT NULL,
  fechaNacimiento varchar(45) NOT NULL,
  sexo varchar(45) NOT NULL,
  parentesco varchar(45) NOT NULL,
  nss varchar(45) NOT NULL,
  PRIMARY KEY (nombre),
  FOREIGN KEY (nss) REFERENCES Empleado (nss) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE TrabajaEn (
  horas int(11) NOT NULL,
  nss varchar(45) NOT NULL,
  nProyecto varchar(45) NOT NULL, 
  PRIMARY KEY (nss,nProyecto),
  FOREIGN KEY (nss) REFERENCES Empleado (nss),
  FOREIGN KEY (nProyecto) REFERENCES Proyecto (nProyecto) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Localidad (
  nombre varchar(45) NOT NULL,
  direccion varchar(45) NOT NULL,
  telefono int(11) NOT NULL,
  nDepto varchar(45) NOT NULL,
  PRIMARY KEY (nombre),
  FOREIGN KEY (nDepto) REFERENCES Departamento (ndepto) ON DELETE NO ACTION ON UPDATE NO ACTION
); 

INSERT INTO Empleado VALUES("1122", "Diana Sanchez", "San Buena", 200, "12-03-70", "f", NULL, NULL);
INSERT INTO Empleado VALUES("1133", "Hector Gomez", "CFE 212", 250, "14-15-80", "m", NULL, NULL);
INSERT INTO Empleado VALUES("S98", "Nora Gonzalez", "5 de Mayo 1521", 500, "15-05-60", "f", NULL, NULL);
INSERT INTO Empleado VALUES("S99", "Gabriel Gomez", "Hidalgo 102", 550, "12-09-70", "m", NULL, NULL);
INSERT INTO Empleado VALUES("A99", "Emilio Perez", "Morelia", 800, "12-12-55", "m", NULL, NULL);
INSERT INTO Empleado VALUES("A98", "Oscar Lara", "San Carlos", 1000, "12-12-65", "m", NULL, NULL);

INSERT INTO Departamento VALUES("D1", "Produccion", "A99", "12-12-85");
INSERT INTO Departamento VALUES("D2", "Manufactura", "A98", "13-12-90");

UPDATE Empleado SET nssSup="S99", nDepto="D1" WHERE nss ="1122";
UPDATE Empleado SET nssSup="S98", nDepto="D2" WHERE nss ="1133";
UPDATE Empleado SET nssSup="A99", nDepto="D1" WHERE nss ="S98";
UPDATE Empleado SET nssSup="A98", nDepto="D2" WHERE nss ="S99";
UPDATE Empleado SET nssSup="A99", nDepto="D1" WHERE nss ="A99";
UPDATE Empleado SET nssSup="A98", nDepto="D2" WHERE nss ="A98";

INSERT INTO Proyecto VALUES("P12", "Automatizacion B6 Cil", "Planta de Produccion", "D2");
INSERT INTO Proyecto VALUES("P13", "LAN Inalambrica", "Plaza Central Toluca", "D2");

INSERT INTO Dependiente VALUES("Jesus Gomez", "12-12-60", "m", "Padre", "1133");
INSERT INTO Dependiente VALUES("Laura Sanchez", "12-12-60", "f", "Madre", "1133");
INSERT INTO Dependiente VALUES("Ana Perez", "12-13-50", "f", "Hija", "A99");


INSERT INTO Localidad VALUES("Planta Toluca", "Morelos 102", 121212,"D1");
INSERT INTO Localidad VALUES("Planta Silao", "Hidalgo 103", 131313,"D1");

INSERT INTO TrabajaEn VALUES(2,"1122","P13");
INSERT INTO TrabajaEn VALUES(3,"1133","P13");
INSERT INTO TrabajaEn VALUES(3,"1122","P12");

INSERT INTO Empleado VALUES("0011", "EmpleadoNull", "La Casa", 50, "12-03-70", "f", NULL, NULL);
INSERT INTO Departamento VALUES("D0", "DepartamentoNull", "0011", "01-04-2018");
UPDATE Empleado SET nssSup="0011", nDepto="D0" WHERE nss ="0011";

INSERT INTO EMPLEADO VALUES("0044","Fernando Torres","Colon",786,"15-04-1990","M","0011","D0");