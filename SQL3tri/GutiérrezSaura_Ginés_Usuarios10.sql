-- 1. Crear un usuario de nombre usuario01 sin privilegios en el equipo local cuya
-- contraseña sea “qwerty01”. Comprobar la ejecución consultado en la base
-- de datos mysql.



-- 2. Crear un usuario de nombre usuario02 para cualquier equipo. Este usuario
-- tendrá como contraseña “qwerty02”.



-- 3. Concederle todos los privilegios (excepto GRANT OPTION) pero que solo
-- pueda acceder a la base dedatos jardineria.. Comprobar la ejecución
-- consultando en la base de datos mysql.



-- 4. Conceder privilegios a usuario01 del equipo local. Concretamente le vamos a
-- conceder privilegios para hacer consultas, insertar registros y actualizar datos
-- en la tabla clientes de la base de datos jardineria. Comprobar la ejecución con
-- una consulta en la base de datos mysql.



-- 5. Quitarle el privilegio de actualización sobre la tabla clientes a usuario01.



-- 6. Visualizar todos los privilegios concedidos al usuario usuario01.



-- 7. Crear un usuario usuario03 sin privilegios en un terminal remoto . Para no
-- complicarnos, usaremos la dirección IP o nombre de nuestro propio equipo.
-- Comprobamos que se ha creado consultando en la base de datos mysql.



-- 8. Crear un nuevo usuario llamado usuario04 en el equipo local con privilegios
-- de consulta sobre las columnas Nombre , Apellido y Apellido2 de la tabla
-- empleados en la base de datos jardineria. Comprobar la ejecución con una
-- consulta en la base de datos mysql.



-- 9. Creamos al usuario05 para el equipo local al que vamos a conceder los
-- mismos privilegios que al anterior, pero además le concedemos privilegios
-- para inserción en la columna Puesto. Comprobar la ejecución con una
-- consulta en la base de datos mysql.



-- 10. Vamos a retirar el privilegio de inserción sobre el campo Puesto al usuario
-- anterior.



-- 11. Eliminar ahora a usuario03. Comprobar que se ha eliminado consultando en la
-- base de datos mysql.



-- 12. Crear nuevamente al usuario03 en el equipo local pero ahora como
-- superusuario, es decir, hay que darle todos los privilegios incluido el
-- privilegio GRANT OPTION. Tendrá como contraseña “super”.



-- 13. Crear desde el usuario03 un nuevo usuario llamado usuario06 y concederle
-- los privilegios de SELECT, DELETE, UPDATE y ALTER sobre la tabla clientes de la
-- base de datos jardineria.



-- 14. Conceder al usuario06 el privilegio de GRANT OPTION y el privilegio de
-- INSERT sobre las columnas CodigoEmpleado, CodigoJefe y Puesto de la tabla
-- empleados. Comprobamos que se han asignado los privilegios citados al
-- usuario06 consultando en la base de datos mysql.



-- 15. Crear al usuario usuario07 desde el usuario root y luego, desde usuario06,
-- concederle el privilegio INSERT para las columnas CodigoEmpleado y Puesto de
-- la tabla empleados.
-- Salimos del monitor de usuario06 y entramos nuevamente como root
-- para comprobar que todo ha ido bien, consultando en la base de datos
-- mysql.



-- 16. Quitar el privilegio INSERT sobre los campos CodigoJefe y Puesto a usuario06
-- desde el usuario usuario03 (que fué quien se lo concedió).
-- Comprobar que todo ha ido correctamente con una consulta en mysql.
