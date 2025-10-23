import pool from '../database/data.js';

export const cadastrar = async (configuracao) => {
    let cx;
    try {
        const { key, value } = configuracao;
        const cmdSql = 'INSERT INTO configuracao (`key`, `value`) VALUES (?,?);';
        
        cx = await pool.getConnection();
        await cx.query(cmdSql, [key, JSON.stringify(value)]);

        const [dados] = await cx.query('SELECT * FROM configuracao WHERE `key` = ?;', [key]);
        return dados;
    } 
    catch (error) {
        throw error;
    }
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const alterar = async (configuracao) => {
    let cx;
    try {
        const { key, value, id } = configuracao;
        const cmdSql = 'UPDATE configuracao SET `key`=?, `value`=? WHERE id = ?';

        cx = await pool.getConnection();

        const [execucao] = await cx.query(cmdSql, [key, JSON.stringify(value),id]);

        if(execucao.affectedRows > 0){
            const [dados, meta_dados] = await cx.query('SELECT * FROM configuracao WHERE id = ?;', [id]);
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

export const consultar = async () => {
    let cx;
    try {
        cx = await pool.getConnection();
        const [dados, meta_dados] = await cx.query('SELECT * FROM configuracao');
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
        const [dados, meta_dados] = await cx.query('SELECT * FROM configuracao WHERE id = ?;', [id]);
        return dados;
    } 
    catch (error) {
        throw error;
    }
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const consultarPorKey = async (key) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const [dados, meta_dados] = await cx.query('SELECT * FROM configuracao WHERE `key` = ?;', [key]);
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
        const [dados, meta_dados] = await cx.query('DELETE FROM configuracao WHERE id = ?;', [id]);
        return dados;
    }
    catch (error) {
        throw error;
    }
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};