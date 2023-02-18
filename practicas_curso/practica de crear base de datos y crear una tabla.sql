CREATE DATABASE base1; # se crea una base de datos
USE base1;
# estamos creando una tabla con los nombres de las columnas en parentesis con el tipo de dato y 
#y su longitud
#el tipo de dato varchar se adapta al tamano de caracterres que se utiliza  asi no se desperdicia memoria
# el id va a ser la llave primaria lo indacmos poniendo primary key 
CREATE TABLE usuarios (id int(10) primary key ,nombre varchar(50), apellido varchar(50),correo varchar(100));

