-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema editorial
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema editorial
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `editorial` DEFAULT CHARACTER SET utf8 ;
USE `editorial` ;

-- -----------------------------------------------------
-- Table `editorial`.`editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editorial`.`editorial` (
  `id_editorial` INT NOT NULL AUTO_INCREMENT,
  `razon_social` VARCHAR(45) NOT NULL,
  `telefono` CHAR(15) NOT NULL,
  PRIMARY KEY (`id_editorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editorial`.`socio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editorial`.`socio` (
  `id_socio` INT NOT NULL AUTO_INCREMENT,
  `dni` CHAR(8) NOT NULL,
  `apellido` VARCHAR(30) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `direccion` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id_socio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editorial`.`prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editorial`.`prestamo` (
  `id_prestamo` INT NOT NULL AUTO_INCREMENT,
  `fecha_retiro` DATE NULL,
  `fecha_tope` DATE NULL,
  `fecha_devolucion` DATE NULL,
  `socio_id_socio` INT NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  INDEX `fk_prestamo_socio1_idx` (`socio_id_socio` ASC) VISIBLE,
  CONSTRAINT `fk_prestamo_socio1`
    FOREIGN KEY (`socio_id_socio`)
    REFERENCES `editorial`.`socio` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editorial`.`socio_telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editorial`.`socio_telefono` (
  `id_socio_telefono` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NULL,
  `socio_id_socio` INT NOT NULL,
  PRIMARY KEY (`id_socio_telefono`),
  INDEX `fk_socio_telefono_socio_idx` (`socio_id_socio` ASC) VISIBLE,
  CONSTRAINT `fk_socio_telefono_socio`
    FOREIGN KEY (`socio_id_socio`)
    REFERENCES `editorial`.`socio` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editorial`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editorial`.`autor` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(30) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editorial`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editorial`.`libro` (
  `id_libro` INT NOT NULL AUTO_INCREMENT,
  `isbn` CHAR(13) NULL,
  `titulo` VARCHAR(50) NULL,
  `anio_escrito` SMALLINT NULL,
  `anio_edicion` SMALLINT NULL,
  `autor_id_autor` INT NOT NULL,
  `editorial_id_editorial` INT NOT NULL,
  PRIMARY KEY (`id_libro`),
  INDEX `fk_libro_autor1_idx` (`autor_id_autor` ASC) VISIBLE,
  INDEX `fk_libro_editorial1_idx` (`editorial_id_editorial` ASC) VISIBLE,
  CONSTRAINT `fk_libro_autor1`
    FOREIGN KEY (`autor_id_autor`)
    REFERENCES `editorial`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_editorial1`
    FOREIGN KEY (`editorial_id_editorial`)
    REFERENCES `editorial`.`editorial` (`id_editorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editorial`.`copia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editorial`.`copia` (
  `id_copia` INT NOT NULL AUTO_INCREMENT,
  `deteriorado` TINYINT(1) NOT NULL,
  `libro_id_libro` INT NOT NULL,
  PRIMARY KEY (`id_copia`),
  INDEX `fk_copia_libro1_idx` (`libro_id_libro` ASC) VISIBLE,
  CONSTRAINT `fk_copia_libro1`
    FOREIGN KEY (`libro_id_libro`)
    REFERENCES `editorial`.`libro` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editorial`.`editorial_telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editorial`.`editorial_telefono` (
  `id_editorial_telefono` INT NOT NULL AUTO_INCREMENT,
  `numero` CHAR(15) NULL,
  `editorial_id_editorial` INT NOT NULL,
  PRIMARY KEY (`id_editorial_telefono`),
  INDEX `fk_editorial_telefono_editorial1_idx` (`editorial_id_editorial` ASC) VISIBLE,
  CONSTRAINT `fk_editorial_telefono_editorial1`
    FOREIGN KEY (`editorial_id_editorial`)
    REFERENCES `editorial`.`editorial` (`id_editorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `editorial`.`copia_has_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `editorial`.`copia_has_prestamo` (
  `copia_id_copia` INT NOT NULL,
  `prestamo_id_prestamo` INT NOT NULL,
  PRIMARY KEY (`copia_id_copia`, `prestamo_id_prestamo`),
  INDEX `fk_copia_has_prestamo_prestamo1_idx` (`prestamo_id_prestamo` ASC) VISIBLE,
  INDEX `fk_copia_has_prestamo_copia1_idx` (`copia_id_copia` ASC) VISIBLE,
  CONSTRAINT `fk_copia_has_prestamo_copia1`
    FOREIGN KEY (`copia_id_copia`)
    REFERENCES `editorial`.`copia` (`id_copia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_copia_has_prestamo_prestamo1`
    FOREIGN KEY (`prestamo_id_prestamo`)
    REFERENCES `editorial`.`prestamo` (`id_prestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
