USE info;
GO

-- 1. Toon van alle personen, waarvan de voornaam begint met de F, de voornaam en de lengte van de voornaam (aantal letters).
SELECT firstName, LEN(firstName) AS letters
FROM person
WHERE firstName LIKE 'F%'

-- 2. Voor alle accountants moet een nieuw wachtwoord aangemaakt worden. Let op de functienamen van de accountants (2 verschillende).
-- Het wachtwoord bestaat uit de eerste twee letter van de voornaam, de eerste letter van de achternaam en laatste vier getallen van het telefoonnummer.
-- Maak dit wachtwoord (het wachtwoord hoeft niet in de tabel te worden opgeslagen)
SELECT LEFT(firstName, 2), LEFT(lastName, 1), RIGHT(phonenumber, 4)
FROM person
WHERE jobTitle = 'Accounting Assistant IV'


-- 3. Toon alle functies in hoofdletters en zonder spaties van alle personen uit Rusland.
SELECT UPPER(REPLACE(jobTitle, ' ', ''))
FROM person
WHERE country = 'Russia'

-- 4. Toon alle steden in hoofdletter en landen in kleine letters. Sorteer het resultaat op land van z naar a.
SELECT UPPER(city), LOWER(country)
FROM person
ORDER BY country DESC
	 
-- 5. Toon de telefoonnummers zonder strepen. Het telefoonnummer wordt opgesplitst in 3 stukken en gescheiden door 10 spaties m.b.v. scalaire functie.
-- bijv. '123-456-7890' wordt '12 456 7890' (1 kolom)
SELECT REPLACE (phoneNumber, '-', SPACE (10))
FROM person
	 
-- 6. Toon alle vrouwen waarvan de voornaam langer is dan de achternaam
SELECT firstName
FROM person
WHERE gender = 'F' AND LEN(firstName) > LEN(lastName);

-- 7. Toon de gemiddelde lengte van alle achternamen van de personen waarvan het ip-adres begint met 192. 
SELECT AVG(LEN(lastName)) AS gemiddeld
FROM person 
WHERE ipAddress LIKE '192%'

-- 8. Bedenk een statement met daarin minimaal 3 scalaire functies. De scalaire functies mogen zowel met getallen, datums of tekst te maken hebben)
SELECT UPPER(firstName), Lower(lastName)
FROM person
WHERE LEN(lastName) > 5 AND LEFT(firstName,1) = LEFT(lastName,1);

