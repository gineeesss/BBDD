Modificar  en un archivo .sql, el evento even_Banco ,  de manera que  se ejecute una vez a la semana, a las tres de la tarde,  durante el mes de junio de este año, utilizando una llamada a un procedimiento. (el procedimiento se creará previamente).Modificar  en un archivo .sql, el evento even_Banco ,  de manera que  se ejecute una vez a la semana,
a las tres de la tarde,  durante el mes de junio de este año, utilizando una llamada a un procedimiento.
(el procedimiento se creará previamente)

SET GLOBAL event_scheduler = ON;

USE banco;

DROP PROCEDURE IF EXISTS actualizar_banco;
CREATE PROCEDURE actualzar_banco()
    DELETE FROM CUENTAS WHERE saldo < 0;


ALTER EVENT even_Banco
    ON SCHEDULE EVERY 1 WEEK
    STARTS '2021-06-01 15:00:00'
    ENDS '2021-06-30 15:00:00'
DO
    CALL actualizar_banco();

SELECT * FROM information_schema.events WHERE event_name = 'even_Banco' \G
