DROP FUNCTION min_experience;

DELIMITER //
CREATE FUNCTION min_experience() RETURNS DECIMAL (10, 1)
BEGIN 
	RETURN (SELECT MIN(experience) FROM employee);
END//
DELIMITER ;

DROP FUNCTION select_by_key_name_and_building_number;

DELIMITER //
CREATE FUNCTION select_by_key_name_and_building_number(pharm_id INT) RETURNS VARCHAR(25)
BEGIN
	RETURN (SELECT CONCAT(name, building_number) FROM pharmacy WHERE id = pharm_id); 
END//

DELIMITER ;