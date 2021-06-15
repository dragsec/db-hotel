/* 1 ospiti nascita */
SELECT COUNT(`id`) AS "ospiti_totali", 
        YEAR(`date_of_birth`)  AS 'year'
FROM `ospiti`
GROUP BY YEAR(`date_of_birth`);

/* 2 status */
SELECT `status`, 
SUM(`price`)
FROM `pagamenti`
GROUP BY `status`;

/* 3 conta prenotazioni stanza */
SELECT `stanza_id`, 
        COUNT(`id`)
FROM `prenotazioni`
GROUP BY `stanza_id`
ORDER BY COUNT(`stanza_id`) DESC;

/* 4 ore di punta */
SELECT `created_at`, 
        HOUR(`created_at`), 
        COUNT(`id`) AS "num_prenotazioni_ora"
FROM `prenotazioni`
GROUP BY HOUR(`created_at`)
ORDER BY 'prenotazioni' DESC;

/* 5 record prenotazioni singola persona */
SELECT `ospite_id`, 
        COUNT(*)
FROM `prenotazioni_has_ospiti`
GROUP BY `ospite_id`
ORDER BY COUNT(`id`) DESC;