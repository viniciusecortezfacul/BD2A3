create database novo character set = utf8;
use novo;
/*Não deixar nada por padrão sempre colocar 
*/
create table tblproprietario(
	strNome varchar(50) not null,
	strCpf char(11)  not null unique,
	dateNasc date not null, 
	pkProprietario integer not null primary key auto_increment,
	strObservacao varchar(200) null
	) ENGINE innoDB character set = utf8;

--INSERT