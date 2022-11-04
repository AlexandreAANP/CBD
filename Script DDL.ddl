
CREATE SEQUENCE SEQ_AGENCIA MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE TABLE agencia (
    n_agencia    NUMBER(10) NOT NULL DEFAULT SEQ_AGENCIA.NEXTVAL,
    v_nome       VARCHAR2(20) NOT NULL,
    n_gerente    NUMBER(10) NOT NULL,
    n_pais       NUMBER(4) NOT NULL,
    n_destrito   NUMBER(10) NOT NULL,
    n_cidade     NUMBER(10) NOT NULL
)
LOGGING;
COMMENT ON TABLE agencia IS
    'Tabela de Agencias do Banco
    Nome -> "Agencia de " + cidade
    ';

ALTER TABLE agencia ADD CONSTRAINT agencia_pk PRIMARY KEY ( n_agencia );

ALTER TABLE agencia ADD CONSTRAINT gerente__un UNIQUE ( n_gerente );


CREATE SEQUENCE SEQ_CARTAO_DEBITO MINVALUE 1000000000000000 MAXVALUE 9999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE TABLE cartao_debito (
    n_cartao             NUMBER(16) NOT NULL DEFAULT SEQ_CARTAO.NEXTVAL,
    d_emissao            DATE NOT NULL,
    d_expiracao          DATE NOT NULL,
    n_cvv                NUMBER(3) NOT NULL,
    n_codigo_seguranca   NUMBER(4) NOT NULL,
    n_titular            NUMBER(10) NOT NULL,
    v_iban               NVARCHAR2(20) NOT NULL
)
LOGGING;

COMMENT ON TABLE cartao_debito IS
    'Tabela de cartao de debito
';
ALTER TABLE cartao_debito ADD CONSTRAINT cartao_debito_pk PRIMARY KEY ( n_cartao );



    
CREATE SEQUENCE SEQ_CATEGORIAS_TRANSACOES MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE categorias_transacoes (
    n_categoria   NUMBER(4) NOT NULL DEFAULT SEQ_CATEGORIAS_TRANSACOES.NEXTVAL,
    v_categoria   NVARCHAR2(20) NOT NULL
)
LOGGING;
COMMENT ON TABLE categorias_transacoes IS
    'Tabela de categorias de transacoes';

ALTER TABLE categorias_transacoes ADD CONSTRAINT categorias_transacoes_pk PRIMARY KEY ( n_categoria );

ALTER TABLE categorias_transacoes ADD CONSTRAINT categorias_transacoes__un UNIQUE ( v_categoria );



CREATE SEQUENCE SEQ_CIDADE MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE cidade (
    n_cidade   NUMBER(10) NOT NULL DEFAULT SEQ_CIDADE.NEXTVAL,
    v_cidade   VARCHAR2(20 CHAR) NOT NULL
)
LOGGING;
COMMENT ON TABLE cidade  IS
    'Tabela de cidades
    Os primeiros dados são importados atráves de uma external table -> cidade_ext';

ALTER TABLE cidade ADD CONSTRAINT cidade_pk PRIMARY KEY ( n_cidade );


    
CREATE SEQUENCE SEQ_CLIENTE MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;    

CREATE TABLE cliente (
    n_cliente   NUMBER(10) NOT NULL DEFAULT SEQ_CLIENTE.NEXTVAL,
    n_pessoa    NUMBER(20) NOT NULL,
    n_agencia   NUMBER(10) NOT NULL
)
LOGGING;

COMMENT ON TABLE cliente  IS
    'Tabela de Cliente';
    
ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( n_cliente );

ALTER TABLE cliente ADD CONSTRAINT cliente__un UNIQUE ( n_pessoa );


CREATE SEQUENCE SEQ_CONTAS MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE contas (
    n_conta          NUMBER(20) NOT NULL DEFAULT SEQ_CONTAS.NEXTVAL,
    v_iban           NVARCHAR2(20) NOT NULL,
    n_cliente        NUMBER(10) NOT NULL,
    n_produto        NUMBER(10) NOT NULL,
    f_saldo          FLOAT(20) NOT NULL,
    d_data_criacao   DATE NOT NULL,
    d_carencia       DATE,
    d_vencimento     DATE,
    f_juros          NUMBER(4, 4)
)
LOGGING;


COMMENT ON TABLE contas IS
    'Tabela de Contas';


ALTER TABLE contas ADD CONSTRAINT contas_pk PRIMARY KEY ( n_conta );

ALTER TABLE cliente ADD CONSTRAINT contas__un UNIQUE ( v_iban );


    
CREATE SEQUENCE SEQ_DISTRITO MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE destrito (
    n_destrito   NUMBER(10) NOT NULL DEFAULT SEQ_DISTRITO.NEXTVAL,
    v_destrito   VARCHAR2(20 CHAR) NOT NULL
)
LOGGING;

COMMENT ON TABLE destrito IS
    'Tabela de cidades
    Os primeiros dados são importados atráves de uma external table -> distrito_ext';

ALTER TABLE destrito ADD CONSTRAINT destrito_pk PRIMARY KEY ( n_destrito );

CREATE SEQUENCE SEQ_FUNCIONARIO MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;



CREATE TABLE funcionario (
    n_funcionario   NUMBER(10) NOT NULL,
    n_pessoa        NUMBER(20) NOT NULL,
    n_gerente       NUMBER(10),
    n_agencia       NUMBER(10) NOT NULL
)
LOGGING;

COMMENT ON TABLE funcionario IS
    'Tabela de funcionarios';

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( n_funcionario );


CREATE SEQUENCE SEQ_OPERACAO MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;


CREATE TABLE operacao (
    n_operacao     NUMBER(20) NOT NULL DEFAULT SEQ_OPERACAO.NEXTVAL,
    f_valor        NUMBER(10, 3) NOT NULL,
    d_data         DATE NOT NULL,
    n_cartao       NUMBER(16),
    n_agencia      NUMBER(10),
    b_by_website   CHAR(1) NOT NULL,
    v_tipo         NVARCHAR2(20) NOT NULL
) PCTFREE 0
LOGGING;



COMMENT ON TABLE operacao IS
    'Tabela de operacao
    v_tipo tem uma constraint que permite apenas valore "levantamento" ou "deposito"
    e n_cartao ou n_agencia tem que ser diferente ou entao by_website tem de ser true
    ';

ALTER TABLE operacao
    ADD CONSTRAINT levantamento_or_deposito_ck_2 CHECK ( lower(v_tipo) IN (
        'levantamento',
        'deposito'
    ) );

ALTER TABLE operacao
    ADD CONSTRAINT not_null_origin_values_ck_1 CHECK ( ( n_cartao IS NOT NULL
                                                         OR n_agencia IS NOT NULL )
                                                       OR b_by_website = 1 );

ALTER TABLE operacao ADD CONSTRAINT operacoes_pk PRIMARY KEY ( n_operacao );


    
CREATE SEQUENCE SEQ_PAIS MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE pais (
    n_pais   NUMBER(4) NOT NULL DEFAULT SEQ_PAIS.NEXTVAL,
    v_pais   VARCHAR2(20 CHAR) NOT NULL
)
LOGGING;

COMMENT ON TABLE pais IS
    'Tabela de pais
    Os primeiros dados são importados atráves de uma external table -> distrito_ext';

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( n_pais );



CREATE SEQUENCE SEQ_PESSOA MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE pessoa (
    n_pessoa            NUMBER(20) NOT NULL DEFAULT SEQ_PESSOA.NEXTVAL,
    v_nome              VARCHAR2(20) NOT NULL,
    d_data_nascimento   DATE NOT NULL,
    n_nif               NUMBER(12) NOT NULL,
    v_profissao         VARCHAR2(20),
    n_pais              NUMBER(4) NOT NULL,
    n_destrito          NUMBER(10) NOT NULL,
    n_cidade            NUMBER(10) NOT NULL,
    v_cod_postal        VARCHAR2(8)
)
LOGGING;

COMMENT ON TABLE pessoa IS
    'Tabela de pessoa';

ALTER TABLE pessoa ADD CONSTRAINT pessoa_pk PRIMARY KEY ( n_pessoa );



CREATE SEQUENCE SEQ_PRODUTOS MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;


CREATE TABLE produtos (
    n_produto        NUMBER(10) NOT NULL DEFAULT SEQ_PRODUTOS.NEXTVAL,
    v_nome           VARCHAR2(20 CHAR) NOT NULL,
    n_tipo_produto   NUMBER(10) NOT NULL
)
LOGGING;


COMMENT ON TABLE produto IS
    'Tabela de produto';

ALTER TABLE produtos ADD CONSTRAINT produtos_pk PRIMARY KEY ( n_produto );

CREATE TABLE sub_titulares (
    n_cliente   NUMBER(10) NOT NULL,
    v_iban      NVARCHAR2(20) NOT NULL
)
LOGGING;

ALTER TABLE sub_titulares ADD CONSTRAINT sub_titulares_pk PRIMARY KEY ( n_cliente );

CREATE SEQUENCE SEQ_TIPO_PRODUTO MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE tipo_produto (
    n_tipo_produto   NUMBER(10) NOT NULL default seq_tipo_produto.nextval,
    v_nome           VARCHAR2(20) NOT NULL
)
LOGGING;

COMMENT ON TABLE tipo_produto IS
    'Tabela de tipo_produto';


ALTER TABLE tipo_produto ADD CONSTRAINT tipo_produto_pk PRIMARY KEY ( n_tipo_produto );

ALTER TABLE tipo_produto ADD CONSTRAINT tipo_produto__unv1 UNIQUE ( v_nome );


CREATE SEQUENCE SEQ_TRANSACAO MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE transacoes (
    n_transacao   NUMBER(20) NOT NULL DEFAULT SEQ_TRANSACAO.NEXTVAL,
    f_valor       NUMBER(20, 3),
    d_data        DATE NOT NULL,
    n_categoria   NUMBER(4) NOT NULL,
    v_emissor     NVARCHAR2(20) NOT NULL,
    v_recetor     NVARCHAR2(20) NOT NULL
) PCTFREE 0 
LOGGING;


COMMENT ON TABLE transacoes IS
    'Tabela de transacoes';

ALTER TABLE transacoes ADD CONSTRAINT duplicated_accounts_ck_1 CHECK ( v_emissor != v_recetor );

ALTER TABLE transacoes ADD CONSTRAINT transacoes_pk PRIMARY KEY ( n_transacao );

    
CREATE TABLE website_login (
    v_username   VARCHAR2(20 CHAR) NOT NULL,
    v_password   NVARCHAR2(20) NOT NULL,
    n_cliente    NUMBER(10) NOT NULL
)
LOGGING;


COMMENT ON TABLE website_login IS
    'Tabela de website_login';

ALTER TABLE website_login ADD CONSTRAINT website_login_pk PRIMARY KEY ( v_username );

ALTER TABLE website_login ADD CONSTRAINT website_login__un UNIQUE ( n_cliente );

ALTER TABLE agencia
    ADD CONSTRAINT agencia_cidade_fk FOREIGN KEY ( n_cidade )
        REFERENCES cidade ( n_cidade )
    NOT DEFERRABLE;

ALTER TABLE agencia
    ADD CONSTRAINT agencia_destrito_fk FOREIGN KEY ( n_destrito )
        REFERENCES destrito ( n_destrito )
    NOT DEFERRABLE;

ALTER TABLE agencia
    ADD CONSTRAINT agencia_funcionario_fk FOREIGN KEY ( n_gerente )
        REFERENCES funcionario ( n_funcionario )
    NOT DEFERRABLE;

ALTER TABLE agencia
    ADD CONSTRAINT agencia_pais_fk FOREIGN KEY ( n_pais )
        REFERENCES pais ( n_pais )
    NOT DEFERRABLE;

ALTER TABLE cartao_debito
    ADD CONSTRAINT cartao_debito_cliente_fk FOREIGN KEY ( n_titular )
        REFERENCES cliente ( n_cliente )
    NOT DEFERRABLE;

ALTER TABLE cartao_debito
    ADD CONSTRAINT cartao_debito_contas_fk FOREIGN KEY ( v_iban )
        REFERENCES contas ( v_iban )
    NOT DEFERRABLE;

ALTER TABLE cliente
    ADD CONSTRAINT cliente_agencia_fk FOREIGN KEY ( n_agencia )
        REFERENCES agencia ( n_agencia )
    NOT DEFERRABLE;

ALTER TABLE cliente
    ADD CONSTRAINT cliente_pessoa_fk FOREIGN KEY ( n_pessoa )
        REFERENCES pessoa ( n_pessoa )
    NOT DEFERRABLE;

ALTER TABLE contas
    ADD CONSTRAINT contas_cliente_fk FOREIGN KEY ( n_cliente )
        REFERENCES cliente ( n_cliente )
    NOT DEFERRABLE;

ALTER TABLE contas
    ADD CONSTRAINT contas_produtos_fk FOREIGN KEY ( n_produto )
        REFERENCES produtos ( n_produto )
    NOT DEFERRABLE;

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_funcionario_fk FOREIGN KEY ( n_gerente )
        REFERENCES funcionario ( n_funcionario )
    NOT DEFERRABLE;

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_pessoa_fk FOREIGN KEY ( n_pessoa )
        REFERENCES pessoa ( n_pessoa )
    NOT DEFERRABLE;

ALTER TABLE operacao
    ADD CONSTRAINT operacoes_agencia_fk FOREIGN KEY ( n_agencia )
        REFERENCES agencia ( n_agencia )
    NOT DEFERRABLE;

ALTER TABLE operacao
    ADD CONSTRAINT operacoes_cartao_debito_fk FOREIGN KEY ( n_cartao )
        REFERENCES cartao_debito ( n_cartao )
    NOT DEFERRABLE;

ALTER TABLE pessoa
    ADD CONSTRAINT pessoa_cidade_fk FOREIGN KEY ( n_cidade )
        REFERENCES cidade ( n_cidade )
    NOT DEFERRABLE;

ALTER TABLE pessoa
    ADD CONSTRAINT pessoa_destrito_fk FOREIGN KEY ( n_destrito )
        REFERENCES destrito ( n_destrito )
    NOT DEFERRABLE;

ALTER TABLE pessoa
    ADD CONSTRAINT pessoa_pais_fk FOREIGN KEY ( n_pais )
        REFERENCES pais ( n_pais )
    NOT DEFERRABLE;

ALTER TABLE produtos
    ADD CONSTRAINT produtos_tipo_produto_fk FOREIGN KEY ( n_tipo_produto )
        REFERENCES tipo_produto ( n_tipo_produto )
    NOT DEFERRABLE;

ALTER TABLE sub_titulares
    ADD CONSTRAINT sub_titulares_cliente_fk FOREIGN KEY ( n_cliente )
        REFERENCES cliente ( n_cliente )
    NOT DEFERRABLE;

ALTER TABLE sub_titulares
    ADD CONSTRAINT sub_titulares_contas_fk FOREIGN KEY ( v_iban )
        REFERENCES contas ( v_iban )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE transacoes
    ADD CONSTRAINT transacoes_categorias_transacoes_fk FOREIGN KEY ( n_categoria )
        REFERENCES categorias_transacoes ( n_categoria )
    NOT DEFERRABLE;

ALTER TABLE transacoes
    ADD CONSTRAINT transacoes_contas_fk FOREIGN KEY ( v_recetor )
        REFERENCES contas ( v_iban )
    NOT DEFERRABLE;

ALTER TABLE transacoes
    ADD CONSTRAINT transacoes_contas_fkv1 FOREIGN KEY ( v_emissor )
        REFERENCES contas ( v_iban )
    NOT DEFERRABLE;

ALTER TABLE website_login
    ADD CONSTRAINT website_login_cliente_fk FOREIGN KEY ( n_cliente )
        REFERENCES cliente ( n_cliente )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            16
-- CREATE INDEX                             0
-- ALTER TABLE                             49
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
