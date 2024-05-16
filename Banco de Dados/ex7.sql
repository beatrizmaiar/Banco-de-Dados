USE biamaia;

CREATE VIEW medico_especialidade as
SELECT m.nome as nomeMedico, e.nome as nomeEspecialidade FROM Medico m, Especialidade e, MedicoEspecialidade me 
WHERE m.cod = me.medico_cod
AND me.especialidade_cod = e.cod ;

-- usando a view contar quantos médicos são cardiologistas 
SELECT COUNT(*)
FROM medico_especialidade me
WHERE nomeEspecialidade = 'Cardiologia';

--1.crie uma tabela Empregado com id, nome e salario.

CREATE TABLE Empregado( id INT AUTO_INCREMENT, nome VARCHAR(20),
salario FLOAT, PRIMARY KEY (id));

--2.criar uma procedure Insere10 para inserir 10 tuplas na tabela Empregado

DELIMITER $$
CREATE PROCEDURE Insere10_bia() BEGIN
DECLARE cont INT; DECLARE v1 CHAR(20); DECLARE v2 INT;
SET cont = 1;
WHILE (cont<=10) DO SET v1 = 'Joao';
SET v2 = 33333*cont;
INSERT INTO Empregado (nome, salario) VALUES(CONCAT(v1,cont),v2);
SET cont = cont + 1; END WHILE;
END $$ DELIMITER ;

CALL Insere10_bia(); SELECT * FROM Empregado e ;


--3.Criar uma procedure que retorne a quantidade de empregados inseridos na tabela 

Empregado
DELIMITER $$
CREATE PROCEDURE qtdEmp(OUT qtd INT)

BEGIN
SELECT	count(*) INTO qtd FROM Empregado e;

END $$ DELIMITER ;

CALL qtdEmp(@total); SELECT @total;

