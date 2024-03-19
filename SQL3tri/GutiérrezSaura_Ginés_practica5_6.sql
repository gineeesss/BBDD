#1. Crea un usuario llamado paco@localhost con la sintaxis create user con permisos de solo conexión y comprueba que se pueda conectar.

CREATE USER paco@localhost IDENTIFIED BY'paco';

GRANT USAGE ON *.* TO paco@localhost;

#2. Crea un usuario llamado juan@localhost con la sintaxis grant con permisos desolo conexión y comprueba que se pueda conectar.

CREATE USER juan@localhost IDENTIFIED BY 'juan';

GRANT USAGE ON *.* TO juan@localhost;

#3. Otorga al usuario paco@localhost permisos de select en la tabla jardineria. Clientes y comprueba que se pueda consultar la tabla.

GRANT SELECT
ON jardineria.Clientes TO paco@localhost;

mysql -upaco -ppaco

SELECT *
FROM jardineria.Clientes;

#4. Otorga al usuario juan@localhost permisos de select, insert y update en las tablas de la base de datos jardineria con opcion GRA T.

GRANT SELECT,INSERT,UPDATE
ON jardineria.* TO juan@localhost;

#5. Conéctate con el usuario juan y otorga permisos a paco de selección en la tabla jardineria.Empleados.

GRANT SELECT 
ON jardineria.Empleados TO paco@localhost;

#6. Quítale ahora los permisos a paco de selección sobre la tabla jardineria.Clientes.

REVOKE SELECT
ON jardneria.Clientes FROM paco@localhost;

#7. Conéctate con root y elimina todos los permisos que has concedido a Paco y Juan.

REVOKE ALL PRIVILEGES
ON *.* FROM 'paco'@'localhost';

REVOKE ALL PRIVILEGES
ON *.* FROM juan@localhost WITH GRANT OPTION;

#8. Otorga a juan los permisos de SELECT sobre las columnas CodigoOficina y Ciudad de la tabla Oficinas de la base de datos jardineria.

GRANT SELECT(CodigoOficina,Ciudad)
ON jardineria.Oficinas TO juan@localhost;

#9. Conéctate con juan y ejecuta la query 'SELECT * from jardineria.Oficinas' ¿Qué sucede?

MYSQL -ujuan -pjuan
SELECT * from jardineria.Oficinas;

#10. Borra el usuario paco@localhost. 

SHOW GRANTS FOR 'paco'@'localhost';
