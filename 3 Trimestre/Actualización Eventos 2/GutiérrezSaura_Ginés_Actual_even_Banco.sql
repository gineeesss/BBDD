Modificar  en un archivo .sql, el evento even_Banco ,  de manera que  se ejecute una vez a la semana, a las tres de la tarde,  durante el mes de junio de este año, utilizando una llamada a un procedimiento. (el procedimiento se creará previamente).Modificar  en un archivo .sql, el evento even_Banco ,  de manera que  se ejecute una vez a la semana,
a las tres de la tarde,  durante el mes de junio de este año, utilizando una llamada a un procedimiento.
(el procedimiento se creará previamente)

SET GLOBAL event_scheduler = ON;

USE banco;


DROP PROCEDURE IF EXISTS actualizar_banco;
DELIMITER //
CREATE PROCEDURE actualzar_banco()
