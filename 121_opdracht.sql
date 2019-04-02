USE info;
GO

-- Opdracht 12.1

-- 1. Tel het aantal mannen uit Nederland
SELECT SUM(personId) AS Mannen 
FROM person
WHERE country = 'Netherlands'

-- 2. Tel de jaarsalarissen van alle Project Managers uit China en Portugal bij elkaar op.
SELECT SUM(yearSalary) AS jaarsalarissen
FROM person
WHERE jobTitle = 'Project Manager' AND (country = 'Portugal' OR country = 'China');

-- 3. Toon de voornaam, achternaam, functie en jaarsalaris van de persoon met het hoogste salaris.
SELECT firstName, lastName, jobTitle,yearSalary
FROM person
WHERE yearSalary=(
SELECT max(yearSalary) FROM person
)

-- 4. Selecteer het land waar de oudste persoon vandaan komt.
SELECT country, birthdate
FROM person
WHERE birthdate=(
SELECT MIN(birthdate) FROM person
)

-- 5. Toon de datum en tijd van nu met behulp van een scalaire functie en toon dit als 'dag-maand-jaar'(1 kolom) en 'uren:minuten:seconden'(1 kolom).
	SELECT convert(varchar, getdate(), 110) AS Datum, convert(varchar, getdate(), 8) AS TIJD

-- 6. Toon de voornaam en achternaam van alle personen die in maart jarig zijn en sorteer het resultaat op geboortedag.
--    Toon hierbij de geboortedatum opgesplitst in dag, maand en jaar (3 kolommen).
SELECT firstName, lastName, DAY(birthdate) AS Dag ,MONTH(birthdate) AS Maand, YEAR(birthdate) AS Jaar
FROM person
WHERE MONTH(birthdate) = 3;

-- 7. Op welke dag van de week is Eal Ast geboren
SELECT DATENAME(dw,birthdate)
FROM person
WHERE firstName = 'Eal';

-- 8. Toon het geslacht, gemiddelde salaris en hoogste salaris van alle personen met de functie 'Social Worker' en splitst dit op in mannen en vrouwen.
--    Het resultaat bestaat uit twee records.
SELECT gender, AVG(yearSalary) AS gemiddelde, MAX(yearSalary) AS hoogste
FROM person
WHERE jobTitle = 'Social Worker'
GROUP BY gender
