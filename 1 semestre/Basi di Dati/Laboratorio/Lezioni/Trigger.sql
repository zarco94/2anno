--1-- scrivere un trigger per fare in modo che l'inserimento di un nuovo prodotto nella preparazione di un piatto produca un aggiornamento del costo del piatto

----------ESEMPIO GENERICO-----------------------------------------
    CREATE TRIGGER aggiorna_costo BEFORE|AFTER <EVENTO> ON <tabella>
    FOR each ROW|STATEMENT EXECUTE PROCEDURE calcola_new_costo();
-------------------------------------------------------------------

CREATE TRIGGER aggiorna_costo AFTER INSERT OR UPDATE ON include
FOR each ROW EXECUTE PROCEDURE calcola_new_costo();

--esempio di INSERT:
    INSERT INTO include VALUES(8,4);

/* se metto BEFORE:
    dbms riceve l'istruzione
    prima di eseguire l'inserimento viene eseguita calcola_new_costo
    al termine dell'esecuzione il dbms esegue l'inserimento
    */

/* se metto AFTER
    il dbms riceve l'istruzione
    il dbms esegue l'inserimento                ==> mettiamo after perchè
    viene eseguita calcola_new_costo
    */

--- ROW e STATEMENT è indifferente

-- calcola_new_costo va creata
CREATE OR REPLACE FUNCTION calcola_new_costo() RETURNS TRIGGER AS $$     -- è una funzione invocabile solo dal trigger, e non dall'utente
DECLARE
    nome_piatto piatto.nome%TYPE;
BEGIN
    SELECT nome INTO nome_piatto FROM piatto WHERE piatto.id = NEW.piatto;
    PERFORM * FROM piatto_costo(nome_piatto);            -- l'oggetto NEW è la tupla attualmente in fase di inserimento

    RETURN NEW;   --è come se la function del trigger fosse una scatola messa prima della scrittura, il trigger controlla l'oggetto NEW prima della scrittura quindi deve restituire di nuovo l'oggetto NEW -> se il trigger lo cambia verrà scritto come il trigger lo ha modificato (questo se siamo in BEFORE), in AFTER posso anche distruggerlo -> RETurn NULL -> tanto l'oggetto NEW verrà comunque distrutto         
END
$$ language 'plpgsql'



--2-- scrivere un trigger che esegue il ricalcolo del costo di un piatto quando cambia il costo di un prodotto che compone quel piatto

CREATE OR replace function ricalcola_costo() RETURNS trigger AS $$
DECLARE
    nome_piatto piatto.nome%TYPE;
BEGIN
    select piatto.nome into nome_piatto from fornisce inner join prodotto on fornisce.prodotto=prodotto.id inner join include on prodotto.id=include.prodotto inner join piatto on include.piatto=piatto.id WHERE fornisce.prodotto = NEW.prodotto
    perfrom * from piatto_costo(nome_piatto);
END
$$ language 'plpgsql'

CREATE TRIGGER aggiorna_prezzi AFTER INSERT OR UPDATE ON fornisce
FOR EACH ROW|STATEMENT EXECUTE PROCEDURE ricalcola_costo();

    update fornisce set costo_u=0.2 WHERE prodotto =5; 


