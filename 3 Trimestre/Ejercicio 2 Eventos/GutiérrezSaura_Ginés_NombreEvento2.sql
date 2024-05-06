-- Crear el evento para incrementar el presupuesto cada seis meses
CREATE EVENT IF NOT EXISTS aumentar_presupuesto
ON SCHEDULE EVERY 6 MONTH
STARTS '2024-05-15 12:01:00'
DO
BEGIN
    UPDATE departamento
    SET presupuesto = presupuesto * 1.05
    WHERE presupuesto < 20000;
END;

SHOW EVENTS IN EMPRESA \G