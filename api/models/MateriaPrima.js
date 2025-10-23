import pool from '../database/data.js';

export const consultar = async (filtro = '') => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM materia_prima WHERE nome LIKE ?;';
        const [dados, meta_dados] = await cx.query(cmdSql, [`%${filtro}%`]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};


export const consultarPorId = async (id) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM materia_prima WHERE id = ?;';
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
        const cmdSql = 'SELECT * FROM materia_prima WHERE codigo LIKE ?;';
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

export const consultarPorCas_number = async (cas_number) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM materia_prima WHERE cas_number LIKE ?;';
        const [dados, meta_dados] = await cx.query(cmdSql, [cas_number]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const consultarPorFormula = async (formula) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM materia_prima WHERE formula LIKE ?;';
        const [dados, meta_dados] = await cx.query(cmdSql, [`%${formula}%`]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const consultarMP_precentual_nutriente = async (nutriente=0,percentual=0.0) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'CALL mp_precentual_nutriente(?,?);';
        const [dados, meta_dados] = await cx.query(cmdSql, [nutriente,percentual]);
        return dados[0];
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const cadastrar = async (materia_prima) => {
    let cx;
    try {        
        let params_cmdSql = '';
        let values_cmdSql = '';
        let values = [];
        for(const key in materia_prima){
            values.push(materia_prima[key]);
            params_cmdSql += key+','
            values_cmdSql += '?,'
        }
        params_cmdSql = params_cmdSql.slice(0, -1);
        values_cmdSql = values_cmdSql.slice(0, -1);

        const cmdSql = 'INSERT INTO materia_prima ('+params_cmdSql+') VALUES ('+values_cmdSql+')';
        cx = await pool.getConnection();
        await cx.query(cmdSql, values);

        // Recuperar o último ID inserido
        const [result] = await cx.query('SELECT LAST_INSERT_ID() as lastId');
        const lastId = result[0].lastId;

        // Consultar a empresa recém-cadastrada pelo último ID
        const [dados, meta_dados] = await cx.query('SELECT * FROM materia_prima WHERE id = ?;', [lastId]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const alterar = async (materia_prima) => {
    let cx;
    try {
        let valores = [];
        let cmdSql = 'UPDATE materia_prima SET ';
        for(const key in materia_prima){
            valores.push(materia_prima[key]);
            cmdSql += `${key} = ?, `;
        }
        cmdSql = cmdSql.replace(', id = ?,', '');
        cmdSql += 'WHERE id = ?;';
        cx = await pool.getConnection();     
        const [execucao] = await cx.query(cmdSql, valores);
        if(execucao.affectedRows > 0){
            const [dados, meta_dados] = await cx.query('SELECT * FROM materia_prima WHERE id = ?;', materia_prima.id);
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

export const deletar = async (id) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'DELETE FROM materia_prima WHERE id = ?;';
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

