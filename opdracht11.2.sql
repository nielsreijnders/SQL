-- Opdracht 11.2

-- 1. Toon alle producten met de naam van de leverancier. (78 rows)
SELECT ProductName, ContactName
FROM Product
LEFT JOIN Supplier
ON Supplier.ContactName = Product.ProductName;


-- 2. Toon de ordernummers, voornaam en achternaam van de klanten uit Mexico. (28 rows)
-- SELECT OrderId, FirstName, LastName
-- FROM OrderItem
-- JOIN Customer
-- ON OrderItem.OrderId = Customer.FirstName;

SELECT OrderNumber, FirstName, LastName
FROM [Order]
JOIN Customer
ON [Order].CustomerId = Customer.Id
WHERE Country = 'Mexico';

-- 3. Toon alle orderitems met het ordernummer van alle orderitems die duurder zijn dan 100 dollar. (46 rows)
SELECT *
FROM [OrderItem]
JOIN [Order]
ON [OrderItem].[OrderId] = [Order].[Id]
WHERE [UnitPrice] > 100;

-- 4. Toon de productnamen, prijzen per stuk en aantallen van alle producten in order met nummer 542410. (3 rows)
SELECT ProductName, OrderItem.UnitPrice, Quantity
FROM [Product]
JOIN [OrderItem]
ON [Product].[Id] = [OrderItem].[ProductId]
JOIN [Order]
ON [OrderItem].[OrderId] = [Order].Id
WHERE [OrderNumber] = 542410;

-- 5. Wat is het totaal aantal producten van de klant met ID 6.
SELECT *
FROM [OrderItem]
JOIN [Order]
ON [OrderItem].[OrderId] = [Order].Id
WHERE [CustomerId] = 6;

-- 6. Toon de ordernummers van de orders waarin meer dan 200 producten zijn verkocht. (20 rows)
SELECT [OrderNumber]
FROM [Order]
JOIN [OrderItem]
ON [Order].[Id] = [OrderItem].[OrderId]
WHERE [OrderItem].[Quantity] > 200;

-- 7. Selecteer alle klanten die ooit een product van leverancier 'Zaanse Snoepfabriek' hebben besteld. Je moet verplicht joins gebruiken. (27 rows)
SELECT *
FROM [Customer]
JOIN [Order]
ON [Customer].[Id] = [Order].[CustomerId]
JOIN [OrderItem]
ON [Order].[Id] = [OrderItem].[OrderId]
JOIN [Product]
ON [OrderItem].[ProductId] = [Product].[Id]
JOIN [Supplier]
ON [Product].[SupplierId] = [Supplier].[Id]
WHERE [CompanyName] = 'Zaanse Snoepfabriek';