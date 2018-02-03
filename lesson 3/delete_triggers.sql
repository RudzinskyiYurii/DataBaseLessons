DELIMITER //
CREATE TRIGGER trigger_pharmacy_delete
AFTER DELETE
ON pharmacy FOR EACH ROW
BEGIN
	DELETE FROM pharmacy_medicine WHERE old.id = pharmacy_id;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_medicine_delete
AFTER DELETE
ON medicine FOR EACH ROW
BEGIN
	DELETE FROM medicine_zone WHERE old.id = medicine_id;
END //

DELIMITER ;