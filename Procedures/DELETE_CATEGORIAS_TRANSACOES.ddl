CREATE OR REPLACE PROCEDURE "DELETE_CATEGORIAS_TRANSACOES" (nCATEGORIA NUMBER) AS

BEGIN
    DELETE FROM categorias_transacoes WHERE n_categoria = nCATEGORIA;

END DELETE_CATEGORIAS_TRANSACOES;
