-- 2. Sacar el nombre, los apellidos y el email de los empleados a cargo de Alberto Soria.

SELECT Nombre, Apellido1, Email
FROM Empleados
WHERE CodigoJefe = (
    SELECT CodigoEmpleado
    FROM Empleados
    WHERE Nombre = 'Alberto' AND Apellido1 = 'Soria'
);

/*1. Obtener el nombre del producto más caro*/



/*2. Obtener el nombre del producto del que más unidades se hayan vendido en un mismo pedido*/



/*4. Sacar el producto que más unidades tiene en stock y el que menos unidades tiene en stock.*/




