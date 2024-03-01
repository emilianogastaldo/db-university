Ciao ragazzi,

Esercizio di oggi: DB University - Queries

nome repo: db-university (stessa di ieri)

Dopo aver creato un nuovo database nel vostro phpMyAdmin importando il file in allegato, eseguite le query che trovate nei PDF, partendo da EX con Select per poi passare a quelle con GROUP.

Cosa  e come consegnare?
Dopo aver testato le vostre query con phpMyAdmin, riportatele in un file .sql e caricatelo nella vostra repo.
Sarebbe consigliabile effettuare un push ad ogni query completata.

ESEMPIO di consegna nel file .sql :
-- 1. Selezionare tutti gli insegnanti 
SELECT * FROM `teachers`;

-- 2. Selezionare tutti i referenti per ogni dipartimento
SELECT `head_of_department`, `name` FROM `departments`;

-- 3 Selezionare tutti gli studenti il cui nome inizia per "E" (373)
SELECT * FROM `students` WHERE `name` LIKE 'E%';
Buon divertimento e buon weekend!