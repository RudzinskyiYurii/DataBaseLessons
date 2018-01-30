/*SELECT maker, type FROM Labor_SQL.Product
ORDER BY maker*/

/*SELECT model, ram, screen, price FROM Labor_SQL.Laptop
	WHERE price>1000
ORDER BY ram, price DESC*/

/*SELECT * FROM Labor_SQL.Printer
	WHERE  color = 'y'
ORDER BY price DESC*/

/*SELECT model, speed, hd, cd, price FROM Labor_SQL.PC
	WHERE (cd = '12x' OR cd = '24x') AND price < 600
ORDER BY speed DESC*/

/*SELECT name, class FROM Labor_SQL.Ships
ORDER BY name
LIMIT 5*/

/*SELECT * FROM Labor_SQL.PC
	WHERE speed >= 500 AND price < 800
ORDER BY price DESC*/

/*SELECT * FROM Labor_SQL.Printer
	WHERE type != "Matrix" AND price < 300
ORDER BY type DESC*/

/*SELECT model, speed FROM Labor_SQL.PC
	WHERE price BETWEEN 400 AND 600
ORDER BY hd*/

/*
SELECT model, speed, hd FROM Labor_SQL.PC
	WHERE hd IN (10, 20) AND model IN (SELECT model FROM Labor_SQL.Product
		WHERE maker = 'A')
ORDER BY speed*/

/*SELECT model, speed, hd, price FROM Labor_SQL.Laptop
WHERE screen >= 12
ORDER BY price DESC */

-- 2 task

/*SELECT * FROM Labor_SQL.PC
	WHERE model RLIKE '[1]{2,}'*/
    
/*SELECT * FROM Labor_SQL.Outcome
WHERE month(date) = '03'*/

/*SELECT * FROM Labor_SQL.Outcome_o
WHERE day(date) = '14'*/

/*SELECT name FROM Labor_SQL.Ships
WHERE Ships.name RLIKE '^W' AND name RLIKE 'n$' */

/*SELECT name FROM Labor_SQL.Ships
WHERE name RLIKE '[e]{2}'*/

-- task 3

/*SELECT DISTINCT Product.maker, type, speed, hd FROM Labor_SQL.Product, Labor_SQL.PC
WHERE Product.model = PC.model AND hd <=8*/

/*SELECT maker FROM Labor_SQL.Product, Labor_SQL.PC
WHERE Product.model = PC.model AND speed >= 600*/

/*SELECT maker FROM Labor_SQL.Product, Labor_SQL.Laptop
WHERE Product.model = Laptop.model AND speed <= 500*/

/*SELECT Laptop1.model, Laptop2.model, Laptop1.hd, Laptop1.ram FROM Labor_SQL.Laptop AS Laptop1
INNER JOIN Labor_SQL.Laptop AS Laptop2 ON (Laptop1.hd = Laptop2.hd 
                  AND Laptop1.ram = Laptop2.ram
                  AND Laptop1.model < Laptop2.model)
ORDER BY Laptop1.model DESC*/

SELECT country FROM Labor_SQL.Classes
GROUP BY country
HAVING COUNT(DISTINCT type) = 2
