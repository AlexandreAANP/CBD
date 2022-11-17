/*
Imaginando que o banco tem acerca de agencias com 100 funcionarios em cada
Tabela de agencia -> 10 * 65 = 650B
tabela de funcionarios -> 10 * 100 * 50 = 50 000B ~= 50KB
tabela pais, existe ~= 196 paises -> 196 * 25B = 4 900B ~= 5KB
tabela distrito, existe (em portugal) ~= 29 -> 29 * 30 ~= 870B ~= 1KB
tabela cidade, existe (em portugal) ~= 159* 30 = 4 770B ~= 5KB
tabela produtos, o banco contem 2 produtos com categorias 4 ou mais categorias iniciais dando um valor a cima -> 2 * 9 * 40 =  720B
tabela tipos de produtos, mais ou menos 9 produtos diferentes -> 9 * 30 = 270 B
tabela categoria de transacao, mais ou menos 9 categorias diferentes -> 9 * 25 = 225 B
total = 650 + 50 000 + 4 900 + 870 + 4 770 + 720 + 270 + 225 = 62 405 B ~= 63 KB
Estes dados são quase fixos, existe poucas alterações então o aumento do tablespace será apenas 10% do total = 6kb 
*/
CREATE TABLESPACE transacoes 
DATAFILE 'banco.dat' 
SIZE 63K REUSE AUTOEXTEND ON NEXT 6KB
