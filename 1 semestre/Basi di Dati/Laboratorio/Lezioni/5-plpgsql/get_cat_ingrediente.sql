-- get_cat_ingrediente
-- Dato un ingrediente restituisce la categoria di appartenenza
-- input: un nome di ingrediente
-- output: la categoria di appartenenza dell'ingrediente
CREATE OR REPLACE FUNCTION get_cat_ingrediente (varchar(20)) RETURNS varchar(20) AS $$
    DECLARE
        categoria_ingrediente classificato_in.categoria%TYPE;
    BEGIN
        SELECT categoria INTO categoria_ingrediente FROM classificato_in WHERE trim(lower(ingrediente)) = trim(lower($1));
        RETURN categoria_ingrediente;
    END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_cat_ingrediente('tonno');