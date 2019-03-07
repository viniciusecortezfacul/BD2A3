CREATE DATABASE dbCEPAberto;
use dbCEPAberto;

CREATE TABLE tblestado(
    pkEstados integer primary key not null auto_increment,
    strNome varchar(20) not null,
    strSigla char(2) not null
) ENGINE = InnoDB CHARACTER SET = utf8 ;
CREATE TABLE tblcidade(
    pkCidade integer primary key not null auto_increment,
    strNome varchar(20) not null
)ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE relestadocidade(
    pkRel integer primary key auto_increment,
    fkEstado integer not null,
    fkCidade integer not null,
    foreign key (fkEstado) references tblestado(pkEstados),
    foreign key (fkCidade) references tblcidade(pkCidade),
    unique(fkCidade)
)ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tblcep(
    strLogradouro varchar(50),
    strNomeDoBairro varchar(20),
    intCep integer not null unique, 
    pkCep integer not null primary key auto_increment
)ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE relcepcidade(
    fkCEP integer not null,
    fkCidade integer not null,
    foreign key(fkCEP) references tblcep(pkCep),
    foreign key(fkCidade) references tblcidade(pkCidade),
    unique(fkCEP)
)ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE relcepestado(
    fkCEP integer not null,
    fkEstado integer not null,
    foreign key(fkCEP) references tblcep(pkCep),
    foreign key(fkEstado) references tblestado(pkEstados),
    unique(fkCEP)
)ENGINE = InnoDB CHARACTER SET = utf8;