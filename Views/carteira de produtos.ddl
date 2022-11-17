select sub_titulares.n_cliente, pessoa.nome, pessoa.n_nif, contas.iban, produtos.v_nome, tipo_produto.v_nome from sub_titulares
inner join cliente on sub_titulares.n_cliente = cliente.n_cliente
inner join pessoa on cliente.n_pessoa = pessoa.n_pessoa
inner join contas on sub_titulares.n_cliente = contas.n_cliente
inner join produtos on contas.n_produto = produtos.n_produto
inner join tipo_produto on produtos.n_tipo_produto = tipo_produto.n_tipo_produto
