-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema consultorio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema consultorio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `consultorio` DEFAULT CHARACTER SET utf8 ;
USE `consultorio` ;

-- -----------------------------------------------------
-- Table `consultorio`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio`.`especialidad` (
  `id_especialidad` INT NOT NULL AUTO_INCREMENT,
  `nombre_especialidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_especialidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio`.`medico` (
  `idmedico` INT NOT NULL AUTO_INCREMENT,
  `matricula` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `especialidad_id_especialidad` INT NOT NULL,
  PRIMARY KEY (`idmedico`),
  INDEX `fk_medico_especialidad_idx` (`especialidad_id_especialidad` ASC) VISIBLE,
  CONSTRAINT `fk_medico_especialidad`
    FOREIGN KEY (`especialidad_id_especialidad`)
    REFERENCES `consultorio`.`especialidad` (`id_especialidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio`.`paciente` (
  `id_paciente` INT NOT NULL AUTO_INCREMENT,
  `identificacion_salud` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio`.`table3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio`.`table3` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio`.`turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio`.`turno` (
  `id_turno` INT NOT NULL AUTO_INCREMENT,
  `medico_idmedico` INT NOT NULL,
  `paciente_id_paciente` INT NOT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`id_turno`),
  INDEX `fk_medico_has_paciente_paciente1_idx` (`paciente_id_paciente` ASC) VISIBLE,
  INDEX `fk_medico_has_paciente_medico1_idx` (`medico_idmedico` ASC) VISIBLE,
  CONSTRAINT `fk_medico_has_paciente_medico1`
    FOREIGN KEY (`medico_idmedico`)
    REFERENCES `consultorio`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico_has_paciente_paciente1`
    FOREIGN KEY (`paciente_id_paciente`)
    REFERENCES `consultorio`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
