-- SQLite
.headers on


--1
SELECT maker FROM Printer, Product
WHERE Printer.model = Product.model
AND Printer.color = 1 
AND Printer.price < 120;


--2
SELECT DISTINCT maker FROM Product
WHERE type = 'pc' AND maker NOT IN (SELECT maker FROM Product
WHERE type = 'laptop' OR type = 'printer');

--3
SELECT DISTINCT Product.maker, MAX(PC.price) as PC_maxprice, MAX(Laptop.price) as Laptop_maxprice, MAX(PC.price) + MAX(Laptop.price) AS Combination_price
FROM Product, PC, Laptop
WHERE type = 'pc' AND maker IN (SELECT maker FROM Product
WHERE type = 'laptop');

--4
SELECT COUNT(*), screen
FROM Laptop
GROUP BY screen
HAVING COUNT(*) > 1;

--5
SELECT price, model FROM Laptop
WHERE price > (SELECT MAX(price) FROM PC);

--6
SELECT DISTINCT maker FROM Product
WHERE (type= 'pc' OR 'laptop')
AND maker IN (
SELECT maker FROM Product
WHERE type = 'printer'
GROUP BY maker
HAVING COUNT(*) >= 2);
