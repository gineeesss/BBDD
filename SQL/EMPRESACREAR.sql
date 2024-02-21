-- phpMyAdmin SQL Dump
-- version 5.0.4deb2~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2024 at 10:05 AM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.27-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EMPRESA`
--

-- --------------------------------------------------------

--
-- Table structure for table `CENTROS`
--

CREATE TABLE `CENTROS` (
  `Numero` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CENTROS`
--

INSERT INTO `CENTROS` (`Numero`, `Nombre`, `Direccion`) VALUES
(10, 'SEDE CENTRAL', 'C/ ALCALA 820, MADRID'),
(20, 'RELACION CON CLIENTES', 'C/ ATOCHA 405, MADRID');

-- --------------------------------------------------------

--
-- Table structure for table `DEPARTAMENTOS`
--

CREATE TABLE `DEPARTAMENTOS` (
  `Numero` int(11) NOT NULL,
  `Centro` int(11) NOT NULL,
  `Director` int(11) DEFAULT NULL,
  `Tipo_dir` enum('P','F') NOT NULL,
  `Presupuesto` decimal(6,2) NOT NULL,
  `Dpto_jefe` int(11) DEFAULT NULL,
  `Nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `DEPARTAMENTOS`
--

INSERT INTO `DEPARTAMENTOS` (`Numero`, `Centro`, `Director`, `Tipo_dir`, `Presupuesto`, `Dpto_jefe`, `Nombre`) VALUES
(100, 10, 260, 'P', '12.00', NULL, 'DIRECCION GENERAL'),
(110, 20, 180, 'P', '15.00', 100, 'DIRECC. COMERCIAL'),
(111, 20, 180, 'F', '11.00', 110, 'SECTOR INDUSTRIAL'),
(112, 20, 270, 'P', '9.00', 100, 'SECTOR SERVICIOS'),
(120, 10, 150, 'F', '3.00', 100, 'ORGANIZACION'),
(121, 10, 150, 'P', '2.00', 120, 'PERSONAL'),
(122, 10, 350, 'P', '6.00', 120, 'PROCESO DE DATOS'),
(130, 10, 310, 'P', '2.00', 100, 'FINANZAS'),
(140, 20, NULL, 'P', '8.00', 100, 'MIAU');

-- --------------------------------------------------------

--
-- Table structure for table `EMPLEADOS`
--

CREATE TABLE `EMPLEADOS` (
  `Cod` int(11) NOT NULL,
  `Departamento` int(11) NOT NULL,
  `Telefono` varchar(11) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  `Fecha_ingreso` date NOT NULL,
  `Salario` decimal(6,2) NOT NULL,
  `Comision` decimal(5,2) DEFAULT NULL,
  `Num_hijos` int(11) NOT NULL,
  `NOmbre` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `EMPLEADOS`
--

INSERT INTO `EMPLEADOS` (`Cod`, `Departamento`, `Telefono`, `Fecha_nacimiento`, `Fecha_ingreso`, `Salario`, `Comision`, `Num_hijos`, `NOmbre`) VALUES
(110, 121, '350', '1969-11-10', '1990-02-10', '1310.00', NULL, 3, 'PONS, CESAR'),
(120, 112, '840', '1975-06-09', '1998-10-01', '1350.00', '110.00', 1, 'LASA, MARIO'),
(130, 112, '810', '1985-11-09', '2009-02-01', '1290.00', '110.00', 2, 'TEROL, LUCIANO'),
(150, 121, '340', '1970-08-10', '1997-01-15', '1440.00', NULL, 0, 'PEREZ, JULIO'),
(160, 111, '740', '1979-07-09', '2005-11-11', '1310.00', '110.00', 2, 'AGUIRRE, AUREO'),
(180, 110, '508', '1974-10-18', '1998-03-18', '1480.00', '50.00', 2, 'PEREZ, MARCOS'),
(190, 121, '350', '1972-05-12', '2002-02-11', '1300.00', NULL, 4, 'VEIGA, JULIANA'),
(210, 100, '200', '1980-09-28', '2010-01-22', '1380.00', NULL, 2, 'GALVEZ, PILAR'),
(240, 111, '760', '1982-02-26', '2006-02-24', '1280.00', '100.00', 3, 'SANZ, LAVINIA'),
(250, 100, '250', '1986-10-27', '2007-03-01', '990.00', NULL, 0, 'ALBA, ADRIANA'),
(260, 100, '220', '1983-12-03', '2008-07-12', '1720.00', NULL, 6, 'LOPEZ, ANTONIO'),
(270, 112, '800', '1985-05-21', '2009-09-10', '950.00', '80.00', 3, 'ARCIA, OCTAVIO'),
(280, 130, '410', '1988-01-11', '2020-10-08', '1100.00', NULL, 5, 'FLOR, DOROTEA'),
(285, 122, '620', '1989-10-25', '2018-02-15', '1380.00', NULL, 0, 'POLO, OTILIA'),
(290, 120, '910', '1987-11-30', '2012-02-14', '1270.00', NULL, 3, 'GIL, GLORIA'),
(310, 130, '480', '1991-11-21', '2019-01-05', '1420.00', NULL, 0, 'GARCIA, AUGUSTO'),
(320, 122, '620', '1997-12-25', '2018-02-05', '1405.00', NULL, 2, 'SANZ, CORNELIO'),
(330, 112, '850', '1988-08-19', '2010-03-01', '1280.00', '90.00', 0, 'DIEZ, AMELIA'),
(350, 122, '610', '1989-04-13', '2014-09-10', '1450.00', NULL, 1, 'CAMPS, AURELIO'),
(360, 111, '750', '1988-10-29', '2015-10-10', '1250.00', '100.00', 2, 'LARA, DORINDA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CENTROS`
--
ALTER TABLE `CENTROS`
  ADD PRIMARY KEY (`Numero`);

--
-- Indexes for table `DEPARTAMENTOS`
--
ALTER TABLE `DEPARTAMENTOS`
  ADD PRIMARY KEY (`Numero`),
  ADD KEY `fk_Centro` (`Centro`),
  ADD KEY `fk_Dpto_jefe` (`Dpto_jefe`),
  ADD KEY `fk_Director` (`Director`);

--
-- Indexes for table `EMPLEADOS`
--
ALTER TABLE `EMPLEADOS`
  ADD PRIMARY KEY (`Cod`),
  ADD KEY `fk_Departamento` (`Departamento`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `DEPARTAMENTOS`
--
ALTER TABLE `DEPARTAMENTOS`
  ADD CONSTRAINT `fk_Centro` FOREIGN KEY (`Centro`) REFERENCES `CENTROS` (`Numero`),
  ADD CONSTRAINT `fk_Director` FOREIGN KEY (`Director`) REFERENCES `EMPLEADOS` (`Cod`),
  ADD CONSTRAINT `fk_Dpto_jefe` FOREIGN KEY (`Dpto_jefe`) REFERENCES `DEPARTAMENTOS` (`Numero`);

--
-- Constraints for table `EMPLEADOS`
--
ALTER TABLE `EMPLEADOS`
  ADD CONSTRAINT `fk_Departamento` FOREIGN KEY (`Departamento`) REFERENCES `DEPARTAMENTOS` (`Numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
