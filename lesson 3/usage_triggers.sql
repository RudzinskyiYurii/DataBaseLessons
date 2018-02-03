DELIMITER //
CREATE TRIGGER trigger_check_emplyee_id
AFTER INSERT
ON employee FOR EACH ROW
BEGIN
	IF (SELECT COUNT(*) FROM employee WHERE new.identity_number RLIKE '[0]{2}$') != 0
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "ID can`t end by 00";
	END IF;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_check_medicine_ministry_code
AFTER INSERT
ON medicine FOR EACH ROW
BEGIN
	IF NOT(convert(new.ministry_code USING cp1251) RLIKE convert('^[^МП][^МП]-[0-9][0-9][0-9]-[0-9][0-9]$' USING cp1251) )
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Ministry code format: 2 довільні букви, окрім М та П - 3 цифри - 2 цифри";
	END IF;
END //

DELIMITER ;


DELIMITER //
CREATE TRIGGER trigger_prohibition_to_update
BEFORE UPDATE
ON post FOR EACH ROW
BEGIN
	IF new.post != old.post
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Post is unable to update!";
	END IF;
END //

DELIMITER ;