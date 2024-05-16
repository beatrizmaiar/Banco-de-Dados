--1.
SELECT m.nome, COUNT(mc .medico_cod)
FROM Medico m, MedicoClinica mc 
WHERE m.cod = me.medico.cod
GROUP BY me.medico_cod 
ORDER BY m.nome 

--2. 
SELECT M.nome
FROM Medico AS M, MedicoEspecialidade AS ME
WHERE M.cod = ME.medico_cod
GROUP BY M.nome
HAVING COUNT(ME.especialidade_cod) = 2;

--3.
SELECT C.nome
FROM Clinica AS C, Consulta AS CO
WHERE C.cod = CO.clinica_cod
GROUP BY C.nome
HAVING AVG(TIME_TO_SEC(CO.hora)) > 20;

--4. 
SELECT C.nome AS Nome_Clinica, E.nome AS Nome_Especialidade
FROM Clinica AS C, EspecialidadeClinica AS EC, Especialidade AS E
WHERE C.cod = EC.clinica_cod AND EC.especialidade_cod = E.cod
ORDER BY C.nome;

--5. 
SELECT C.nome AS Nome_Clinica, COUNT(EC.especialidade_cod) AS Qtd_Especialidades_Atendidas
FROM Clinica AS C, EspecialidadeClinica AS EC
WHERE C.cod = EC.clinica_cod
GROUP BY C.nome;

--6.
SELECT C.nome AS Nome_Clinica
FROM Clinica AS C, MedicoClinica AS MC, Medico AS M
WHERE M.nome = 'Arthur' AND M.cod = MC.medico_cod AND MC.clinica_cod = C.cod;

--7. 
SELECT E.nome AS Nome_Especialidade
FROM Especialidade AS E, MedicoEspecialidade AS ME, Medico AS M
WHERE M.nome = 'Andre' AND M.cod = ME.medico_cod AND ME.especialidade_cod = E.cod;

--8.  
SELECT M.nome
FROM Medico AS M, Consulta AS C
WHERE M.cod = C.medico_cod
GROUP BY M.nome
HAVING MAX(C.hora) = (SELECT MAX(hora) FROM Consulta);

--9.
SELECT M.nome
FROM Medico AS M
WHERE M.cod NOT IN (SELECT DISTINCT medico_cod FROM MedicoClinica);


