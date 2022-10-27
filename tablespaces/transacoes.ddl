
/*
Imaginando que um cliente faça 10 operaçoes e 10 transferencias por dia
isto dá 300 operacoes e 300 transferencias por mes por cliente
300 + 300 = 600 registos novos
300 registos operacoes -> 300 * 95 bytes = 28 500 bytes ~= 28 KB
300 registos de transferencia -> 300 * 85 bytes = 25 500 bytes ~= 25KB
tendo inicialmente 100 000 clientes
tamanho inicial -> 100 000 * (28KB + 25KB) = 5 300 000 KB = 5,3 GB
*/
CREATE TABLESPACE transacoes 
DATAFILE 'transacoes.dat' 
SIZE 6 G REUSE AUTOEXTEND ON NEXT 6 G
