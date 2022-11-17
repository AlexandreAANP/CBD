create or replace PROCEDURE INSERT_TRANSACOES (fVALOR IN NUMBER,nCATEGORIA IN NUMBER,vEMISSOR IN NVARCHAR2,vRECETOR IN NVARCHAR2) AS 
    check_value CONTAS.F_SALDO%TYPE;
    check_iban CONTAS.V_IBAN%TYPE := NULL;
    exp_saldo_insuficiente EXCEPTION;
    
BEGIN
    -- caso um destes select n retorna nada então a exceção NO_DATA_FOUND é lançada
    SELECT V_IBAN INTO check_iban FROM CONTAS WHERE V_IBAN = vEmissor;
    SELECT V_IBAN FROM CONTAS WHERE V_IBAN = vRecetor;
    
    
    SELECT F_SALDO INTO check_value FROM CONTAS WHERE V_IBAN = vEMISSOR;
    IF check_value < fVALOR THEN
        DBMS_OUTPUT.PUT_LINE('VALOR NA CONTA:' || check_value);
        RAISE exp_saldo_insuficiente;
    ELSE
        DBMS_OUTPUT.PUT_LINE('VALOR NA CONTA:' || check_value);

        INSERT INTO TRANSACOES(N_TRANSACAO, F_VALOR, D_DATA, N_CATEGORIA, V_EMISSOR, V_RECETOR) VALUES (DEFAULT, fVALOR, DEFAULT, nCATEGORIA, vEMISSOR, vRECETOR);
        UPDATE CONTAS SET F_SALDO = (CONTAS.F_SALDO + fVALOR) WHERE V_IBAN= vRECETOR;
        UPDATE CONTAS SET F_SALDO = (CONTAS.F_SALDO - fVALOR) WHERE V_IBAN = vEMISSOR;
    END IF;
EXCEPTION
    WHEN exp_saldo_insuficiente THEN
         INSERT_LOG('NAO TEM SALDO SUFICIENTE PARA TRANSFERIR O VALOR:' || fvalor);
         DBMS_OUTPUT.PUT_LINE('NAO TEM SALDO SUFICIENTE PARA TRANSFERIR O VALOR:' || fvalor);
    WHEN NO_DATA_FOUND THEN
         IF check_iban IS NULL THEN
            INSERT_LOG('Conta de emissor não existe: ' || vEMISSOR);
            DBMS_OUTPUT.PUT_LINE('Conta de emissor não existe: ' || vEMISSOR);
         ELSE
             INSERT_LOG('Conta de recetor não existe: ' || vRECETOR);
             DBMS_OUTPUT.PUT_LINE('Conta de recetor não existe: ' || vRECETOR);
         ENDIF;
END INSERT_TRANSACOES;
