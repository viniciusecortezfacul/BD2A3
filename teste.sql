CREATE DATABASE CRUD;



CREATE TABLE  CRUD.tblNome(
    upkNome BINARY(16) NOT NULL PRIMARY KEY,
    dcCreated DATETIME DEFAULT CURRENT_TIMESTAMP,
    dcModified DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
)ENGINE = InnoDB CHARACTER SET = UTF-8 ;

CREATE FUNCTION CRUD.fnNovaChave() RETURNS BINARY(16) DETERMINISTIC
	RETURN UNHEX(REPLACE(UUID(), '-', ''));