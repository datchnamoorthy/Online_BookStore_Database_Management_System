-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema online_bookstore_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema online_bookstore_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_bookstore_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `online_bookstore_db` ;

-- -----------------------------------------------------
-- Table `online_bookstore_db`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bookstore_db`.`books` (
  `Book_ID` INT NOT NULL,
  `Title` TEXT NULL DEFAULT NULL,
  `Author` TEXT NULL DEFAULT NULL,
  `Genre` TEXT NULL DEFAULT NULL,
  `Published_Year` INT NULL DEFAULT NULL,
  `Price` DOUBLE NULL DEFAULT NULL,
  `Stock` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Book_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `online_bookstore_db`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bookstore_db`.`customers` (
  `Customer_ID` INT NOT NULL,
  `Name` TEXT NULL DEFAULT NULL,
  `Email` TEXT NULL DEFAULT NULL,
  `Phone` INT NULL DEFAULT NULL,
  `City` TEXT NULL DEFAULT NULL,
  `Country` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `online_bookstore_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_bookstore_db`.`orders` (
  `Order_ID` INT NOT NULL,
  `Customer_ID` INT NULL DEFAULT NULL,
  `Book_ID` INT NULL DEFAULT NULL,
  `Order_date` DATE NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `Total_Amount` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  INDEX `customer_id_idx` (`Customer_ID` ASC) VISIBLE,
  INDEX `book_id_idx` (`Book_ID` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `online_bookstore_db`.`customers` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `book_id`
    FOREIGN KEY (`Book_ID`)
    REFERENCES `online_bookstore_db`.`books` (`Book_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
