import pool from '../database/data.js';

export const consultar = async (filtro = '') => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM nutriente WHERE nome LIKE ?;';
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
        const cmdSql = 'SELECT * FROM nutriente WHERE id = ?;';
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

export const cadastrar = async (nutriente) => {
    let cx;
    try {
        const {nome, formula} = nutriente;
        cx = await pool.getConnection();
        const cmdSql = 'INSERT INTO nutriente (nome, formula) VALUES (?, ?)';
        await cx.query(cmdSql, [nome, formula]);

        // Recuperar o último ID inserido
        const [result] = await cx.query('SELECT LAST_INSERT_ID() as lastId');
        const lastId = result[0].lastId;

        // Consultar a empresa recém-cadastrada pelo último ID
        const [dados, meta_dados] = await cx.query('SELECT * FROM nutriente WHERE id = ?;', [lastId]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const alterar = async (nutriente) => {
    let cx;
    try {
        let valores = [];
        let cmdSql = 'UPDATE nutriente SET ';
        for(const key in nutriente){
            valores.push(nutriente[key]);
            cmdSql += `${key} = ?, `;
        }
        cmdSql = cmdSql.replace(', id = ?,', '');
        cmdSql += 'WHERE id = ?;';
        cx = await pool.getConnection();
        const [execucao] = await cx.query(cmdSql, valores);
        if(execucao.affectedRows > 0){
            const [dados, meta_dados] = await cx.query('SELECT * FROM nutriente WHERE id = ?;', nutriente.id);
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
        const cmdSql = 'DELETE FROM nutriente WHERE id = ?;';
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

