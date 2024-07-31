/* consulta datos a la tabla inscritos */
select * from inscritos i ;

/* Resolución Desafio 2 */
/* 1. ¿Cuántos registros hay? */
select count(cantidad) from inscritos i; 

/* 2. ¿Cuántos inscritos hay en total? */

select sum(cantidad) from inscritos i;

/* ¿Cuál o cuáles son los registros de mayor antigüedad? */
select 
	cantidad, fecha
from inscritos i  
where 
	fecha = (
		select * from (select min(fecha) from inscritos)
	);

/* 4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
ahora en adelante) */

select 
	sum(cantidad), fecha
from 
	inscritos i
group by
	fecha 
order by
	fecha asc ;

/* 5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
inscribieron en ese día? */


select 
	fecha, sum(cantidad) 
from 
	inscritos i
group by
	fecha 
order by
	sum(cantidad) desc 
limit 1;