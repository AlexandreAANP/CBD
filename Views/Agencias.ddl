CREATE VIEW VIEW_Agencia AS
SELECT 
agencia.n_agencia,
agencia.v_nome,
funcionario.n_funcionario as num_gerente,
pessoa.v_nome as nome_gerente, -- TESTAR ESTE CAMPO
pais.v_pais,
destrito.v_destrito,
cidade.v_cidade
From agencia
INNER JOIN funcionario
ON agencia.n_gerente = funcionario.n_funcionario
INNER JOIN Pessoa
ON funcionario.n_pessoa = pessoa.n_pessoa
INNER JOIN Cidade
ON agencia.n_cidade = cidade.n_cidade
INNER JOIN Destrito
ON agencia.n_destrito = destrito.n_destrito
INNER JOIN PAIS
ON agencia.n_pais =  pais.n_pais
