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

SELECT type.model, type.speed, type.hd FROM Labor_SQL.Product
	WHERE (type.hd = '10' OR type.hd = '20') AND maker = 'A'
ORDER BY type.speed
