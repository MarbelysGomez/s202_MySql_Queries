-- Queries --
SELECT last_name1, last_name2, first_name FROM person WHERE type = 'student' ORDER BY last_name1, last_name2, first_name;
SELECT first_name, last_name1, last_name2 FROM person WHERE type = 'student' AND phone IS NULL;
SELECT first_name, last_name1, last_name2 FROM person WHERE type = 'student' AND YEAR(birthdate) = 1999;
SELECT first_name, last_name1, last_name2 FROM person WHERE type = 'professor' AND phone IS NULL AND SUBSTRING (nif, 9, 1) = 'K';
SELECT subject_name FROM school_subject WHERE quarters = 1 AND course = 3 AND degree_id = 7;
SELECT p.last_name1, p.last_name2, p.first_name, d.department_name FROM professor pr JOIN person p ON pr.id_professor = p.id JOIN department d ON pr.id_department = d.id ORDER BY last_name1, first_name;
SELECT s.subject_name, sy.start_year, sy.end_year FROM student_enrolls_in_subject se JOIN person p ON se.id_student = p.id JOIN school_subject s ON se.id_subject = s.id JOIN school_year sy ON se.id_school_year = sy.id WHERE p.nif = '26902806M';
SELECT DISTINCT d.department_name FROM school_subject s JOIN professor pr ON s.professor_id = pr.id_professor JOIN department d ON pr.id_department = d.id JOIN degree deg ON s.degree_id = deg.id WHERE deg.id = 1; 
SELECT DISTINCT p.first_name, p.last_name1, p.last_name2 FROM student_enrolls_in_subject se JOIN person p ON se.id_student = p.id JOIN school_year sy ON se.id_school_year = sy.id WHERE sy.start_year = 2018 AND sy.end_year = 2019;
-- LEFT JOIN and RIGHT JOIN --
SELECT d.department_name, p.last_name1, p.last_name2, p.first_name FROM professor pr LEFT JOIN department d ON pr.id_department = d.id LEFT JOIN person p ON pr.id_professor = p.id ORDER BY d.department_name, p.last_name1, p.last_name2, p.first_name;
SELECT p.last_name1, p.last_name2, p.first_name FROM person p LEFT JOIN professor pr ON p.id = pr.id_professor WHERE pr.id_professor IS NULL;
SELECT d.department_name FROM department d LEFT JOIN professor pr ON d.id = pr.id_department WHERE pr.id_department IS NULL;
SELECT p.last_name1, p.last_name2, p.first_name FROM person p LEFT JOIN professor pr ON p.id = pr.id_professor LEFT JOIN school_subject s ON pr.id_professor = s.professor_id WHERE s.professor_id IS NULL;
SELECT s.subject_name FROM school_subject s LEFT JOIN professor pr ON s.professor_id = pr.id_professor WHERE pr.id_professor IS NULL;
SELECT d.department_name FROM department d LEFT JOIN professor pr ON d.id = pr.id_department LEFT JOIN school_subject s ON pr.id_professor = s.professor_id LEFT JOIN student_enrolls_in_subject se ON s.id = se.id_subject WHERE se.id_subject IS NULL;
-- Summary Queries -- 
SELECT COUNT(*) AS total_students FROM person WHERE type = 'student';
SELECT COUNT(*) AS students_born_in_1999 FROM person WHERE type = 'student' AND YEAR(birthdate) = 1999;
SELECT d.department_name, COUNT(pr.id_professor) AS number_of_teachers FROM department d LEFT JOIN professor pr ON d.id = pr.id_department WHERE pr.id_professor IS NOT NULL GROUP BY d.department_name ORDER BY number_of_teachers DESC;
SELECT d.department_name, COUNT(pr.id_professor) AS number_of_professors FROM department d LEFT JOIN professor pr ON d.id = pr.id_department GROUP BY d.department_name;
SELECT deg.degree_name, COUNT(s.id) AS number_of_subjects FROM degree deg LEFT JOIN school_subject s ON deg.id = s.degree_id GROUP BY deg.degree_name ORDER BY number_of_subjects DESC;
SELECT deg.degree_name, COUNT(s.id) AS number_of_subjects FROM degree deg LEFT JOIN school_subject s ON deg.id = s.degree_id GROUP BY deg.degree_name HAVING number_of_subjects > 40;
SELECT deg.degree_name, s.subject_type, SUM(s.credits) AS total_credits FROM degree deg LEFT JOIN school_subject s ON deg.id = s.degree_id GROUP BY deg.degree_name, s.subject_type;
SELECT sy.start_year, COUNT(se.id_student) AS number_of_students FROM school_year sy LEFT JOIN student_enrolls_in_subject se ON sy.id = se.id_school_year GROUP BY sy.start_year;
SELECT pr.id_professor, p.first_name, p.last_name1, p.last_name2, COUNT(s.id) AS number_of_subjects FROM professor pr LEFT JOIN school_subject s ON pr.id_professor = s.professor_id LEFT JOIN person p ON pr.id_professor = p.id GROUP BY pr.id_professor, p.first_name, p.last_name1, p.last_name2 ORDER BY number_of_subjects DESC;
SELECT * FROM person WHERE type = 'student' ORDER BY birthdate DESC LIMIT 1;
SELECT p.first_name, p.last_name1, p.last_name2 FROM professor pr LEFT JOIN school_subject s ON pr.id_professor = s.professor_id JOIN department d ON pr.id_department = d.id JOIN person p ON pr.id_professor = p.id WHERE s.professor_id IS NULL;