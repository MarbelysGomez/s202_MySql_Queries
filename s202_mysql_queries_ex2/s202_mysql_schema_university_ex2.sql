DROP DATABASE IF EXISTS university;
CREATE DATABASE university CHARACTER SET utf8mb4;
USE university;
 
CREATE TABLE department (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE person (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    first_name VARCHAR(25) NOT NULL,
    last_name1 VARCHAR(50) NOT NULL,
    last_name2 VARCHAR(50),
    city VARCHAR(25) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(9),
    birthdate DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    type ENUM('professor', 'student') NOT NULL
);
 
CREATE TABLE professor (
    id_professor INT UNSIGNED PRIMARY KEY,
    id_department INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES person(id),
    FOREIGN KEY (id_department) REFERENCES department(id)
);
 
 CREATE TABLE degree (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    degree_name VARCHAR(100) NOT NULL
);
 
CREATE TABLE school_subject (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credits FLOAT UNSIGNED NOT NULL,
    subject_type ENUM('básica', 'obligatoria', 'optativa') NOT NULL,
    course TINYINT UNSIGNED NOT NULL,
    quarters TINYINT UNSIGNED NOT NULL,
    professor_id INT UNSIGNED,
    degree_id INT UNSIGNED NOT NULL,
    FOREIGN KEY(professor_id) REFERENCES professor(id_professor),
    FOREIGN KEY(degree_id) REFERENCES degree(id)
);
 
CREATE TABLE school_year (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    start_year YEAR NOT NULL,
    end_year YEAR NOT NULL
);

CREATE TABLE student_enrolls_in_subject (
    id_student INT UNSIGNED NOT NULL,
    id_subject INT UNSIGNED NOT NULL,
    id_school_year INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_student, id_subject, id_school_year),
    FOREIGN KEY (id_student) REFERENCES person(id),
    FOREIGN KEY (id_subject) REFERENCES subject(id),
    FOREIGN KEY (id_school_year) REFERENCES school_year(id)
);
 
 /* Department */
INSERT INTO department VALUES (1, 'Computer Science');
INSERT INTO department VALUES (2, 'Mathematics');
INSERT INTO department VALUES (3, 'Economics and Business');
INSERT INTO department VALUES (4, 'Education');
INSERT INTO department VALUES (5, 'Agronomy');
INSERT INTO department VALUES (6, 'Chemistry and Physics');
INSERT INTO department VALUES (7, 'Philology');
INSERT INTO department VALUES (8, 'Law');
INSERT INTO department VALUES (9, 'Biology and Geology');

/* Person */
INSERT INTO person VALUES (1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'High Neighborhood Street', '950254837', '1991/03/28', 'M', 'student');
INSERT INTO person VALUES (2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'Mercury Street', '618253876', '1992/08/08', 'M', 'student');
INSERT INTO person VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'Mars Street', '618223876', '1979/08/19', 'F', 'professor');
INSERT INTO person VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'Shooting Star Street', NULL, '2000/10/05', 'M', 'student');
INSERT INTO person VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'Venus Street', '678516294', '1978/01/19', 'M', 'professor');
INSERT INTO person VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'Jupiter Street', '628349590', '1998/01/28', 'M', 'student');
INSERT INTO person VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'Neptune Street', NULL, '1999/05/24', 'M', 'student');
INSERT INTO person VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'Saturn Street', '669162534', '1977/08/21', 'F', 'professor');
INSERT INTO person VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'Uranus Street', '626351429', '1996/11/21', 'M', 'student');
INSERT INTO person VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'Pluto Street', NULL, '1977/05/19', 'F', 'professor');
INSERT INTO person VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'Andarax Street', '679837625', '1997/04/26', 'M', 'student');
INSERT INTO person VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'Almanzora Street', NULL, '1971-04-29', 'F', 'professor');
INSERT INTO person VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'Guadalquivir Street', '950896725', '1980/02/01', 'M', 'professor');
INSERT INTO person VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'Duero Street', '950263514', '1977/01/02', 'M', 'professor');
INSERT INTO person VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'Tajo Street', '668726354', '1980/03/14', 'M', 'professor');
INSERT INTO person VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'Sierra de los Filabres Street', NULL, '1982/03/18', 'M', 'professor');
INSERT INTO person VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'Sierra de Gádor Street', NULL, '1973/05/05', 'M', 'professor');
INSERT INTO person VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'Veleta Street', '662581126', '1979/01/07', 'F', 'professor');
INSERT INTO person VALUES (19, '79820011H', 'Dolores', 'Bernier', 'Leffler', 'Almería', 'Mulhacén Street', '950552331', '1977/08/19', 'F', 'professor');
INSERT INTO person VALUES (20, '06210885N', 'Alicia', 'Kiehn', 'McKenzie', 'Almería', 'María Street', '638751342', '1973/06/12', 'F', 'professor');

/* Professor */
INSERT INTO professor VALUES (3, 1);
INSERT INTO professor VALUES (5, 2);
INSERT INTO professor VALUES (8, 3);
INSERT INTO professor VALUES (12, 4);
INSERT INTO professor VALUES (13, 5);
INSERT INTO professor VALUES (14, 6);
INSERT INTO professor VALUES (15, 7);
INSERT INTO professor VALUES (16, 8);
INSERT INTO professor VALUES (17, 9);
INSERT INTO professor VALUES (18, 1);
INSERT INTO professor VALUES (20, 2);

/* Degree */
INSERT INTO degree VALUES (1, 'Computer Science');
INSERT INTO degree VALUES (2, 'Mathematics');
INSERT INTO degree VALUES (3, 'Economics');
INSERT INTO degree VALUES (4, 'Primary Education');
INSERT INTO degree VALUES (5, 'Agronomic Engineering');
INSERT INTO degree VALUES (6, 'Chemistry');
INSERT INTO degree VALUES (7, 'Spanish Language and Literature');
INSERT INTO degree VALUES (8, 'Law');
INSERT INTO degree VALUES (9, 'Biology');
 
/* Subject */
INSERT INTO subject VALUES (1, 'Linear Algebra and Discrete Mathematics', 6, 'basic', 1, 1, 3, 4);
INSERT INTO subject VALUES (2, 'Calculus', 6, 'basic', 1, 1, 14, 4);
INSERT INTO subject VALUES (3, 'Physics for Computer Science', 6, 'basic', 1, 1, 3, 4);
INSERT INTO subject VALUES (4, 'Introduction to Programming', 6, 'basic', 1, 1, 14, 4);
INSERT INTO subject VALUES (5, 'Organization and Management of Businesses', 6, 'basic', 1, 1, 3, 4);
INSERT INTO subject VALUES (6, 'Statistics', 6, 'basic', 1, 2, 14, 4);
INSERT INTO subject VALUES (7, 'Computer Structure and Technology', 6, 'basic', 1, 2, 3, 4);
INSERT INTO subject VALUES (8, 'Fundamentals of Electronics', 6, 'basic', 1, 2, 14, 4);
INSERT INTO subject VALUES (9, 'Logic and Algorithmics', 6, 'basic', 1, 2, 3, 4);
INSERT INTO subject VALUES (10, 'Programming Methodology', 6, 'basic', 1, 2, 14, 4);
INSERT INTO subject VALUES (11, 'Computer Architecture', 6, 'basic', 2, 1, 3, 4);
INSERT INTO subject VALUES (12, 'Data Structures and Algorithms I', 6, 'mandatory', 2, 1, 3, 4);
INSERT INTO subject VALUES (13, 'Software Engineering', 6, 'mandatory', 2, 1, 14, 4);
INSERT INTO subject VALUES (14, 'Intelligent Systems', 6, 'mandatory', 2, 1, 3, 4);
INSERT INTO subject VALUES (15, 'Operating Systems', 6, 'mandatory', 2, 1, 14, 4);
INSERT INTO subject VALUES (16, 'Databases', 6, 'basic', 2, 2, 14, 4);
INSERT INTO subject VALUES (17, 'Data Structures and Algorithms II', 6, 'mandatory', 2, 2, 14, 4);
INSERT INTO subject VALUES (18, 'Fundamentals of Computer Networks', 6, 'mandatory', 2, 2, 3, 4);
INSERT INTO subject VALUES (19, 'Planning and Management of IT Projects', 6, 'mandatory', 2, 2, 3, 4);
INSERT INTO subject VALUES (20, 'Software Services Programming', 6, 'mandatory', 2, 2, 14, 4);
INSERT INTO subject VALUES (21, 'User Interface Development', 6, 'mandatory', 3, 1, 14, 4);
INSERT INTO subject VALUES (22, 'Requirements Engineering', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO subject VALUES (23, 'Integration of Information Technologies in Organizations', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO subject VALUES (24, 'Software Modeling and Design 1', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO subject VALUES (25, 'Multiprocessors', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO subject VALUES (26, 'Security and Regulatory Compliance', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO subject VALUES (27, 'Information Systems for Organizations', 6, 'elective', 3, 1, NULL, 4); 
INSERT INTO subject VALUES (28, 'Web Technologies', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO subject VALUES (29, 'Code Theory and Cryptography', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO subject VALUES (30, 'Database Administration', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (31, 'Software Engineering Tools and Methods', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (32, 'Industrial Informatics and Robotics', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (33, 'Information Systems Engineering', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (34, 'Software Modeling and Design 2', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (35, 'E-Business', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (36, 'Peripherals and Interfaces', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (37, 'Real-Time Systems', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (38, 'Network Access Technologies', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (39, 'Digital Image Processing', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO subject VALUES (40, 'Network and Operating System Administration', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO subject VALUES (41, 'Data Warehouses', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO subject VALUES (42, 'Reliability and Risk Management', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO subject VALUES (43, 'Software Product Lines', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO subject VALUES (44, 'Software Engineering Processes 1', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO subject VALUES (45, 'Multimedia Technologies', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO subject VALUES (46, 'IT Analysis and Planning', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO subject VALUES (47, 'Rapid Application Development', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO subject VALUES (48, 'Quality and Technological Innovation Management', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO subject VALUES (49, 'Business Intelligence', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO subject VALUES (50, 'Software Engineering Processes 2', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO subject VALUES (51, 'Computer Security', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO subject VALUES (52, 'Cell Biology', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO subject VALUES (53, 'Physics', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO subject VALUES (54, 'Mathematics I', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO subject VALUES (55, 'General Chemistry', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO subject VALUES (56, 'Organic Chemistry', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO subject VALUES (57, 'Plant and Animal Biology', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO subject VALUES (58, 'Biochemistry', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO subject VALUES (59, 'Genetics', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO subject VALUES (60, 'Mathematics II', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO subject VALUES (61, 'Microbiology', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO subject VALUES (62, 'Agricultural Botany', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO subject VALUES (63, 'Plant Physiology', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO subject VALUES (64, 'Molecular Genetics', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO subject VALUES (65, 'Biochemical Engineering', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO subject VALUES (66, 'Thermodynamics and Applied Chemical Kinetics', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO subject VALUES (67, 'Bioreactors', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO subject VALUES (68, 'Microbial Biotechnology', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO subject VALUES (69, 'Genetic Engineering', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO subject VALUES (70, 'Immunology', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO subject VALUES (71, 'Virology', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO subject VALUES (72, 'Molecular Basis of Plant Development', 4.5, 'mandatory', 3, 1, NULL, 7);
INSERT INTO subject VALUES (73, 'Animal Physiology', 4.5, 'mandatory', 3, 1, NULL, 7);
INSERT INTO subject VALUES (74, 'Metabolism and Biomolecule Biosynthesis', 6, 'mandatory', 3, 1, NULL, 7);
INSERT INTO subject VALUES (75, 'Separation Operations', 6, 'mandatory', 3, 1, NULL, 7);
INSERT INTO subject VALUES (76, 'Molecular Plant Pathology', 4.5, 'mandatory', 3, 1, NULL, 7);
INSERT INTO subject VALUES (77, 'Basic Instrumental Techniques', 4.5, 'mandatory', 3, 1, NULL, 7);
INSERT INTO subject VALUES (78, 'Bioinformatics', 4.5, 'mandatory', 3, 2, NULL, 7);
INSERT INTO subject VALUES (79, 'Biotechnology of Horticultural Products', 4.5, 'mandatory', 3, 2, NULL, 7);
INSERT INTO subject VALUES (80, 'Plant Biotechnology', 6, 'mandatory', 3, 2, NULL, 7);
INSERT INTO subject VALUES (81, 'Genomics and Proteomics', 4.5, 'mandatory', 3, 2, NULL, 7);
INSERT INTO subject VALUES (82, 'Biotechnological Processes', 6, 'mandatory', 3, 2, NULL, 7);
INSERT INTO subject VALUES (83, 'Advanced Instrumental Techniques', 4.5, 'mandatory', 3, 2, NULL, 7);

/* School Year */
INSERT INTO school_year VALUES (1, 2014, 2015);
INSERT INTO school_year VALUES (2, 2015, 2016);
INSERT INTO school_year VALUES (3, 2016, 2017);
INSERT INTO school_year VALUES (4, 2017, 2018);
INSERT INTO school_year VALUES (5, 2018, 2019);

/* Student Enrolls in Subject */
INSERT INTO student_enrolls_in_subject VALUES (1, 1, 1);
INSERT INTO student_enrolls_in_subject VALUES (1, 2, 1);
INSERT INTO student_enrolls_in_subject VALUES (1, 3, 1);
INSERT INTO student_enrolls_in_subject VALUES (2, 1, 1);
INSERT INTO student_enrolls_in_subject VALUES (2, 2, 1);
INSERT INTO student_enrolls_in_subject VALUES (2, 3, 1);
INSERT INTO student_enrolls_in_subject VALUES (4, 1, 1);
INSERT INTO student_enrolls_in_subject VALUES (4, 2, 1);
INSERT INTO student_enrolls_in_subject VALUES (4, 3, 1);
INSERT INTO student_enrolls_in_subject VALUES (24, 1, 5);
INSERT INTO student_enrolls_in_subject VALUES (24, 2, 5);
INSERT INTO student_enrolls_in_subject VALUES (24, 3, 5);
INSERT INTO student_enrolls_in_subject VALUES (24, 4, 5);
INSERT INTO student_enrolls_in_subject VALUES (24, 5, 5);
INSERT INTO student_enrolls_in_subject VALUES (24, 6, 5);
INSERT INTO student_enrolls_in_subject VALUES (24, 7, 5);
INSERT INTO student_enrolls_in_subject VALUES (24, 8, 5);
INSERT INTO student_enrolls_in_subject VALUES (24, 9, 5);
INSERT INTO student_enrolls_in_subject VALUES (24, 10, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 1, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 2, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 3, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 4, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 5, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 6, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 7, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 8, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 9, 5);
INSERT INTO student_enrolls_in_subject VALUES (23, 10, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 1, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 2, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 3, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 4, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 5, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 6, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 7, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 8, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 9, 5);
INSERT INTO student_enrolls_in_subject VALUES (19, 10, 5);