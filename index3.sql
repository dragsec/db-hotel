/* 1 nome ospiti con > 2 prenotazioni */
SELECT  `ospiti`.`name`, 
        `ospiti`.`lastname`,  
	    COUNT(`prenotazioni_has_ospiti`.`prenotazione_id`) AS `num_prenotazioni`
FROM `prenotazioni_has_ospiti` 
LEFT JOIN `ospiti`
ON `prenotazioni_has_ospiti`.`ospite_id` =  `ospiti`.`id`
GROUP BY `ospiti`.`id`
HAVING `num_prenotazioni` > 2;

/* 2 ospiti per prenotazione */
SELECT `ospiti`.`name`,
	    `ospiti`.`lastname`
FROM `ospiti`
INNER JOIN `prenotazioni_has_ospiti`
ON `ospiti`.`id` = `prenotazioni_has_ospiti`.`ospite_id`;


/* 3 may 2018 -> nome, cognome, prezzo, pagamento */
SELECT `paganti`.`name`,
	    `paganti`.`lastname`,
        YEAR(`prenotazioni`.`created_at`),
        MONTH(`prenotazioni`.`created_at`)
FROM `prenotazioni`
LEFT JOIN `prenotazioni_has_ospiti`
ON `prenotazioni_has_ospiti`.`prenotazione_id` = `prenotazioni`.`id`
LEFT JOIN `ospiti`
ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id`
LEFT JOIN `pagamenti`
ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
LEFT JOIN `paganti`
ON `paganti`.`id` = `pagamenti`.`pagante_id`
WHERE 'prenotazioni'.'created_at' BETWEEN "2018-05-01" AND "2018-05-31";

/* 4 $ totali prenotazioni floor 1 */
SELECT SUM(`pagamenti`.`price`) AS "prezzo_tot"
FROM `pagamenti`
LEFT JOIN `prenotazioni`
ON `pagamenti`.`prenotazione_id` = `prenotazioni`.`id`
INNER JOIN `stanze`
ON `prenotazioni`.`stanza_id` = `stanze`.`id`
WHERE 'stanze'.`floor` = 1;

/* 5 tutti i dati fatture id 7 */
SELECT *
FROM `pagamenti`
LEFT JOIN `paganti`
ON `pagamenti`.`pagante_id` = `paganti`.`id`
where `pagamenti`.`prenotazione_id` = 7;

/* 6 stanze mai prenotate */
SELECT *
FROM `prenotazioni`
RIGHT JOIN `stanze`
ON `prenotazioni`.`stanza_id` = `stanze`.`id`
WHERE `prenotazioni`.`stanza_id` IS NULL;