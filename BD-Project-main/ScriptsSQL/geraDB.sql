-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- -----------------------------------------------------
-- Schema CaumPetClinic
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `CaumPetClinic` ;

-- -----------------------------------------------------
-- Schema CaumPetClinic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CaumPetClinic` DEFAULT CHARACTER SET utf8 ;
USE `CaumPetClinic` ;

-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Morada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CaumPetClinic`.`Morada` ;

CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Morada` (
  `idMorada` INT NOT NULL,
  `codPostal` VARCHAR(150) NOT NULL,
  `rua` VARCHAR(150) NOT NULL,
  `localidade` VARCHAR(150) NOT NULL,
  `porta` INT NOT NULL,
  `piso` VARCHAR(45) NULL,
  PRIMARY KEY (`idMorada`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idMorada_UNIQUE` ON `CaumPetClinic`.`Morada` (`idMorada` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Contacto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CaumPetClinic`.`Contacto` ;

CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Contacto` (
  `idContacto` INT NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `telemovel` INT NULL,
  `telefone` INT NULL,
  PRIMARY KEY (`idContacto`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idContacto_UNIQUE` ON `CaumPetClinic`.`Contacto` (`idContacto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CaumPetClinic`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Cliente` (
  `NIF` INT NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `dataDeNascimento` DATE NOT NULL,
  `pontos` INT NOT NULL,
  `Morada_idMorada` INT NOT NULL,
  `Contacto_idContacto` INT NOT NULL,
  PRIMARY KEY (`NIF`, `Morada_idMorada`, `Contacto_idContacto`),
  CONSTRAINT `fk_Cliente_Morada1`
    FOREIGN KEY (`Morada_idMorada`)
    REFERENCES `CaumPetClinic`.`Morada` (`idMorada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Contacto1`
    FOREIGN KEY (`Contacto_idContacto`)
    REFERENCES `CaumPetClinic`.`Contacto` (`idContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idCliente_UNIQUE` ON `CaumPetClinic`.`Cliente` (`NIF` ASC) VISIBLE;

CREATE INDEX `fk_Cliente_Morada1_idx` ON `CaumPetClinic`.`Cliente` (`Morada_idMorada` ASC) VISIBLE;

CREATE INDEX `fk_Cliente_Contacto1_idx` ON `CaumPetClinic`.`Cliente` (`Contacto_idContacto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CaumPetClinic`.`Animal` ;

CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Animal` (
  `idAnimal` INT NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `peso` REAL NOT NULL,
  `dataDeNascimento` DATE NOT NULL,
  `especie` VARCHAR(150) NOT NULL,
  `raca` VARCHAR(150) NOT NULL,
  `historico` VARCHAR(150) NULL,
  `Cliente_NIF` INT NOT NULL,
  PRIMARY KEY (`idAnimal`, `Cliente_NIF`),
  CONSTRAINT `fk_Animal_Cliente`
    FOREIGN KEY (`Cliente_NIF`)
    REFERENCES `CaumPetClinic`.`Cliente` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idAnimal_UNIQUE` ON `CaumPetClinic`.`Animal` (`idAnimal` ASC) VISIBLE;

CREATE INDEX `fk_Animal_Cliente_idx` ON `CaumPetClinic`.`Animal` (`Cliente_NIF` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Clinica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CaumPetClinic`.`Clinica` ;

CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Clinica` (
  `idClinica` INT NOT NULL,
  `Morada_idMorada` INT NOT NULL,
  `Contacto_idContacto` INT NOT NULL,
  PRIMARY KEY (`idClinica`, `Morada_idMorada`, `Contacto_idContacto`),
  CONSTRAINT `fk_Clinica_Morada1`
    FOREIGN KEY (`Morada_idMorada`)
    REFERENCES `CaumPetClinic`.`Morada` (`idMorada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clinica_Contacto1`
    FOREIGN KEY (`Contacto_idContacto`)
    REFERENCES `CaumPetClinic`.`Contacto` (`idContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idClinica_UNIQUE` ON `CaumPetClinic`.`Clinica` (`idClinica` ASC) VISIBLE;

CREATE INDEX `fk_Clinica_Morada1_idx` ON `CaumPetClinic`.`Clinica` (`Morada_idMorada` ASC) VISIBLE;

CREATE INDEX `fk_Clinica_Contacto1_idx` ON `CaumPetClinic`.`Clinica` (`Contacto_idContacto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CaumPetClinic`.`Funcionario` ;

CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Funcionario` (
  `NIF` INT NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `dataDeNascimento` DATE NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `avaliacao` INT NOT NULL,
  `Morada_idMorada` INT NOT NULL,
  `Contacto_idContacto` INT NOT NULL,
  `Clinica_idClinica` INT NOT NULL,
  PRIMARY KEY (`NIF`, `Morada_idMorada`, `Contacto_idContacto`, `Clinica_idClinica`),
  CONSTRAINT `fk_Funcionario_Morada1`
    FOREIGN KEY (`Morada_idMorada`)
    REFERENCES `CaumPetClinic`.`Morada` (`idMorada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Contacto1`
    FOREIGN KEY (`Contacto_idContacto`)
    REFERENCES `CaumPetClinic`.`Contacto` (`idContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Clinica1`
    FOREIGN KEY (`Clinica_idClinica`)
    REFERENCES `CaumPetClinic`.`Clinica` (`idClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `NIF_UNIQUE` ON `CaumPetClinic`.`Funcionario` (`NIF` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Morada1_idx` ON `CaumPetClinic`.`Funcionario` (`Morada_idMorada` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Contacto1_idx` ON `CaumPetClinic`.`Funcionario` (`Contacto_idContacto` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Clinica1_idx` ON `CaumPetClinic`.`Funcionario` (`Clinica_idClinica` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CaumPetClinic`.`Servico` ;

CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Servico` (
  `idServico` INT NOT NULL,
  `tipoServico` VARCHAR(150) NOT NULL,
  `descricao` VARCHAR(150) NOT NULL,
  `valorBase` FLOAT NOT NULL,
  `lucro` FLOAT NOT NULL,
  PRIMARY KEY (`idServico`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idServico_UNIQUE` ON `CaumPetClinic`.`Servico` (`idServico` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CaumPetClinic`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Pedido` (
  `idPedido` INT NOT NULL,
  `dataEstimadaRecolha` DATE NOT NULL,
  `dataEfetivaRecolha` DATE NULL,
  `dataEstimadaEntrega` DATE NOT NULL,
  `dataEfetivaEntrega` DATE NULL,
  `avaliacao` INT NULL,
  `custoFinal` FLOAT NOT NULL,
  `Animal_idAnimal` INT NOT NULL,
  `Servico_idServico` INT NOT NULL,
  `Funcionario_NIF` INT NOT NULL,
  `Clinica_idClinica` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Animal_idAnimal`, `Servico_idServico`, `Funcionario_NIF`, `Clinica_idClinica`),
  CONSTRAINT `fk_Pedido_Animal1`
    FOREIGN KEY (`Animal_idAnimal` )
    REFERENCES `CaumPetClinic`.`Animal` (`idAnimal` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Servico1`
    FOREIGN KEY (`Servico_idServico`)
    REFERENCES `CaumPetClinic`.`Servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Funcionario1`
    FOREIGN KEY (`Funcionario_NIF` )
    REFERENCES `CaumPetClinic`.`Funcionario` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Clinica1`
    FOREIGN KEY (`Clinica_idClinica`)
    REFERENCES `CaumPetClinic`.`Clinica` (`idClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idPedido_UNIQUE` ON `CaumPetClinic`.`Pedido` (`idPedido` ASC) VISIBLE;

CREATE INDEX `fk_Pedido_Animal1_idx` ON `CaumPetClinic`.`Pedido` (`Animal_idAnimal` ASC) VISIBLE;

CREATE INDEX `fk_Pedido_Servico1_idx` ON `CaumPetClinic`.`Pedido` (`Servico_idServico` ASC) VISIBLE;

CREATE INDEX `fk_Pedido_Funcionario1_idx` ON `CaumPetClinic`.`Pedido` (`Funcionario_NIF` ASC) VISIBLE;

CREATE INDEX `fk_Pedido_Clinica1_idx` ON `CaumPetClinic`.`Pedido` (`Clinica_idClinica` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Carrinha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CaumPetClinic`.`Carrinha` ;

CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Carrinha` (
  `matricula` VARCHAR(150) NOT NULL,
  `kmsNaUltimaUtil` VARCHAR(45) NULL,
  `emUso` VARCHAR(45) NULL,
  `anotacoes` VARCHAR(45) NULL,
  `Funcionario_NIF` INT NULL,
  PRIMARY KEY (`matricula`),
  CONSTRAINT `fk_Carrinha_Funcionario1`
    FOREIGN KEY (`Funcionario_NIF`)
    REFERENCES `CaumPetClinic`.`Funcionario` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `matricula_UNIQUE` ON `CaumPetClinic`.`Carrinha` (`matricula` ASC) VISIBLE;

CREATE UNIQUE INDEX `fk_Carrinha_Funcionario1_idx` ON `CaumPetClinic`.`Carrinha` (`Funcionario_NIF` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


