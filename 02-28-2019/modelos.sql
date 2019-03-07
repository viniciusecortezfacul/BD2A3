
-- tabela minima
CREATE TABLE tblminima(
    dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --METADADOS PARA SABER QUANDO FOI CRIADO
    dcModified DATETIME NULL ON UPDATE CURRENT_TIMESTAMP, --trigger
    pkMinima INTEGER NOT NULL PRIMARY KEY 
)ENGINE = InnoDB CHARACTER SET = utf8;

-- exemplo de estrutura de Relacionamento

CREATE TABLE relendetidade1entidade2(
    pkEntidade1
)

/*
 RELACIONAMENTOS:

 1 .. 1  UNIQUE (fkEntidade1), UNIQUE(fkEntidade)
 1 .. *  UNIQUE(fkEntidade2)

 * .. * UNIQUE(fkEntidade1, fkEntidade2)
*/


/*  Dublin Core
        Created
        Modified
        Creator
        Publisher
        Deleted

*/