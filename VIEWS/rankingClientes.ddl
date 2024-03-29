CREATE VIEW NUM_CLIENTES
SELECT count(cliente.n_cliente) AS NumeroClientes
FROM cliente
INNER JOIN agencia ON cliente.n_agencia = agencia.n_agencia
GROUP BY agencia.n_agencia;

--CREATE VIEW RANKING_AGENCIA   AINDA NAO FUNCIONA
SELECT /*+ LEADING (sub_titulares agencia) */ (contas.f_saldo) AS Ranking
FROM contas
INNER JOIN sub_titulares ON contas.n_conta = sub_titulares.n_conta
INNER JOIN cliente ON sub_titulares.n_cliente = cliente.n_cliente
INNER JOIN agencia ON cliente.n_agencia = agencia.n_agencia
ORDER BY -contas.f_saldo;

CREATE VIEW AS RANKING_BANCO
SELECT contas.f_saldo AS Ranking
FROM contas
ORDER BY -contas.f_saldo