DROP FUNCTION IF EXISTS nutriente_percentualComposicao;

DELIMITER $$
CREATE FUNCTION IF NOT EXISTS `nutriente_percentualComposicao`(`mp_id` INT, `mp_percentual` DOUBLE) RETURNS json
    DETERMINISTIC
BEGIN
    RETURN (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'nutriente', nutriente.nome,
                'percentual', mp_percentual/100*garantia.percentual
            )
        )
        FROM nutriente
        JOIN garantia ON nutriente.id = garantia.nutriente
        JOIN materia_prima ON garantia.materia_prima = materia_prima.id
        WHERE materia_prima.id = mp_id
    );
END $$
DELIMITER ;