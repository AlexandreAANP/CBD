CREATE OR REPLACE VIEW RISCO_LAVAGEM_DINHEIRO AS
SELECT sb.N_CLIENTE, 
p.v_nome, 
pais.v_pais as nome_pessoa, 
w.V_USERNAME,
cd.n_cartao,
tr.N_TRANSACAO, tr.D_DATA, tr.V_TIPO, tr.F_VALOR FROM transacoes tr
inner join  CARTAO_DEBITO cd ON  cd.n_cartao = tr.n_cartao
INNER JOIN SUB_TITULARES sb on sb.N_CLIENTE = cd.N_TITULAR 
INNER JOIN CLIENTE c ON c.n_cliente = sb.n_cliente 
INNER JOIN WEBSITE_LOGIN w ON w.n_cliente = c.n_cliente  
INNER JOIN PESSOA p ON p.n_pessoa = c.n_pessoa 
INNER JOIN cidade ON p.n_cidade = cidade.n_cidade 
inner join destrito d on d.n_destrito = cidade.n_distrito 
inner join pais on pais.n_pais = d.n_pais where tr.v_tipo= 'LEVANTAMENTO' and tr.f_valor > 5000 
OR tr.v_tipo= 'TRANSFERENCIA' and tr.f_valor > 10000 
OR pais.v_pais != 'PORTUGAL';
