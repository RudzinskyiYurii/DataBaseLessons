DELIMITER //
CREATE TRIGGER trigger_emplyee_post_fk
AFTER INSERT
ON employee FOR EACH ROW
BEGIN
	IF (SELECT COUNT(*) FROM employee WHERE new.post IN (SELECT post FROM post)) = 0
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "There is not such post!";
	END IF;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_pharmacy_street_fk
AFTER INSERT
ON pharmacy FOR EACH ROW
BEGIN
	IF (SELECT COUNT(*) FROM pharmacy WHERE new.street IN (SELECT street FROM street)) = 0
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "There is not such street!";
	END IF;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_pharmacy_medicine_pharmacy_fk
AFTER INSERT
ON pharmacy_medicine FOR EACH ROW
BEGIN
	IF (SELECT COUNT(*) FROM pharmacy_medicine WHERE new.pharmacy_id IN (SELECT id FROM pharmacy)) = 0
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "There is no such id in pharmacy";
	END IF;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_pharmacy_medicine_medicine_fk
AFTER INSERT
ON pharmacy_medicine FOR EACH ROW
BEGIN
	IF (SELECT COUNT(*) FROM pharmacy_medicine WHERE new.medicine_id IN (SELECT id FROM medicine)) = 0
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "There is no such id in medicine";
	END IF;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_medicine_zone_medicine_fk
AFTER INSERT
ON medicine_zone FOR EACH ROW
BEGIN
	IF (SELECT COUNT(*) FROM medicine_zone WHERE new.medicine_id IN (SELECT id FROM medicine)) = 0
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "There is no such id in medicine";
	END IF;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_medicine_zone_zone_fk
AFTER INSERT
ON medicine_zone FOR EACH ROW
BEGIN
	IF (SELECT COUNT(*) FROM medicine_zone WHERE new.zone_id IN (SELECT id FROM zone)) = 0
    THEN SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "There is no such id in zone";
	END IF;
END //

DELIMITER ;