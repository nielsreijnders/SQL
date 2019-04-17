-- Opdracht 14.1
USE MASTER;
CREATE DATABASE infoNew;
GO

USE infoNew;
GO

-- 1. Pas onderstaande CREATE aan,zodat die voldoet aan de volgende voorwaarden:
--	* De personId is de primaire sleutel en moet automatisch met 2 opgehoogd worden als er een nieuwe record wordt toegevoegd. personId moet beginnen bij 1000.
--  * De voornaam, achternaam, geboortedatum en jaarsalaris moeten verplicht ingevuld worden. 
--  * Voor het geslacht moet standaard de letter U (unknown) ingevuld worden.
--  * Voor het wachtwoord moet standaard Welkom123 ingevuld worden.
--  * PersonId, telefoonnummer, gebruikersnaam en emailadres moeten unieke waarden bevatten.
--  * In gender mogen alleen de letter M, F of U komen te staan.
--  * De gebruikersnaam moet meer dan 7 karakters bevatten.
--  * Het jaarsalaris moet een waarde hebben tussen de 5000 en 100000.
CREATE TABLE person (
	personId INT NOT NULL PRIMARY KEY,
	firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL,
	gender CHAR(1) DEFAULT 'U',
	birthdate DATE NOT NULL,
	city VARCHAR(50),
	country VARCHAR(50),
	phoneNumber VARCHAR(50) UNIQUE,
	userName VARCHAR(50) UNIQUE,
	password VARCHAR(50) DEFAULT 'Welkom123',
	email VARCHAR(50) UNIQUE,
	ipAddress VARCHAR(20),
	jobTitle VARCHAR(50),
	yearSalary DECIMAL(8,2) NOT NULL,
	CONSTRAINT chk_salary		CHECK (yearSalary BETWEEN 5000 AND 100000),
	CONSTRAINT chk_user			CHECK (LEN(userName) > 7) ,
	CONSTRAINT chk_gender       CHECK (gender = 'M' OR gender = 'F')
);

DROP TABLE person

-- 2. Voeg een man en een vrouw toe. 
--    Verzin zelf de gegevens. 
--    Het persoonsId moet automatisch gegenereerd worden.
INSERT INTO person(personId, firstName, lastName, gender, birthdate, city, country, phoneNumber, userName, password, email, ipAddress, jobTitle, yearSalary)
VALUES (1, 'Niels', 'Reijnders', 'M', '2019-01-01', 'Vught', 'Netherlands', '+31 6 55628136', '223278932847', 'Welkom124', 'niels.reijnders1@gmail.com', '22.111.245.6', 'Developer', 60000),
(2, 'Niela', 'Visser', 'F', '1988-01-01', 'Den Bosch', 'Netherlands', '+31 6 3425435', '123444555', 'Jeetje', 'nielavisser@gmail.com', '22.111.245.6', 'Nagelakker', 60000)

-- 3. Voeg iemand toe waarvan de volgende gegevens onbekend zijn:
--    * Geslacht
--	  * Wachtwoord
--	  De overige gegevens mogen zelf verzonnen worden (geslacht en wachtwoord komen niet in de insert).
INSERT INTO person(personId, firstName, lastName, birthdate, city, country, phoneNumber, userName, email, ipAddress, jobTitle, yearSalary)
VALUES (3, 'Devin', 'Reijnders', '2019-01-01', 'Vught', 'Netherlands', '+31 6 54543136', '202', 'devin.reijnders1@gmail.com', '22.111.245.6', 'Developer', 60000)

-- 4. Probeer bij onderstaande vragen een van de personen uit vraag 2 aan te passen en zorg ervoor dat je een foutmelding krijgt door de check die je hebt toegevoegd.
-- 4a. Zorg voor een foutmelding op het geslacht.
INSERT INTO person(personId, firstName, lastName, gender, birthdate, city, country, phoneNumber, userName, password, email, ipAddress, jobTitle, yearSalary)
VALUES (3, 'Devin', 'Reijnders', 'I', '2019-01-01', 'Vught', 'Netherlands', '+31 6 54543136', '3824093248', '', 'devin.reijnders1@gmail.com', '22.111.245.6', 'Developer', 60000)


-- 4b. Zorg voor een foutmelding op de gebruikersnaam.
INSERT INTO person(personId, firstName, lastName, gender, birthdate, city, country, phoneNumber, userName, password, email, ipAddress, jobTitle, yearSalary)
VALUES (4, 'esffs', 'Reijnders', 'M', '2019-01-01', 'Vught', 'Netherlands', '+31 6 545431436', 'hoi', '', 'fes.reijnders1@gmail.com', '22.111.245.6', 'Devesfeloper', 60000)


-- 4c. Zorg voor een foutmelding op het jaarsalaris.  
INSERT INTO person(personId, firstName, lastName, gender, birthdate, city, country, phoneNumber, userName, password, email, ipAddress, jobTitle, yearSalary)
VALUES (4, 'esffs', 'Reijnders', 'M', '2019-01-01', 'Vught', 'Netherlands', '+31 6 545431436', '2042', '', 'fes.reijnders1@gmail.com', '22.111.245.6', 'Devesfeloper', 600000)


-- 5. Schrijf een statement om de tabel te verwijderen.
DROP TABLE person
