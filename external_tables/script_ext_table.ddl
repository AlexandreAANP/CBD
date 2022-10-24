-- com isto não é possivel usar primary key na table
-- por selecionar tabela
CREATE SEQUENCE SEQ_PAIS START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

SELECT * FROM PAIS_EXT;

--Create directory default
CREATE DIRECTORY def_dir1 AS '/home/oracle/data/';

CREATE TABLE Pais_ext12 (
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
        LOCATION('countries_v2.txt')
)REJECT LIMIT UNLIMITED;
COMMIT;
SELECT * FROM pais_ext12;
ALTER TABLE Pais_ext10 ADD CONSTRAINT pais_pk PRIMARY KEY ( n_pais );
