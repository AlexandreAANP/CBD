create or replace PROCEDURE INSERT_CONTAS (vIBAN NVARCHAR2, nCLIENTE IN NUMBER, nPRODUTO IN NUMBER, fSALDO FLOAT, dCRIACAO DATE, dCARENCIA DATE, dVENCIMENTO DATE, fJUROS FLOAT, nCONTA N) AS 
    check_iban CONTAS.V_IBAN%TYPE := NULL;

BEGIN   
    -- caso um destes select n retorna nada então a exceção NO_DATA_FOUND é lançada
       INSERT INTO CONTAS(V_IBAN, N_CLIENTE, N_PRODUTO, F_SALDO, D_DATA_CRIACAO, D_CARENCIA, D_VENCIMENTO, F_JUROS, N_CONTA) VALUES (vIBAN, nCLIENTE, nPRODUTO, fSALDO, dCRIACAO, dCARENCIA, dVENCIMENTO, fJUROS, nCONTA);
END INSERT_CONTAS;