USE WorldEvents;
GO

-- 1. Maak een stored procedure waarmee je per continents de events kan zien. De variabele die je opgeeft is het continent.
ALTER PROC spContinent @continent nvarchar(30) = NULL
AS
SELECT EventName, ContinentName
FROM tblEvent
JOIN tblCountry
ON tblEvent.CountryID = tblCountry.CountryID
JOIN tblContinent
ON tblCountry.ContinentID = tblContinent.ContinentID
WHERE ContinentName = @continent

-- 2. Voer bovenstaande stored procedure uit met twee verschillende continenten. De stored procedures moeten resultaat terug geven.
EXECUTE spContinent 'Asia'
EXECUTE spContinent 'Europe'

-- 3. Maak een stored procedure waarmee je per categorie de events kan zien. De variabele die je opgeeft is de categorie.
ALTER PROC spCategory @category nvarchar(30) = NULL
AS
SELECT *
FROM tblCategory
JOIN tblEvent
ON tblCategory.CategoryID = tblEvent.CategoryID
WHERE CategoryName = @category 


-- 4. Voer bovenstaande stored procedure uit met twee verschillende categoriën. De stored procedures moeten resultaat terug geven.
EXECUTE spCategory 'Politics'
EXECUTE spCategory 'Old'

-- 5. Maak een stored procedure waarmee je per categorie en jaartal de events kan zien. De variabele die je opgeeft zijn de categorie en jaartal.
ALTER PROC spEvents @year nvarchar(30) = NULL, @category nvarchar(30) = NULL
AS
SELECT *
FROM tblEvent
JOIN tblCategory
ON tblEvent.EventName = tblCategory.CategoryName
WHERE @year = YEAR(EventDate) AND @category = CategoryName

-- 6. Voer bovenstaande stored procedure uit met twee verschillende categoriën en jaartallen. De stored procedures moeten resultaat terug geven.
EXECUTE spEvents @year = '2001'

-- 7a. Toon een lijst met alle stored procedures.
select ROUTINE_DEFINITION
from WorldEvents.information_schema.routines 
where routine_type = 'PROCEDURE' 
and Left(Routine_Name, 3) NOT IN ('sp_', 'xp_', 'ms_')

-- 7b. Met welke letter toon je de:
--		* Primary keys  = Pk
--		* User tabellen = 
--		* Views			= 

-- 8. Verwijder de stored procedure uit opgave 1.
DROP PROC spContinent

-- 9. Verwijder de stored procedure uit opgave 3 en 5. Controleer eerst of de stored procedure bestaat. Als dit zo is, dan moet de stored procedure verwijderd worden.
DROP PROC spCategory