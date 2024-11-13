CREATE SCHEMA PRACTICA_2;
USE PRACTICA_2;
create table emple(emp_no 	INTEGER PRIMARY KEY,
apellido VARCHAR(50) NOT NULL,
oficio VARCHAR(30),
dir INTEGER,
fecha_alt DATE,
salario INTEGER,
comision INTEGER,	
dept_no INTEGER);	


create table depart(
dept_no INTEGER,
dnombre VARCHAR(30),
loc VARCHAR(30));


INSERT INTO emple VALUES (7369,'SÁNCHEZ','EMPLEADO',7902,'1990/12/17',
                        1040,NULL,20);
INSERT INTO emple VALUES (7499,'ARROYO','VENDEDOR',7698,'1990/02/20',
                        1500,390,30);
INSERT INTO emple VALUES (7521,'SALA','VENDEDOR',7698,'1991/02/22',
                        1625,650,30);
INSERT INTO emple VALUES (7566,'JIMÉNEZ','DIRECTOR',7839,'1991/04/02',
                        2900,NULL,20);
INSERT INTO emple VALUES (7654,'MARTÍN','VENDEDOR',7698,'1991/09/29',
                        1600,1020,30);
INSERT INTO emple VALUES (7698,'NEGRO','DIRECTOR',7839,'1991/05/01',
                        3005,NULL,30);
INSERT INTO emple VALUES (7782,'CEREZO','DIRECTOR',7839,'1991/06/09',
                       2885,NULL,10);
INSERT INTO emple VALUES (7788,'GIL','ANALISTA',7566,'1991/11/09',
                        3000,NULL,20);
INSERT INTO emple VALUES (7839,'REY','PRESIDENTE',NULL,'1991/11/17',
                        4100,NULL,10);
INSERT INTO emple VALUES (7844,'TOVAR','VENDEDOR',7698,'1991/09/08',
                        1350,0,30);
INSERT INTO emple VALUES (7876,'ALONSO','EMPLEADO',7788,'1991/09/23',
                        1430,NULL,20);
INSERT INTO emple VALUES (7900,'JIMENO','EMPLEADO',7698,'1991/12/03',
                        1335,NULL,30);
INSERT INTO emple VALUES (7902,'FERNÁNDEZ','ANALISTA',7566,'1991/12/03',
                        3000,NULL,20);
INSERT INTO emple VALUES (7934,'MUÑOZ','EMPLEADO',7782,'1992/01/23',
                        1690,NULL,10);

INSERT INTO depart VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO depart VALUES (20,'INVESTIGACIÓN','MADRID');
INSERT INTO depart VALUES (30,'VENTAS','BARCELONA');
INSERT INTO depart VALUES (40,'PRODUCCIÓN','BILBAO');

create table herramientas(
  descripcion varchar(50) primary key,
  estanteria  integer,
  unidades integer);

insert into herramientas values('Alicates',1,10);
insert into herramientas values('Soldador',1,15);
insert into herramientas values('Guantes',2,7);
insert into herramientas values('Martillo',3,10);
insert into herramientas values('Sierra',4,5);
insert into herramientas values('Destornillador',3,7);
insert into herramientas values('Metro',5,15);
insert into herramientas values('Escofina',6,5);
insert into herramientas values('Lima',6,10);
insert into herramientas values('Cortador',4,5);

create table personas(
  cod_hospital	integer,
  dni 		integer primary key,
  apellidos	varchar(50),
  funcion	varchar(30),
  salario	integer);

create table medicos(
  cod_hospital  integer,
  dni		integer primary key,
  apellidos	varchar(50),
  especialidad	varchar(50));

create table hospitales(
  cod_hospital  integer,
  nombre	varchar(50),
  direccion	varchar(50),
  num_plazas	integer);

insert into personas values(1,12345678,'García Hernández, Eladio','CONSERJE',1200);
insert into personas values(1,87654321,'Fuentes Bermejo, Carlos','DIRECTOR',2000);
insert into personas values(2,55544433,'González Marín, Alicia','CONSERJE',1200);
insert into personas values(1,66655544,'Castillo Montes, Pedro','MEDICO',1700);
insert into personas values(2,22233322,'Tristán García, Ana','MEDICO',1900);
insert into personas values(3,55544411,'Ruiz Hernández, Caridad','MEDICO',1900);
insert into personas values(3,99988333,'Serrano DÌaz, Alejandro','DIRECTOR',2400);
insert into personas values(4,33222111,'Mesa del Castillo, Juan','MEDICO',2200);
insert into personas values(2,22233333,'Martínez Molina, Andrés','MEDICO',1600);
insert into personas values(4,55544412,'Jiménez Jiménez, Dolores','CONSERJE',1200);
insert into personas values(4,22233311,'Martínez Molina, Gloria','MEDICO',1600);

insert into medicos values(1,66655544,'Castillo Montes, Pedro','PSIQUIATRA');
insert into medicos values(2,22233322,'Tristán García, Ana','CIRUJANO');
insert into medicos values(4,33222111,'Mesa del Castillo, Juan','DERMATOLOGO');
insert into medicos values(2,22233333,'Martínez Molina, AndrÈs','CIRUJANO');
insert into medicos values(4,22233311,'Martínez Molina, Gloria','PSIQUIATRA'); 

insert into hospitales values(1,'Rafael Méndez','Gran Vía, 7',250);
insert into hospitales values(2,'Reina Sofía','Junterones, 5',225);
insert into hospitales values(3,'Príncipe Asturias','Avenida ColÛn',150);
insert into hospitales values(4,'Virgen de la Arrixaca','Avenida Juan Carlos I',250);

  
