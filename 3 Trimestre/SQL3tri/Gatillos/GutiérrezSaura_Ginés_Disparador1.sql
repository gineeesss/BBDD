CREATE DATABASE comercio2;

CREATE TABLE DEPARTAMENTOS(
	cod_dep VARCHAR(5),
	nombre_dep VARCHAR(15),
	presupuesto	 DECIMAL(8,2) DEFAULT 0,
	PRIMARY KEY (cod_dep)
);
CREATE TABLE EMPLEADOS(
	dni CHAR(9),
	nombre VARCHAR(30),
	salario_anual DECIMAL(7,2),
	cod_dep VARCHAR(5),
	PRIMARY KEY (dni),
	FOREIGN KEY (cod_dep) REFERENCES DEPARTAMENTOS(cod_dep)
);
INSERT INTO DEPARTAMENTOS(cod_dep,nombre_dep) VALUES
('10000', 'Technologia'),
('20000', 'Motomami');

DROP TRIGGER IF EXISTS dp_insert_empleado;
CREATE TRIGGER dp_insert_empleado AFTER INSERT ON EMPLEADOS
FOR EACH ROW
	UPDATE DEPARTAMENTOS
	SET presupuesto = presupuesto + NEW.salario_anual
	WHERE cod_dep = NEW.cod_dep;

INSERT INTO EMPLEADOS VALUES
('23123323P','Paco Sanz', 321.42,'10000'),
('31631620X','Andrea Garte',5512.42,'20000');


INSERT INTO DEPARTAMENTOS(cod_dep,nombre_dep) VALUES
('INFOR', 'Informática');
INSERT INTO EMPLEADOS VALUES
('58295719K','El Nuevo', 25000,'INFOR');

DROP TRIGGER IF EXISTS dp_modif_empleado;
CREATE TRIGGER dp_modif_empleado AFTER UPDATE ON EMPLEADOS
FOR EACH ROW
	UPDATE DEPARTAMENTOS
	SET presupuesto = presupuesto - OLD.salario_anual + NEW.salario_anual
	WHERE cod_dep = NEW.cod_dep;


UPDATE DEPARTAMENTOS SET presupuesto = 0
WHERE cod_dep='10000';

UPDATE EMPLEADOS SET salario_anual = 7725.14
WHERE dni='23123323P';
UPDATE EMPLEADOS SET salario_anual = 12.3
WHERE dni='31631620X';
UPDATE EMPLEADOS SET salario_anual = 77777.77
WHERE dni='58295719K';
