--1
SELECT nominativo, telefono
FROM fornitore
WHERE consegne_da_ora>'08:00' AND consegne_a_ora<'13:00'; -- devo specificare dei dati che son orari

--2 individuare marca e quantità disponibile dei prodotti italiani acqui...
SELECT marca, qnt_disp
FROM prodotto INNER JOIN fornisce ON prodotto = id --se non specifici inner scrivendo solo join è come scrivere inner
WHERE (paese_prov = 'Italia') AND (data_f>'2014-10-01')AND(costo_u>10);

--3 individuare il codice delle ricette che utilizzano sia le patate sia le zucchine come ingrediente
    --con il JOIN
SELECT c.ricetta
FROM composta_da AS c JOIN composta_da AS d ON c.ricetta = d.ricetta
WHERE (ingrediente = 'zucchine') AND (d.ingrediente = 'patate');
    --intersezione
SELECT ricetta
FROM composta_da 
WHERE (ingrediente = 'olio')
INTERSECT
SELECT ricetta
FROM composta_da 
WHERE (ingrediente = 'patate');
    --con query innestata
SELECT ricetta
FROM composta_da 
WHERE (ingrediente = 'olio') AND ricetta IN(
    SELECT ricetta
    FROM composta_da 
    WHERE (ingrediente = 'patate')
);

--5 marca dei soli prodotti che non pongono problemi di intolleranze alimentari
SELECT marca
FROM prodotto
WHERE id NOT IN (SELECT prodotto FROM incompatibile_con);
    --oppure
SELECT marca
FROM prodotto
WHERE id IN
(SELECT id
FROM prodotto
EXCEPT
SELECT prodotto
FROM incompatibile_con);
