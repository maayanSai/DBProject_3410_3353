CREATE TABLE Driver
(
  Name VARCHAR(15) NOT NULL,
  IDriver INT NOT NULL,
  Seniority INT NOT NULL,
  IcenseNumber VARCHAR(15) NOT NULL,
  IDBusLine INT NOT NULL,
  PRIMARY KEY (IDriver)
);

CREATE TABLE Station
(
  Name VARCHAR(15) NOT NULL,
  IDStation INT NOT NULL,
  Adrress VARCHAR(15) NOT NULL,
  PRIMARY KEY (IDStation)
);

CREATE TABLE Bus
(
  Model VARCHAR(15) NOT NULL,
  licenseNumber VARCHAR(15) NOT NULL,
  Capacity INT NOT NULL,
  PRIMARY KEY (licenseNumber)
);

CREATE TABLE Ticket
(
  CardProfile VARCHAR(15) NOT NULL,
  IDTicket INT NOT NULL,
  AccumulatedValue INT NOT NULL,
  PRIMARY KEY (IDTicket)
);

CREATE TABLE BusLine
(
  IDBusLine INT NOT NULL,
  Frequency VARCHAR(15) NOT NULL,
  MaxPrice INT NOT NULL,
  PRIMARY KEY (IDBusLine)
);

CREATE TABLE TravelPayment
(
  TravelTime date NOT NULL,
  TravelCost INT NOT NULL,
  IDTicket INT NOT NULL,
  licenseNumber VARCHAR(15) NOT NULL,
  PRIMARY KEY (IDTicket, licenseNumber),
  FOREIGN KEY (IDTicket) REFERENCES Ticket(IDTicket),
  FOREIGN KEY (licenseNumber) REFERENCES Bus(licenseNumber)
);

CREATE TABLE StationToBus
(
  Serial INT NOT NULL,
  IDBusLine INT NOT NULL,
  IDStation INT NOT NULL,
  PRIMARY KEY (IDBusLine, IDStation),
  FOREIGN KEY (IDBusLine) REFERENCES BusLine(IDBusLine),
  FOREIGN KEY (IDStation) REFERENCES Station(IDStation)
);

CREATE TABLE BusRide
(
  StartTime DATE NOT NULL,
  IDBusLine INT NOT NULL,
  licenseNumber VARCHAR(15) NOT NULL,
  PRIMARY KEY (IDBusLine, licenseNumber),
  FOREIGN KEY (IDBusLine) REFERENCES BusLine(IDBusLine),
  FOREIGN KEY (licenseNumber) REFERENCES Bus(licenseNumber)
);

CREATE TABLE BusDriver
(
  IDriver INT NOT NULL,
  licenseNumber VARCHAR(15) NOT NULL,
  PRIMARY KEY (IDriver, licenseNumber),
  FOREIGN KEY (IDriver) REFERENCES Driver(IDriver),
  FOREIGN KEY (licenseNumber) REFERENCES Bus(licenseNumber)
);

CREATE TABLE Passenger
(
  Name VARCHAR(15) NOT NULL,
  IDPassenger INT NOT NULL,
  Phone VARCHAR(15) NOT NULL,
  IDTicket INT NOT NULL,
  PRIMARY KEY (IDPassenger),
  FOREIGN KEY (IDTicket) REFERENCES Ticket(IDTicket)
);
