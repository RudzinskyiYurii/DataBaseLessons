#SELECT * FROM employee WHERE experience = min_experience() 
SELECT * , select_by_key_name_and_building_number(pharmacy_id) name_and_building_number FROM employee