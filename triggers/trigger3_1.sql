drop table if exists alumnos;
create table alumnos(
matricula int NOT NULL AUTO_INCREMENT, 
nombre varchar(50), 
edad int DEFAULT 0,
primary key(matricula));


