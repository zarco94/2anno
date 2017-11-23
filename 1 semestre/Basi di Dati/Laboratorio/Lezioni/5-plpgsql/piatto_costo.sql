-- piatto_costo
-- Dato un piatto calcola il costo complessivo della sua realizzazione e lo memorizza nell'attributo piatto.costo (da creare)
-- input: l'id di un piatto  
-- output: --
ALTER TABLE piatto ADD COLUMN costo NUMERIC(6,2);

CREATE OR REPLACE FUNCTION piatto_costo(mio_piatto integer) RETURNS VOID AS $$
    DECLARE 
        c piatto.costo%TYPE;
        i prodotto.ingrediente%TYPE;
        cu fornisce.costo_u%TYPE;
        r piatto.ricetta%TYPE;
        q composta_da.quantita%TYPE;
    BEGIN
    c := 0;
    
	FOR i, cu, r IN SELECT prodotto.ingrediente, costo_u, ricetta FROM piatto INNER JOIN include ON piatto.id=include.piatto INNER JOIN prodotto ON include.prodotto=prodotto.id INNER JOIN fornisce ON prodotto.id=fornisce.prodotto WHERE piatto = mio_piatto 
	LOOP
		SELECT quantita INTO q FROM composta_da WHERE ingrediente=i AND ricetta=r;
		IF FOUND THEN
			c := c + q * cu;
		END IF;
    END LOOP;
    UPDATE piatto SET costo = c WHERE id = mio_piatto;
    RETURN;
    END;
$$ LANGUAGE plpgsql;

SELECT * FROM piatto_costo(6);