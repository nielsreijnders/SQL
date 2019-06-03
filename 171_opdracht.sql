-- Opdracht 17.1

-- 1. Toon de naam, database ID en aanmaakdatum van alle aanwezige databases.
SELECT name FROM master.sys.databases

-- 2. Toon het type, de fysieke locatie en grootte van een willekeurige database (meerdere queries).
SELECT * FROM master.sys.databases

-- 3. Maak een database aan met de naam 'opdracht_171'.
CREATE DATABASE opdracht_171

-- 4. Verander de naam van de zojuist aangemaakt database naar 'opdracht_171_a'
ALTER DATABASE opdracht_171 MODIFY NAME = opdracht_171_a

-- 5. Maak de database 'opdracht_171_B' aan en zorg ervoor dat deze, d.m.v. een query, in de map 'database' op jouw bureaublad geplaatst wordt.
--	  Zowel de database- als het logbestand moeten hier worden weggeschreven.	  
--    Het kan zijn dat SQL Server hier niet alle rechten voor heeft. Voer onderstaande instructie uit om SQL Server deze rechten te geven.
/* 
INSTRUCTIE SQL SERVER RECHTEN
	1. Druk op de Windows-toets
	2. Type 'services' en druk op enter
	3. Dubbelklik op SQL Server (SQLEXPRESS) of Rechterklik op SQL Server (SQLEXPRESS) en kies Properties/eigenschappen
	4. Selecteer het Log on/Aanmelden tabblad
	5. Selecteer "Local System Account" of "Lokaal systeemaccount"
	6. Klik op OK
	7. Rechterklik op SQL Server (SQLEXPRESS) en kies "stop"
	8. Rechterklik op SQL Server (SQLEXPRESS) en kies "start"
*/
CREATE DATABASE opdracht_171_B ON PRIMARY
 (NAME = opdracht17,
 FILENAME = 'C:\opdracht171.mdf',
 SIZE = 10MB, MAXSIZE = 50MB, FILEGROWTH = 5MB)
 LOG ON (NAME = log17,
 FILENAME = 'C:\logopdracht17.ldf' ,
 SIZE = 1MB, MAXSIZE = 5MB, FILEGROWTH = 1MB)


-- 6. Verwijder de database 'opdracht_171_B', maar alleen als de database bestaat (dus eerst controleren).
DROP DATABASE IF EXISTS opdracht_171_B;
