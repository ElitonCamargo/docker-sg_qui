import pool from '../database/data.js';

export const cadastrar = async (projeto={},loginId=0) => {    
    let cx;
    try {
        let valores = [];
        let campos = '';
        let placeholders = '';
        
        if('status' in projeto){
            campos += 'status,'
            placeholders += `JSON_ARRAY(JSON_OBJECT('status',  '${projeto['status']}', 'data_alteracao', (SELECT CURRENT_TIMESTAMP), 'id_responsavel', '${loginId}')),`;
            delete projeto['status'];
        }
        if('aplicacao' in projeto){
            campos += 'aplicacao,'
            let aplic = JSON.stringify(projeto['aplicacao'].splice(','));
            placeholders += `'${aplic}', `;
            delete projeto['aplicacao'];
        }   

        for(const key in projeto){
            campos += `${key},`;            
            placeholders += '?,';
            valores.push(projeto[key]);            
        }
        campos = campos.slice(0, -1);
        placeholders = placeholders.slice(0, -1);
        const cmdSql = `INSERT INTO projeto (${campos}) VALUES (${placeholders});`;        
        cx = await pool.getConnection();
        await cx.query(cmdSql, valores);

        const [result] = await cx.query('SELECT LAST_INSERT_ID() as lastId');
        const lastId = result[0].lastId;

        const [dados, meta_dados] = await cx.query('SELECT * FROM projeto WHERE id = ?;', [lastId]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const duplicar = async (id = 0) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'CALL duplicar_projeto(?)';
        const [dados] = await cx.query(cmdSql, [id]);
        return dados[0];
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const alterar = async (projeto={},loginId=0) => {
    let cx;
    try {
        let valores = [];
        let cmdSql = 'UPDATE projeto SET ';

        if('status' in projeto){
            cmdSql += `status = JSON_MERGE_PRESERVE(JSON_ARRAY(JSON_OBJECT('status', '${projeto['status']}', 'data_alteracao', (SELECT CURRENT_TIMESTAMP), 'id_responsavel', '${loginId}')),status), `;
            delete projeto['status'];
        }
        if('aplicacao' in projeto){
            let aplic = JSON.stringify(projeto['aplicacao'].splice(','));
            cmdSql += `aplicacao = '${aplic}', `;
            delete projeto['aplicacao'];
        }
        else{
            cmdSql += `aplicacao = null, `;
        }

        for(const key in projeto){
            valores.push(projeto[key]);
            cmdSql += `${key} = ?, `;
        }

        cmdSql = cmdSql.replace(', id = ?,', '');
        cmdSql += 'WHERE id = ?;';
        cx = await pool.getConnection();  
        const [execucao] = await cx.query(cmdSql, valores);
        if(execucao.affectedRows > 0){
            const [dados, meta_dados] = await cx.query('SELECT * FROM projeto WHERE id = ?;', projeto.id);
            return dados;
        }
        return [];

    }
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const consultar = async (filtro = '') => {
    let cx;
    try {        
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM projeto WHERE nome LIKE ? or descricao LIKE ? ORDER BY updatedAt DESC;';
        const [dados, meta_dados] = await cx.query(cmdSql, [`%${filtro}%`,`%${filtro}%`]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

const filtroAvancado = (projetos=[], filtroConsulta)=>{
    let dados_essenciais = projetos.map((projeto)=>{
        let result = {
            projeto_id: projeto.id,
            materias_primas:[],
            nutrientes:[]
        }
        projeto.etapas.forEach(etapa =>{
            etapa.etapa_mp.forEach(mp=>{
                result.materias_primas.push({
                    id: mp.mp_id,
                    percentual: mp.percentual
                })
            })
        })
        projeto.nutrientes.forEach(nutr => {
            result.nutrientes.push({
                id: nutr.id,
                percentual: nutr.percentual
            })
        });
        return result;
    });
    
    const filtrar = (dados_essenciais=[] , filtroConsulta = {}) => {
        return dados_essenciais.filter(projeto => {
               const todasMateriasPrimas = filtroConsulta.materia_prima.every(filtroMateriaPrima => {
                return projeto.materias_primas.some(materiaPrima => {
                    return materiaPrima.id == filtroMateriaPrima.id && (materiaPrima.percentual >= filtroMateriaPrima.percentual[0] && materiaPrima.percentual <= filtroMateriaPrima.percentual[1]);
                });
            });    

            const todosNutrientes = filtroConsulta.nutriente.every(filtroNutriente => {
                return projeto.nutrientes.some(nutriente => {
                    return nutriente.id == filtroNutriente.id && (nutriente.percentual >= filtroNutriente.percentual[0] && nutriente.percentual <= filtroNutriente.percentual[1]);
                });
            });
            return todasMateriasPrimas && todosNutrientes;
        });
    };
    return (filtrar(dados_essenciais, filtroConsulta)).map(projeto=>projeto.projeto_id); //Retorna apenas os IDs
    // return filtrar(dados_essenciais, filtroConsulta);
}

export const consultarFiltroAvacado = async (filtro = []) => {
    let cx;
    try {
        let filtroConsulta = {
            materia_prima:[], 
            nutriente:[] 
        }
        filtro = JSON.parse(filtro);
        // Separar os filtros em materia_prima e nutriente
        filtro.forEach(elemento => {
            if (elemento.tipo === "nutriente") {
                filtroConsulta.nutriente.push({id: elemento.id, percentual: [elemento.percentual[0],elemento.percentual[1]]});
            } else{
                filtroConsulta.materia_prima.push({id: elemento.id, percentual: [elemento.percentual[0],elemento.percentual[1]]});
            }
        });

        let cmdSelectMp = '';
        let cmdSelectNut = '';

        // Construir a parte do SQL para materia_prima
        if (filtroConsulta.materia_prima.length > 0) {
            cmdSelectMp = "SELECT DISTINCT projeto_id FROM projeto_detalhado WHERE ";
            cmdSelectMp += filtroConsulta.materia_prima.map(elemento =>
                `(materia_prima_id = ${elemento.id} AND etapa_mp_percentual BETWEEN ${elemento.percentual[0]} AND ${elemento.percentual[1]})`
            ).join(' OR ');
        }

        // Construir a parte do SQL para nutriente
        if (filtroConsulta.nutriente.length > 0) {
            cmdSelectNut = "SELECT DISTINCT projeto_id FROM percentual_nutriente_projeto WHERE ";
            cmdSelectNut += filtroConsulta.nutriente.map(elemento =>
                `(nutriente_id = ${elemento.id} AND percentual_nutriente BETWEEN ${elemento.percentual[0]} AND ${elemento.percentual[1]})`
            ).join(' OR ');
        }

        // Construir o comando SQL final
        const cmdSql = `
            SELECT projeto_detalhado.* 
            FROM projeto_detalhado
            INNER JOIN (
                ${cmdSelectMp ? cmdSelectMp : ''} 
                ${cmdSelectMp && cmdSelectNut ? ' UNION ' : ''} 
                ${cmdSelectNut ? cmdSelectNut : ''} 
            ) AS pnp
            ON projeto_detalhado.projeto_id = pnp.projeto_id;
        `;

        // Executar a consulta no banco de dados
        cx = await pool.getConnection();
        const [dados, meta_dados] = await cx.query(cmdSql.trim());
        let projetos = estruturarProjeto(dados);        
        let IDs_projeto_compativeis = filtroAvancado(projetos, filtroConsulta);
        return projetos.filter(projeto=>{
            return IDs_projeto_compativeis.some(id => id == projeto.id);
        })

    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const estruturarProjeto = (dados) => {
    let projetos = [];
    const addProjeto = (projeto = {}) => {
        let projetoExistente = projetos.find(p => p.id === projeto.projeto_id);
        if (!projetoExistente) {
            projetoExistente = {
                "id": projeto.projeto_id,
                "codigo": projeto.projeto_codigo,
                "nome": projeto.projeto_nome,
                "cliente": projeto.projeto_cliente,
                "descricao": projeto.projeto_descricao,
                "data_inicio": projeto.projeto_data_inicio,
                "data_termino": projeto.projeto_data_termino,
                "densidade": projeto.projeto_densidade,
                "ph": projeto.projeto_ph,
                "tipo": projeto.projeto_tipo,
                "aplicacao": projeto.projeto_aplicacao,
                "natureza_fisica": projeto.projeto_natureza_fisica,
                "status": projeto.projeto_status,
                "etapas": [],
                "nutrientes": [],
                "percentual_concluido": 0,
                "dencidade_estimada": 0,
                "createdAt": projeto.projeto_createdAt,
                "updatedAt": projeto.projeto_updatedAt

            };
            projetos.push(projetoExistente);
        }
        return projetoExistente;
    }

    const addEtapasProjeto = (etapa, projeto) => {       
        let etapaExistente = projeto.etapas.find(e => e.id === etapa.etapa_id);
        if (!etapaExistente) {
            etapaExistente = {
                "id": etapa.etapa_id,
                "nome": etapa.etapa_nome,
                "descricao": etapa.etapa_descricao,
                "ordem": etapa.etapa_ordem,
                "etapa_mp": []
            };
            if(etapaExistente.id){
                projeto.etapas.push(etapaExistente);    
            }
        }
        return etapaExistente;        
    }

    const addEtapa_MpEtapas = (etapa_mp, etapa, projeto) => {
        if (etapa_mp.etapa_mp_id) {
            let etapa_MpExistente = etapa.etapa_mp.find(e_mp => e_mp.id === etapa_mp.etapa_mp_id);
            if (!etapa_MpExistente) {
                etapa.etapa_mp.push({
                    "id": etapa_mp.etapa_mp_id,
                    "mp_id": etapa_mp.materia_prima_id,
                    "mp_codigo": etapa_mp.materia_prima_codigo,
                    "materia_prima": etapa_mp.materia_prima_nome,
                    "percentual": etapa_mp.etapa_mp_percentual,
                    "tempo_agitacao": etapa_mp.etapa_mp_tempo_agitacao,
                    "observacao": etapa_mp.etapa_mp_observacao,
                    "lote": etapa_mp.etapa_mp_lote,
                    "ordem": etapa_mp.etapa_mp_ordem
                });
                projeto.dencidade_estimada += etapa_mp.parcial_densidade || 0;
            }
        }
    }

    const addNutrientes = (nutriente, projeto) => {
        if (nutriente.nutriente_id) {
            let index_nutriente = projeto.nutrientes.findIndex(n => n.id === nutriente.nutriente_id);
            if (index_nutriente === -1) {
                projeto.nutrientes.push({
                    "id": nutriente.nutriente_id,
                    "nome": nutriente.nutriente_nome,
                    "formula": nutriente.nutriente_formula,
                    "visivel": nutriente.nutriente_visivel,
                    "percentual": nutriente.percentual_origem,
                    "origem": [{
                        "mp": nutriente.materia_prima_nome,
                        "percentual": nutriente.percentual_origem
                    }]
                });
            } else {
                projeto.nutrientes[index_nutriente].percentual += nutriente.percentual_origem;
                projeto.nutrientes[index_nutriente].origem.push({
                    "mp": nutriente.materia_prima_nome,
                    "percentual": nutriente.percentual_origem
                });
            }
        }
    };

    if (dados) {
        for (const elemento of dados) {
            let projeto_referenciado = addProjeto(elemento);
            let etapa_referenciada = addEtapasProjeto(elemento, projeto_referenciado);
            addEtapa_MpEtapas(elemento, etapa_referenciada, projeto_referenciado);
            addNutrientes(elemento, projeto_referenciado);
            // Atualizar percentual_concluido e densidade_estimada
            projeto_referenciado.percentual_concluido = projeto_referenciado.etapas.reduce((total, etapa) => 
                total + etapa.etapa_mp.reduce((subtotal, mp) => subtotal + mp.percentual, 0), 0);
        }
    }
    //console.log(projetos[0].etapas);
    return projetos;
};


export const consultarPorId = async (id) => {
    let cx;
    try {
        cx = await pool.getConnection();
        cx.query("CALL projeto_marcarVisualizacao(?)", [id]);
        const cmdSql = 'SELECT * FROM projeto WHERE id = ?;';
        const [dados, meta_dados] = await cx.query(cmdSql, [id]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const consultarPorCodigo = async (codigo) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM projeto WHERE codigo like ?;';
        const [dados, meta_dados] = await cx.query(cmdSql, [codigo]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const consultarPorData = async (data_inicio="", data_termino="") => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = `
        SELECT * FROM projeto
        WHERE (data_inicio BETWEEN '${data_inicio}' AND '${data_termino}')
           OR (data_termino BETWEEN '${data_inicio}' AND '${data_termino}')
           OR (data_inicio <= '${data_inicio}' AND data_termino >= '${data_termino}')
        ORDER BY updatedAt DESC
        ;
        `;
        const [dados, meta_dados] = await cx.query(cmdSql);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};


export const consultarPorStatus = async (status='') => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = `SELECT * FROM projeto WHERE JSON_UNQUOTE(JSON_EXTRACT(status, '$[0].status')) LIKE ? ORDER BY updatedAt DESC;`; 
        const [dados, meta_dados] = await cx.query(cmdSql,[status]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const deletar = async (id) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'DELETE FROM projeto WHERE id = ?;';
        const [dados, meta_dados] = await cx.query(cmdSql, [id]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

// *************** Consultas Entre vária entidades ***********************

export const consultaDetalhada = async (id) => {
    let cx;
    try { 
        cx = await pool.getConnection();
        cx.query("CALL projeto_marcarVisualizacao(?)", [id]);
        const cmdSql = 'SELECT * FROM projeto_detalhado WHERE projeto_id = ?;';
        const [dados, meta_dados] = await cx.query(cmdSql, [id]);
        return estruturarProjeto(dados);
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};