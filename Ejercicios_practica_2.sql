/*
PRÁCTICA 2
*/
use practica_2;

-- 1. Visualizar el número de empleados de cada departamento. Utilizar GROUP BY para agrupar por departamento.
select depart.dnombre, count(emp_no) as num_emple
from depart left join emple
on depart.dept_no=emple.dept_no
group by depart.dnombre;

/* 2. Visualizar los departamentos con más de 5 empleados. Utilizar GROUP BY
para agrupar por departamento y HAVING para establecer la condición sobre los
grupos.*/
select depart.dnombre, count(emp_no) as num_emple
from depart left join emple
on depart.dept_no=emple.dept_no
group by depart.dnombre
having num_emple > 5;

-- 3. Hallar la media de los salarios de cada departamento (utilizar la función avg y GROUPBY).
select depart.dnombre, avg(salario) as prome_sal_dept 
from depart left join emple
on depart.dept_no=emple.dept_no
group by depart.dnombre;

-- 4. Visualizar el nombre de los empleados vendedores del departamento
-- ʻVENTASʼ (Nombre del departamento=ʼVENTASʼ, oficio=ʼVENDEDORʼ).
select emple.apellido, emple.oficio, depart.dnombre as Departamento 
from depart inner join emple
on depart.dept_no=emple.dept_no
where depart.dnombre = 'VENTAS' and emple.oficio = 'VENDEDOR';

-- 5. Visualizar el número de vendedores del departamento ʻVENTASʼ (utilizar la
-- función COUNT sobre la consulta anterior).
select depart.dnombre as Departamento, count(emple.oficio) as num_vendedores 
from depart inner join emple
on depart.dept_no=emple.dept_no
where depart.dnombre = 'VENTAS' and emple.oficio = 'VENDEDOR'
group by Departamento;

-- 6. Visualizar los oficios de los empleados del departamento ʻVENTASʼ.
select depart.dnombre as Departamento, emple.oficio as Oficio
from depart inner join emple
on depart.dept_no=emple.dept_no
where depart.dnombre = 'VENTAS';

/* 7. A partir de la tabla EMPLE, visualizar el número de empleados de cada
departamento cuyo oficio sea ʻEMPLEADOʼ (utilizar GROUP BY para agrupar por
departamento. En la cláusula WHERE habrá que indicar que el oficio es
ʻEMPLEADOʼ)*/
select depart.dnombre, emple.oficio, count(emp_no) as num_emple
from depart left join emple
on depart.dept_no=emple.dept_no
where emple.oficio = 'EMPLEADO'
group by depart.dnombre;

-- 8. Visualizar el departamento con más empleados.
-- query para consultar cantidad de empleados por departamento
select depart.dnombre, count(emp_no) as num_emple
from depart left join emple
on depart.dept_no=emple.dept_no
group by depart.dnombre;

-- query para consultar el departamento con más empleados
select depart.dnombre, count(emp_no) as num_emple
from depart left join emple
on depart.dept_no=emple.dept_no
group by depart.dnombre
having num_emple = (select count(emp_no) as num_emple from emple group by dept_no order by count(emp_no) desc limit 1);

-- 9. Mostrar los departamentos cuya suma de salarios sea mayor que la media de salarios de todos los empleados.
select emple.dept_no, depart.dnombre, sum(emple.salario) as suma_salarios
from depart left join emple 
on depart.dept_no=emple.dept_no
group by emple.dept_no, depart.dnombre
having suma_salarios > (select avg(emple.salario) from emple);

-- 10. Para cada oficio obtener la suma de salarios.
select e.oficio as Oficio, sum(e.salario) as Suma_salarios
from depart as d inner join emple as e
on e.dept_no=d.dept_no
group by e.oficio;

-- 11. Visualizar la suma de salarios de cada oficio del departamento ʻVENTASʼ. 
select d.dnombre as Departamento, e.oficio as Oficio, sum(e.salario) as Suma_salarios
from depart as d inner join emple as e
on e.dept_no=d.dept_no
where d.dnombre = 'VENTAS'
group by e.oficio;

-- 12. Visualizar el número de departamento que tenga más empleados cuyo oficio sea empleado.
select d.dept_no as num_dept, e.oficio as oficio, count(e.emp_no) as num_emple
from emple as e inner join depart as d
on e.dept_no=d.dept_no
where oficio = 'EMPLEADO'
group by num_dept, oficio
having num_emple = (
	select max(tabla.num_emple) from (
		select count(e.emp_no) as num_emple
		from emple as e inner join depart as d
		on e.dept_no=d.dept_no
		where oficio = 'EMPLEADO'
		group by d.dept_no, e.oficio
    ) as tabla);

-- otra forma de resolverlo podría ser
select d.dept_no as num_dept, e.oficio as oficio, count(e.emp_no) as num_emple
from emple as e inner join depart as d
on e.dept_no=d.dept_no
where oficio = 'EMPLEADO'
group by num_dept, oficio
having num_emple = (
	select count(e.emp_no) as num_emple
    from emple as e inner join depart as d
    on e.dept_no=d.dept_no
    where e.oficio = 'EMPLEADO'
    group by d.dept_no, e.oficio order by num_emple desc limit 1);
    
-- 13. Mostrar el número de oficios distintos de cada departamento.
select distinct e.oficio, e.dept_no
from emple as e inner join depart as d 
on e.dept_no=d.dept_no;

-- 14. Mostrar los departamentos que tengan más de dos personas trabajando en la misma profesión.
select d.dnombre as departamento, e.oficio as oficio, count(e.emp_no) as num_trabajadores
from emple as e inner join depart as d
on e.dept_no=d.dept_no
group by departamento, oficio
having num_trabajadores > 2
order by departamento, num_trabajadores;

-- 15. Dada la tabla HERRAMIENTAS, visualizar por cada estantería la suma de las unidades.
select estanteria, sum(unidades) as suma_unidades from herramientas group by estanteria order by estanteria;

-- 16. Visualizar la estantería con más unidades de la tabla HERRAMIENTAS.
select estanteria, sum(unidades) as suma_unidades from herramientas group by estanteria order by suma_unidades desc limit 1;

-- 17. Mostrar el número de médicos que pertenecen a cada hospital, ordenado por número descendente de hospital.
-- En esta query solo utilizo los medicos que aparecen en la tabla medicos más no los que aparecen en la tabla personas.
select h.cod_hospital as cod_hospital, h.nombre as hospital, count(m.dni) as num_medicos 
from hospitales as h left join medicos as m
on m.cod_hospital=h.cod_hospital
group by h.nombre, h.cod_hospital
order by cod_hospital desc;

-- Si utilizamos los médicos que aparecen en las tablas personas y medicos, tendremos la siguiente consulta
select uni_per_med.cod_hospital, uni_per_med.hospital, sum(uni_per_med.num_medicos) 
from (
	select h.cod_hospital as cod_hospital, h.nombre as hospital, count(m.dni) as num_medicos 
	from hospitales as h left join medicos as m
	on m.cod_hospital=h.cod_hospital
	group by h.nombre, h.cod_hospital

	union all

	select h.cod_hospital as cod_hospital, h.nombre as hospital, count(p.dni) as num_medicos
	from hospitales as h left join personas as p
	on p.cod_hospital=h.cod_hospital
	where p.funcion = 'MEDICO'
	group by h.nombre, h.cod_hospital
) as uni_per_med
group by uni_per_med.cod_hospital, uni_per_med.hospital
order by uni_per_med.cod_hospital desc;

-- 18. Realizar una consulta en la que se muestre por cada hospital el nombre de
-- las especialidades que tiene.
select h.nombre as hospital, m.especialidad as especialidad
from hospitales as h left join medicos as m
on h.cod_hospital=m.cod_hospital;

/* 19. Realizar una consulta en la que aparezca por cada hospital y en cada
especialidad el número de médicos (tendrás que partir de la consulta anterior y
utilizar GROUP BY).*/
select h.cod_hospital, h.nombre as hospital, m.especialidad as especialidad, count(m.dni) as num_medicos
from hospitales as h left join medicos as m
on h.cod_hospital=m.cod_hospital
group by h.nombre, m.especialidad, h.cod_hospital;

-- 20. Obtener por cada hospital el número de empleados.
-- Para este ejercicio contemplo los empleados que aparecen en la tabla personas y los empleados que aparecen en la tabla medicos
-- de esta forma le metemos más nivel a las subconsultas con las uniones
select tab_uni.hospital as hospital, sum(tab_uni.num_empleados) as num_empleados 
from (
	select h.nombre as hospital, count(m.dni) as num_empleados 
	from hospitales as h left join medicos as m
	on h.cod_hospital=m.cod_hospital
	group by h.nombre

	union 

	select h.nombre as hospital, count(p.dni) as num_empleados
	from hospitales as h left join personas as p
	on h.cod_hospital=p.cod_hospital
	group by h.nombre
) as tab_uni
group by tab_uni.hospital;

-- 21. Obtener por cada especialidad el número de trabajadores.
select especialidad , count(dni) as num_trabajadores
from medicos 
group by especialidad

union 

select funcion, count(dni) as num_trabajadores
from personas
group by funcion;

-- 22. Visualizar la especialidad que tenga más médicos.
select especialidad, count(dni) as num_medicos
from medicos
group by especialidad
having count(dni) = (select count(dni) as num_medicos from medicos group by especialidad order by count(dni) desc limit 1);

-- 23. ¿Cuál es el nombre del hospital que tiene mayor número de plazas?
select nombre, num_plazas
from hospitales
where num_plazas = (select max(num_plazas) from hospitales);

-- 24. Visualizar las diferentes estanterías de la tabla HERRAMIENTAS ordenados 
-- descendentemente por estantería.
select distinct estanteria from herramientas order by estanteria desc;

-- 25. Averiguar cuántas unidades tiene cada estantería.
select estanteria, sum(unidades) as unidades_totales
from herramientas
group by estanteria
order by estanteria desc;

-- 26. Visualizar las estanterías que tengan más de 15 unidades 
select estanteria, sum(unidades) as unidades_totales
from herramientas
group by estanteria
having unidades_totales > 15
order by estanteria desc;

-- 27. ¿Cuál es la estantería que tiene más unidades?
select estanteria, sum(unidades) as unidades_totales
from herramientas
group by estanteria
having unidades_totales = (
	select max(uni.unidades_totales) as unidades_maximas 
    from (
		select estanteria, sum(unidades) as unidades_totales
		from herramientas
		group by estanteria
		order by estanteria desc
	) as uni
)
order by estanteria desc;

-- Una forma más corta de hacer el ejercicio anterior podría ser
select estanteria, sum(unidades) as unidades_totales
from herramientas
group by estanteria
having unidades_totales = (
	select sum(unidades) as unidades_totales 
    from herramientas 
    group by estanteria 
    order by unidades_totales desc limit 1
);

-- 28. A partir de las tablas EMPLE y DEPART mostrar los datos del
-- departamento que no tiene ningún empleado.
-- Con esta query hallamos los departamentos que existen en la tabla empleados
select distinct dept_no from emple;
select dnombre, dept_no from depart where dept_no not in (select distinct dept_no from emple);

-- Otra forma de resolver
select depart.dnombre, depart.dept_no, count(emp_no) as num_emple
from depart left join emple
on depart.dept_no=emple.dept_no
group by depart.dnombre, depart.dept_no
having num_emple = 0;
 
/* 29. Mostrar el número de empleados de cada departamento. En la salida se
debe mostrar también los departamentos que no tienen ningún empleado.*/
select depart.dept_no, depart.dnombre, count(emp_no) as num_emple
from depart left join emple
on depart.dept_no=emple.dept_no
group by depart.dnombre, depart.dept_no;

/* 30. Obtener la suma de salarios de cada departamento, mostrando las
columnas DEPT_NO, SUMA DE SALARIOS y DNOMBRE. En el resultado
también se deben mostrar los departamentos que no tienen asignados
empleados.*/
select d.dept_no as dept_no, d.dnombre as departamento, sum(e.salario) as suma_de_salarios
from depart as d left join emple as e
on d.dept_no=e.dept_no
group by d.dept_no, d.dnombre;

/*31. Utilizar la función IFNULL en la consulta anterior para que en el caso de
que un departamento no tenga empleados, aparezca como suma de salarios el
valor 0.*/
select d.dept_no as dept_no, d.dnombre as departamento, ifnull(sum(e.salario),0.0) as suma_de_salarios
from depart as d left join emple as e
on d.dept_no=e.dept_no
group by d.dept_no, d.dnombre;

/*32. Obtener el número de médicos que pertenecen a cada hospital, mostrando
las columnas COD_HOSPITAL, NOMBRE y NÚMERO DE MÉDICOS. En el
resultado deben aparecer también los datos de los hospitales que no tienen
médicos.*/
select h.cod_hospital as cod_hospital, h.nombre as hospital, count(m.dni) as numero_de_medicos
from hospitales as h left join medicos as m
on h.cod_hospital=m.cod_hospital
group by h.cod_hospital, h.nombre;


