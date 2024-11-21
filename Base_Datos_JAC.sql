/*Creacion base de datos*/
CREATE SCHEMA `bd_jacumbavita` ;
USE `bd_jacumbavita` ;

/*Creacion de tablas*/
CREATE TABLE `bd_jacumbavita`.`Departamento` (
  `idDepartamento` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB;

CREATE TABLE `bd_jacumbavita`.`EtapadeVida` (
  `idEtapadeVida` INT NOT NULL,
  `NombreEtapa` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`idEtapadeVida`))
ENGINE = InnoDB;

CREATE TABLE `bd_jacumbavita`.`GrupoSisben` (
  `idGrupoSisben` INT NOT NULL,
  `GrupoSisben` VARCHAR(45) NOT NULL,
  `Clasificación` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGrupoSisben`))
ENGINE = InnoDB;

CREATE TABLE `bd_jacumbavita`.`Origen` (
  `idOrigen` INT NOT NULL,
  `LugarNacimiento` VARCHAR(45) NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idOrigen`),
	FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `bd_jacumbavita`.`Departamento` (`idDepartamento`))
ENGINE = InnoDB;

CREATE TABLE `bd_jacumbavita`.`NucleoFamiliar` (
  `idNucleoFamiliar` INT NOT NULL,
  `NumeroPersonas` INT NOT NULL,
  `GrupoSisben_idGrupoSisben` INT NOT NULL,
  PRIMARY KEY (`idNucleoFamiliar`),
	FOREIGN KEY (`GrupoSisben_idGrupoSisben`)
    REFERENCES `bd_jacumbavita`.`GrupoSisben` (`idGrupoSisben`))
ENGINE = InnoDB;

CREATE TABLE `bd_jacumbavita`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `Tipo_id` VARCHAR(45) NOT NULL,
  `numero_id` INT NOT NULL,
  `Nombres` VARCHAR(60) NOT NULL,
  `Apellidos` VARCHAR(60) NOT NULL,
  `Edad` INT NOT NULL,
  `Telefono` INT NOT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `EtapadeVida_idEtapadeVida` INT NOT NULL,
  `Origen_idOrigen` INT NOT NULL,
  `NucleoFamiliar_idNucleoFamiliar` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
    FOREIGN KEY (`EtapadeVida_idEtapadeVida`)
    REFERENCES `bd_jacumbavita`.`EtapadeVida` (`idEtapadeVida`),
    FOREIGN KEY (`Origen_idOrigen`)
    REFERENCES `bd_jacumbavita`.`Origen` (`idOrigen`),
    FOREIGN KEY (`NucleoFamiliar_idNucleoFamiliar`)
    REFERENCES `bd_jacumbavita`.`NucleoFamiliar` (`idNucleoFamiliar`))
ENGINE = InnoDB;

/*Consulta de tablas*/

SELECT * FROM `bd_jacumbavita`.`Usuario`;
SELECT * FROM `bd_jacumbavita`.`EtapadeVida`;
SELECT * FROM `bd_jacumbavita`.`Departamento`;
SELECT * FROM `bd_jacumbavita`.`Origen`;
SELECT * FROM `bd_jacumbavita`.`GrupoSisben`;
SELECT * FROM `bd_jacumbavita`.`NucleoFamiliar`;

/*Insertar datos a las tablas*/

INSERT INTO `bd_jacumbavita`.`Departamento` ( `idDepartamento`,`Nombre`) VALUES ('1','Boyacá');
INSERT INTO `bd_jacumbavita`.`Departamento` ( `idDepartamento`,`Nombre`) VALUES ('2','Cundinamarca');
INSERT INTO `bd_jacumbavita`.`Departamento` ( `idDepartamento`,`Nombre`) VALUES ('3','Casanare');
INSERT INTO `bd_jacumbavita`.`Departamento` ( `idDepartamento`,`Nombre`) VALUES ('4','Choco');
INSERT INTO `bd_jacumbavita`.`Departamento` ( `idDepartamento`,`Nombre`) VALUES ('5','Santander');

INSERT INTO `bd_jacumbavita`.`EtapadeVida` (`idEtapadeVida` , `NombreEtapa`) VALUES ('101','Fase Prenatal');
INSERT INTO `bd_jacumbavita`.`EtapadeVida` (`idEtapadeVida` , `NombreEtapa`) VALUES ('102','Infancia');
INSERT INTO `bd_jacumbavita`.`EtapadeVida` (`idEtapadeVida` , `NombreEtapa`) VALUES ('103','Niñez');
INSERT INTO `bd_jacumbavita`.`EtapadeVida` (`idEtapadeVida` , `NombreEtapa`) VALUES ('104','Adolescencia');
INSERT INTO `bd_jacumbavita`.`EtapadeVida` (`idEtapadeVida` , `NombreEtapa`) VALUES ('105','Juventud');
INSERT INTO `bd_jacumbavita`.`EtapadeVida` (`idEtapadeVida` , `NombreEtapa`) VALUES ('106','Adultez');
INSERT INTO `bd_jacumbavita`.`EtapadeVida` (`idEtapadeVida` , `NombreEtapa`) VALUES ('107','Tercera Edad');

INSERT INTO `bd_jacumbavita`.`GrupoSisben` (`idGrupoSisben`,`GrupoSisben`, `Clasificación`) VALUES ('1','GrupoA','Pobreza Extrema');
INSERT INTO `bd_jacumbavita`.`GrupoSisben` (`idGrupoSisben`,`GrupoSisben`, `Clasificación`) VALUES ('2','GrupoB','Pobreza Moderada');
INSERT INTO `bd_jacumbavita`.`GrupoSisben` (`idGrupoSisben`,`GrupoSisben`, `Clasificación`) VALUES ('3','GrupoC','Vulnerable');
INSERT INTO `bd_jacumbavita`.`GrupoSisben` (`idGrupoSisben`,`GrupoSisben`, `Clasificación`) VALUES ('4','GrupoD','Población no pobre, no vulnerable');

INSERT INTO `bd_jacumbavita`.`Origen` (`idOrigen`, `LugarNacimiento`, `Departamento_idDepartamento` ) VALUES ('201', 'Almeida', '1');
INSERT INTO `bd_jacumbavita`.`Origen` (`idOrigen`, `LugarNacimiento`, `Departamento_idDepartamento` ) VALUES ('202', 'Guateque', '1');
INSERT INTO `bd_jacumbavita`.`Origen` (`idOrigen`, `LugarNacimiento`, `Departamento_idDepartamento` ) VALUES ('203', 'Garagoa', '1');
INSERT INTO `bd_jacumbavita`.`Origen` (`idOrigen`, `LugarNacimiento`, `Departamento_idDepartamento` ) VALUES ('204', 'Bogota', '2');
INSERT INTO `bd_jacumbavita`.`Origen` (`idOrigen`, `LugarNacimiento`, `Departamento_idDepartamento` ) VALUES ('205', 'Villanueva', '3');

INSERT INTO `bd_jacumbavita`.`NucleoFamiliar` (`idNucleoFamiliar`, `NumeroPersonas`, `GrupoSisben_idGrupoSisben` ) VALUES ('21', '1', '1');
INSERT INTO `bd_jacumbavita`.`NucleoFamiliar` (`idNucleoFamiliar`, `NumeroPersonas`, `GrupoSisben_idGrupoSisben` ) VALUES ('22', '2', '1');
INSERT INTO `bd_jacumbavita`.`NucleoFamiliar` (`idNucleoFamiliar`, `NumeroPersonas`, `GrupoSisben_idGrupoSisben` ) VALUES ('23', '3', '3');
INSERT INTO `bd_jacumbavita`.`NucleoFamiliar` (`idNucleoFamiliar`, `NumeroPersonas`, `GrupoSisben_idGrupoSisben` ) VALUES ('24', '4', '2');
INSERT INTO `bd_jacumbavita`.`NucleoFamiliar` (`idNucleoFamiliar`, `NumeroPersonas`, `GrupoSisben_idGrupoSisben` ) VALUES ('25', '5', '1');

INSERT INTO `bd_jacumbavita`.`Usuario` (`idUsuario`, `Tipo_id`, `numero_id`, `Nombres`, `Apellidos`, `Edad`, `Telefono`, `Email`, `EtapadeVida_idEtapadeVida`, `Origen_idOrigen`, `NucleoFamiliar_idNucleoFamiliar`) VALUES ('01', 'Cedula Ciudadania', '1052790143', 'Brayan Sebastian', 'Morales Lopez', '30', '32013456', 'sebastian@gmail.com', '106', '201', '22');
INSERT INTO `bd_jacumbavita`.`Usuario` (`idUsuario`, `Tipo_id`, `numero_id`, `Nombres`, `Apellidos`, `Edad`, `Telefono`, `Email`, `EtapadeVida_idEtapadeVida`, `Origen_idOrigen`, `NucleoFamiliar_idNucleoFamiliar`) VALUES ('02', 'Targeta de identidad', '1012578324', 'Laura Cristina', 'Perez Camacho', '16', '31157689', 'Critinaperez@gmail.com', '104', '201', '23');
INSERT INTO `bd_jacumbavita`.`Usuario` (`idUsuario`, `Tipo_id`, `numero_id`, `Nombres`, `Apellidos`, `Edad`, `Telefono`, `Email`, `EtapadeVida_idEtapadeVida`, `Origen_idOrigen`, `NucleoFamiliar_idNucleoFamiliar`) VALUES ('03', 'Targeta de identidad', '1010345221', 'Nicolas Camilo', 'Fuentes Cano', '18', '31243256', 'Fuentescamilo@gmail.com', '105', '202', '23');
INSERT INTO `bd_jacumbavita`.`Usuario` (`idUsuario`, `Tipo_id`, `numero_id`, `Nombres`, `Apellidos`, `Edad`, `Telefono`, `Email`, `EtapadeVida_idEtapadeVida`, `Origen_idOrigen`, `NucleoFamiliar_idNucleoFamiliar`) VALUES ('04', 'Cedula Ciudadania', '23301245', 'Blanca Lucia', 'Salgado Gutierrez', '44', '32198745', 'Lucia@gmail.com', '106', '201', '24');
INSERT INTO `bd_jacumbavita`.`Usuario` (`idUsuario`, `Tipo_id`, `numero_id`, `Nombres`, `Apellidos`, `Edad`, `Telefono`, `Email`, `EtapadeVida_idEtapadeVida`, `Origen_idOrigen`, `NucleoFamiliar_idNucleoFamiliar`) VALUES ('05', 'Cedula Ciudadania', '4265478', 'Pablo Emilio', 'Sanches Bohorquez', '50', '30245629', 'Pablosanches@gmail.com', '106', '203', '21');
INSERT INTO `bd_jacumbavita`.`Usuario` (`idUsuario`, `Tipo_id`, `numero_id`, `Nombres`, `Apellidos`, `Edad`, `Telefono`, `Email`, `EtapadeVida_idEtapadeVida`, `Origen_idOrigen`, `NucleoFamiliar_idNucleoFamiliar`) VALUES ('06', 'Cedula Ciudadania', '23300231', 'Rosa Estela', 'Velasquez Martinez', '35', '31067820', 'Martinezrosa@gmail.com', '106', '202', '23');
INSERT INTO `bd_jacumbavita`.`Usuario` (`idUsuario`, `Tipo_id`, `numero_id`, `Nombres`, `Apellidos`, `Edad`, `Telefono`, `Email`, `EtapadeVida_idEtapadeVida`, `Origen_idOrigen`, `NucleoFamiliar_idNucleoFamiliar`) VALUES ('07', 'Targeta de identidad', '1009234910', 'Luis Alejandro', 'Avila Mondragon', '13', '31890276', 'Alejandroqgmail.com', '104', '203', '23');

/*Consultas en la base de datos*/

SELECT Nombres FROM bd_jacumbavita.usuario;
SELECT NombreEtapa FROM bd_jacumbavita.etapadevida;

SELECT Nombres, Apellidos, Edad FROM bd_jacumbavita.usuario;
SELECT idNucleoFamiliar, NumeroPersonas FROM bd_jacumbavita.nucleofamiliar;

SELECT Nombres, Apellidos FROM bd_jacumbavita.usuario UNION SELECT 
GrupoSisben, Clasificación FROM bd_jacumbavita.gruposisben;

SELECT * FROM bd_jacumbavita.usuario LEFT JOIN  bd_jacumbavita.origen  ON
 bd_jacumbavita.usuario.Nombres = bd_jacumbavita.origen.LugarNacimiento;

SELECT u.Apellidos, u.numero_id, u.idusuario FROM bd_jacumbavita.usuario u WHERE u.idusuario;
SELECT O.LugarNacimiento, o.idorigen FROM bd_jacumbavita.origen o WHERE o.idOrigen;

