-- Crear el evento para incrementar el presupuesto cada seis meses
CREATE EVENT IF NOT EXISTS aumentar_presupuesto
ON SCHEDULE EVERY 6 MONTH
STARTS '2024-05-15 12:01:00'
DO
BEGIN
    -- Incrementar el presupuesto en un 5% para los departamentos con presupuesto inferior a 20000 euros
    UPDATE departamento
    SET presupuesto = presupuesto * 1.05
    WHERE presupuesto < 20000;
END;
