DROP VIEW IF EXISTS percentual_nutriente_projeto;
DROP VIEW IF EXISTS projeto_detalhado;

DELIMITER $$

CREATE VIEW `projeto_detalhado` AS
SELECT
    projeto.id AS projeto_id,
    projeto.codigo AS projeto_codigo,
    projeto.nome AS projeto_nome,
    projeto.cliente AS projeto_cliente,
    projeto.descricao AS projeto_descricao,
    projeto.data_inicio AS projeto_data_inicio,
    projeto.data_termino AS projeto_data_termino,
    projeto.densidade AS projeto_densidade,
    projeto.ph AS projeto_ph,
    projeto.tipo AS projeto_tipo,
    projeto.aplicacao AS projeto_aplicacao,
    projeto.natureza_fisica AS projeto_natureza_fisica,
    projeto.status AS projeto_status,
    projeto.createdAt AS projeto_createdAt,
    projeto.updatedAt AS projeto_updatedAt,
    etapa.id AS etapa_id,
    etapa.nome AS etapa_nome,
    etapa.descricao AS etapa_descricao,
    etapa.ordem AS etapa_ordem,
    etapa_mp.id AS etapa_mp_id,
    etapa_mp.percentual AS etapa_mp_percentual,
    etapa_mp.tempo_agitacao AS etapa_mp_tempo_agitacao,
    etapa_mp.observacao AS etapa_mp_observacao,
    etapa_mp.lote AS etapa_mp_lote,
    etapa_mp.ordem AS etapa_mp_ordem,
    materia_prima.id AS materia_prima_id,
    materia_prima.codigo AS materia_prima_codigo,
    materia_prima.nome AS materia_prima_nome,
    materia_prima.formula AS materia_prima_formula,
    materia_prima.cas_number AS materia_prima_cas_number,
    materia_prima.densidade AS materia_prima_densidade,
    materia_prima.descricao AS materia_prima_descricao,
    garantia.id AS garantia_id,
    garantia.percentual AS garantia_percentual,
    nutriente.id AS nutriente_id,
    nutriente.nome AS nutriente_nome,
    nutriente.formula AS nutriente_formula,
    nutriente.visivel AS nutriente_visivel,
    (garantia.percentual * etapa_mp.percentual / 100) AS percentual_origem,
    (etapa_mp.percentual / 100 * materia_prima.densidade) AS parcial_densidade
FROM projeto
LEFT JOIN etapa ON projeto.id = etapa.projeto
LEFT JOIN etapa_mp ON etapa.id = etapa_mp.etapa
LEFT JOIN materia_prima ON etapa_mp.mp = materia_prima.id
LEFT JOIN garantia ON materia_prima.id = garantia.materia_prima
LEFT JOIN nutriente ON garantia.nutriente = nutriente.id
ORDER BY projeto.id, etapa.ordem, etapa_mp.ordem, etapa_mp.id DESC$$


CREATE VIEW `percentual_nutriente_projeto` AS
SELECT
    projeto_detalhado.projeto_id AS projeto_id,
    projeto_detalhado.projeto_nome AS projeto_nome,
    projeto_detalhado.nutriente_id AS nutriente_id,
    projeto_detalhado.nutriente_nome AS nutriente_nome,
    SUM(projeto_detalhado.percentual_origem) AS percentual_nutriente
FROM projeto_detalhado
GROUP BY projeto_detalhado.projeto_id, projeto_detalhado.nutriente_id$$

DELIMITER ;
