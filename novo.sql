create database revisao character set = utf8;
use revisao;
/* Não deixar nada por padrão sempre colocar */
create table tblproprietario(
	strNome varchar(50) not null,
	strCpf char(11)  not null unique,
	dateNasc date not null, 
	pkProprietario integer not null primary key auto_increment,
	strObservacao varchar(200) null DEFAULT NULL
	) ENGINE innoDB character set = utf8;

CREATE TABLE tblpet(
	pkPet INTEGER NOT NULL PRIMARY KEY auto_increment,
	strRga varchar(10) NULL UNIQUE DEFAULT NULL,
	strNome varchar(100) NOT NULL 
) ENGINE innoDB character set = utf8;


CREATE TABLE relproprietario(
	pkProprietarioPet INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	fkProprietario INTEGER NOT NULL,
	fkPet INTEGER NOT NULL,
	FOREIGN KEY (fkProprietario) REFERENCES tblproprietario(pkProprietario),
	FOREIGN KEY (fkPet) REFERENCES tblpet(pkPet),
	UNIQUE(fkProprietario, fkProprietario)
)ENGINE innoDB character set = utf8;


INSERT INTO tblproprietario(strNome, strCpf,dateNasc) VALUES ("André", "12312312312", "1999-02-01");
INSERT INTO tblproprietario(strNome, strCpf,dateNasc) VALUES ("Carlos", "12312312313", "1999-02-02");
INSERT INTO tblproprietario(strNome, strCpf,dateNasc) VALUES ("João", "12312312314", "1999-02-03");

INSERT INTO tblpet(strNome, strRga) VALUES ("Dog1", "1231231231");
INSERT INTO tblpet(strNome, strRga) VALUES ("Dog2", "1231231232");
INSERT INTO tblpet(strNome, strRga) VALUES ("Dog3", "1231231233");

INSERT INTO relproprietario(fkPet, fkProprietario) VALUES(1, 1);
INSERT INTO relproprietario(fkPet, fkProprietario) VALUES(2, 1);
INSERT INTO relproprietario(fkPet, fkProprietario) VALUES(3, 1);
INSERT INTO relproprietario(fkPet, fkProprietario) VALUES(1, 2);
INSERT INTO relproprietario(fkPet, fkProprietario) VALUES(2, 2);
INSERT INTO relproprietario(fkPet, fkProprietario) VALUES(3, 2);
INSERT INTO relproprietario(fkPet, fkProprietario) VALUES(1, 3);
INSERT INTO relproprietario(fkPet, fkProprietario) VALUES(2, 3);
INSERT INTO relproprietario(fkPet, fkProprietario) VALUES(3, 3);



SELECT * FROM  tblproprietario inner join relproprietario on tblproprietario.pkProprietario = relproprietario.fkProprietario INNER JOIN tblPet on relproprietario.fkPet = tblPet.pkPet;