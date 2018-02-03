DROP PROCEDURE param_insert;
DELIMITER //
CREATE PROCEDURE param_insert(
	surname VARCHAR(30),
    name CHAR(30),
    midle_name VARCHAR(30),
    identity_number CHAR(10),
    passport CHAR(10),
    experience DECIMAL (10, 1),
    birthday DATE,
    post VARCHAR(15),
    pharmacy_id INT)
INSERT INTO employee (
			surname, 
            name, 
            midle_name,
            identity_number,
            passport,
            experience,
            birthday,
            post,
            pharmacy_id) VALUES (
            surname, 
            name, 
            midle_name,
            identity_number,
            passport,
            experience,
            birthday,
            post,
            pharmacy_id)
	
//
DELIMITER ;


DROP PROCEDURE insert_into_pharmacy_medicine;
DELIMITER //
CREATE PROCEDURE insert_into_pharmacy_medicine(pharmacy_id INT, medicine_id INT)
BEGIN
	IF ((SELECT id FROM medicine WHERE id = medicine_id) != 0 AND 
		(SELECT id FROM pharmacy WHERE id = pharmacy_id) != 0)
	THEN 
		INSERT INTO pharmacy_medicine VALUES (pharmacy_id, medicine_id);
	END IF;
END //
DELIMITER ;

DROP PROCEDURE create_tables_foreach_names_from_employee;
DROP FUNCTION create_random_columns;

DELIMITER //
CREATE FUNCTION create_random_columns() RETURNS VARCHAR(1000)
BEGIN 
SET @temp_count = FLOOR(1 + (RAND() * 8));
    SET @random_columns = CONCAT("column_", @temp_count, ' INT NULL');
    
    create_random_columns: REPEAT
		SET @temp_count = @temp_count - 1;
		SET @random_columns = CONCAT(@random_columns, ', column_', @temp_count, ' INT NULL');
        UNTIL @temp_count < 2
		END REPEAT create_random_columns;
RETURN @random_columns;
END//         
	
DELIMITER ;    
    
DELIMITER //
CREATE PROCEDURE create_tables_foreach_names_from_employee ()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE surnameT, nameT char (30);
    #DECLARE random_columns VARCHAR (1000);
    
    DECLARE cursor_new  CURSOR
    FOR SELECT surname, name FROM employee;
    
    DECLARE CONTINUE HANDLER 
    FOR NOT FOUND SET done = TRUE;
    
    
    OPEN cursor_new;
   
    my_loop: LOOP 
		FETCH cursor_new INTO surnameT, nameT;
        IF done = TRUE THEN LEAVE my_loop;
        END IF;
        SET @temp_query = CONCAT('CREATE TABLE ', surnameT, nameT,' (', create_random_columns(), ' ) ' ';');
        PREPARE myquery FROM @temp_query;
        EXECUTE myquery;
        DEALLOCATE PREPARE myquery;
        END LOOP;
        
        CLOSE cursor_new;        
    
END//
DELIMITER ;
