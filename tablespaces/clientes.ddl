
/*
Imaginando que o banco tenha um inicial de 100 000 clientes com um aumento de 10 % ao ano
um cliente têm entre 1 a 3 contas isto para tabela de contas -> 90 * 300 000 = 27 000 000 ~= 27MB -> tabela de contas
100 000 clientes -> 100 000 bytes ~= 100 KB ~= 0.1MB -> tabela de clientes
Cada cliente em media associa 2 titulares -> (100 000 * 2) * 30 = 6 000 000B ~= 6MB
Cada cliente apenas tem um registo de user no website -> 100 000 * 50 = 5 000 000B ~= 5MB
Cada cliente de 1 a 3 cartões -> 100 000 * 3 * 70 = 21 000 000B ~= 21MB
100 000 cliente ~= 100 000 pessoas -> 100 000 * 105 = 10 500 000B ~= 10.5MB
total = 27 + 0.1 + 6 + 5 + 21 + 10.5 = 69,6 MB ~= 70 MB
com aumento de 10% ao mes -> 70 * 0.1 = 7 
*/
CREATE TABLESPACE clientes 
DATAFILE 'clientes.dat' 
SIZE 70M REUSE AUTOEXTEND ON NEXT 7M
