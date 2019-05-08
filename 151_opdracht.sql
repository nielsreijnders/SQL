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
ALERT PROC spUK 
AS 
SELECT *
FROM tblCountry
WHERE CountryName = 'United Kingdom'

-- 4. Pas de stored procedure nogmaals aan. Zorg er nu voor dat als er geen land is ingevuld er standaard 'United Kingdom' wordt gekozen.


-- 5. Toon het resultaat van de stored procedure met drie verschillende landen.


-- 6. Maak een stored procedure waarmee je alle events van 1960 t/m 1970 laat zien. Gebruik hiervoor de BETWEEN.


-- 7. Toon het resultaat van de zojuist aangemaakte stored procedure.


-- 8. Pas de stored procedure aan zodat de periode als parameters opgegeven kan worden. De periode wordt aangegeven d.m.v. een begin- en eindjaartal.


-- 9. Pas de stored procedure nogmaals aan. Zorg er nu voor dat als er geen periode is ingevuld er standaard de periode tussen 1900 en 2000 gepakt wordt.


-- 10. Toon het resultaat van de zojuist aangemaakte stored procedure met:
--     Alle jaartallen moeten verschillen.
--  a. Zowel het begin- als eindjaar ingevuld.


--  b. Alleen het beginjaar ingevuld


--  c. Alleen het eindjaar ingevuld

