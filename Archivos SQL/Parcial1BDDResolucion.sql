create table propietarios(
	dni int primary key,
	nombre varchar(50));
insert into propietarios(dni, nombre)
values (40160666,'Pepito'),(40160667,'Panchito'),(40160668,'Sturtcito'),(40160669,'Juanito');

create table marcas(
	codigo int primary key,
	nombre varchar(50),
	nacionalidad varchar(40));
insert into marcas(codigo, nombre, nacionalidad)
values (1, 'Ford', 'EEUU'), (2,'Chevrolet','narnia'),(3,'Volkswagen','aleman'),(4,'Ferrari','Italiana')

create table autos(
	patente varchar(8) primary key,
	modelo varchar(50),
	fechaAlta date,
	marca int,
	foreign key (marca) references marcas(codigo));
insert into autos(patente, modelo, marca)
values ('AF456JK','Fiesta',1),('AF999JK','K',2),('XX001AA','Chevi',2),('AF456QQ','Gol',3),('ZZaaQQ',null,null);

create table AutosPropietarios(
	dni int,
	patente varchar(8),
	fecha date,
	porcentaje varchar(3),
	primary key (dni, patente),
	foreign key (dni) references propietarios(dni),
	foreign key(patente) references autos(patente));
insert into AutosPropietarios(dni, patente, porcentaje)
values (40160666,'AF456JK','100'),(40160667,'AF999JK','75'),(40160668,'AF999JK','25'),(40160669,'ZZaaQQ',null)

select * from autospropietarios;

--Ej 2)--
select patente from autospropietarios
group by (patente)
having count(patente) =1;

select aut.patente,pro.nombre from autospropietarios aut
join propietarios pro on pro.dni = aut.dni 
group by (aut.patente, pro.nombre)
having count(aut.patente) =1;

--Ej 6)--
select v.*, (select count(*) from autospropietarios where patente = v.patente) as cantProp, m.nacionalidad
from autos v
join marcas m on m.codigo = v.marca;