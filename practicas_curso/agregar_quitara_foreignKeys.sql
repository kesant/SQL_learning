#agregar y quitar foreing keys 
USE grupos;


CREATE TABLE ZONAS(
ID INT NOT NULL,
DIR_COD INT NOT NULL,
DIR VARCHAR (20),
NOMBRE VARCHAR(20)
);

DESC ZONAS;#DESCRIBE LA BASE DE DATOS 

ALTER TABLE ZONAS

ADD PRIMARY KEY (ID);
DESC ZONAS;

CREATE TABLE GRUPO_1(
ID INT NOT NULL,
DIR_COD INT NOT NULL,
NOMBRE VARCHAR(20),
PRIMARY KEY (ID)
);
DESC GRUPO_1;
#agregar foreing key  de la relacion entre las tablas
ALTER TABLE GRUPO_1
ADD CONSTRAINT FK_ZONASID
FOREIGN KEY (DIR_COP) REFERENCES ZONAS(ID);

DESC GRUPO_1;

CREATE TABLE GRUPO_2(
ID INT NOT NULL,
DIR_COD INT NOT NULL,
NOMBRE VARCHAR(20),
PRIMARY KEY (ID),
FOREIGN KEY (DIR_COP) REFERENCES ZONAS(ID)
);

# ELIMINAR EL FOREIGN KEY 
 ALTER TABLE GRUPO_1
 DROP FOREIGN KEY FK_ZONASID;




