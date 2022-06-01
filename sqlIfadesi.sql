CREATE TABLE IF NOT EXISTS `veritabanisql`.`flight` (
'flight_id' INT(3),
'departureGate2' INT(10),
'departureAirportNo' INT(10),
'arrivalMoment' DATE,
'status' VARCHAR()45,
'arrivakAirportNo' INT(10),
'boardingMoment' DATE,
'departureMoment' DATE,
'plane_id' INT(10),
'crew_id' INT(10),
'arrivalGate' INT(10),
'plane_plane_id' INT,
PRIMARY KEY (`flight_id`)

)

CREATE TABLE IF NOT EXISTS `veritabanisql`.`plane` (
  `plane_id` INT NOT NULL,
  `activeOrNot` VARCHAR(45) NULL,
  `airlineCompany` VARCHAR(45) NULL,
  `pass_NumOfFlight` VARCHAR(45) NULL,
  `range` INT(4) NULL,
  `modelNo` INT(4) NULL,
  `brandName` VARCHAR(45) NULL,
  `pass_capasity` INT(4) NULL,
  PRIMARY KEY (`plane_id`)

CREATE TABLE IF NOT EXISTS `veritabanisql`.`passenger` (
  `pass_id` TEXT(20) NOT NULL,
  `pass_LName` VARCHAR(45) NULL,
  `pass_FName` VARCHAR(45) NULL,
  `adress` TEXT(60) NULL,
  `gender` VARCHAR(45) NULL,
  `registeredBags` INT(3) NULL,
  `pass_phone` TEXT NULL,
  `plane_plane_id` INT NOT NULL,
  `reservation_ticketId` INT(20) NOT NULL,
  PRIMARY KEY (`pass_id`, `reservation_ticketId`),
  INDEX `fk_passenger_plane1_idx` (`plane_plane_id` ASC) VISIBLE,
  INDEX `fk_passenger_reservation1_idx` (`reservation_ticketId` ASC) VISIBLE,
  CONSTRAINT `fk_passenger_plane1`
    FOREIGN KEY (`plane_plane_id`)
    REFERENCES `veritabanisql`.`plane` (`plane_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_passenger_reservation1`
    FOREIGN KEY (`reservation_ticketId`)
    REFERENCES `veritabanisql`.`reservation` (`ticketId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

 CREATE TABLE IF NOT EXISTS `veritabanisql`.`reservation` (
  `ticketId` INT(20) NOT NULL,
  `seatNo` INT(3) NULL,
  `ticketPrice` INT(4) NULL,
  `ticketRefund` TINYINT NULL,
  `ticketType` VARCHAR(45) NULL,
  `onlineTicket?` TINYINT NULL,
  `bookingAgencyNo` INT(15) NULL,
  `ticketIssuedMoment` DATE NULL,
  `flight_flight_id` INT(3) NOT NULL,
  PRIMARY KEY (`ticketId`),
  INDEX `fk_reservation_flight1_idx` (`flight_flight_id` ASC) VISIBLE,
  CONSTRAINT `fk_reservation_flight1`
    FOREIGN KEY (`flight_flight_id`)
    REFERENCES `veritabanisql`.`flight` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    CREATE TABLE IF NOT EXISTS `veritabanisql`.`flight_has_passenger` (
  `flight_flight_id` INT(3) NOT NULL,
  `passenger_pass_id` TEXT(20) NOT NULL,
  `passenger_reservation_ticketId` INT(20) NOT NULL,
  PRIMARY KEY (`flight_flight_id`, `passenger_pass_id`, `passenger_reservation_ticketId`),
  INDEX `fk_flight_has_passenger_passenger1_idx` (`passenger_pass_id` ASC, `passenger_reservation_ticketId` ASC) VISIBLE,
  INDEX `fk_flight_has_passenger_flight1_idx` (`flight_flight_id` ASC) VISIBLE,
  CONSTRAINT `fk_flight_has_passenger_flight1`
    FOREIGN KEY (`flight_flight_id`)
    REFERENCES `veritabanisql`.`flight` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flight_has_passenger_passenger1`
    FOREIGN KEY (`passenger_pass_id` , `passenger_reservation_ticketId`)
    REFERENCES `veritabanisql`.`passenger` (`pass_id` , `reservation_ticketId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

CREATE TABLE IF NOT EXISTS `veritabanisql`.`passenger_has_crew` (
  `passenger_pass_id` TEXT(20) NOT NULL,
  `passenger_reservation_ticketId` INT(20) NOT NULL,
  `crew_crew_id` INT NOT NULL,
  PRIMARY KEY (`passenger_pass_id`, `passenger_reservation_ticketId`, `crew_crew_id`),
  INDEX `fk_passenger_has_crew_crew1_idx` (`crew_crew_id` ASC) VISIBLE,
  INDEX `fk_passenger_has_crew_passenger1_idx` (`passenger_pass_id` ASC, `passenger_reservation_ticketId` ASC) VISIBLE,
  CONSTRAINT `fk_passenger_has_crew_passenger1`
    FOREIGN KEY (`passenger_pass_id` , `passenger_reservation_ticketId`)
    REFERENCES `veritabanisql`.`passenger` (`pass_id` , `reservation_ticketId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_passenger_has_crew_crew1`
    FOREIGN KEY (`crew_crew_id`)
    REFERENCES `veritabanisql`.`crew` (`crew_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

CREATE TABLE IF NOT EXISTS `veritabanisql`.`crew` (
  `crew_id` INT NOT NULL,
  `mission` VARCHAR(45) NULL,
  `crew_FName` VARCHAR(45) NULL,
  `crew_LName` VARCHAR(45) NULL,
  `plane_plane_id` INT NOT NULL,
  PRIMARY KEY (`crew_id`, `plane_plane_id`),
  INDEX `fk_crew_plane1_idx` (`plane_plane_id` ASC) VISIBLE,
  CONSTRAINT `fk_crew_plane1`
    FOREIGN KEY (`plane_plane_id`)
    REFERENCES `veritabanisql`.`plane` (`plane_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `veritabanisql`.`worker` (
  `id` INT NOT NULL,
  `phoneNo` TEXT NULL,
  `gender` VARCHAR(45) NULL,
  `address` TEXT(60) NULL,
  `job` VARCHAR(45) NULL,
  `jobDOS` DATE NULL,
  `salary` INT(6) NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `workAge` INT NULL,
  `airport_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_worker_airport1_idx` (`airport_id` ASC) VISIBLE,
  CONSTRAINT `fk_worker_airport1`
    FOREIGN KEY (`airport_id`)
    REFERENCES `veritabanisql`.`airport` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

 CREATE TABLE IF NOT EXISTS `veritabanisql`.`airport` (
  `id` INT NOT NULL,
  `workDOS` DATE NULL,
  `cargoTransOrNot` TINYINT NULL,
  `capasityPlane` INT(3) NULL,
  `numOfWorkers` INT NULL,
  `space_Km` INT NULL,
  PRIMARY KEY (`id`))
