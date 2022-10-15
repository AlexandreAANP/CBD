CREATE VIEW View_Pessoa AS
SELECT 
N_Pessoa,
V_Nome,
D_Data_nascimento,
N_NIF,
V_Profissao,
pais.v_pais,
destrito.v_destrito,
cidade.v_cidade,
pessoa.v_cod_postal
FROM Pessoa 
INNER JOIN Pais
ON Pessoa.n_pais = pais.n_pais
INNER JOIN Destrito
ON pessoa.n_destrito = destrito.n_destrito
INNER JOIN CIDADE
ON pessoa.n_cidade = cidade.n_cidade
