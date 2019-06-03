USE WorldEvents;
GO

-- 1. Maak een stored procedure waarmee je alle events uit het land 'United Kingdom' laat zien.
CREATE PROC spUK 
AS 
SELECT *
FROM tblCountry
WHERE CountryName = 'United Kingdom'

-- 2. Toon het resultaat van de zojuist aangemaakte stored procedure.
EXEC spUK

-- 3. Pas de stored procedure aan zodat het land als parameter opgegeven kan worden. De events van dat land worden dan getoond i.p.v. 'United Kingdom'.
ALTER PROC spUK @City nvarchar(30)
AS 
SELECT * 
FROM tblCountry
WHERE CountryName = @City

EXECUTE spUK 'United Kingdom'

-- 4. Pas de stored procedure nogmaals aan. Zorg er nu voor dat als er geen land is ingevuld er standaard 'United Kingdom' wordt gekozen.
ALTER PROC spUK @City nvarchar(30) = 'United Kingdom'
AS 
SELECT * 
FROM tblCountry
WHERE CountryName = @City


-- 5. Toon het resultaat van de stored procedure met drie verschillende landen.
EXECUTE spUK 'United Kingdom' 
EXECUTE spUK 'China' 
EXECUTE spUK 'Netherlands' 

-- 6. Maak een stored procedure waarmee je alle events van 1960 t/m 1970 laat zien. Gebruik hiervoor de BETWEEN.
CREATE PROC spYear
AS
SELECT * 
FROM tblEvent
WHERE EventDate BETWEEN '1960' AND '1970'

-- 7. Toon het resultaat van de zojuist aangemaakte stored procedure.
EXECUTE spYear

-- 8. Pas de stored procedure aan zodat de periode als parameters opgegeven kan worden. De periode wordt aangegeven d.m.v. een begin- en eindjaartal.
ALTER PROC spYear @start nvarchar(30), @end nvarchar(30)
AS
SELECT *
FROM tblEvent
WHERE EventDate BETWEEN @start AND @end

-- 9. Pas de stored procedure nogmaals aan. Zorg er nu voor dat als er geen periode is ingevuld er standaard de periode tussen 1900 en 2000 gepakt wordt.
ALTER PROC spYear @start nvarchar(30) = '1900', @end nvarchar(30) = '2000'
AS
SELECT *
FROM tblEvent
WHERE EventDate BETWEEN @start AND @end

-- 10. Toon het resultaat van de zojuist aangemaakte stored procedure met:
--     Alle jaartallen moeten verschillen.
--  a. Zowel het begin- als eindjaar ingevuld.
EXECUTE spYear @start = '1900', @end = '2000'
EXECUTE spYear @start = '1700', @end = '3000'
EXECUTE spYear @start = '1990', @end = '1992'

--  b. Alleen het beginjaar ingevuld
EXECUTE spYear @start = '1990'

--  c. Alleen het eindjaar ingevuld
EXECUTE spYear @end = '1950'
