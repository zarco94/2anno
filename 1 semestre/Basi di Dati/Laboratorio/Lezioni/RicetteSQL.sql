CREATE TABLE ricetta(
id serial PRIMARY KEY,
titolo varchar(50)  NOT NULL UNIQUE,
tempo integer
);



//vincoli
PRIMARY KEY
UNIQUE                      /* utile quando l''attributo è denotativo(dal nome riconosco per forza quel piatto)      */ 
NOT NULL
DEFAULT



DROP TABLE ricetta;  /*cancella la tabella ricetta                                                                  */              



ALTER TABLE piatto ADD CONSTRAINT
"chiave esterna_ricetta" FOREING KEY(ricetta)
/*Serve se voglio aggiungere successivamente il vincolo di chiave esterna alla tabella ricetta                      */


ALTER TABLE piatto DROP COSTRAINT 
"piatto_ricetta_fkey";
/* cancella il vincolo piatto_ricetta_fkey--------il nome del vincolo lo ottengo con la describe (/d)               */



CREATE TABLE piatto(
id serial PRIMARY KEY,
nome varchar(50) NOT NULL UNIQUE,
ricetta integer NOT NULL REFERENCES ricetta(id) ON UPDATE CASCADE ON DELETE NO ACTION
);
    
//piatto.ricetta deve avere lo stesso tipo di dato di ricetta.id perchè è chiave esterna => piatto.ricetta è di tipop integer essendo ricetta.id è di tipo serial    
//REFERENCES ricetta(id) indica che piatto.ricetta è chiave esterna di ricetta.id



INSERT INTO ricetta(titolo,tempo)
VALUES ('pesto', 20);
INSERT INTO ricetta(titolo,tempo)
VALUES ('arrosto', 50);
INSERT INTO ricetta(titolo,tempo)
VALUES ('tiramisu', 40);
INSERT INTO ricetta(titolo)
VALUES ('branzino');

/*INSERT serve per inserire una tupla nuova,
//se specifico solo uno dei due si setta a NULL
//se inserisco solo il tempo ottengo un errore perchè titolo non può essere NULL                                    */


/*SELECT * FROM ricetta;  interroga la tabella e preleva tutte le tuple e me le fa vedere                           */


INSERT INTO piatto(nome,ricetta)
VALUES ('il pesto montanelli',1);
INSERT INTO piatto(nome,ricetta)
VALUES ('l''arrosto migliore',2);
INSERT INTO piatto(nome,ricetta)
VALUES ('la pasta al basilico verde',1);

/* '' serve per inserire un solo '                                                                                  */



INSERT INTO piatto(nome,ricetta)
VALUES ('lo stinco di maiale',6);

/*mi da errore perchè viokla la chiave esterna*/



DELETE FROM piatto WHERE id=2;

/* mi cancella la tupla di piatto che abbia id=2 (chiave primaria)                                                  */



UPDATE ricetta SET tempo = 40 WHERE id=4;

/*inserisce l''attributo tempo =40 al branzino (che ha id =4)                                                       */ 



select * from piatto
/*restitutisce tutte le tuple contenute in piatto*/



/*RELAZIONALE:    */
menu(id,titolo)
inserito_in(piatto, menu, prezzo_cliente)
utilizza(r_utilizza, r_utilizzata)

CREATE TABLE menu(
id serial PRIMARY KEY,
titolo varchar(100) NOT NULL  UNIQUE
);

CREATE TABLE inserito_in(
piatto  integer REFERENCES piatto(id) ON UPDATE CASCADE ON DELETE CASCADE,           /*ON DELETE CASCADE : elimina il piatto anche dal menu se viene eliminato dal ristorante */
menu integer  REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE,
prezzo_cliente decimal(5,2) NOT NULL,                               /* il numero ha 5 cifre e 2 decimali */
PRIMARY KEY(piatto, menu)                                           /*qundo la chiave primaria è composta da più di 1 attributo     */
);

CREATE TABLE utilizza(
r_utilizza integer REFERENCES ricetta(id) ON UPDATE CASCADE ON DELETE NO ACTION,
r_utilizzata integer REFERENCES ricetta(id) ON UPDATE CASCADE ON DELETE NO ACTION,
PRIMARY KEY(r_utilizza, r_utilizzata)
);



NOT NULL(nome,cognome) /* vuol dire che la coppia non deve essere non nulla */
UNIQUE(nome, cognome) /*  non posso avere 2 Mario Rossi ma due MArio si se non hanno lo s6tesso cognome */



SET search_path TO gabrielezarcone                  /* definisce il percorso predefinito di ricerca -> all' inizio è public*/



DELETE FROM inserito_in WHERE piatto=1 AND menu=1;          /*  */

UPDATE piatto SET id=100 WHERE id=1;                            /* NON ha senso cambiare l'id delle tuple. Se io lo cambio a 100 poi quando incrementando arriverà da solo a 100 si creerà un errore */

-- serve per commentare sulla riga
--modificare la struttura della tabella menu aggiungendo l'attributo data_creazione

ALTER TABLE menu ADD data_creazione date;



--impostare il valore di default di data_creazione alla data corrente

ALTER TABLE menu ALTER COLUMN data_creazione SET DEFAULT CURRENT_DATE;

-- MODIFICARE LA STRUTTURA DELLA TABELLA MENU AGGIUNGENDO L'ATTRIBUTO TITOLO_BREVE CHE HA LA LUNGHEZZA FISSA DI 5 CARATTEWRI
ALTER TABLE menu ADD COLUMN titolo_breve char(5);


INSERT INTO menu(titolo, titolo_breve)
VALUES ('BIS DI PRIMI', 'BIS');

INSERT INTO menu(titolo, titolo_breve)
VALUES ('TRIS DI PRIMI ', 'TRIS ');             -- non mi da problemi di inserimento


SELECT * FROM menu WHERE titolo='TRIS DI PRIMI';            -- L'INSERIMENTO L'HO FATTO con uno spazio alla fine quindi non mi stamperà nessuna riga, li vede come 2 strignhe diverse diverse
-- lo stesso anche per maiuscolo e minuscolo
-- varchar prende solo quello che scriv mentre char autocompleta quella che non è scritto


INSERT INTO menu(titolo, data_creazione)
VALUES ('tutti i primi', '2017-10-31');             -- se specifico il valore il default non viene inserito ma inserisce il mio valore



-creare tabella chef che memorizza nome e cognome di chef 

CREATE TABLE chef(
nome varchar(50) NOT NULL,
cognome varchar(50) NOT NULL,
PRIMARY KEY(nome, cognome)
);


-- creare tabella ristorante che ha come attributo nome e città. Si sappia che non esistono ristoranti con lo stesso nome in città

CREATE TABLE ristorante(
nome varchar(100) NOT NULL,
citta varchar(100) NOT NULL,
PRIMARY KEY(nome, citta)
);


-- CIASCUNO CHEF lavora in uno e un solo ristorante. si definisca ilò vincolo di chiave esterna
-- la metto su chef perchè per un ristorante possono lavorare più chef, mentre uno chef può lavorare in un solo ristorante
ALTER TABLE chef ADD COLUMN r_nome varchar(100) NOT NULL;                            -- NB varchar deve essere uguale del varchar del nome del ristornate altrimenti ho problemi se ho nomi troppo lunghi o corti
ALTER TABLE chef ADD COLUMN r_citta varchar(100) NOT NULL; 


/*ORA CREO LA CHIAVE ESTRERNA SU 2 ELEMENTI. ayttenzione all'ordine dei due elementi'*/
ALTER TABLE chef ADD CONSTRAINT
"chef_fkey" FOREIGN KEY (r_nome, r_citta) 
REFERENCES ristorante(nome, citta) ON UPDATE CASCADE ON DELETE NO ACTION;


-- posso aggiungere  gli chef che non lavorano in nessun riwstorante
ALTER TABLE chef ALTER COLUMN r_nome DROP NOT NULL;

ALTER TABLE chef ALTER COLUMN r_citta DROP NOT NULL;

--se però adesso inserisco un ristorante con solo il nome  e non la città me lo fa inserire, ma non è un achiave esterna


-------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--creare tabella ingrediente con attributi (nome,stagione) dove nome è varchar e stagione è uno dei seguenti valori: estate, autunno, inverno , primavera
-- CHECK controlla che i valori siano ugauli a uno di quelli successivi a CHECk

CREATE TABLE ingrediente(
nome varchar(20) PRIMARY KEY,
stagione varchar(9) CHECK(stagione IN ('estate', 'autunno', 'inverno', 'primavera'))
);

--posso creare anche un dominio e usare direttamente quello
CREATE DOMAIN stagioni_possibili AS varchar(9) CHECK(VALUE IN ('estate', 'autunno', 'inverno', 'primavera'));

ALTER TABLE ingrediente ALTER COLUMN stagione TYPE stagioni_possibili;








































































































