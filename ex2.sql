CREATE DATABASE dbCEPAberto;
use dbCEPAberto;

CREATE TABLE tblestado(
    pkEstados integer primary key not null ,
    strNome varchar(20) not null,
    strSigla char(2) not null
) ENGINE = MyISAM CHARACTER SET = utf8 ;
CREATE TABLE tblcidade(
    pkCidade integer primary key not null ,
    strNome varchar(60) not null, 
    strBairro varchar(80),
)ENGINE = MyISAM CHARACTER SET = utf8;

CREATE TABLE relestadocidade(
    pkRel integer primary key auto_increment ,
    fkEstado integer not null,
    fkCidade integer not null,
    foreign key (fkEstado) references tblestado(pkEstados),
    foreign key (fkCidade) references tblcidade(pkCidade),
    unique(fkCidade)
)ENGINE = MyISAM CHARACTER SET = utf8;

CREATE TABLE tblcep(
    strLogradouro varchar(150),
    strNomeDoBairro varchar(80),
    intCep char(8) null unique, 
    pkCep integer not null primary key 
)ENGINE = MyISAM CHARACTER SET = utf8;

CREATE TABLE relcepcidade(
    fkCEP integer not null,
    fkCidade integer not null,
    foreign key(fkCEP) references tblcep(pkCep),
    foreign key(fkCidade) references tblcidade(pkCidade),
    unique(fkCEP)
)ENGINE = MyISAM CHARACTER SET = utf8;

CREATE TABLE relcepestado(
    fkCEP integer not null,
    fkEstado integer not null,
    foreign key(fkCEP) references tblcep(pkCep),
    foreign key(fkEstado) references tblestado(pkEstados),
    unique(fkCEP)
)ENGINE = MyISAM CHARACTER SET = utf8;


LOAD DATA INFILE 'C:/ProgramData/MySQL Server 8.0/Uploads/cities.csv' INTO TABLE [tabela] FIELDS TERMINATED BY ',' (...);