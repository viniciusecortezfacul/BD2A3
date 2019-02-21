create database novo character set = utf8;
use novo;


create table tblProprietario(
	strNome varchar(50),
	strCpf char(11),
	dateNasc date, 
	pkProprietario integer,
	primary key(pkProprietario)
	);
	
	
create table tblPet(
	strNome varchar(50),
	strEspecie varchar(50),
	strRga varchar(20),
	pkPet integer,
	fkProprietario integer,
	foreign key (fkProprietario) references tblProprietario(pkProprietario)
);