import pool from '../database/data.js';

export const cadastrar = async (etapa_mp={}) => {
    let cx;
    try {
        let values = [];       
        let columns = '';      
        let placeholders = ''; 

        for(const key in etapa_mp){
            columns += `${key},`;       
            placeholders += '?, ';      
            values.push(etapa_mp[key]); 
        }

        columns = columns.slice(0, -1);
        placeholders = placeholders.slice(0, -2);

        let cmdSql = `INSERT INTO etapa_mp (${columns}) VALUES (${placeholders})`;
        // cmdSql += `ON DUPLICATE KEY UPDATE percentual = VALUES(percentual);`;
                
        cx = await pool.getConnection();

        await cx.query(cmdSql, values);

        //const [result] = await cx.query('SELECT LAST_INSERT_ID() as lastId');
        //const lastId = result[0].lastId;

        // const [dados] = await cx.query('SELECT * FROM etapa_mp WHERE id = ?;', [lastId]);
        const [dados] = await cx.query('SELECT * FROM etapa_mp WHERE etapa = ? and mp = ?;', [values[0], values[1]]);

        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

export const alterar = async (etapa_mp={}) => {
    let cx;
    try {
        let values = [];               
        let columns_placeholders = ''; 

        for(const key in etapa_mp){
            columns_placeholders += `${key}=?,`;
            values.push(etapa_mp[key]);         
        }
        values.push(etapa_mp.id);  

        columns_placeholders = columns_placeholders.slice(0, -1);

        const cmdSql = `UPDATE etapa_mp SET ${columns_placeholders} WHERE id = ?`;

        cx = await pool.getConnection();

        const [execucao] = await cx.query(cmdSql, values);

        if(execucao.affectedRows > 0){
            const [dados] = await cx.query('SELECT * FROM etapa_mp WHERE id = ?;', [etapa_mp.id]);
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

export const consultarPorEtapa = async (id_etapa) => {
    let cx;
    try {
        cx = await pool.getConnection();        
        const cmdSql = 'SELECT * FROM etapa_mp WHERE etapa_mp.etapa = ? ORDER BY etapa_mp.ordem ASC;';        
        const [dados] = await cx.query(cmdSql, [id_etapa]);        
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
        
        const cmdSql = 'SELECT * FROM etapa_mp WHERE id = ?;';
        
        const [dados] = await cx.query(cmdSql, [id]);
                
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
        try {
            await cx.beginTransaction();
            let cmdSql = 'SELECT etapa, ordem FROM etapa_mp WHERE id = ?;';

            let [result] = await cx.query(cmdSql, [id]);
            console.log(result[0])

            let execucaoDelete ={
                affectedRows:0
            };

            if(result[0]){
                const etapa = result[0].etapa;
                const ordem = result[0].ordem;

                cmdSql = 'DELETE FROM etapa_mp WHERE id = ?;';
                [execucaoDelete] = await cx.query(cmdSql, [id]);

                if (execucaoDelete.affectedRows > 0) {
                    const cmdSql = `UPDATE etapa_mp SET ordem=ordem-1 WHERE etapa = ? AND ordem > ?`;
                    await cx.query(cmdSql, [etapa, ordem]);
                    console.log(etapa,ordem);
                }

            }
           
            console.log(execucaoDelete);
            await cx.commit();

            return execucaoDelete;

        } catch (err) {
            await cx.rollback();
            throw err;
        }
    } catch (error) {
        throw error;
    } finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};


export const alterarOrdem = async (ordemetapa_mp = []) => {
    let cx;
    try {
        
        // Converte a lista de etapas para JSON
        
        let ordemetapa_mpJson = ordemetapa_mp;
        if (typeof ordemetapa_mpJson !== 'string') 
        {
            ordemetapa_mpJson = JSON.stringify(ordemetapa_mpJson);
        }
        
        cx = await pool.getConnection();

        try {
            const cmdSql = `CALL etapa_mp_alterarOrdemMateriasPrimas(?)`;
            await cx.query(cmdSql, [ordemetapa_mpJson]);
            return ordemetapa_mp;
        } catch (err) {
            throw err;
        }
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};
