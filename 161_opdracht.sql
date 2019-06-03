-- Opdracht 16.1
-- Theorie
-- 1a. Wat is het verschil tussen Windows Authentication en SQL Server Authentication? 
-- Bij die van windows hoef je geen wachtwoord in te vullen. 

-- 1b. Wat is een voor- en nadeel van Windows Authentication?
-- Voordeel sneller
-- Nadeel minder veilig

-- 1c. Wat is een voor- en nadeel van SQL Server Authentication?
-- Voordeel veiliger
-- Nadeel minder snel

-- 1d. Wat is het verschil tussen CREATE LOGIN en CREATE USER?
-- Je moet eerst een login maken voordat je een gebruiker kan toevoegen


-- Praktijk
-- 2. Maak vier gebruikers aan die toegang hebben tot de server en geef ze een wachtwoord. 
--    Geef de eerste gebruiker jouw eigen voornaam. De tweede, derde en vierde gebruiker mag jezelf verzinnen.
--    Zorg ervoor dat de tweede en derde gebruiker het wachtwoord, bij de eerste keer inloggen, moeten wijzigen.
CREATE LOGIN Niels
WITH PASSWORD = 'pwd123';

CREATE LOGIN Niels1
WITH PASSWORD = 'pwd123' MUST_CHANGE, CHECK_EXPIRATION = ON;

CREATE LOGIN Niels2
WITH PASSWORD = 'pwd123' MUST_CHANGE, CHECK_EXPIRATION = ON;

CREATE LOGIN Niels3
WITH PASSWORD = 'pwd123';

-- 3. De tweede gebruiker is zijn/haar wachtwoord vergeten. Herstel het wachtwoord voor deze gebruiker. Na het inloggen moet deze gebruiker zijn wachtwoord wijzigen.
ALTER LOGIN Niels1
WITH PASSWORD = 'pwd123' MUST_CHANGE, CHECK_EXPIRATION = ON;

-- 4. De derde gebruiker krijgt tijdelijk geen toegang tot de database, maar zijn/haar inloggegevens moeten wel bewaard blijven. Zorg ervoor dat deze gebruiker tijdelijk niet kan inloggen.
ALTER LOGIN Niels3
DISABLE

-- 5. De vierde gebruiker krijgt helemaal geen toegang meer. Verwijder zijn/haar gegevens.
DROP LOGIN Niels3

-- 6. Pas jouw eigen gebruikersnaam aan. Voeg je achternaam toe aan de gebruikersnaam (zonder spaties). Bijv. Chuck wordt ChuckNorris.
ALTER LOGIN Niels
WITH NAME = NielsReijnders;

-- 7. Geef de eerste gebruiker de rechten om alle functies binnen SQL Server uit te voeren.
EXEC SP_ADDSRVROLEMEMBER NielsReijnders, sysadmin; 


-- 8. Geef de tweede gebruiker de rechten om logins aan te maken en te beheren..
EXEC SP_ADDSRVROLEMEMBER Niels2, securityadmin; 

-- 9. Toon een overzicht met alle gebruikers en controleer of bovenstaande opgaven goed zijn uitgevoerd.
SELECT * from master.sys.sql_logins

