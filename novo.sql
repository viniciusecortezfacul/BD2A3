create database revisao character set = utf8;
use revisao;
/*Não deixar nada por padrão sempre colocar 
*/
create table tblproprietario(
	strNome varchar(50) not null,
	strCpf char(11)  not null unique,
	dateNasc date not null, 
	pkProprietario integer not null primary key auto_increment,
	strObservacao varchar(200) null
	) ENGINE innoDB character set = utf8;

CREATE TABLE tblpet(
	pkPet INTEGER NOT NULL PRIMARY KEY auto_increment,
	strRga varchar(50),
	strNome varchar(100)
);