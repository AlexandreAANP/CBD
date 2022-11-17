CREATE OR REPLACE PROCEDURE Insert_Random_rows_pessoas (i Number)
AS
counter number:=0;
nome nome_ext.v_nome%type :=null;
data_nascimento pessoa.d_data_nascimento%type :=null;
pais NUMBER;
distrito NUMBER;
cidade NUMBER;
nif Number(9);

exp_registos_insuficientes EXCEPTION;
BEGIN
    WHILE counter<i LOOP
        --Get random name
        SELECT v_nome INTO nome FROM nome_ext ORDER BY DBMS_RANDOM.value FETCH NEXT 1 ROWS ONLY;
        DBMS_OUTPUT.PUT_LINE(nome);
        -- GET RANDOM DATA NASCIMENTO
        SELECT TO_DATE(
              TRUNC(
                   DBMS_RANDOM.VALUE(TO_CHAR(DATE '1920-01-01','J')
                                    ,TO_CHAR(DATE '2010-12-31','J')
                                    )
                    ),'J'
               ) INTO data_nascimento FROM DUAL;
            DBMS_OUTPUT.PUT_LINE(data_nascimento);
            
            
        -- generate random nif number 100000000 - 999999999
        nif := dbms_random.value(100000000,999999999);
        DBMS_OUTPUT.PUT_LINE(nif);
        
        -- get random pais
        SELECT n_pais INTO pais FROM pais ORDER BY DBMS_RANDOM.value FETCH NEXT 1 ROWS ONLY;
        
        -- get random cidade
        SELECT n_cidade INTO cidade FROM cidade ORDER BY DBMS_RANDOM.value FETCH NEXT 1 ROWS ONLY;
        
        -- get random distrito
        SELECT n_destrito INTO distrito FROM destrito ORDER BY DBMS_RANDOM.value FETCH NEXT 1 ROWS ONLY;
        
        DBMS_OUTPUT.PUT_LINE('Morada '||pais||distrito||cidade);
        
        INSERT INTO PESSOA VALUES(default, nome, data_nascimento, nif, null,pais, distrito, cidade,'');
        COMMIT;
        counter := counter+1;
    END LOOP;
    
    EXCEPTION 
        WHEN exp_registos_insuficientes THEN
            DBMS_OUTPUT.PUT_LINE('MENOS DE DOIS REGISTOS');
END Insert_Random_rows_pessoas;
SELECT * FROM DESTRITO;
