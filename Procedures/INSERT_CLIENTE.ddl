CREATE SEQUENCE  "BANK"."SEQ_CLIENTES"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
create or replace PROCEDURE INSERT_CLIENTES (nPESSOA IN NUMBER, nAGENCIA IN NUMBER) AS 
BEGIN   
    INSERT INTO CLIENTE(N_CLIENTE, N_PESSOA, N_AGENCIA) VALUES (DEFAULT, nPESSOA, nAGENCIA);
END INSERT_CLIENTES;
