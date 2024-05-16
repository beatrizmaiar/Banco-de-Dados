--1.
SELECT *
FROM ATOR
WHERE sexo = 'f';

--2.
SELECT nomeart, nacionalidade, sexo
FROM ATOR;

--3.
SELECT nomeart, indicacoesoscar, oscar
FROM ATOR;

--4.
SELECT codf
FROM PERSONAGEM 
WHERE cache <= 3000
 
--5.
SELECT coda
FROM ATOR
WHERE nomeart = 'DemiMoore' 

--6.
SELECT nome
FROM FILME f, PERSONAGEM p, ATOR a 
WHERE p.coda = a.coda AND f.codf = p.codf AND nomeart = 'DemiMoore';

--7.
SELECT nomeart
FROM ATOR
WHERE nomereal LIKE 'Jessica%'

--8.
SELECT nomeart
FROM ATOR
WHERE idade >=30 AND idade <=40;

--9.
SELECT nomeart
FROM ATOR
WHERE indicacoesoscar - oscar = 2;

--10.
SELECT nomeart
FROM ATOR
ORDER BY nomeart;

--11.
SELECT a.nomeart , a.idade  
FROM ATOR a
ORDER BY a.idade DESC, a.nomereal ASC;

--12.
SELECT a.nomeart, a.nacionalidade
FROM ATOR a, PERSONAGEM p 
WHERE p.coda = a.coda 

