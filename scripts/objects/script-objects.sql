CREATE OR REPLACE VIEW `V_BUSCAR_MEDIA_SALARIAL_POR_ANO` AS
SELECT FORMAT(AVG(pp.salario), 2) as media_salarial, YEAR(pp.data_pesquisa) ano  FROM pessoa p
	JOIN pessoa_entrevista pe on p.id = pe.id_pessoa
	JOIN pesquisa_pandemia pp on pp.id = pe.id_pesquisa
GROUP BY ano;

-- retornar os salarios de cada pessoa durante a pandemia 
CREATE OR REPLACE VIEW `V_BUSCAR_SALARIO_PESSOA_PANDEMIA` AS
SELECT p.id, p.nome, p.cpf, pp.salario, YEAR(pp.data_pesquisa) as ano  FROM pessoa p
	JOIN pessoa_entrevista pe on p.id = pe.id_pessoa
	JOIN pesquisa_pandemia pp on pp.id = pe.id_pesquisa
WHERE YEAR(pp.data_pesquisa) BETWEEN 2020 AND 2022
ORDER BY 5;

-- retornar a quantidade de pessoas por setor informado
DELIMITER //
-- DROP PROCEDURE IF EXISTS PROC_QUANTIDADE_PESSOA_SETOR;
CREATE PROCEDURE `PROC_QUANTIDADE_PESSOA_SETOR` (nomeSetor varchar(50))
BEGIN
SELECT * from pessoa p
	JOIN departamento d ON p.id = d.id_pessoa
WHERE UPPER(d.nome) = UPPER(nomeSetor);
END //
DELIMITER ;

-- chamar os objetos
-- SELECT * FROM V_BUSCAR_MEDIA_SALARIAL_POR_ANO;
-- SELECT * FROM V_BUSCAR_SALARIO_PESSOA_PANDEMIA;
-- CALL PROC_QUANTIDADE_PESSOA_SETOR("tecnologia");