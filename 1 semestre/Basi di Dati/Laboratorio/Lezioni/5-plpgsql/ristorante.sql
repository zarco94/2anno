--SCHEMA RISTORANTE (alcuni vincoli NOT NULL sono stati ridefiniti)
--RICETTA (id, titolo, tempo)
--UTILIZZA (r_utilizza, r_e_utilizzata)
--PIATTO (id, nome, ricetta)
--MENU (id, titolo)
--INSERITO_IN (piatto, menu, prezzo_cliente)
--INGREDIENTE (nome, stagione*)
--CATEGORIA (nome, sopra_categoria*)
--CLASSIFICATO_IN (ingrediente, categoria)
--COMPOSTA_DA (ricetta, ingrediente, quantita, u_misura)
--PRODOTTO (id, marca, qnt_disp, prezzo_aggiunta, scadenza, paese_prov,  certificato, soglia_riordino, ingrediente)
--INCLUDE (piatto, prodotto)
--FORNITORE (cod_fisc, nominativo, indirizzo, cap, citta, telefono, piva, consegne_da_ora, consegne_a_ora)
--FORNISCE (prodotto, fornitore, data_f, quantita, costo_u)
--INTOLLERANZA (nome)
--INCOMPATIBILE_CON (prodotto, intolleranza) 

-- *
CREATE TABLE ricetta (
	id serial PRIMARY KEY,
	titolo VARCHAR(50) UNIQUE NOT NULL,
	tempo INTEGER NOT NULL
);

INSERT INTO ricetta(titolo, tempo) VALUES ('Cavolfiore al forno', 25);
INSERT INTO ricetta(titolo, tempo) VALUES ('Polpa di riccio', 30);
INSERT INTO ricetta(titolo, tempo) VALUES ('Sugo panna e prosciutto', 15);
INSERT INTO ricetta(titolo, tempo) VALUES ('Sugo vegetariano', 30);
INSERT INTO ricetta(titolo, tempo) VALUES ('Pesto di basilico', 35);
INSERT INTO ricetta(titolo, tempo) VALUES ('Cavolfiore bollito', 30);
INSERT INTO ricetta(titolo, tempo) VALUES ('Sugo alla carlofortina', 25);
INSERT INTO ricetta(titolo, tempo) VALUES ('Polpo al vapore', 25);
INSERT INTO ricetta(titolo, tempo) VALUES ('Insalata di polpo', 15);

-- *
CREATE TABLE utilizza (
	r_utilizza INTEGER NOT NULL REFERENCES ricetta(id) ON UPDATE CASCADE ON DELETE CASCADE,
	r_utilizzata INTEGER NOT NULL REFERENCES ricetta(id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (r_utilizza, r_utilizzata)
);

INSERT INTO utilizza VALUES (7,5);
INSERT INTO utilizza VALUES (9,8);

-- *
CREATE TABLE piatto (
	id serial PRIMARY KEY,
	nome VARCHAR(50) UNIQUE NOT NULL, 
	ricetta INTEGER NOT NULL REFERENCES ricetta(id) ON UPDATE CASCADE ON DELETE NO ACTION
);

INSERT INTO piatto(nome, ricetta) VALUES ('Pasta e cavolfiore al forno', 1);
INSERT INTO piatto(nome, ricetta) VALUES ('Pasta con polpa di riccio', 2);
INSERT INTO piatto(nome, ricetta) VALUES ('Penne al baffo', 3);
INSERT INTO piatto(nome, ricetta) VALUES ('Fusilli panna e prosciutto', 3); 
INSERT INTO piatto(nome, ricetta) VALUES ('Lasagne vegetariane', 4);
INSERT INTO piatto(nome, ricetta) VALUES ('Trofie al pesto', 5);
INSERT INTO piatto(nome, ricetta) VALUES ('Trofie alla genovese', 5);
INSERT INTO piatto(nome, ricetta) VALUES ('Penne alla carlofortina', 7);
INSERT INTO piatto(nome, ricetta) VALUES ('Antipasto di polpo', 9);

-- *
CREATE TABLE menu (
	id serial PRIMARY KEY,
	titolo VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO menu(titolo) VALUES ('Bis di primi');  
INSERT INTO menu(titolo) VALUES ('Tris di primi');  
INSERT INTO menu(titolo) VALUES ('Tutti i primi');

CREATE TABLE inserito_in (
	menu INTEGER NOT NULL REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE,
	piatto INTEGER NOT NULL REFERENCES piatto(id) ON UPDATE CASCADE ON DELETE CASCADE,
	prezzo_cliente NUMERIC(6,2) NOT NULL,
	PRIMARY KEY (piatto,menu)
);

INSERT INTO inserito_in VALUES (1,1,10);
INSERT INTO inserito_in VALUES (1,4,7.5);
INSERT INTO inserito_in VALUES (2,1,5);
INSERT INTO inserito_in VALUES (2,2,5.5);
INSERT INTO inserito_in VALUES (2,3,5);
INSERT INTO inserito_in VALUES (3,3,7.5);
INSERT INTO inserito_in VALUES (3,4,9.5);
INSERT INTO inserito_in VALUES (3,5,8.5);
INSERT INTO inserito_in VALUES (3,6,5);
INSERT INTO inserito_in VALUES (3,7,5);

-- *
CREATE DOMAIN dom_stagione AS VARCHAR(9) CHECK (VALUE IN ('estate','autunno','inverno','primavera'));CREATE TABLE ingrediente (
	nome VARCHAR(20) PRIMARY KEY,
	stagione dom_stagione
);

INSERT INTO ingrediente VALUES ('basilico','estate');
INSERT INTO ingrediente(nome) VALUES ('tonno');
INSERT INTO ingrediente(nome) VALUES ('cavolfiore');
INSERT INTO ingrediente(nome) VALUES ('polpo');
INSERT INTO ingrediente(nome) VALUES ('pasta di grano duro');
INSERT INTO ingrediente(nome) VALUES ('sugo di pomodoro');
INSERT INTO ingrediente(nome) VALUES ('fagiolini');
INSERT INTO ingrediente(nome) VALUES ('patate');
INSERT INTO ingrediente(nome) VALUES ('prezzemolo');
INSERT INTO ingrediente(nome) VALUES ('pinoli');
INSERT INTO ingrediente(nome) VALUES ('besciamella');
INSERT INTO ingrediente(nome) VALUES ('olio');
INSERT INTO ingrediente(nome) VALUES ('sale');

-- *
CREATE TABLE categoria (
	nome VARCHAR(20) PRIMARY KEY,
	sopra_categoria VARCHAR(20)
);
-- la creazione del vincolo di chiave esterna deve sempre avvenire mediante successivo comando ALTER in caso di associazioni ricorsive (l'attributo referenziato ancora non esiste quando si esegue la CREATE TABLE)
ALTER TABLE categoria ADD CONSTRAINT fk_categoria_categoria FOREIGN KEY (sopra_categoria) REFERENCES categoria(nome) ON UPDATE CASCADE ON DELETE NO ACTION;

INSERT INTO categoria(nome) VALUES ('Derivati farina');
INSERT INTO categoria(nome) VALUES ('Condimenti');
INSERT INTO categoria(nome) VALUES ('Salse');
INSERT INTO categoria(nome) VALUES ('Verdura');
INSERT INTO categoria(nome) VALUES ('Frutta');
INSERT INTO categoria(nome) VALUES ('Carne');
INSERT INTO categoria(nome) VALUES ('Pesce');
INSERT INTO categoria(nome,sopra_categoria) VALUES ('Molluschi','Pesce');
INSERT INTO categoria(nome,sopra_categoria) VALUES ('Crostacei','Pesce');
INSERT INTO categoria(nome,sopra_categoria) VALUES ('Pesci bianchi','Pesce');
INSERT INTO categoria(nome,sopra_categoria) VALUES ('Gamberi','Crostacei');
INSERT INTO categoria(nome,sopra_categoria) VALUES ('Scampi','Crostacei');
INSERT INTO categoria(nome,sopra_categoria) VALUES ('Astici','Crostacei');
INSERT INTO categoria(nome,sopra_categoria) VALUES ('Mazzancolle','Gamberi');

-- *
CREATE TABLE classificato_in (
	ingrediente VARCHAR(20) NOT NULL REFERENCES ingrediente(nome) ON UPDATE CASCADE ON DELETE CASCADE,
	categoria VARCHAR(20) NOT NULL REFERENCES categoria(nome) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(ingrediente,categoria)
);

INSERT INTO classificato_in VALUES ('basilico','Verdura');
INSERT INTO classificato_in VALUES ('tonno','Pesce');
INSERT INTO classificato_in VALUES ('cavolfiore','Verdura');
INSERT INTO classificato_in VALUES ('polpo','Molluschi');
INSERT INTO classificato_in VALUES ('pasta di grano duro','Derivati farina');
INSERT INTO classificato_in VALUES ('fagiolini','Verdura');
INSERT INTO classificato_in VALUES ('patate','Verdura');
INSERT INTO classificato_in VALUES ('prezzemolo','Verdura');
INSERT INTO classificato_in VALUES ('pinoli','Frutta');
INSERT INTO classificato_in VALUES ('besciamella','Salse');
INSERT INTO classificato_in VALUES ('sugo di pomodoro','Salse');
INSERT INTO classificato_in VALUES ('olio','Condimenti');
INSERT INTO classificato_in VALUES ('sale','Condimenti');

-- *
CREATE TABLE composta_da (
	ricetta INTEGER NOT NULL REFERENCES ricetta(id) ON UPDATE CASCADE ON DELETE CASCADE,
	ingrediente VARCHAR(20) NOT NULL REFERENCES ingrediente(nome) ON UPDATE CASCADE ON DELETE CASCADE,
	quantita DECIMAL(6,2) NOT NULL,
	u_misura VARCHAR(20) NOT NULL,
	PRIMARY KEY(ricetta,ingrediente)
);

INSERT INTO composta_da VALUES (5,'basilico',500,'grammi');
INSERT INTO composta_da VALUES (5,'pasta di grano duro',200,'grammi');
INSERT INTO composta_da VALUES (7,'sugo di pomodoro',300,'grammi');
INSERT INTO composta_da VALUES (7,'tonno',200,'grammi');
INSERT INTO composta_da VALUES (7,'basilico',500,'grammi');
INSERT INTO composta_da VALUES (7,'olio',3,'cucchiai');
INSERT INTO composta_da VALUES (7,'sale',1,'pizzico');
INSERT INTO composta_da VALUES (9,'polpo',400,'grammi');
INSERT INTO composta_da VALUES (9,'patate',400,'grammi');
INSERT INTO composta_da VALUES (9,'prezzemolo',100,'grammi');
INSERT INTO composta_da VALUES (9,'olio',8,'cucchiai');
INSERT INTO composta_da VALUES (9,'sale',1,'pizzico');

-- *
CREATE DOMAIN dom_certificato AS VARCHAR(3) CHECK (VALUE IN ('DOC','IGP','DOP','IGT'));

CREATE TABLE prodotto (
	id serial PRIMARY KEY,
	marca VARCHAR(20) NOT NULL,
	qnt_disp DECIMAL(6,2) NOT NULL,
	prezzo_aggiunta DECIMAL(5,2) NOT NULL,
	scadenza DATE NOT NULL DEFAULT (CURRENT_DATE+30) CHECK (scadenza > CURRENT_DATE),
	paese_prov VARCHAR(20) NOT NULL DEFAULT 'Italia',
	certificato dom_certificato,
	soglia_riordino DECIMAL(6,2) NOT NULL DEFAULT 10,
	ingrediente VARCHAR(20) NOT NULL REFERENCES ingrediente(nome) ON UPDATE CASCADE ON DELETE NO ACTION
);

INSERT INTO prodotto(marca,qnt_disp,prezzo_aggiunta,ingrediente) VALUES ('star',10,1,'basilico');
INSERT INTO prodotto(marca,qnt_disp,prezzo_aggiunta,ingrediente) VALUES ('riomare',50,2,'tonno'); INSERT INTO prodotto(marca,qnt_disp,prezzo_aggiunta,ingrediente) VALUES ('vdo',50,2,'cavolfiore');
INSERT INTO prodotto(marca,qnt_disp,prezzo_aggiunta,ingrediente) VALUES ('mareblu',30,2,'tonno'); 
INSERT INTO prodotto(marca,qnt_disp,prezzo_aggiunta,ingrediente) VALUES ('barilla',100,0.5,'pasta di grano duro'); 

-- *
CREATE TABLE include (
	piatto INTEGER NOT NULL REFERENCES piatto(id) ON UPDATE CASCADE ON DELETE NO ACTION,
	prodotto INTEGER NOT NULL REFERENCES prodotto(id) ON UPDATE CASCADE ON DELETE NO ACTION,
	PRIMARY KEY(piatto,prodotto)
);

INSERT INTO include VALUES (6,1);
INSERT INTO include VALUES (7,1);
INSERT INTO include VALUES (8,2);
INSERT INTO include VALUES (1,3);
INSERT INTO include VALUES (1,5);
INSERT INTO include VALUES (2,5);
INSERT INTO include VALUES (3,5);
INSERT INTO include VALUES (4,5);
INSERT INTO include VALUES (6,5);
INSERT INTO include VALUES (7,5);
INSERT INTO include VALUES (8,5);

-- *
CREATE TABLE fornitore (
	cod_fisc CHAR(16) PRIMARY KEY,
	nominativo VARCHAR(100) UNIQUE NOT NULL,
	indirizzo VARCHAR(50) NOT NULL,
	cap CHAR(5) NOT NULL,
	citta VARCHAR(50) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	piva CHAR(11) NOT NULL,
	consegne_da_ora TIME NOT NULL DEFAULT '08:00',
	consegne_a_ora TIME NOT NULL DEFAULT '10:00'
);

INSERT INTO fornitore(cod_fisc,nominativo,indirizzo,cap,citta,telefono,piva) VALUES ('ABCDEF65E14A745U','ALLIN distribuzioni','Corso Impero','20135','Milano','+39 028392993','83742618221');

-- *
	CREATE TABLE fornisce(
		prodotto INTEGER NOT NULL REFERENCES prodotto(id) ON UPDATE CASCADE ON DELETE NO ACTION,
		fornitore CHAR(16) NOT NULL REFERENCES fornitore(cod_fisc) ON UPDATE CASCADE ON DELETE NO ACTION,
		data_f DATE NOT NULL DEFAULT CURRENT_DATE,
		costo_u DECIMAL(6,2) NOT NULL,
		PRIMARY KEY(prodotto,fornitore)
	);
	
	INSERT INTO fornisce(prodotto,fornitore,costo_u) VALUES (1,'ABCDEF65E14A745U',0.5);
	INSERT INTO fornisce(prodotto,fornitore,costo_u) VALUES (2,'ABCDEF65E14A745U',2);
	INSERT INTO fornisce(prodotto,fornitore,costo_u) VALUES (3,'ABCDEF65E14A745U',0.6);
	INSERT INTO fornisce(prodotto,fornitore,costo_u) VALUES (4,'ABCDEF65E14A745U',2);
	INSERT INTO fornisce(prodotto,fornitore,costo_u) VALUES (5,'ABCDEF65E14A745U',0.4);

-- *
CREATE TABLE intolleranza (
	nome VARCHAR(30) PRIMARY KEY
);

INSERT INTO intolleranza VALUES ('glutine');

-- *
CREATE TABLE incompatibile_con (
	prodotto INTEGER NOT NULL REFERENCES prodotto(id) ON UPDATE CASCADE ON DELETE CASCADE,
	intolleranza VARCHAR(30) NOT NULL REFERENCES intolleranza(nome) ON UPDATE CASCADE ON DELETE NO ACTION,
	PRIMARY KEY(prodotto,intolleranza)
);

INSERT INTO incompatibile_con VALUES (5,'glutine');