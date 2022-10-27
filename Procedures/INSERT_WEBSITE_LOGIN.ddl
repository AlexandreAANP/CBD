create or replace PROCEDURE INSERT_WEBSITE_LOGIN (vUSERNAME IN VARCHAR2, vPASSWORD IN NVARCHAR2, nCLIENTE) AS 
vEXCEPTION EXCEPTION;
BEGIN   
    INSERT INTO WEBSITE_LOGIN(V_USERNAME, V_PASSWORD, N_CLIENTE) VALUES (vUSERNAME, vPASSWORD, nCLIENTE);

EXCEPTION
    WHEN vEXCEPTION THEN
         INSERT_LOG('ERRO AO EXECUTAR PROCEDIMENTO INSERT_WEBSITE_LOGIN');
END INSERT_WEBSITE_LOGIN;