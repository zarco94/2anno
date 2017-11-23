-- get_piatti_per_intolleranza
-- Data una intolleranza restituisce il nome dei piatti che contengono SOLO prodotti ammissibili per quella intolleranza
-- input: il nome di una intolleranza
-- output: SETOF nome di piatti
CREATE OR REPLACE FUNCTION get_piatti_per_intolleranza(mia_intolleranza varchar(30)) RETURNS SETOF varchar(50) AS $$
    DECLARE
        k piatto.nome%TYPE;
    BEGIN
        FOR k IN SELECT nome FROM piatto WHERE id NOT IN(SELECT piatto FROM include INNER JOIN prodotto ON include.prodotto=prodotto.id INNER JOIN incompatibile_con ON prodotto.id=incompatibile_con.prodotto WHERE intolleranza = mia_intolleranza)
        LOOP
            RETURN NEXT k;
        END LOOP;
        RETURN;
    END
$$ LANGUAGE plpgsql;

SELECT * FROM get_piatti_per_intolleranza('glutine');