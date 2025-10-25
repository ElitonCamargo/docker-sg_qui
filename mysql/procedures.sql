
DROP PROCEDURE IF EXISTS duplicar_projeto;
DROP PROCEDURE IF EXISTS etapa_alterarOrdem;
DROP PROCEDURE IF EXISTS etapa_mp_alterarOrdemMateriasPrimas;
DROP PROCEDURE IF EXISTS mp_precentual_nutriente;
DROP PROCEDURE IF EXISTS projeto_marcarVisualizacao;
DROP PROCEDURE IF EXISTS token_consultar;
DROP PROCEDURE IF EXISTS token_extender;
DROP PROCEDURE IF EXISTS token_criar;

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS `duplicar_projeto`(IN `projeto_base_id` INT)
BEGIN
    DECLARE novo_projeto_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        ROLLBACK;        
    END;
    
	START TRANSACTION;    
    
    
    INSERT INTO projeto (nome, descricao, data_inicio, data_termino, densidade, ph, tipo, aplicacao, natureza_fisica, status)
    SELECT CONCAT(nome, ' (Copy)'), descricao, data_inicio, data_termino, densidade, ph, tipo, aplicacao, natureza_fisica, status
    FROM projeto
    WHERE id = projeto_base_id;
    
    SET novo_projeto_id = LAST_INSERT_ID();
    
    
    INSERT INTO etapa (projeto, nome, descricao, ordem)
    SELECT novo_projeto_id, nome, descricao, ordem
    FROM etapa
    WHERE projeto = projeto_base_id;
    
    
    CREATE TEMPORARY TABLE etapa_mapeamento AS
    SELECT e_base.id AS base_etapa_id, e_new.id AS new_etapa_id
    FROM 
	etapa e_base
    JOIN 
	etapa e_new ON e_base.ordem = e_new.ordem AND e_base.projeto = projeto_base_id AND e_new.projeto = novo_projeto_id;
    
    
    INSERT INTO etapa_mp (etapa, mp, percentual, tempo_agitacao, observacao, ordem)
    SELECT emap.new_etapa_id, em.mp, em.percentual, em.tempo_agitacao, em.observacao, em.ordem
    FROM 
	etapa_mp em
    JOIN 
	etapa_mapeamento emap ON em.etapa = emap.base_etapa_id;

    DROP TEMPORARY TABLE etapa_mapeamento;

    SELECT * FROM projeto WHERE projeto.id = novo_projeto_id;
    
COMMIT;
END$$



CREATE PROCEDURE IF NOT EXISTS `etapa_alterarOrdem`(IN `ordemEtapa` JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE total INT DEFAULT JSON_LENGTH(ordemEtapa);
    DECLARE etapaId INT;
    DECLARE etapaOrdem INT;

    
    START TRANSACTION;

    
    WHILE i < total DO
        
        SET etapaId = JSON_UNQUOTE(JSON_EXTRACT(ordemEtapa, CONCAT('$[', i, '].id')));
        SET etapaOrdem = JSON_UNQUOTE(JSON_EXTRACT(ordemEtapa, CONCAT('$[', i, '].ordem')));
        
        
        UPDATE etapa SET ordem = etapaOrdem WHERE id = etapaId;
        
        
        SET i = i + 1;
    END WHILE;

    
    COMMIT;
END$$


CREATE PROCEDURE IF NOT EXISTS `etapa_mp_alterarOrdemMateriasPrimas`(IN `ordemMateriasPrimas` JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE total INT DEFAULT JSON_LENGTH(ordemMateriasPrimas);
    DECLARE _id INT;
    DECLARE etapaId INT;
    DECLARE materiaPrimaOrdem INT;

    
    START TRANSACTION;

    
    WHILE i < total DO
        
        SET _id = JSON_UNQUOTE(JSON_EXTRACT(ordemMateriasPrimas, CONCAT('$[', i, '].id')));
        SET etapaId = JSON_UNQUOTE(JSON_EXTRACT(ordemMateriasPrimas, CONCAT('$[', i, '].etapa')));
        SET materiaPrimaOrdem = JSON_UNQUOTE(JSON_EXTRACT(ordemMateriasPrimas, CONCAT('$[', i, '].ordem')));
        
        
        UPDATE etapa_mp SET etapa = etapaId,  ordem = materiaPrimaOrdem WHERE id = _id;
        
        
        SET i = i + 1;
    END WHILE;

    
    COMMIT;
END$$


CREATE PROCEDURE IF NOT EXISTS `mp_precentual_nutriente`(IN `_nutriente` INT, IN `_percentual` DOUBLE)
SELECT
	materia_prima.id 					as mp_id,
	materia_prima.nome 					as mp_nome,
	materia_prima.formula 				as mp_formula,
	(_percentual * 100) / garantia.percentual 	as percentual,
    nutriente_percentualComposicao(materia_prima.id, ((_percentual * 100) / garantia.percentual)) as composicao
FROM
	nutriente
	JOIN
	garantia ON nutriente.id = garantia.nutriente
	JOIN
	materia_prima ON garantia.materia_prima = materia_prima.id
WHERE
	nutriente.id = _nutriente AND ((_percentual * 100) / garantia.percentual) < 100
    ORDER BY percentual ASC$$



CREATE PROCEDURE IF NOT EXISTS `projeto_marcarVisualizacao`(IN `id` INT)
BEGIN
    UPDATE projeto SET updatedAt = CURRENT_TIMESTAMP WHERE projeto.id = id;
END$$


CREATE PROCEDURE IF NOT EXISTS `token_consultar`(IN `_chave_token` VARCHAR(255))
BEGIN
	SET @usuario = SUBSTRING_INDEX(_chave_token, '.', 1);
	SELECT * FROM token WHERE token.usuario = @usuario AND token.chave_token LIKE _chave_token;
END$$


CREATE PROCEDURE IF NOT EXISTS `token_criar`(IN `_usuario` INT, IN `_validade` INT, IN `_chave_token` VARCHAR(255))
BEGIN
    SET @token = CONCAT(_usuario, '.', _chave_token);
    SET @vaidade = DATE_ADD(CURRENT_TIMESTAMP, INTERVAL _validade HOUR);
    INSERT INTO token(usuario, chave_token, validade) VALUES(_usuario, @token, @vaidade) ON DUPLICATE KEY UPDATE chave_token = VALUES(chave_token), validade = VALUES(validade);
    SELECT * FROM token WHERE token.usuario = _usuario;
END$$


CREATE PROCEDURE IF NOT EXISTS `token_extender`(IN `_usuario` INT, IN `_horas` INT)
    NO SQL
UPDATE token
SET 
	validade = DATE_ADD(validade, INTERVAL _horas HOUR)
WHERE 
	token.usuario = _usuario$$
	
DELIMITER ;