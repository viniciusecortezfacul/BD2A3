CREATE DATABASE dbModelo;
USE dbModelo;

CREATE TABLE tblestudante(
    pkChave integer not null primary key auto_increment,
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    strProntuario char(9) unique,
    strNome varchar(50),
    dtNascimento date
)ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tblturma(
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    pkChave integer not null primary key auto_increment,
    strDia varchar(6) not null,
    strPeriodo varchar(6) not null
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
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    pkChave integer not null primary key auto_increment,
    strSigla char(5) not null unique,
    strEscolaridade varchar(20) not null
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
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    pkChave INTEGER NOT NULL PRIMARY KEY auto_increment,
    strProntuario char(9) not null unique,
    strNome varchar(50) not null,
    strEscolaridade varchar(20) not null, 
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