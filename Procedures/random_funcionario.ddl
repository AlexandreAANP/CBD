CREATE OR REPLACE PROCEDURE Insert_Random_rows_funcionario (i Number)
AS
counter number:=0;
pessoa number(20);
Nagencia number(20);
Ngerente number(20);


exp_registos_insuficientes EXCEPTION;
BEGIN
    WHILE counter<i LOOP
        --Get random pessoa
        SELECT n_pessoa INTO pessoa FROM pessoa ORDER BY DBMS_RANDOM.value FETCH NEXT 1 ROWS ONLY;
        DBMS_OUTPUT.PUT_LINE(pessoa);
        
        -- get random agencia
        SELECT n_agencia INTO Nagencia FROM agencia ORDER BY DBMS_RANDOM.value FETCH NEXT 1 ROWS ONLY;
        DBMS_OUTPUT.PUT_LINE(Nagencia);
        --get gerente of value before
        SELECT n_gerente INTO Ngerente from agencia where agencia.n_agencia = Nagencia;
        DBMS_OUTPUT.PUT_LINE(Ngerente);
        
        INSERT INTO Funcionario VALUES(DEFAULT, pessoa, Ngerente ,nagencia);
        COMMIT;
        counter := counter+1;
    END LOOP;
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Falta de dados para inserção de funcionario');
END Insert_Random_rows_funcionario;

--CREATE SEQUENCE SEQ_FUNCIONARIO MINVALUE 2 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;
--ALTER TABLE funcionario MODIFY N_funcionario DEFAULT SEQ_funcionario.NEXTVAL;

exec insert_random_rows_funcionario(2);
