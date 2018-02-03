USE StoredPr_DB;
#CALL param_insert("Цибульська", "Ірина", NULL, NULL, NULL, NULL, NULL, "ddd", NULL);
#CALL insert_into_pharmacy_medicine (4, 10);
CALL create_tables_foreach_names_from_employee;