CREATE VIEW VIEW_Produtos AS
SELECT
produtos.v_nome as Produto,
tipo_produto.v_nome as Tipo_produto
FROM produtos
INNER JOIN tipo_produto
ON produtos.n_tipo_produto = tipo_produto.n_tipo_produto
