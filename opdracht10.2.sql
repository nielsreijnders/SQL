-- 1a. Toon het klant ID van klant Patricio Simpson. (1 row)

	SELECT Id
	FROM Customer
	WHERE FirstName = 'Patricio ' and LastName = 'Simpson';

-- 1b. Toon alle orders van klant Patricio Simpson.(6 rows)

	SELECT *
	FROM "Order"
	where CustomerId =(	SELECT Id
						FROM Customer
						WHERE FirstName = 'Patricio ' and LastName = 'Simpson');

-- 1c. Toon alle producten die klant Patricio Simpson ooit besteld heeft. (11 rows)


	SELECT *
	FROM OrderItem
	where OrderId in(
						SELECT Id
						FROM "Order"
						where CustomerId =(	SELECT Id
						FROM Customer
						WHERE FirstName = 'Patricio ' and LastName = 'Simpson')) ;
-- 1d. Toon alle leveranciers van de producten die klant Patricio Simpson ooit besteld heeft. (8 rows)


-- 2. Toon alle producten die vaker dan 50 keer op een order zijn verschenen. Met het aantal per order hoef je niks te doen. (4 rows)


-- 3. Selecteer alle orders waarvan het totaalbedrag niet overeenkomt met de som van alle orderitems (prijs per stuk x aantal). (3 rows) 


-- 4. Selecteer de leverancier van het duurste product. (1 row)


-- 5. Selecteer alle producten die nog nooit verkocht zijn. (1 row)


-- 6. Selecteer alle producten die vaker dan 100 keer in een order zijn verkocht. (12 rows)


-- 7. Selecteer alle klanten die maar 1 order hebben geplaatst. (1 row)


-- 8. Selecteer de voornaam, achternaam en het aantal bestellingen van alle klanten. (91 rows)


-- 9. Selecteer de naam, telefoonnummer en het aantal producten van alle leveranciers. Toon alleen de leveranciers met meer dan 4 producten. (2 rows)
