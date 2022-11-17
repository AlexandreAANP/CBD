select n_cliente, pessoa.v_nome, pessoa.d_data_nascimento, pessoa.v_profissao, cidade.v_cidade, destrito.v_destrito, pais.v_pais from cliente
inner join pessoa on cliente.n_pessoa = pessoa.n_pessoa
inner join cidade on pessoa.n_cidade = cidade.n_cidade
inner join destrito on pessoa.n_cidade = destrito.n_cidade
inner join pais on destrito.n_pais = pais.n_pais
