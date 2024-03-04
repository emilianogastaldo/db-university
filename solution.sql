
-- QUERY CON SELECT:
-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * FROM `students` WHERE YEAR(`date_of_birth`) = 1990;
SELECT * FROM `students` WHERE `date_of_birth` like '1990-%'; -- più veloce

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * FROM `courses` WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * FROM `students` WHERE (YEAR(CURRENT_DATE())-YEAR(`date_of_birth`)) > 30;
SELECT * FROM `students` TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;
SELECT * FROM `students` DATEDIFF(CURRENT_DATE(),  DATE(`date_of_birth`) / 365) > 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * FROM `courses` WHERE `period` = 'I semestre' AND `year` = 1;
SELECT * FROM `courses` WHERE `period` LIKE 'I %' AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams` WHERE HOUR(`hour`) >= 14 AND `date` = '2020-06-20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM `degrees` WHERE `name` LIKE '%Magistrale%';
SELECT * FROM `degrees` WHERE `level` = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`id`) AS `Numero di dipartimenti` FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(`phone`) AS `insegnanti_senza_telefono` FROM `teachers`; -- per sapere quanti sono
SELECT * FROM `teachers` WHERE `phone` IS NULL; -- per sapere quali sono


-- QUERY CON GROUP BY:
-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) AS `Anno immatricolazione`, COUNT(*) AS `Iscritti` FROM `students` GROUP BY `Anno immatricolazione`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address`, COUNT(`office_address`) FROM `teachers` GROUP BY `office_address`;
SELECT `office_address`, COUNT(`office_address`) FROM `teachers` GROUP BY `office_address` HAVING COUNT(`office_address`) > 1; -- tolgo gli edifici in cui c'è un solo insegnante

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, ROUND(AVG(`vote`), 2) AS `Voto medio` FROM `exam_student` GROUP BY `exam_id`;
SELECT `exam_id`, ROUND(AVG(`vote`), 2) AS `Voto medio` FROM `exam_student` WHERE `vote` > 17 GROUP BY `exam_id`; -- tolgo i voti al di sotto del 18

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id` AS `Dipartimento`, COUNT(*) AS `Quanti corsi di laurea` FROM `degrees` GROUP BY `department_id`;