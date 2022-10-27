CREATE SEQUENCE  "BANK"."SEQ_TIPO_PRODUTO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

create or replace PROCEDURE INSERT_TIPO_PRODUTO (vNOME IN VARCHAR2) AS 
vEXCEPTION EXCEPTION;
BEGIN   
    INSERT INTO TIPO_PRODUTO(N_TIPO_PRODUTO, V_NOME) VALUES (DEFAULT, vNOME);

EXCEPTION
    WHEN vEXCEPTION THEN
         INSERT_LOG('ERRO AO EXECUTAR PROCEDIMENTO INSERT_TIPO_PRODUTO ' );
END INSERT_TIPO_PRODUTO;