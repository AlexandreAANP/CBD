CREATE OR REPLACE PROCEDURE "DELETE_TIPO_PRODUTO" (nTIPOPRODUTO NUMBER)

BEGIN
    DELETE FROM tipo_produto WHERE n_tipo_produto = nTIPOPRODUTO;

END DELETE_TIPO_PRODUTO;