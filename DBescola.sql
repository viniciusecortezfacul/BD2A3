CREATE DATABASE dbEscola;
USE dbEscola;

CREATE TABLE tblestudante(
	upkEstudante binary(16) not null,
    pkChave integer not null primary key auto_increment,
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    strProntuario char(7) unique,
    strNome varchar(50),
    dtNascimento date
)ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tblturma(
	upkTurma binary(16) not null,
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    pkChave integer not null primary key auto_increment,
	dia enum( "SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA", "SABADO"," DOMINGO") ,
	pediodo enum("MATUTINO", "VESPERTINO", "NOTURNO") 
)ENGINE = InnoDB CHARACTER SET = utf8;


CREATE TABLE relestudanteturma(
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    pkChave integer not null primary key auto_increment,
    fkEstudante integer not null,
    fkTurma integer not null,
    foreign key (fkEstudante) references tblestudante(pkChave),
    foreign key (fkTurma) references tblturma(pkChave),
    unique(fkEstudante, fkTurma)
)ENGINE = InnoDB CHARACTER SET = utf8;


CREATE TABLE tbldisciplina(
	upkDisciplina binary(16) not null,
	strNome varchar(50),
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    pkChave integer not null primary key auto_increment,
    strSigla char(5) not null unique
)ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE reldisciplinaturma(
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    pkChave integer not null primary key auto_increment,
    fkTurma integer not null,
    fkDisciplina integer not null,
    foreign key (fkTurma) references tblturma(pkChave),
    foreign key (fkDisciplina) references tbldisciplina(pkChave),
    unique (fkTurma)
)ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tbldocente(
	upkDocente binary(16) not null,
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    pkChave INTEGER NOT NULL PRIMARY KEY auto_increment,
    strProntuario char(7) not null unique,
    strNome varchar(50) not null,
	escolaridade enum("FUNDAMENTAL", "MEDIO", "TECNOLOGO", "BACHARELADO", "LICENCIATURA", "MESTRADO", "DOUTORADO", "POSGRADUACAO","LIVREDOCENCIA" ),
    dtNascimento date
)ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE reldocentedisciplina(
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    pkChave integer primary key not null auto_increment,
    fkDocente integer not null,
    fkDisciplina integer not null,
    foreign key (fkDocente) references tbldocente(pkChave),
    foreign key (fkDisciplina) references tbldisciplina(pkChave),
    unique(fkDocente, fkDisciplina)
)ENGINE = InnoDB CHARACTER SET = utf8;





INSERT INTO tblestudante(strProntuario, strNome, dtNascimento) values ("SP3003030", "Joao", "1999-10-23");
INSERT INTO tblestudante(strProntuario, strNome, dtNascimento) values ("SP3003031", "Claudio", "1999-10-23");
INSERT INTO tblestudante(strProntuario, strNome, dtNascimento) values ("SP3003033", "Jobiscley", "1999-10-23");
INSERT INTO tblestudante(strProntuario, strNome, dtNascimento) values ("SP3003034", "Joelington", "1999-10-23");





INSERT INTO tbldisciplina(strSigla) values ("BD2A3");
INSERT INTO tblturma(strDia, strPeriodo) values ("SEG", "3");

INSERT INTO reldisciplinaturma(fkDisciplina, fkTurma) values (01, 01);
INSERT INTO reldocentedisciplina(fkDocente, fkDisciplina) values(01, 01);
INSERT INTO relestudanteturma(fkEstudante, fkTurma) values(01, 01);
INSERT INTO relestudanteturma(fkEstudante, fkTurma) values(02, 01);
INSERT INTO relestudanteturma(fkEstudante, fkTurma) values(03, 01);

CREATE FUNCTION fnNovaChave() RETURNS BINARY(16) DETERMINISTIC
	RETURN UNHEX(REPLACE(UUID(), '-', ''));
	
DELIMITER //	
CREATE PROCEDURE prCriarDocente ( varProntuario char(7), varNome varchar(50),  varNascimento date,  
				varEscolaridade enum("FUNDAMENTAL", "MEDIO", "TECNOLOGO", "BACHARELADO", "LICENCIATURA", "MESTRADO", "DOUTORADO", "POSGRADUACAO","LIVREDOCENCIA" ))
	BEGIN
		START TRANSACTION;
			INSERT INTO tbldocente(upkDocente, strProntuario, strNome, escolaridade, dtNascimento) values (fnNovaChave(), varProntuario, varNome, varEscolaridade, varNascimento);
		COMMIT;
	END //
DELIMITER ;

DELIMITER //	

CREATE PROCEDURE prCriarEstudante ( varProntuario char(7), varNome varchar(50),  varNascimento date)
	BEGIN
		START TRANSACTION;
			INSERT INTO tblestudante(upkEstudante, strProntuario, strNome, dtNascimento) values (fnNovaChave(), varProntuario, varNome, varNascimento);
		COMMIT;
	END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE prAtualizarEstudante ( varProntuario char(7), varNome varchar(50),  varNascimento date)
	BEGIN
		START TRANSACTION;
			UPDATE tblestudante set strProntuario = varProntuario, strNome = varNome, dtNascimento = varNascimento WHERE strProntuario = varProntuario;
		COMMIT;
	END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE prLerEstudante ( varProntuario char(7))
	BEGIN
		START TRANSACTION;
			SELECT dcCreated as "criado", dcModified as "modificado", strProntuario as "prontuario", 
					strNome as "nome", dtNascimento as "nascimento" from tblestudante;
		COMMIT;
	END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE prListarEstudante()
	BEGIN
		START TRANSACTION;
			SELECT dcCreated as "criado", dcModified as 
					"modificado", strProntuario as "prontuario", strNome as "nome", 
					dtNascimento as "nascimento"
					from tblestudante;
		COMMIT;
	END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE prCriarDisciplina ( varSigla char(5), varNome varchar(50))
	BEGIN
		START TRANSACTION;
			INSERT INTO tbldisciplina (upkDisciplina, strSigla  ,strNome ) values (fnNovaChave(), varSigla, varNome);
		COMMIT;
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prCriarTurma( varSigla char(5), varDia enum( "SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA", "SABADO"," DOMINGO") , varPeriodo enum("MATUTINO", "VESPERTINO", "NOTURNO") )
	BEGIN
		START TRANSACTION;
			INSERT INTO tblturma (upkTurma, periodo, dia)  values (fnNovaChave(), varDia, varPeriodo);
			INSERT INTO reldisciplinaturma(upkTurma, fkTurma, fkDisciplina) SELECT fnNovaChave(), LAST_INSERT_ID, fkDisciplina from tbldisciplina where strSigla = varSigla; 						
		COMMIT ;
	END//
DEMILITER;


DELIMITER //
CREATE PROCEDURE prListarDisciplina()
	BEGIN
		START TRANSACTION;
			SELECT dcCreated as "criado", dcModified as "modificado", strSigla as "sigla", strNome as "nome" from tbldisciplina;
		COMMIT ;
	END//
DEMILITER;

DELIMITER //
CREATE PROCEDURE prListarDocente()
	BEGIN
		START TRANSACTION;
			SELECT dcCreated as "criado", dcModified as "modificado", strProntuario as "prontuario", strNome as "nome" , escolaridade, dtNascimento as "nascimento"   from tbldocente;
		COMMIT ;
	END//

CREATE USER 'secretaria'@'localhost' IDENTIFIED BY 'senha';
GRANT ALL ON dbEscola.* TO 'secretaria'@'localhost';

show procedure status like "pr%";




