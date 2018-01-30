/*SELECT DISTINCT maker FROM Labor_SQL.Product
WHERE type = "PC" AND maker IN (SELECT maker FROM Labor_SQL.Product  WHERE type = "Laptop")*/

/*SELECT DISTINCT maker FROM Labor_SQL.Product
WHERE type = "PC" AND maker = ANY (SELECT maker FROM Labor_SQL.Product  WHERE type = "Laptop")*/

/*SELECT DISTINCT maker FROM Labor_SQL.Product
WHERE type = "PC" AND NOT maker != ALL (SELECT maker FROM Labor_SQL.Product  WHERE type = "Laptop")*/


-- завдання 3
/*SELECT DISTINCT maker, (SELECT COUNT(*) pc FROM Product JOIN PC ON (Product.model = PC.model) WHERE P.maker = maker), 
(SELECT COUNT(*) laptop FROM Product JOIN Laptop ON (Product.model = Laptop.model) WHERE P.maker = maker), 
(SELECT COUNT(*) printer FROM Labor_SQL.Product JOIN Printer ON (Product.model = Printer.model) WHERE P.maker = maker) FROM Product AS P*/


#--- homework -------------------------------------------------------------------------------------------------------------------------------

-- task 1

/*SELECT DISTINCT maker FROM Product
WHERE type = "PC" AND NOT maker IN (SELECT maker FROM Product  WHERE type = "Laptop")*/

/*SELECT DISTINCT maker FROM Product
WHERE type = "PC" AND maker != ALL (SELECT maker FROM Product  WHERE type = "Laptop")*/

/*SELECT DISTINCT maker FROM Labor_SQL.Product
WHERE type = "PC" AND NOT maker = ANY (SELECT maker FROM Labor_SQL.Product  WHERE type = "Laptop")*/

/*SELECT DISTINCT maker FROM Labor_SQL.Product
WHERE type = "PC" AND maker IN (SELECT maker FROM Labor_SQL.Product  WHERE type = "Laptop")*/

/*SELECT DISTINCT maker FROM Labor_SQL.Product
WHERE type = "PC" AND NOT maker != ALL (SELECT maker FROM Labor_SQL.Product  WHERE type = "Laptop")*/

-- task 2

/*SELECT DISTINCT maker FROM Product AS P
WHERE type = "PC" AND EXISTS (SELECT model FROM PC WHERE model = P.model)*/

/*SELECT DISTINCT maker FROM Product AS P
WHERE type = "PC" AND EXISTS (SELECT model FROM PC WHERE speed >= 750 AND model = P.model)*/

/*SELECT DISTINCT maker FROM Product AS P
WHERE (type = "PC" AND EXISTS (SELECT model FROM PC WHERE speed >= 750 AND model = P.model)) OR (type = "Laptop" 
										 AND EXISTS (SELECT model FROM Laptop WHERE speed >= 750 AND model = P.model))*/

/*SELECT maker FROM Product AS P
WHERE type = "PC" AND EXISTS (SELECT maker FROM Product WHERE type = "Printer" AND maker = P.maker)
						AND (SELECT model FROM PC WHERE speed = (SELECT MAX(speed) FROM PC) AND model = P.model)*/
						
-- task 3

/*SELECT CONCAT("середня ціна = ", AVG(price)) avg_price FROM Laptop*/

/*SELECT CONCAT("code:", code) code, CONCAT("model:", model) model, CONCAT("speed:", speed) speed, 
		CONCAT("ram:", ram) ram, CONCAT("hd:",hd) hd, CONCAT("cd:", cd) cd, CONCAT("price:", price) price FROM PC*/

/*SELECT DATE_FORMAT(date, '%Y.%m.%d') FROM Income*/
