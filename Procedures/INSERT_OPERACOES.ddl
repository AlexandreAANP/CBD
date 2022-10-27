create or replace PROCEDURE INSERT_OPERACOES (fVALOR IN NUMBER, nCARTAO IN NUMBER, nAGENCIA IN NUMBER, bWEBSITE IN CHAR, vTIPO IN NVARCHAR2) AS 
    check_value CONTAS.F_SALDO%TYPE;
    check_iban CONTAS.V_IBAN%TYPE := NULL;
    exp_saldo_insuficiente EXCEPTION;
BEGIN
    -- caso um destes select n retorna nada então a exceção NO_DATA_FOUND é lançada
    SELECT V_IBAN INTO check_iban FROM CARTAO_DEBITO WHERE N_CARTAO = nCARTAO;
    SELECT F_SALDO INTO check_value FROM CONTAS WHERE V_IBAN = check_iban;
    IF check_value < fVALOR THEN
        DBMS_OUTPUT.PUT_LINE('VALOR NA CONTA:' || check_value);
        RAISE exp_saldo_insuficiente;
    ELSE 
        DBMS_OUTPUT.PUT_LINE('VALOR NA CONTA:' || check_value);
        INSERT INTO OPERACAO(N_OPERACAO, F_VALOR, D_DATA, N_CARTAO, N_AGENCIA, B_BY_WEBSITE, V_TIPO) VALUES (DEFAULT, fVALOR, DEFAULT, nCARTAO, nAGENCIA, bWEBSITE, vTIPO);
        IF vTIPO = 'levantamento' THEN
            UPDATE CONTAS SET F_SALDO = (CONTAS.F_SALDO - fVALOR) WHERE V_IBAN = check_iban;
        END IF;
        IF vTIPO = 'deposito' THEN
            UPDATE CONTAS SET F_SALDO = (CONTAS.F_SALDO + fVALOR) WHERE V_IBAN = check_iban;  
        ELSE
            DBMS_OUTPUT.PUT_LINE('VALOR NA CONTA:' || check_value);
            INSERT_LOG('OPERACAO NAO PERMITIDA');
        END IF;
    END IF;
EXCEPTION
    WHEN exp_saldo_insuficiente THEN
         INSERT_LOG('NAO TEM SALDO SUFICIENTE PARA REALIZAR A OPERACAO:' || fvalor);
         DBMS_OUTPUT.PUT_LINE('NAO TEM SALDO SUFICIENTE PARA REALIZAR A OPERACAO:' || fvalor);
    WHEN NO_DATA_FOUND THEN
         IF check_iban is null THEN
            INSERT_LOG('Conta de operacao não existe: ' || check_iban);
            DBMS_OUTPUT.PUT_LINE('Conta de operacao não existe: ' || check_iban);
         END IF;
END INSERT_OPERACOES;
