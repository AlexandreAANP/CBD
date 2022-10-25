CREATE OR REPLACE PROCEDURE Insert_Random_rows_transacoes (i Number)
AS
counter Number(20,0) :=0;
count_accounts Number(20,0);
count_categorias NUMBER(20,0);
random_emissor VARCHAR2(20);
random_recetor varchar2(20);
random_categoria Number(4,0);
random_value Number (20,3);
exp_registos_insuficientes EXCEPTION;
BEGIN
    WHILE counter<i LOOP
    
        --GET RANDOM IBAN
        SELECT COUNT(V_IBAN) INTO count_accounts FROM CONTAS;
        IF count_accounts <2 THEN
            raise exp_registos_insuficientes;
        END IF;
        SELECT v_iban INTO random_emissor from CONTAS where n_conta = CAST (dbms_random.value(1,count_accounts) AS NUMBER(20,0));
        SELECT v_iban INTO random_recetor from CONTAS where n_conta = CAST (dbms_random.value(1,count_accounts) AS NUMBER(20,0));
        --randomize again if random_emissor == random_recetor
        WHILE random_emissor = random_recetor LOOP
             SELECT v_iban INTO random_recetor from CONTAS where n_conta = CAST (dbms_random.value(1,count_accounts) AS NUMBER(20,0));
        END LOOP;
        
        --GET RANDOM CATEGORY
        SELECT COUNT(n_categoria) INTO count_categorias FROM categorias_transacoes;
        SELECT n_categoria INTO random_categoria from categorias_transacoes where n_categoria = CAST (dbms_random.value(1,count_categorias) AS NUMBER(20,0));
        
        -- INSERT INTO TRANSACOES TABLE
        SELECT CAST(dbms_random.value(1,1000000)AS NUMBER(20,3)) INTO random_value from dual;
        INSERT INTO TRANSACOES VALUES(DEFAULT, random_value,TO_DATE(SYSDATE, 'yyyy/mm/dd'),random_categoria, random_emissor, random_recetor); 
        DBMS_OUTPUT.PUT_LINE('correu');
        COMMIT;
        counter := counter+1;
    END LOOP;
    
    EXCEPTION 
        WHEN exp_registos_insuficientes THEN
            DBMS_OUTPUT.PUT_LINE('MENOS DE DOIS REGISTOS');
END Insert_Random_rows_transacoes;
