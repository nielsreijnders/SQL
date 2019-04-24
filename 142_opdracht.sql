-- Opdracht 14.2

-- 1. Bekijk de video "SQL Server 33: indexes" (https://www.youtube.com/watch?v=tLD5tCP4jqM)
-- In deze video wordt gesproken over de kolommen waar je een index op moet toepassen.
-- Schrijf meerdere statements om deze indexen toe te voegen, zodat dit de snelheid van je database ten goede komt.
CREATE INDEX idx_name
ON tblDoctor (DoctorName);


-- 2. Verander een van de bestaande indexen.
-- Je hoeft nu geen rekening meer te houden met de snelheid van de database.
DROP INDEX idx_name
ON tblDoctor;
CREATE INDEX idx_name
ON tblDoctor (DoctorNumber);

-- 3. Verwijder drie verschillende indexen.
DROP INDEX idx_name
ON tblDoctor

-- 4. Toon alle indexen van de database (overzicht met alle indexen).
select * from sys.indexes
WHERE tblDoctor = idx_name;


