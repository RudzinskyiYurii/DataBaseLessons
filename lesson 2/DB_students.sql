CREATE DATABASE IF NOT EXISTS Students
CHARACTER SET utf8;
use Students;

CREATE TABLE student (
		id VARCHAR (45) NOT NULL PRIMARY KEY,  -- PK
        photo VARCHAR (50) NULL ,
        full_name VARCHAR (100) NOT NULL ,
        current_rating INT NULL,
        city_name VARCHAR (45) NOT NULL, -- FK
		course_id INT NOT NULL,  -- FK
        stipend_id INT NULL,  -- FK
        speciality_id VARCHAR (40) NOT NULL -- FK
);

CREATE TABLE city (
		name VARCHAR (45) NOT NULL PRIMARY KEY, -- PK
        region_id INT NOT NULL -- FK
);

CREATE TABLE region (
		id INT NOT NULL PRIMARY KEY, -- PK
        name VARCHAR (50) NOT NULL 
);

CREATE TABLE course (
		id INT NOT NULL , -- PK
		name VARCHAR (50) NOT NULL,   -- PK
        number VARCHAR (20) NOT NULL, -- PK
        entried_year VARCHAR (20) NULL
);

CREATE TABLE discipline (
		name VARCHAR (50) NOT NULL PRIMARY KEY,  -- PK
        teacher VARCHAR (50) NOT NULL,
        semester_number INT NOT NULL
);

CREATE TABLE student_has_discipline (
		student_id VARCHAR (45) NOT NULL,  -- FK
        discipline_name VARCHAR (50) NOT NULL  -- FK
);

CREATE TABLE progress (
		student_id VARCHAR (45) NOT NULL,  -- PK, FK
        discipline_name VARCHAR (50) NOT NULL,  -- PK, FK
        modul_one_result INT NULL,
        modul_two_result INT NULL
);
        
CREATE TABLE mark (
		student_id VARCHAR (45) NOT NULL,  -- PK, FK
        discipline_name VARCHAR (50) NOT NULL, -- PK, FK
        semestr_mark_100 INT NULL,
        semestr_mark_5 INT NULL
);

CREATE TABLE speciality (
		id VARCHAR (40) NOT NULL PRIMARY KEY,  -- PK
        name VARCHAR (50) NOT NULL
);

CREATE TABLE stipend (
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- PK
		speciality_id VARCHAR (40) NOT NULL, -- FK
        rate INT NULL,
        type VARCHAR (45) NULL
);
        
ALTER TABLE course ADD 
		CONSTRAINT PK_course PRIMARY KEY NONCLUSTERED
        (
			id,
            name,
            number
        );
        
ALTER TABLE progress add
		CONSTRAINT PK_progress PRIMARY KEY NONCLUSTERED
        (
			student_id,
            discipline_name
        );
        
ALTER TABLE mark add
		CONSTRAINT PK_mark PRIMARY KEY NONCLUSTERED
        (
			student_id,
            discipline_name
        );
        
ALTER TABLE student ADD
		CONSTRAINT FK_student_city FOREIGN KEY
        (
			city_name
        ) REFERENCES city (
			name
        );
        
ALTER TABLE student ADD
		CONSTRAINT FK_student_course FOREIGN KEY
        (
			course_id
        ) REFERENCES course (
			id
        );
        
ALTER TABLE student ADD
		CONSTRAINT FK_student_stipend FOREIGN KEY
        (
			stipend_id
        ) REFERENCES stipend (
			id
        );
        
ALTER TABLE student ADD
		CONSTRAINT FK_student_speciality FOREIGN KEY
        (
			speciality_id
        ) REFERENCES speciality (
			id
        );
        
ALTER TABLE city ADD
		CONSTRAINT FK_city_region FOREIGN KEY
        (
			region_id
        ) REFERENCES region (
			id
        );
        
ALTER TABLE student_has_discipline ADD
		CONSTRAINT FK_student_has_discipline_student1 FOREIGN KEY
        (
			student_id
        ) REFERENCES student (
			id
        );
        
ALTER TABLE student_has_discipline ADD
		CONSTRAINT FK_student_has_discipline_discipline1 FOREIGN KEY
        (
			discipline_name
        ) REFERENCES discipline (
			name
        );
        
        
ALTER TABLE progress ADD
		CONSTRAINT FK_progress_srudent FOREIGN KEY
        (
			student_id
        ) REFERENCES student (
			id
        );
        
ALTER TABLE progress ADD
		CONSTRAINT FK_progress_discipline FOREIGN KEY
        (
			discipline_name
        ) REFERENCES discipline (
			name
        );
        
ALTER TABLE mark ADD
		CONSTRAINT FK_mark_student FOREIGN KEY
        (
			student_id
        ) REFERENCES student (
			id
        );
        
ALTER TABLE mark ADD
		CONSTRAINT FK_mark_discipline FOREIGN KEY
        (
			discipline_name
        ) REFERENCES discipline (
			name
        );
        
ALTER TABLE stipend ADD
		CONSTRAINT FK_stipend_speciality FOREIGN KEY
        (
			speciality_id
        ) REFERENCES speciality (
			id
        );        

#--- region ------------------------------------------------------------------------------------------
INSERT INTO region VALUES (12, "Львівська обл.");

#--- city --------------------------------------------------------------------------------------------
INSERT INTO city VALUES ("Львів", 12);
INSERT INTO city VALUES ("Дрогобич", 12);



#--- course ------------------------------------------------------------------------------------------
INSERT INTO course VALUES (1, "КІ", "24", "2008");

#--- discipline --------------------------------------------------------------------------------------
INSERT INTO discipline VALUES ("Хімія", "Мельничук", 2);
INSERT INTO discipline VALUES ("Фізика", "Дунець", 1);



#--- speciality ---------------------------------------------------------------------------------------
INSERT INTO speciality VALUES ("0015", "СПР");

#--- stipend ------------------------------------------------------------------------------------------
INSERT INTO stipend VALUES (1, "0015", 700, "проста");
INSERT INTO stipend (speciality_id, rate, type) VALUES ("0015", 1300, "підвищена");

#--- student -----------------------------------------------------------------------------------------
INSERT INTO student VALUES ("014545", NULL, "Петренко Олег Ігорович", NULL, "Львів", 1, 1, "0015");
INSERT INTO student VALUES ("000105", NULL, "Адрієнко Юлі", 128, "Дрогобич", 1, 2, "0015");

#--- student_has_discipline --------------------------------------------------------------------------
INSERT INTO student_has_discipline VALUES ("014545", "Хімія");
INSERT INTO student_has_discipline VALUES ("014545", "Фізика");
INSERT INTO student_has_discipline VALUES ("000105", "Фізика");

#--- mark ---------------------------------------------------------------------------------------------
INSERT INTO mark VALUES ("014545", "Фізика", 89, 5);
INSERT INTO mark VALUES ("000105", "Фізика", 65, 3);

#--- progress -----------------------------------------------------------------------------------------
INSERT INTO progress VALUES ("014545", "Фізика", 45, 89);
INSERT INTO progress VALUES ("014545", "Хімія", 74, 49);
INSERT INTO progress VALUES ("000105", "Фізика", 65, 51);
