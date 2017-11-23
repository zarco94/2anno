CREATE TABLE IMMOBILE(
    codice serial PRIMARY KEY,
    descrizione varchar(100) NOT NULL,
    ubicazione varchar(100) NOT NULL,
    superfice decimal(7,2) NOT NULL,
    pertinenza integer REFERENCES immobile(codice) -- così non funziona dato che si riferisce a  sestesso e non troverebbe l'attributo
);
-- quindi uso un ALTER dopo aver creato la tabella

CREATE TABLE IMMOBILE(
    codice serial PRIMARY KEY,
    descrizione varchar(100) NOT NULL,
    ubicazione varchar(100) NOT NULL,
    superfice decimal(7,2) NOT NULL,
    pertinenza integer 
);


ALTER TABLE immobile ADD COSTRAINT "immobile_fk"
FOREIGN KEY (pertinenza) REFERENCES immobile(codice) ON UPDATE CASCADE ON DELETE CASCADE;