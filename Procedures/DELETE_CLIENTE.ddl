CREATE OR REPLACE PROCEDURE "DELETE_CLIENTE" (nCLIENTE NUMBER)

BEGIN
    DELETE FROM cliente WHERE n_cliente = nCLIENTE;

END DELETE_CLIENTE;