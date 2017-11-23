-- get_all_ingredienti
-- Data una categoria restituisce tutti gli ingredienti che vi appartengono
-- input: un nome di categoria
-- output: gli ingredienti di quella categoria
CREATE OR REPLACE FUNCTION get_all_ingredienti (varchar(20)) RETURNS SETOF varchar(20) AS $$
    DECLARE
        ingrediente_categoria classificato_in.ingrediente%TYPE;
    BEGIN
        FOR ingrediente_categoria IN SELECT ingrediente FROM classificato_in WHERE trim(lower(categoria)) = trim(lower($1))
        LOOP
            RETURN NEXT ingrediente_categoria;
        END LOOP;
        RETURN;
    END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_all_ingredienti('Verdura');