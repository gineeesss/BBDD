CREATE TABLE EMPLEADOS(
	dni VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellido1 VARCHAR(15) NOT NULL,
	apellido2 VARCHAR(15) NOT NULL,
	direcc VARCHAR(25),
	ciudad VARCHAR(20),
	codPostal VARCHAR(5),
	sexo ENUM('h','n') NOT NULL,
	fecha_nac DATE
);

CREATE TABLE TRABAJOS(
	codigo VARCHAR(5),
	nombre VARCHAR(10) UNIQUE,
	salario DECIMAL(6,2) CHECK (salario<=5000)
);

CREATE TABLE UNIVERSIDADES(
<<<<<<< HEAD
	univ_cod VARCHAR(5) PRIMARY KEY,
=======
	univ_od VARCHAR(5),
>>>>>>> 1554869dc70ff6ef9bae30a5f658cb084d1e999d
	nombre_univ VARCHAR(25),
	ciudad VARCHAR(20),
	cod_postal VARCHAR(5)
);

CREATE TABLE DEPARTAMENTOS(
	dptoCod INT AUTO_INCREMENT,
	nombre_dpto VARCHAR(30) UNIQUE NOT NULL,
	jefe VARCHAR(10),
	presupuesto DECIMAL(7,2) NOT NULL,
	PRIMARY KEY(dptoCod),
	FOREIGN KEY (jefe) REFERENCES EMPLEADOS(dni)
);

CREATE TABLE ESTUDIOS(
	dni_emple VARCHAR(10),
	numero INT,
	universidad VARCHAR(5),
	titulacion VARCHAR(30),
	especialidad VARCHAR(20),
	anio INT(4),
	PRIMARY KEY(dni_emple, numero),
	FOREIGN KEY(dni_emple) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE,
	FOREIGN KEY(universidad) REFERENCES UNIVERSIDADES(univ_cod) ON DELETE CASCADE
);
<<<<<<< HEAD

CREATE TABLE TRABAJOS(
	codigo VARCHAR(5) PRIMARY KEY,
	nombre VARCHAR(20) UNIQUE,
	salario DECIMAL(6,2) CHECK (salario <=5000) NOT NULL
);

CREATE TABLE HISTORIAL_LABORAL(
	Dni_emple VARCHAR(10),
	Trabajo_cod VARCHAR(5),
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE,
	PRIMARY KEY(Dni_emple, Trabajo_cod, fecha_inicio),
	FOREIGN KEY (dni_emple) REFERENCES EMPLEADOS(dni) ON DELETE CASCADE,
	FOREIGN KEY (Trabajo_cod) REFERENCES TRABAJOS(codigo)
);
=======
>>>>>>> 1554869dc70ff6ef9bae30a5f658cb084d1e999d
