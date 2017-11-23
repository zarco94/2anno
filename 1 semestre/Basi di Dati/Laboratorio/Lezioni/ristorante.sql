--1--Dato un ingrediente, restituire la categoria di apparteneza
--INPUT: il nome di un ingrediente
--OUTPUT: il nome della categoria di apparteneza

CREATE OR REPLACE FUNCTION get_categoria(varchar(20)) RETURNS varchar(20) AS $$
DECLARE  --devo sempre dichiarare le variabili
cat_ingrediente classificato_in.categoria%TYPE; --mi dice che cat_ingrediente ha lo stesso tipo di categoria in classificato_in

BEGIN
    SELECT categoria INTO cat_ingrediente FROM classificato_in WHERE ingrediente = $1;
    RETURN cat_ingrediente;
END;
$$ language 'plpgsql';


--determinare la categoria dell'ingrediente polpo




--2-- Data una categoria restituire gli ingredienti che vi appartengono
    --INPUT:il nome di una categoria
    --OUTPUT: gli ingredienti di quella categoria
CREATE OR REPLACE FUNCTION get_ingredienti (cat_ingrediente varchar(20)) RETURNS varchar(20) AS $$
DECLARE
    ing_categoria classificato_in.ingrediente%TYPE;

BEGIN
    SELECT ingrediente INTO ing_categoria FROM classificato_in WHERE categoria = lower(trim(cat_ingrediente));
END;
$$ language 'plpgsql';

--uso funzioni
    SELECT * FROM get_ingredienti('verdura');

--eliminare funzione 
    DROP FUNCTION get_ingredienti(varchar(20));    

    

CREATE OR REPLACE FUNCTION get_ingredienti (cat_ingrediente varchar(20)) RETURNS SETOF varchar(20) AS $$
DECLARE
    ing_categoria classificato_in.ingrediente%TYPE;

BEGIN
    FOR ing_categoria IN SELECT ingrediente  FROM classificato_in WHERE categoria = lower(trim(cat_ingrediente))
    LOOP
        RETURN NEXT ing_categoria;
    END LOOP;

    RETURN;   -- è vuota perchè restituisce al chiamante il contenuto che è stato accumulato all'interno del loop
END;
$$ language 'plpgsql';


--3-- estrarre il nome dei piatti che contengono SOLO prodotti ammissibili per l'intolleranza al glutine
SELECT id
FROM piatto

EXCEPT

SELECT include.piatto
FROM include JOIN prodotto ON include.prodotto = prodotto.id JOIN incompatibile_con ON prodotto.id=incompatibile_con.prodotto
WHERE intolleranza = 'glutine';

    --se volessi però vedere il nome
    SELECT nome
    FROM piatto
    WHERE id IN(
        SELECT id
        FROM piatto

        EXCEPT

        SELECT include.piatto
        FROM include JOIN prodotto ON include.prodotto = prodotto.id JOIN incompatibile_con ON prodotto.id=incompatibile_con.prodotto
        WHERE intolleranza = 'glutine'
    );

    --oppure
    SELECT nome
    FROM piatto
    WHERE id NOT IN(
        SELECT include.piatto
        FROM piatto

        EXCEPT

        SELECT include.piatto
        FROM include JOIN prodotto ON include.prodotto = prodotto.id JOIN incompatibile_con ON prodotto.id=incompatibile_con.prodotto
        WHERE intolleranza = 'glutine'
    );

    ----FUNZIONE----

    CREATE OR REPLACE FUNCTION get_piatti_ok_intolleranza(varchar(30)) RETURNS SETOF varchar(50) AS $$
    DECLARE  

    BEGIN
        FOR ____ IN SELECT nome FROM piatto WHERE id NOT IN (SELECT
        )
        loop
    END;
    $$ language 'plpgsql';



--4--