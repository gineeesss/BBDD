/* 1. Equipo y ciudad de los jugadores españoles de la NBA. */

SELECT e.Nombre, e.Ciudad
FROM jugadores j
JOIN equipos e ON j.Nombre_equipo = e.Nombre
WHERE j.Procedencia = 'Spain';

/* 2. Equipos que comiencen por H y terminen en S. */

SELECT Nombre
FROM equipos
WHERE Nombre LIKE 'H%S';


/* 3. Puntos por partido de 'Pau Gasol' en toda su carrera. */

SELECT ROUND(AVG(Puntos_por_partido),2)
FROM estadisticas
JOIN jugadores ON estadisticas.jugador = jugadores.codigo
WHERE jugadores.Nombre = 'Pau Gasol';

/* 4. Equipos que hay en la conferencia oeste ('west'). */

SELECT Nombre
FROM equipos
WHERE Conferencia = 'west';

/* 5. Jugadores de Arizona que pesen más de 100 kilos y midan más de 1.82m (6 pies). */

SELECT *
FROM jugadores
WHERE Procedencia = 'Arizona' AND Peso > 100 AND Altura > 1.82;

/* 6. Puntos por partido de los jugadores de los 'cavaliers'. */

SELECT j.Nombre, ROUND(AVG(e.Puntos_por_partido),2)
FROM jugadores j
JOIN estadisticas e ON j.codigo = e.jugador
JOIN equipos eq ON j.Nombre_equipo = eq.Nombre
WHERE eq.Nombre = 'cavaliers'
GROUP BY j.Nombre;

/* 7. Jugadores cuya tercera letra de su nombre sea la v. */

SELECT Nombre
FROM jugadores
WHERE SUBSTRING(Nombre, 3, 1) = 'v';

/* 8. Número de jugadores que tiene cada equipo de la conferencia oeste 'West'. */

SELECT Nombre_equipo, COUNT(*)
FROM jugadores
JOIN equipos ON jugadores.Nombre_equipo = equipos.Nombre
WHERE equipos.Conferencia = 'west'
GROUP BY Nombre_equipo;

/* 9. Número de jugadores Argentinos en la NBA. */

SELECT COUNT(*)
FROM jugadores
WHERE Procedencia = 'Argentina';


/* 10. Máxima media de puntos de 'Lebron James' en su carrera. */

SELECT MAX(Puntos_por_partido)
FROM estadisticas
JOIN jugadores ON estadisticas.jugador = jugadores.codigo
WHERE jugadores.Nombre = 'Lebron James';

/* 11. Asistencias por partido de 'Jose Calderon' en la temporada '07/08'. */

SELECT Asistencias_por_partido
FROM estadisticas
JOIN jugadores ON estadisticas.jugador = jugadores.codigo
WHERE jugadores.Nombre = 'Jose Calderon' AND estadisticas.temporada = '07/08';

/* 12. Puntos por partido de 'Lebron James' en las temporadas del 03/04 al 05/06. */

SELECT AVG(Puntos_por_partido)
FROM estadisticas
JOIN jugadores ON estadisticas.jugador = jugadores.codigo
WHERE jugadores.Nombre = 'Lebron James' AND estadisticas.temporada BETWEEN '03/04' AND '05/06';

/* 13. Número de jugadores que tiene cada equipo de la conferencia este 'East'. */

SELECT e.Nombre, COUNT(*) AS "Numero Jugadores Conferencia East"
FROM jugadores j INNER JOIN equipos e ON j.Nombre_equipo = e.Nombre
GROUP BY e.Nombre;

/* 14. Tapones por partido de los jugadores de los 'Blazers'. */

SELECT ROUND((SUM(Tapones_por_partido)/COUNT(j.codigo)),2) AS "Tapones por Partido" /*usar AVG en vez de hacer yo laedia*/
FROM estadisticas est INNER JOIN jugadores j ON est.jugador = j.codigo
WHERE j.Nombre_equipo LIKE "%Blazers";

/* 15. Media de rebotes de los jugadores de la conferencia Este 'East'. */

SELECT j.Nombre, ROUND((SUM(Rebotes_por_partido)/COUNT(j.codigo)),2) AS "Media Rebotes jugadores Este"
FROM estadisticas e INNER JOIN jugadores j ON e.jugador = j.codigo
WHERE j.Nombre_equipo IN (SELECT Nombre FROM equipos WHERE Conferencia="East")
GROUP BY j.Nombre; /*Es por cada jugador, no media de todos*/

/* 16. Rebotes por partido de los jugadores de los equipos de Los Angeles. */

SELECT ROUND(SUM(Rebotes_por_partido)/COUNT(*),2) AS "Rebotes por partidos de los jugadores en Los Angeles"
FROM estadisticas e INNER JOIN jugadores j ON e.jugador = j.codigo
WHERE Nombre_equipo IN(SELECT Nombre FROM equipos WHERE Ciudad="Los Angeles");

/* 17. Número de jugadores que tiene cada equipo de la división North West. */

SELECT COUNT(*) AS "Numero Jugadores", e.Nombre
FROM jugadores j INNER JOIN equipos e ON j.Nombre_equipo = e.Nombre 
WHERE e.Division = "NorthWest"
GROUP BY e.Nombre;

/* 18. Número de jugadores de España y Francia en la NBA. */

SELECT COUNT(*) AS "Jugadores españoles y franceses"
FROM jugadores
WHERE Procedencia = "Spain" OR Procedencia = "France";

/* 19. Número de pivots 'C' que tiene cada equipo. */

SELECT Nombre_equipo, COUNT(*)
FROM jugadores
WHERE PosiCIon = "C" OR Posicion LIKE "%-C%" OR Posicion LIKE "C-%"
GROUP BY Nombre_equipo;

/* 20. ¿Cuánto mide el pívot más alto de la nba? */

    SELECT Nombre, MAX(Altura)
    FROM jugadores
    WHERE PosiCIon = "C" OR Posicion LIKE "%-C%" OR Posicion LIKE "C-%";

/* 21. ¿Cuánto pesa (en libras y en kilos) el pívot más alto de la NBA? */

SELECT Nobre, MAX(Peso) AS "Peso en Libras", MAX(Peso)*0.45 AS "Peso en Kilos"
FROM jugadores
WHERE PosiCIon = "C" OR Posicion LIKE "%-C%" OR Posicion LIKE "C-%";

/* 22. Número de jugadores que empiezan por 'Y'. */

SELECT COUNT(*) AS "Numero de jugadores que empiezan por Y"
FROM jugadores
WHERE Nombre LIKE "Y%";

/* 23. Jugadores que no metieron ningún punto en alguna temporada. */

/* 24. Número total de jugadores de cada división. */

/* 25. Peso medio en kilos y en libras de los jugadores de los 'Raptors'. */

SELECT ROUND(AVG(Peso),2) AS "Peso medio en Libras", ROUND(AVG(Peso)*0.45,2) AS "Peso Medio en Kilos"
FROM jugadores
WHERE Nombre_equipo = "Raptors";

/* 26. Mostrar un listado de jugadores con el formato Tombre(Equipo) en una sola columna. */

/* 27. Puntuación más baja de un partido de la BA. */

/* 28. Primeros 10 jugadores por orden alfabético. */

/* 29. Temporada con más puntos por partido de 'Kobe Bryant'. */

/* 30. Número de bases 'G' que tiene cada equipo de la conferencia este 'East'. */

/* 31. Número de equipos que tiene cada conferencia. */

/* 32. Nombre de las divisiones de la conferencia Este. */

/* 33. Máximo reboteador de los 'Suns'. */

/* 34. Máximo anotador de la toda base de datos en una temporada. */

/* 35. Sacar cuántas letras tiene el nombre de cada jugador de los 'grizzlies' (Usar función LENGTH). */

/* 36. ¿Cuántas letras tiene el equipo con nombre más largo de la NBA (Ciudad y Nombre)? */