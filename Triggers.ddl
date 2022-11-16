CREATE TRIGGER TRIGGERAGEN
  BEFORE INSERT ON AGENCIA
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_AGENCIA IS NULL )
  THEN
    :new.N_AGENCIA := SEQ_AGENCIA.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_CARTAO_DEBITO
  BEFORE INSERT ON CARTAO_DEBITO
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_CARTAO IS NULL )
  THEN
    :new.N_CARTAO := SEQ_CARTAO_DEBITO.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_CATEGORIA_TRANSACOES
  BEFORE INSERT ON CATEGORIAS_TRANSACOES
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_CATEGORIA IS NULL )
  THEN
    :new.N_CATEGORIA := SEQ_CATEGORIAS_TRANSACOES.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_CIDADE
  BEFORE INSERT ON CIDADE
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_CIDADE IS NULL )
  THEN
    :new.N_CIDADE := SEQ_CIDADE.nextval;
  END IF;
END;


CREATE TRIGGER TRIGGER_CLIENTE
  BEFORE INSERT ON CLIENTE
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_CLIENTE IS NULL )
  THEN
    :new.N_CLIENTE  := SEQ_CLIENTE.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_CONTAS
  BEFORE INSERT ON CONTAS
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_CONTA IS NULL )
  THEN
    :new.N_CONTA  := SEQ_CONTAS.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_DESTRITO
  BEFORE INSERT ON DESTRITO
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_DESTRITO IS NULL )
  THEN
    :new.N_DESTRITO := SEQ_DISTRITO.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_FUNCIONARIO
  BEFORE INSERT ON FUNCIONARIO
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_FUNCIONARIO IS NULL )
  THEN
    :new.N_FUNCIONARIO := SEQ_FUNCIONARIO.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_PAIS
  BEFORE INSERT ON PAIS
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_PAIS IS NULL )
  THEN
    :new.N_PAIS:= SEQ_PAIS.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_PESSOA
  BEFORE INSERT ON PESSOA
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_PESSOA IS NULL )
  THEN
    :new.N_PESSOA:= SEQ_PESSOA.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_PRODUTOS
  BEFORE INSERT ON PRODUTOS
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_PRODUTO IS NULL )
  THEN
    :new.N_PRODUTO:= SEQ_PRODUTOS.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_TIPO_PRODUTO
  BEFORE INSERT ON TIPO_PRODUTO
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_TIPO_PRODUTO IS NULL )
  THEN
    :new.N_TIPO_PRODUTO:= SEQ_TIPO_PRODUTO.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_TIPO_PRODUTO
  BEFORE INSERT ON TIPO_PRODUTO
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_TIPO_PRODUTO IS NULL )
  THEN
    :new.N_TIPO_PRODUTO:= SEQ_TIPO_PRODUTO.nextval;
  END IF;
END;

CREATE TRIGGER TRIGGER_TRANSACOES
  BEFORE INSERT ON TRANSACOES
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.N_TRANSACAO IS NULL )
  THEN
    :new.N_TRANSACAO:= SEQ_TRANSACAO.nextval;
  END IF;
END;
