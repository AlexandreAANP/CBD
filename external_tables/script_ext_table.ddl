/*
OBJETIVO É Através de um ficheiro adquirido online conseguir copiar para para uma external table
Assim caso o ficheiro seja inserido novos dados basta fazer replace pelo o novo ficheiro e ele irá adicionar na tabela externa
Após temos uma tabela externa copiamos para a nossa tabela de Pais, pois é impossivel ter primary keys em tabelas externas 
e as tabelas externas sempre que são corridas, por exemplo com select é importado o ficheiro.

*Futuramente podemos fazer um procedimento que atraves do ficheiro vai fazer update na tabela pais 
*/
CREATE SEQUENCE SEQ_PAIS START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

SELECT * FROM PAIS_EXT;

--Create directory default
CREATE DIRECTORY def_dir1 AS '/home/oracle/data/';

CREATE TABLE Pais_ext (
    N_Pais NUMBER(20),
    V_Pais VARCHAR2(20 CHAR)
)
ORGANIZATION EXTERNAL
(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY def_dir1
    ACCESS PARAMETERS
    (RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ","(
            N_PAIS CHAR(3),
            V_PAIS CHAR(20)
        ))
        LOCATION('countries.txt')-- ficheiro que está na pasta external tables
)REJECT LIMIT UNLIMITED;
COMMIT;
SELECT * FROM pais_ext;
INSERT INTO PAIS (n_pais,v_pais) SELECT pais_ext.n_pais, pais_ext.v_pais FROM pais_ext;
