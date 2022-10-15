CREATE VIEW_CLIENTE AS
SELECT
N_CLIENTE,
pessoa.v_nome,
pessoa.n_nif,
pessoa.d_data_nascimento,
TRUNC((SYSDATE - d_data_nascimento)/ 365.25) as idade,-- Calcula a idade através da data de nascimento
pessoa.v_profissao,
agencia.v_nome as Agencia
FROM Cliente
INNER JOIN Pessoa
ON cliente.n_pessoa = pessoa.n_pessoa
INNER JOIN Agencia
ON cliente.n_agencia = agencia.n_agencia
