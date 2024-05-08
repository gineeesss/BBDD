Entregar, usando un archivo .sql, la actualización del  even_ Empresa,de manera  que se ejecute 
quince  minutos después del mediodía. Además, deberá disminuir en un 5% los presupuesto
superiores a 30000 euros. El aumento de los presupuestos inferiores a 20000 euros se mantiene.

SET GLOBAL event_scheduler = ON;

USE EMPRESA;

DELIMITER //

ALTER EVENT aumentar_presupuesto
ON SCHEDULE EVERY 1 DAY
STARTS '2024-05-15 12:15:00'
DO
BEGIN
    UPDATE DEPARTAMENTOS    
    SET Presupuesto = Presupuesto * 0.95
    WHERE Presupuesto > 30000;
    
    UPDATE DEPARTAMENTOS
    SET Presupuesto = Presupuesto * 1.05
    WHERE Presupuesto < 20000;
END//
DELIMITER ;

INSERT INTO DEPARTAMENTOS VALUES
(666,10,150,'P',31000,NULL,'GUAU'),
(777,20,NULL,'P',19000,NULL,'MUUUU');
