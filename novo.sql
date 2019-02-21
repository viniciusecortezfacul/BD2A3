create database novo character set = utf8;
use novo;
/*Não deixar nada por padrão sempre colocar 
*/

create table tblProprietario(
	strNome varchar(50) not null,
	strCpf char(11)  not null,
	dateNasc date not null, 
	pkProprietario integer not null primary key auto_increment,
	strObservacao varchar(200) null
	) IENGINE ;
	
	
create table tblPet(
	strNome varchar(50),
	strEspecie varchar(50),
	strRga varchar(20),
	pkPet integer,
	fkProprietario integer,
	foreign key (fkProprietario) references tblProprietario(pkProprietario)
);