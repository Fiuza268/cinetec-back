CREATE DATABASE cinetec;

CREATE TABLE tbl_usuario (
	id_usuario VARCHAR (20) NOT NULL, 
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(40) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    tipo_usuario ENUM('Administrador', 'Comum')
);

INSERT INTO tbl_usuario(nome, email, senha, tipo_usuario, id_usuario)	
	  VALUES("Vinicius", "fiuzavinicius268@gmail.com", "aprovado", "Comum", 1);

CREATE TABLE tab_diretor (
	id_diretor INT PRIMARY KEY AUTO_INCREMENT,
    nome_diretor VARCHAR(45) NOT NULL,
    nacionalidade VARCHAR(20) NOT NULL,
    dt_nasc DATE NOT NULL,
    genero  VARCHAR(1) NOT NULL
);

DESC tab_diretor;

CREATE TABLE LOGIN (
	id_usu INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE tab_genero (
	id_genero INT PRIMARY KEY AUTO_INCREMENT,
    genero VARCHAR(45) NOT NULL
);
DESC tab_genero; 

CREATE TABLE tab_film (
	id_film INT PRIMARY KEY AUTO_INCREMENT,
    nome_film_PT VARCHAR(45) NOT NULL,
    ano_lancamento INT(4) NOT NULL,
    duracao INT(4) NOT NULL,
    FK_id_genero INT,
    FK_id_diretor INT,
    FOREIGN KEY (FK_id_genero) REFERENCES tab_genero (id_genero),
    FOREIGN KEY (FK_id_diretor) REFERENCES tab_diretor (id_diretor)
);
DESC tab_film; 

DESC tab_ator; 

CREATE TABLE tab_filme_has_tab_ator (
	 FK_id_ator INT,
     FK_id_filme INT,
	 FOREIGN KEY (FK_id_ator) REFERENCES tab_ator (id_ator),
     FOREIGN KEY (FK_id_filme) REFERENCES tab_film (id_film),
     PRIMARY KEY (FK_id_ator, FK_id_filme)
     
);
 DESC tab_filme_has_tab_ator;

ALTER TABLE tab_usuario DROP nome;
ALTER TABLE tab_usuario MODIFY senha VARCHAR(15);

ALTER TABLE tab_diretor ADD sexo varchar (45);
ALTER TABLE tab_film CHANGE nome_film_PT nome_filme VARCHAR (45) NOT NULL;
ALTER TABLE tab_filme_has_tab_ator RENAME filme_e_ator;

ALTER TABLE tab_diretor DROP genero;
UPDATE tab_diretor SET sexo = "M";
 
INSERT INTO tab_ator(nome_ator, sexo, data_nasc)	
    VALUES("Andrew Garfield", "M", "1983-08-20"),
			("Sandra Bullock", "F", "1964-06-26"),
			("Will Smith", "M", "1968-09-25"),
			("Harrison Ford", "M", "1942-07-13"),
			("Hugh Jackman" ,"M" , "1968-10-12"),
			("Angelina Jolie" ,"F", "1975-06-04"),
			("Keanu Reeves", "M", "1964-09-02"),
			("Jennifer Lawrence", "F", "1990-08-15"),
			("Sylvester Stallone", "M", "1946-07-06"),
			("James Mcavoy", "M", "1979-04-21"),
			("Brad Pitt", "M", "1963-12-18"),
			("Leonardo Dicaprio", "M", "1974-11-11"),
			("Vin Diesel", "M", "1967-07-18"),
			("Johnny Depp", "M", "1963-06-09"),
			("Robin Williams" ,"M" ,"1951-07-21"),
			("Robert Downey Jr.","M" ,"1965-04-04"),
			("Patrick Stewart", "M" ,"1940-07-13"),
			("Sandra Bullock", "F", "1964-07-26"),
			("Jackie Chan","M","1954-04-07"),
			("Jennifer Aniston","F","1969-02-11"),
			("Jim Carrey","F","1962-01-17"),
			("Scarlett Johansson","F","1984-11-22"),
			("Megan Fox","F","1986-05-16"),
			("Ben Stiller","F","1965-11-30"),
			("Emma Stone","F","1988-11-06"),
			("Wesley Snipes","M","1962-06-31"),
			("Wagner Moura","M","1976-06-27");

INSERT INTO tab_diretor(nome_diretor, nacionalidade, dt_nasc, sexo)	
			VALUES("Steven Spielberg","Estados Unidos","1946-12-18","M"),
			("James Cameron","Canada","1954-08-16","M"),
			("José Padilha","Brasil","1967-08-01","M"),
			("George Lucas","Estados Unidos","1944-05-14","M"),
			("Alan Rickman","Inglaterra","1946-02-21","M"),
			("Fernando Meirelles","Brasil","1965-11-09","M");

INSERT INTO tab_genero(genero)	
			VALUES("Terror"),
			("Ação"),
			("Comedia"),
			("Drama"),
			("Suspense"),
			("Ficção"),
			("Romance"),
			("Animação");

INSERT INTO tab_film(nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor)	
			VALUES("Viva: A Vida é Uma Festa","2017","105","8","5"),
			("Logan","2017","137","2","1"),
			("Um Sonho de Liberdade","1995","142","4","5"),
			("Matrix","1999","150","6","1"),
			("Jumanji","1996","104","3","6"),
			("Cidade de Deus","2002","135","2","3"),
			("O Resgate do Soldado Ryan","1998","170","2","6"),
			("Extraordinário","	2017","113","4","5"),
			("O Poderoso Chefão","1972","178","2","2"),
			("Forrest Gump","1994","142","7","1"),
			("Truque de Mestre","2013","125","2","4"),
			("Fragmentado","2017","117","4","6"),
			("Avatar","2009","162","6","2"),
			("O Preço do Amanhã","2011","109","2","3"),
			("O Senhor dos Anéis: O Retorno do Rei","2003","200","6","5"),
			("Toy Story","1995","141","8","2"),
			("Star Wars: Os Últimos Jedi","2017","152","6","4"),
			("O Menino do Pijama Listrado","2008","94","4","1"),
			("O Lobo de Wall Street","2013","181","4","6"),
			("A Hora do Rush","1998","98","3","5"),
			("Piratas do Caribe - Maldição do Perola Negra","2003","143","2","4"),
			("Passengeiros","2016","116","2","1"),
			("Beleza Oculta","2016","97","4","2"),
			("It - A Coisa","2017","134","1","3"),
			("Rocky V","1990","111","4","4"),
			("Titanic","1997","195","7","4"),
			("Vingadores 4","2019","150","2","2"),
			("Velozes e Furiosos 8","2017","136","2","6"),
			("Transformers","2007","150","2","4"),
			("Ilha do Medo","2010","139","5","1");