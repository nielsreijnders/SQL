--------------------------------------------------
---                 SUBQUERIES                 ---
--- Gebruik alleen subqueries als het nodig is ---
--------------------------------------------------

-- 1. Selecteer alle nummers met een hogere dansbaarheid dan het nummer met track ID 0CcQNd8CINkwQfe1RDtGV. (20 rows)
SELECT *
FROM track
WHERE danceability > (
	SELECT danceability
	FROM track
	WHERE trackId = '0CcQNd8CINkwQfe1RDtGV'
)

-- 2. Selecteer de nummers met dezelfde pitch als de nummers van Calvin Harris. (27 rows)
SELECT *
FROM track
WHERE pitch IN (
	SELECT pitch
	FROM track
	WHERE artists = 'Calvin Harris'
)

-- 3. Selecteer de nummers waarvan de eerste letter van de titel een S is en de laatste letter van de titel een y is. (3 rows) 
SELECT *
FROM track
WHERE name LIKE 's%' AND name LIKE '%y'

-- 4. Selecteer de artiest(en) die net zoveel hits heeft/hebben gehad als Ed Sheeran. (2 rows)
SELECT artists 
FROM track
GROUP BY artists
HAVING COUNT(artists) = (	SELECT COUNT(artists)
							FROM track
							GROUP BY artists
							HAVING artists = 'Ed Sheeran');


-- 5. Selecteer de nummers waarvan de pitch gelijk is aan het aantal nummers met pitch 10.0. (4 rows)
SELECT [name]
FROM track
WHERE pitch = (	SELECT COUNT(pitch)
				FROM track
				GROUP BY pitch
				HAVING pitch = 10.0);

-- 6. Selecteer de artiest en het aantal nummers waarmee de artiest in de lijst staat. Je mag GROUP BY niet gebruiken. (78 rows)
SELECT artists, COUNT(artists) AS Hits
FROM track
GROUP BY artists;

-- 7. Selecteer de nummers die qua tempo tussen Redbone van Childish Gambino en El Amante van Nicky Jam inzitten. Deze nummers mogen niet getoond worden. (3 rows)
SELECT *
FROM track
WHERE tempo > (	SELECT tempo
				FROM track
				WHERE [name] = 'Redbone') AND tempo < (	SELECT tempo
														FROM track
														WHERE [name] = 'El Amante');
					
-- 8. Selecteer alle nummers waarbij de danceability net zo hoog is als de nummers waarvan de energy 0.8 is. (1 row)
SELECT *
FROM track
WHERE danceability = (	SELECT danceability
						FROM track
						WHERE energy = 0.8);

-- 9. Selecteer alle nummers waar het woord 'you' in de titel zit. Het woord you als deel van een ander woord telt niet mee, bijv. your telt niet. (7 rows)
SELECT *
FROM track
WHERE [name] LIKE '% you %' 
OR [name] LIKE '% you';

-- 10. Bedenk zelf een originele query met subquery. Let er op dat de subquery nodig is. (? rows)
SELECT [name], artists, durationMs
FROM track
WHERE durationMs = (	SELECT MAX(durationMs)
						FROM track );
