SELECT categoria
FROM classificato_in
WHERE ingrediente ='polpo';



CREATE OR REPLACE FUNCTION get_categoria(varchar(20)) 
RETURNS varchar(20) AS $$
DECLARE
cat_ingrediente classificato_in.categoria%TYPE;

BEGIN

SELECT categoria INTO cat_ingrediente
FROM classificato_in
WHERE ingrediente =$1;

RETURN cat_ingrediente;
END;
$$ language 'plpgsql'

SELECT * 
FROM get_categoria('basilico');

DROP FUNCTION get_categoria(varchar(20));


CREATE OR REPLACE FUNCTION get_ingredienti(cat_ingrediente varchar(20))
RETURNS SETOF varchar(20) AS $$

DECLARE
ing_categoria classificato_in.ingrediente%TYPE;

BEGIN

FOR ing_categoria IN
SELECT ingrediente
FROM classificato_in 
WHERE lower(trim(categoria))=lower(trim(cat_ingrediente))
LOOP
	RETURN NEXT ing_categoria;
END LOOP;

RETURN;

END;
$$ language 'plpgsql';

SELEZIONE INTOLLERANZA----------------------------------------------------

SELECT nome 
FROM piatto
WHERE id NOT IN (
		SELECT include.piatto
		FROM  prodotto INNER JOIN include ON prodotto.id=include.prodotto INNER JOIN incompatibile_con ON prodotto.id=incompatibile_con.prodotto INNER JOIN piatto ON include.piatto=piatto.id
		WHERE intolleranza='glutine'
);

FUNZIONE INTOLLERANZA-----------------------------------------------------

CREATE OR REPLACE FUNCTION get_piatti_ok_intolleranza(varchar(30))
RETURNS SETOF varchar(50) AS $$

DECLARE
piatto_nome piatto.nome%TYPE;
BEGIN

FOR	piatto_nome IN 
SELECT nome 
FROM piatto
WHERE id NOT IN (
		SELECT include.piatto
		FROM  prodotto INNER JOIN include ON prodotto.id=include.prodotto INNER JOIN incompatibile_con ON prodotto.id=incompatibile_con.prodotto INNER JOIN piatto ON include.piatto=piatto.id
		WHERE intolleranza=$1)
LOOP
	RETURN NEXT piatto_nome;
END LOOP;

RETURN;

END;

$$ language 'plpgsql';



DATO IL NOME DI UN PIATTO CALCOLA IL COSTO COMPLESSIVO DELLA SUA PREPARAZIONE-----------------------

piatto(id, nome,ricetta)
composta_da(ricetta,ingrediente,qta)
prodotto(id,ingrediente)
fornisce(prodotto,costo_u)

CREATE OR REPLACE FUNCTION piatto_costo(varchar(50)) 
RETURNS VOID AS $$
DECLARE
	p_costo decimal(5,2);
	nome_ingrediente composta_da.ingrediente%TYPE;
	q_ingrediente composta_da.quantita%TYPE;
	c_prodotto fornisce.costo_u%TYPE;
	
BEGIN
	p_costo=0;
	FOR nome_ingrediente, q_ingrediente IN 
		SELECT composta_da.ingrediente, quantita
		FROM piatto INNER JOIN ricetta ON piatto.ricetta=ricetta.id 
		INNER JOIN composta_da ON ricetta.id=composta_da.ricetta
		WHERE piatto.nome=$1
	LOOP
		SELECT costo_u INTO c_prodotto
		FROM prodotto
		INNER join fornisce ON prodotto.id =fornisce.prodotto 
		WHERE prodotto.ingrediente=nome_ingrediente;
		
		p_costo = p_costo + (q_ingrediente * c_prodotto);
	END LOOP;
	
	UPDATE piatto SET costo=p_costo WHERE nome=$1;
	
	RETURN;
END;

$$ language 'plpgsql';