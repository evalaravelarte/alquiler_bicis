-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema alquiler_bicis_final
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema alquiler_bicis_final
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `alquiler_bicis_final` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `alquiler_bicis_final` ;

-- -----------------------------------------------------
-- Table `alquiler_bicis_final`.`bici`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alquiler_bicis_final`.`bici` (
  `cod_bici` INT NOT NULL,
  `libre` TINYINT NOT NULL DEFAULT '0',
  `hora_alquiler` TIME NULL DEFAULT NULL,
  `hora_devolucion` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`cod_bici`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `alquiler_bicis_final`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alquiler_bicis_final`.`usuario` (
  `cod_usuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cod_bici` INT NULL,
  PRIMARY KEY (`cod_usuario`),
  INDEX `fk_bici` (`cod_bici` ASC) VISIBLE,
  CONSTRAINT `fk_bici`
    FOREIGN KEY (`cod_bici`)
    REFERENCES `alquiler_bicis_final`.`bici` (`cod_bici`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO usuario (cod_usuario,nombre) VALUES (1, 'Eva'), (2, 'Juan');
INSERT INTO bici (cod_bici,libre) VALUES (1, 0), (2, 0);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
