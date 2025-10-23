import pool from '../database/data.js';

export const consultar = async (filtro = '') => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM elemento WHERE nome LIKE ? or simbolo LIKE ?;';
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
export const consultarPorEstado = async (estado) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM elemento WHERE estado_padrao LIKE ?;';
        const [dados, meta_dados] = await cx.query(cmdSql, [`${estado}`]);
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
        const cmdSql = 'SELECT * FROM elemento WHERE id = ?;';
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

export const consultarPorSimbolo = async (simbolo) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'SELECT * FROM elemento WHERE simbolo = ?;';
        const [dados, meta_dados] = await cx.query(cmdSql, [simbolo]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const cadastrar = async (elemento) => {
    let cx;
    try {
        cx = await pool.getConnection();
        const cmdSql = 'INSERT INTO elemento (simbolo, nome, numero_atomico, massa_atomica, grupo, periodo, ponto_de_fusao, ponto_de_ebulicao, densidade, estado_padrao, configuracao_eletronica, propriedades) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
        const { simbolo, nome, numero_atomico, massa_atomica, grupo, periodo, ponto_de_fusao, ponto_de_ebulicao, densidade, estado_padrao, configuracao_eletronica, propriedades } = elemento;
        await cx.query(cmdSql, [simbolo, nome, numero_atomico, massa_atomica, grupo, periodo, ponto_de_fusao, ponto_de_ebulicao, densidade, estado_padrao, configuracao_eletronica, propriedades]);
        
        // Recuperar o último ID inserido
        const [result] = await cx.query('SELECT LAST_INSERT_ID() as lastId');
        const lastId = result[0].lastId;

        // Consultar o elemento recém-cadastrado pelo último ID
        const [dados, meta_dados] = await cx.query('SELECT * FROM elemento WHERE id = ?;', [lastId]);
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const alterar = async (elemento) => {
    let cx;
    try {
        let valores = [];
        let cmdSql = 'UPDATE elemento SET ';
        for(const key in elemento){
            valores.push(elemento[key]);
            cmdSql += `${key} = ?, `;
        }
        cmdSql = cmdSql.replace(', id = ?,', '');
        cmdSql += 'WHERE id = ?;'
        cx = await pool.getConnection();
        const [execucao] = await cx.query(cmdSql, valores);
        if(execucao.affectedRows > 0){
            const [dados, meta_dados] = await cx.query('SELECT * FROM elemento WHERE id = ?;', elemento.id);
            return dados;
        }
        return [];
    } 
    catch (error) {
        console.error('Erro ao alterar elemento:', error);
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
        const cmdSql = 'DELETE FROM elemento WHERE id = ?;';
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
