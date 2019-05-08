USE info;
GO

-- 1a. Maak een procedure aan waarmee je personen kan zoeken op basis van voor- of achternaam.
--    Toon van deze personen het ID, voornaam, achternaam, geslacht, geboortedatum en woonplaats
ALTER PROC spName @firstName nvarchar(30) = NULL, @lastName nvarchar(30) = NULL
AS
SELECT personId, firstName, lastName, gender, birthdate, ipAddress
FROM person
WHERE firstName = @firstName OR lastName = @lastName

-- 1b. Zoek drie willekeurige personen op m.b.v.:
--     - Voor en achternaam
--     - Alleen de voornaam
--     - Alleen de achternaam

EXECUTE spName @firstName = 'Jan', @lastName = 'Smits'
EXECUTE spName @firstName = 'Jan'
EXECUTE spName @lastName = 'Porritt'

-- 2a. Schrijf een stored procedure waarmee je het jaarsalaris van een persoon met 10% kan verhogen. Om de persoon te bepalen geef je de personId op.
ALTER PROC riseYearSalary @firstName nvarchar(30) = NULL, @lastName nvarchar(30) = NULL
AS
UPDATE person
SET yearSalary = yearSalary * 1.1
WHERE firstName = @firstName OR lastName = @lastName 

-- 2b. Voer de procedure uit voor 3 verschillende personen.
EXECUTE riseYearSalary @firstName = 'Jan'
EXECUTE riseYearSalary @firstName = 'Amber'
EXECUTE riseYearSalary @firstName = 'Niels'

-- 2c. Pas bovenstaande stored procedure aan zodat de salarisverhoging in percentages kan worden meegegeven. Als er niks is ingevuld, dan wordt 10% gebruikt.
ALTER PROC riseYearSalary @firstName nvarchar(30) = NULL, @lastName nvarchar(30) = NULL, @rise int = 10
AS
UPDATE person
SET yearSalary = yearSalary * (100 + @rise) / 100
WHERE firstName = @firstName OR lastName = @lastName 

-- 2d. Voer de procedure uit voor 3 verschillende personen.
EXECUTE riseYearSalary @firstName = 'Jan'
EXECUTE riseYearSalary @firstName = 'Amber'
EXECUTE riseYearSalary @firstName = 'Niels'

-- 3a. Maak een procedure aan waarmee je een persoon kan toevoegen aan de tabel.
--     Voor deze persoon moeten de volgende gegevens opgegeven worden:
--     - Voornaam
--     - Achternaam
--     - Geslacht
--     - Geboortedatum
--     - Woonplaats
--     - Land
--	   Toon in dezelfde stored procedure ook de zojuist ingevoerde gegevens. Haal deze gegevens op met een SELECT-statement en gebruik het personId.
CREATE PROC addPerson @firstName nvarchar(30), @lastName nvarchar(30), @gender nvarchar(30), @birth date, @adress nvarchar(30), @country nvarchar(30)
AS
UPDATE person
SET firstName = @firstName, lastName = @lastName, gender = @gender, birthdate = @birth, ipAddress = @adress, country = @country

-- 3b. Voeg drie personen toe m.b.v. de stored procedure.
EXECUTE addPerson @firstName = 'Niels', @lastName = 'Reijnders', @gender = 'male', @birth = '22-01-2001', @adress = 'Vught', @country = 'Netherlands'
EXECUTE addPerson @firstName = 'Devin', @lastName = 'Smit', @gender = 'male', @birth = '22-01-2001', @adress = 'Vught', @country = 'Netherlands'
EXECUTE addPerson @firstName = 'Jan', @lastName = 'Dekker', @gender = 'male', @birth = '22-01-2001', @adress = 'Vught', @country = 'Netherlands'

-- 4a. Maak een stored procedure waarmee je gebruikers a.d.h.v. de personId kan verwijderen uit de database.
CREATE PROC remove @firstName nvarchar(30) = NULL, @lastName nvarchar(30) = NULL
AS
UPDATE person
SET yearSalary = yearSalary * 1.1
WHERE firstName = @firstName OR lastName = @lastName 

-- 4b. Verwijder drie personen waarvan de naam jou niet aan staat.
EXECUTE remove @firstName = 'Jan'
EXECUTE remove @firstName = 'Amber'
EXECUTE remove @firstName = 'Niels'