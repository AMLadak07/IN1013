-- Drop the database if it exists
DROP DATABASE IF EXISTS pet_database;

-- Create a new database
CREATE DATABASE pet_database;

-- Use the newly created database
USE pet_database;

-- Drop the tables if they exist
DROP TABLE IF EXISTS petPet, petEvent;

-- Create petPet table
CREATE TABLE petPet (
    petname VARCHAR(20) PRIMARY KEY,
    owner VARCHAR(45) NOT NULL,
    species VARCHAR(45) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    birth DATE NOT NULL,
    death DATE
);

-- Create petEvent table
CREATE TABLE petEvent (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    petname VARCHAR(20),
    eventdate DATE NOT NULL,
    eventtype VARCHAR(15) NOT NULL,
    remark VARCHAR(255),
    FOREIGN KEY (petname) REFERENCES petPet(petname)
);
