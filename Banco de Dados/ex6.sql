USE biamaia;

CREATE TABLE Folha_Pagto ( medico_cod int, consulta_cod int, valor float,
primary key(medico_cod, consulta_cod),
foreign key (medico_cod) references Medico(cod),
foreign key (consulta_cod) references Consulta(cod));

INSERT INTO Folha_Pagto VALUES (1,1,100), (1,2,150),(2,3,100), (2, 4, 150), (3,5,50);

--1.
SELECT e.nome
FROM Medico m JOIN MedicoEspecialidade me ON m.cod = me.medico_cod JOIN Especialidade e ON e.cod = me.especialidade_cod
WHERE m.nome = 'Paulo';

--2.
SELECT c.`data` 
FROM Consulta c JOIN Medico m ON c.medico_cod = m.cod 
WHERE m.nome = 'Arthur'

--3.
SELECT m.nome, c2.nome, c2.endereco 
FROM Consulta c JOIN Medico m ON m.cod = c.medico_cod JOIN Clinica c2 ON c.clinica_cod = c2.cod JOIN Especialidade e ON c.especialidade_cod = e.cod 
WHERE e.nome = 'CLiNiCO GERAL'

--5.Mostre o nome e o endereço das clínicas que possuem consulta marcada para 30/03/2010

SELECT c2.nome, c2.endereco 
FROM Consulta c JOIN Clinica c2 ON c.clinica_cod = c2.cod 
WHERE c.`data`  = '2010-3-30'

--6.Recuperar nome dos médicos que atendem na Clínica Bem Estar;

SELECT m.nome 
FROM Medico m JOIN MedicoClinica mc ON m.cod = mc.medico_cod JOIN Clinica c ON c.cod = mc.clinica_cod 
WHERE c.nome = 'clinica bem estar'

--7.Exiba o nome e endereço das clínicas onde o médico André trabalha;

SELECT c.nome, c.endereco 
FROM Clinica c JOIN MedicoClinica mc ON c.cod = mc.clinica_cod  JOIN Medico m ON m.cod =mc.medico_cod 
WHERE m.nome = 'Andre'

--8.insira 2 clinicas

iNSERT iNTO Clinica VALUES (11, 'clinica Deus eh bom', 'Barreiro');
iNSERT iNTO Clinica VALUES (12, 'clinica e o mal nao presta', 'barro branco');

--9.Insira 2 médicos

iNSERT iNTO Medico VALUES (11,'Leandrinha', '2020-2020');
iNSERT iNTO Medico VALUES (12,'Diego','3030-3030');

--10.Liste o Nome das Clinicas e suas especialidades

SELECT c.nome, e.nome 
FROM Clinica c JOIN EspecialidadeClinica ec ON c.cod = ec.clinica_cod JOIN Especialidade e ON e.cod = ec.especialidade_cod 

--11.Liste o Nome de todas as clinicas e suas Especialidade.Clinicas que não possuem especialidade devem aparecer. Ordenar o resultado pelo nome da Clinica e Especialidade.

SELECT c.nome, e.nome 
FROM Clinica c  LEFT JOIN EspecialidadeClinica ec ON c.cod = ec.clinica_cod LEFT JOIN Especialidade e ON e.cod = ec.especialidade_cod 
ORDER BY c.nome, e.nome 

--12. Liste o nome de todos os médicos cadastrados e para aqueles que tem consulta, listar a data e hora da consulta.

SELECT m.nome, c.`data` , c.hora 
FROM Medico m LEFT JOIN Consulta c ON m.cod = c.medico_cod 

--13.Liste para cada médico, o seu nome e a quantidade de consultas que ele possui.

SELECT m.nome, COUNT(c.medico_cod) 
FROM Medico m JOIN Consulta c ON m.cod = c.medico_cod 
GROUP BY (c.medico_cod)

--14.Liste para cada médico, o seu nome e a quantidade de consultas que ele
 possui. Médicos que não possuem consulta também devem aparecer no
resultado.

SELECT m.nome, COUNT(c.medico_cod) 
FROM Medico m LEFT JOIN Consulta c ON m.cod = c.medico_cod 
GROUP BY (c.medico_cod)

--16.Listar nomes das Clinicas que tem especialidade

SELECT c.nome
FROM Clinica c
WHERE c.cod IN (SELECT ec.clinica_cod FROM EspecialidadeClinica ec)

--17. Listar nomes dos médicos que não tem consulta

SELECT m.nome
FROM Medico m
WHERE m.cod NOT IN (SELECT c.medico_cod FROM Consulta c)

--18. Listar nomes dos médicos que atendem na Clinica ortocentro

SELECT m.nome
FROM Medico m 
WHERE m.cod IN (SELECT mc.medico_cod  FROM MedicoClinica mc JOIN Clinica c ON c.cod = mc.clinica_cod WHERE c.nome = 'ortocentro')

--19. Crie a tabela Folha_pagto e insira os dados:

CREATE TABLE Folha_Pagto ( medico_cod int, consulta_cod int, valor float,
primary key(medico_cod, consulta_cod),
foreign key (medico_cod) references Medico(cod),
foreign key (consulta_cod) references Consulta(cod));

INSERT INTO Folha_Pagto VALUES (1,1,100), (1,2,150),(2,3,100), (2, 4, 150), (3,5,50);

--20.Listar nomes dos médicos que recebem valor da consulta maior que a média:

SELECT m.nome
FROM Folha_Pagto fp JOIN Medico m ON fp.medico_cod = m.cod
WHERE fp.valor > (SELECT AVG (fp2.valor) FROM Folha_Pagto fp2);

--21.Listar nome dos médidos que não estão na folha de pagto

SELECT m.nome
FROM Medico m
WHERE m.cod NOT IN (SELECT fp.medico_cod FROM Folha_Pagto fp)

--22.Listar nome dos médicos e para aqueles que estão na folha de pagto, listar a média de salário

SELECT m.nome, AVG (fp.valor)
FROM Medico m LEFT JOIN Folha_Pagto fp ON m.cod = fp.medico_cod 
GROUP BY m.cod;









