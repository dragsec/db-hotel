/* 1 Ospiti from cdi */
SELECT `name`, 
        `lastname`, 
        `document_type`
FROM `ospiti`
WHERE `document_type` = "CI";

/* 2 Ospiti dopo 1988 */
SELECT `name`, 
        `lastname`, 
        `date_of_birth`
FROM `ospiti` 
WHERE YEAR(`date_of_birth`) >= 1988;
SELECT COUNT(`date_of_birth`)
FROM `ospiti`
WHERE YEAR(`date_of_birth`) >= 1988; 

/* 3 Ospiti sopra 20 anni */
SELECT `name`, 
        `date_of_birth`
FROM `ospiti`
WHERE `date_of_birth` <= (YEAR(CURRENT_DATE()) - 20);

/* 4 Ospiti start D */
SELECT `name`, 
        `lastname`
FROM `ospiti`
WHERE `name` LIKE "D%";

/* 5 Totale $ */
SELECT SUM(`price`)
FROM `pagamenti`
WHERE `status` = "accepted"; 

/* 6 Max $ */
SELECT MAX(`price`)
FROM `pagamenti`;

/* 7 patente + nati dopo 1975 */
SELECT *
FROM `ospiti`
WHERE `document_type` = "Driver License"
AND YEAR(`date_of_birth`) = "1975";

/* 8 ospiti paganti */
SELECT `ospite_id`
FROM `paganti`
WHERE `ospite_id` > 0;

/* 9 Stanze? */
SELECT SUM(`beds`) 
FROM `stanze`; /
