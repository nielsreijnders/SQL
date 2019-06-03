-- Opdracht 16.2

-- 1. Maak vier databases aan met de namen database_1, database_2, database_3 en database_4 (zonder tabellen)
CREATE DATABASE database_1;
CREATE DATABASE database_2;
CREATE DATABASE database_3;
CREATE DATABASE database_4;

-- 2. Maak een gebruiker waarmee je toegang krijgt tot de server. Geef deze gebruiker jouw voornaam gevolgd door de eerste letter van je achternaam, bijv. HenkS.
CREATE USER NielsR FOR LOGIN Niels1

-- 3. Zorg ervoor dat jouw gebruiker toegang krijgt tot database_1 als de eigenaar van de database. Dit zijn meerdere queries. 
CREATE ROLE Moderator 
GRANT SELECT, UPDATE, DELETE, INSERT
TO Moderator;

GRANT Moderator TO NielsR;

EXEC sp_addrolemember db_owner, NielsR;

-- 4. Zorg ervoor dat jouw gebruiker toegang krijgt tot database_2 als een gebruiker die alleen gegevens uit de database kan lezen. Dit zijn meerdere queries. 
CREATE ROLE INSERT1 
GRANT INSERT, SELECT
TO INSERT1;

GRANT INSERT1 ON database_2 TO NielsR

-- 5. Zorg ervoor dat jouw gebruiker toegang krijgt tot database_3 als een gebruiker die een backup van de database kan maken. Dit zijn meerdere queries. 
CREATE ROLE SELECT1 
GRANT INSERT, SELECT
TO SELECT1;

GRANT SELECT1 ON database_3 TO NielsR

-- 6. Zorg ervoor dat jouw gebruiker geen backups meer kan maken van database_3. Dit zijn meerdere queries. 
REVOKE SELECT1 ON database_3 TO NielsR

-- 7. Maak in database_4 drie verschillende tabellen aan. Geef deze tabellen de namen tabel_1, tabel_2 en tabel_3. Voeg een kolom met de naam id toe aan de tabellen.
CREATE TABLE tabel_1 (
    id int,
);
CREATE TABLE tabel_2 (
    id int,
);
CREATE TABLE tabel_3 (
    id int,
);

INSERT INTO tabel_1
VALUES (5);
INSERT INTO tabel_2
VALUES (3);
INSERT INTO tabel_3
VALUES (4);

-- 8. Maak een nieuwe rol aan en zorg ervoor dat de gebruiker alle rechten (SELECT, UPDATE, DELETE, INSERT) krijgt tot tabel_1 van database_4.
CREATE ROLE ALL1
GRANT SELECT, UPDATE, DELETE, INSERT
TO ALL1;

CREATE USER Test FROM LOGIN Niels2;

GRANT ALL1 ON tabel_1 TO Test;

-- 9. Zorg ervoor dat de gebruiker deze rol niet meer aan de gebruiker gekoppeld is.
REVOKE ALL1 ON tabel_1 TO Test;

-- 10. Maak een nieuwe rol aan en zorg ervoor dat de gebruiker geen rechten (SELECT, UPDATE, DELETE, INSERT) krijgt tot tabel_2 van database_4.
CREATE USER Test1 FROM LOGIN NielsReijnders;

REVOKE ALL1 ON tabel_2 TO Test1