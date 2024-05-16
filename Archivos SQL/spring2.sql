Create domain ISBN as varchar(13);
Alter domain ISBN
Add constraint ISBNnum check (value ~ '^[0-9]+$');
Create domain DNI as varchar(8);
Alter domain DNI
Add constraint DNInum check (value ~ '^[0-9]+$');
Create domain id_legajo as varchar(10);
Alter domain id_legajo
Add constraint id_legajonum check (value ~ '^[0-9]+$');

Create table elementos(
elem_id ISBN primary key,
titulo varchar(50),
max_dias varchar(1)
);
Create table resumenes_capitulo(
	elem_id ISBN REFERENCES elementos(elem_id) ON DELETE CASCADE,
	nro_capitulo varchar(3),
	resumen text,
	primary key(elem_id, nro_capitulo)
);
Create table carreras(
	carrera_id serial PRIMARY KEY,
	tipo_carrera varchar(30),
	detalle text
);
Create table elemento_carrera(
	elem_id ISBN REFERENCES elementos(elem_id) ON DELETE CASCADE,
	carrera_id int REFERENCES carreras(carrera_id) ON DELETE CASCADE,
	PRIMARY key(elem_id, carrera_id)
);
Create table tipo_libro(
	Id_tipo_libro serial PRIMARY KEY,
	Descripcion varchar(20)
);
Create table editorial(
	editorial_id serial PRIMARY KEY,
	nom_editorial varchar(30),
	pagina_oficial varchar(50),
	mail varchar(30)
);
Create table autores(
autor_id serial PRIMARY KEY,
apellidos varchar(30),
nombres varchar(30)
);
Create table autores_libros(
	elem_id ISBN REFERENCES elementos(elem_id) ON UPDATE CASCADE ON DELETE CASCADE,
	autor_id int REFERENCES autores(autor_id) ON UPDATE CASCADE ON DELETE CASCADE,
	primary key(elem_id, autor_id)
);
create table libros (
elem_id ISBN PRIMARY KEY REFERENCES elementos(elem_id) ON UPDATE CASCADE ON DELETE SET NULL,
tipo_libro int REFERENCES tipo_libro(id_tipo_libro) ON UPDATE CASCADE ON DELETE SET NULL,
id_editorial int REFERENCES editorial(editorial_id) ON UPDATE CASCADE ON DELETE SET NULL,
lengua_origen varchar(50),
lengua_escritura varchar(50),
cant_paginas int
);
Create table ejemplares(
elem_id ISBN REFERENCES elementos(elem_id) ON DELETE SET NULL,
nro_ejemplar int,
retirable boolean,
PRIMARY KEY(elem_id, nro_ejemplar)
);
Create table periodo_revista(
	Tipo_periodo varchar(1) PRIMARY KEY,
	Descripcion varchar(20)
	);

Create table revistas(
elem_id ISBN REFERENCES elementos(elem_id) ON UPDATE CASCADE ON DELETE SET NULL,
nro_edicion varchar(5),
tipo_periodo varchar(1) REFERENCES periodo_revista(tipo_periodo) ON UPDATE CASCADE ON DELETE SET NULL,
PRIMARY KEY(elem_id, nro_edicion)
);
Create table personas(
		DNI DNI PRIMARY KEY,
		apellidos varchar(40),
		nombres varchar(40)
);
Create table alumnos(
	libreta id_legajo PRIMARY KEY,
	DNI DNI REFERENCES personas(DNI),
	carrera_id int REFERENCES carreras(carrera_id),
	fecha_inscripcion date,
	foto bytea
);
Create table suspensiones_alumn(
	libreta id_legajo REFERENCES alumnos(libreta),
	suspension_ts timestamp,
	descripcion text,
	primary key(libreta, suspension_ts)
);
Create table docentes(
		id_legajo id_legajo PRIMARY KEY,
		DNI DNI REFERENCES personas(DNI),
		fecha_inscripcion date
);
Create table moras_docentes(
	id_legajo id_legajo REFERENCES docentes(id_legajo),
	suspension_ts timestamp,
	descripcion text,
	primary key(id_legajo, suspension_ts)
);
Create table empleados(
	cod_empleado varchar(1) PRIMARY KEY,
	descripcion varchar(30),
	observacion text
);
INSERT INTO empleados (cod_empleado, descripcion, observacion)
VALUES
	('B', 'Bibliotecario', 'Jefe'),
	( 'A', 'Auxiliar', null),
	('E', 'Becario', 'No pueden entregar prestamos, solo recibir devoluciones');
Create table prestamos(
	cod_prestamo serial primary key,
	elemento_id ISBN,
	nro_ejemplar int,
	cod_empleado varchar(1) references empleados(cod_empleado),
	id_legajo id_legajo references alumnos(libreta),
	fecha_retiro date,
	fecha_devol	date,
	fecha_RealDevol date,
	foreign key(elemento_id, nro_ejemplar)
	references ejemplares(elem_id, nro_ejemplar)
);
CREATE TABLE articulo_revista (
elem_id ISBN REFERENCES elementos(elem_id) ON UPDATE CASCADE ON DELETE SET NULL,
nro_articulo varchar(3),
 detalle text,
	primary key(elem_id, nro_articulo)
);
--quise referenciar a la tabla revistas, pero no funca xq dice:
--ERROR: no hay restricción unique que coincida con las columnas dadas en la tabla referida «revistas» 
--solucionado al enmascarar ambas como una sola relacion.
--tabla de relacion pura
Create table autor_articulo(
	elem_id ISBN,
	nro_articulo varchar(3),
	autor_id int,
	PRIMARY KEY(elem_id,nro_articulo, autor_id),
	Foreign key(elem_id, nro_articulo)
	references articulo_revista(elem_id, nro_articulo)
	ON UPDATE CASCADE ON DELETE CASCADE,
	Foreign key(autor_id)
	references autores(autor_id)
	ON UPDATE CASCADE ON DELETE CASCADE
);



/*
datos harcode
PRIMERO AGREGAR CARRERAS, LUEGO LAS OTRAS TRES TABLAS

insert into carreras(detalle,tipo_carrera) values
	('Tecnicatura en Programacion', 'Pre-Grado'),
	('Tecnicatura en Alimentacion', 'Pre-Grado'),
	('Civil', 'Ingenieria'),
	('Electronica', 'Ingenieria'),
	('ElectroMecanica', 'Ingenieria');

---------------------------------------------------------------------------------------

insert into personas(dni, apellidos,nombres) values
	(40160500, 'gomez', 'roberto'),
	(40160501, 'gomez', 'juan'),
	(40160502, 'gomez', 'Marcos'),
	(40160503, 'gomez', 'Pedro');
insert into alumnos(libreta,dni,carrera_id) values
	(17290, 40160500, 23),
	(17291, 40160501, 21),
	(17292, 40160502, 22),
	(17293, 40160503, 24);
INSERT INTO prestamos (id_legajo, fecha_retiro) VALUES
	(17290, current_date), (17290, current_date),(17290, current_date), (17290, current_date),
	(17291, current_date), (17291, current_date),(17291, current_date), (17291, current_date),
	(17292, current_date),(17292, current_date),(17292, current_date),
	(17293, current_date),(17293, current_date);
*/







/*

EJERCICIO 2

SELECT legajo, COUNT(*) AS cantidad_prestamos
FROM prestamos
WHERE EXTRACT(YEAR FROM fecha_retiro) = Extract(Year from current_date)
GROUP BY legajo
HAVING COUNT(*) > 3;

*/




/*

EJERCICIO 3

UPDATE alumnos SET nombres = left(nombres,30);
ALTER TABLE alumnos 
ALTER COLUMN nombres TYPE varchar(30);

*/