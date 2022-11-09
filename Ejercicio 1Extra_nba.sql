/*A continuación, se deben realizar las siguientes consultas sobre la base de datos:
1. Mostrar el nombre de todos los jugadores ordenados alfabéticamente.*/
use nba;
select * from jugador
order by nombre asc;

/*2. Mostrar el nombre de los jugadores que sean pivots (‘C’) y que pesen más de 200 libras,
ordenados por nombre alfabéticamente.*/
select * from jugador
where posicion like ('C') and peso>200
order by nombre asc;

/*3. Mostrar el nombre de todos los equipos ordenados alfabéticamente.*/
select * from equipo
order by nombre;

/*4. Mostrar el nombre de los equipos del este (East).*/
select * from equipo
where conferencia in ('East');

#5. Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.
select * from equipo
where ciudad like ('c%');

#6. Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.
select * from jugador
order by nombre_equipo asc;


#7. Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.
select * from jugador
where nombre_equipo in ('Raptors')
order by nombre asc;

#8. Mostrar los puntos por partido del jugador ‘Pau Gasol’.
select e.Puntos_por_partido, j.nombre from estadistica e inner join jugador j
on e.jugador= j.codigo
where nombre in ('Pau Gasol');

select * from estadistica;
select * from jugador;

#9. Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.
select e.Puntos_por_partido, j.nombre from estadistica e inner join jugador j
on e.jugador= j.codigo
where nombre in ('Pau Gasol') and e.temporada in ('04/05');

#10. Mostrar el número de puntos de cada jugador en toda su carrera.
select j.nombre, round(SUM(e.Puntos_por_partido),0) as 'cantidadTotalPuntos' from estadistica e inner join jugador j
on e.jugador= j.codigo
group by j.nombre
order by cantidadTotalPuntos desc;

#11. Mostrar el número de jugadores de cada equipo.
select* from equipo;
select * from jugador;
select nombre_equipo, count(codigo) as "Cantidad de Jugadores" from jugador
group by nombre_equipo;


#12. Mostrar el jugador que más puntos ha realizado en toda su carrera.

select j.nombre, round(SUM(e.Puntos_por_partido),0) as 'cantidadTotalPuntos' from estadistica e inner join jugador j
on e.jugador= j.codigo
group by j.nombre
order by cantidadTotalPuntos desc
limit 1;

#13. Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.

select * from jugador;

select e.nombre, e.conferencia, e.division, j.nombre, j.altura from equipo e inner join jugador j
on j.nombre_equipo=e.nombre
where j.altura=(select max(altura) from jugador);

#14. Mostrar la media de puntos en partidos de los equipos de la división Pacific.
select * from equipo;
select * from partido;
select * from estadistica;

select e.division, avg(p.puntos_local + p.puntos_visitante) as 'media de puntos totales' from partido p inner join  equipo e
on e.nombre = p.equipo_local or e.nombre=p.equipo_visitante
where e.division in ('Pacific');


#15. Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor
#diferencia de puntos.
use nba;
select *, abs(puntos_local - puntos_visitante) as diferencia from partido 
where abs(puntos_local-puntos_visitante)=(select max(abs(puntos_local-puntos_visitante)) from partido);

#17. Mostrar los puntos de cada equipo en los partidos, tanto de local como de visitante.

SELECT DISTINCT(e.nombre),
        (SELECT SUM(puntos_local) FROM partido WHERE equipo_local = e.nombre) as Puntos_local,
        (SELECT SUM(puntos_visitante) FROM partido WHERE equipo_visitante = e.nombre) as Puntos_visitante
FROM equipo as e;

#18. Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante,
#equipo_ganador), en caso de empate sera null.*/
SELECT codigo, equipo_local, equipo_visitante, IF(puntos_local>puntos_visitante, equipo_local, IF(puntos_local<puntos_visitante, equipo_visitante, null)) as 'equipo_ganador'
FROM partido;

select * from partido;
select * from equipo;
select * from jugador;
select * from estadistica;

/*CANDADO A
Posición: El candado A está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:

Teniendo el máximo de asistencias por partido, muestre cuantas veces se logró dicho máximo.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/

select MAX(asistencias_por_partido) from estadistica;

SELECT * from estadistica
order by asistencias_por_partido desc;
##2

/*
Clave: La clave del candado A estará con formada por la/s siguientes consulta/s a la base de
datos:
Muestre la suma total del peso de los jugadores, donde la conferencia sea Este y la posición sea
centro o esté comprendida en otras posiciones.*/
select SUM(j.peso) from jugador j
inner join equipo e
on j.nombre_equipo=e.nombre
where j.posicion like('%c%') and e.conferencia like ('East');

##14043
select * from jugador j
inner join equipo e
on j.nombre_equipo=e.nombre
where j.posicion like('%c%') and e.conferencia like ('East');

select * from partido;
select * from equipo;
select * from jugador;
select * from estadistica;


/*
CANDADO B
Posición: El candado B está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Muestre la cantidad de jugadores que poseen más asistencias por partidos, que el numero de
jugadores que tiene el equipo Heat.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/
select * from partido;
select * from equipo;
select * from jugador;
select * from estadistica;

select count(jugador) from estadistica
where Asistencias_por_partido>(select count(nombre) from jugador where nombre_equipo like ('%Heat%'));
##3

select count(nombre) from jugador where nombre_equipo like ('%Heat%');
select * from estadistica
order by Asistencias_por_partido desc;

/*
Clave: La clave del candado B estará con formada por la/s siguientes consulta/s a la base de
datos:
La clave será igual al conteo de partidos jugados durante las temporadas del año 1999.*/


select count(codigo) as 'partidos_jugados' from partido
where temporada like ('%99%');
##3480

/*
CANDADO C
Posición: El candado C está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
La posición del código será igual a la cantidad de jugadores que proceden de Michigan y forman
parte de equipos de la conferencia oeste.
Al resultado obtenido lo dividiremos por la cantidad de jugadores cuyo peso es mayor o igual a
195, y a eso le vamos a sumar 0.9945.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/

select sum(count(codigo)/((select count(nombre) from jugador
where procedencia like '%Michigan%' and  nombre_equipo in (select nombre from equipo where conferencia like '%West%'))0.9945) from jugador
where peso >=195;


select count(codigo) from jugador
where peso >=195;

select count(nombre) from jugador
where procedencia like '%Michigan%' and  nombre_equipo in (select nombre from equipo where conferencia like '%West%');




/*
Clave: La clave del candado B estará con formada por la/s siguientes consulta/s a la base de
datos:
Para obtener el siguiente código deberás redondear hacia abajo el resultado que se devuelve de
sumar: el promedio de puntos por partido, el conteo de asistencias por partido, y la suma de
tapones por partido. Además, este resultado debe ser, donde la división sea central.*/




/*
CANDADO D
Posición: El candado D está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Muestre los tapones por partido del jugador Corey Maggette durante la temporada 00/01. Este
resultado debe ser redondeado. Nota: el resultado debe estar redondeado
Este resultado nos dará la posición del candado (1, 2, 3 o 4)

Clave: La clave del candado D estará con formada por la/s siguientes consulta/s a la base de
datos:
Para obtener el siguiente código deberás redondear hacia abajo, la suma de puntos por partido
de todos los jugadores de procedencia argentina*/





