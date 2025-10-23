import pool from '../database/data.js';
// **************** Tenho que alterar o cadastrar para sempre colocar a quantidade de itens cadastrados por etapa + 1;
// Define e exporta uma função assíncrona chamada 'cadastrar', que recebe 'etapa' (um objeto com valores padrão vazio)
export const cadastrar = async (etapa={}) => {
    let cx;
    try {
        let values = [];       // Cria um array vazio para armazenar os valores dos campos do objeto 'etapa'.
        let columns = '';      // Cria uma string vazia para armazenar os nomes das colunas.
        let placeholders = ''; // Cria uma string vazia para armazenar os placeholders ('?') para a consulta SQL.

        // Itera sobre cada chave no objeto 'etapa'.
        for(const key in etapa){
            columns += `${key},`;         // Adiciona o nome da chave à string 'columns', seguido por uma vírgula.
            placeholders += '?, ';        // Adiciona um placeholder ('?') à string 'placeholders', seguido por uma vírgula.
            values.push(etapa[key]);      // Adiciona o valor correspondente à chave no array 'values'.
        }

        // Remove a última vírgula das strings 'columns' e 'placeholders'.
        columns = columns.slice(0, -1);
        placeholders = placeholders.slice(0, -2);

        // Cria uma string de comando SQL para inserir os valores na tabela 'etapa'.
        const cmdSql = `INSERT INTO etapa (${columns}) VALUES (${placeholders});`;
                
        // Obtém uma conexão do pool de conexões.
        cx = await pool.getConnection();

        // Executa a consulta SQL para inserir os valores na tabela 'etapa'.
        await cx.query(cmdSql, values);

        // Executa uma consulta SQL para obter o último ID inserido.
        const [result] = await cx.query('SELECT LAST_INSERT_ID() as lastId');
        const lastId = result[0].lastId;

        // Executa uma consulta SQL para selecionar todos os dados da tabela 'etapa' onde o ID é igual ao último ID inserido.
        const [dados, meta_dados] = await cx.query('SELECT * FROM etapa WHERE id = ?;', [lastId]);

        // Retorna os dados obtidos na consulta.
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};


// Define e exporta uma função assíncrona chamada 'alterar', que recebe um parâmetro 'etapa' (um objeto com valor padrão vazio).
export const alterar = async (etapa={}) => {
    let cx;
    try {
        let values = [];                 // Cria um array vazio para armazenar os valores dos campos do objeto 'etapa'.
        let columns_placeholders = '';   // Cria uma string vazia para armazenar os pares coluna-placeholder ('coluna=?') para a consulta SQL.

        // Itera sobre cada chave no objeto 'etapa'.
        for(const key in etapa){
            columns_placeholders += `${key}=?,`;  // Adiciona o par 'coluna=?' à string 'columns_placeholders', seguido por uma vírgula.
            values.push(etapa[key]);              // Adiciona o valor correspondente à chave no array 'values'.
        }
        values.push(etapa.id);  // Adiciona o valor do 'id' do objeto 'etapa' ao array 'values'.

        // Remove a última vírgula da string 'columns_placeholders'.
        columns_placeholders = columns_placeholders.slice(0, -1);

        // Cria uma string de comando SQL para atualizar os valores na tabela 'etapa'.
        const cmdSql = `UPDATE etapa SET ${columns_placeholders} WHERE id = ?`;

        // Obtém uma conexão do pool de conexões.
        cx = await pool.getConnection();

        // Executa a consulta SQL para atualizar os valores na tabela 'etapa'.
        const [execucao] = await cx.query(cmdSql, values);

        // Verifica se alguma linha foi afetada pela atualização.
        if(execucao.affectedRows > 0){
            // Se sim, executa uma consulta SQL para selecionar todos os dados da tabela 'etapa' onde o ID é igual ao 'id' do objeto 'etapa'.
            const [dados, meta_dados] = await cx.query('SELECT * FROM etapa WHERE id = ?;', [etapa.id]);
 
            // Retorna os dados obtidos na consulta.
            return dados;
        }
        // Se nenhuma linha foi afetada, retorna um array vazio.
        return [];

    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

// Define e exporta uma função assíncrona chamada 'alterarOrdem', que reorganiza a ordem das etapas dentro de um projeto.
export const alterarOrdem = async (ordemEtapa = []) => {
    let cx;
    try {
        // Converte a lista de etapas para JSON
        let ordemEtapaJson = ordemEtapa;
        if (typeof ordemEtapaJson !== 'string') 
        {
            ordemEtapaJson = JSON.stringify(ordemEtapaJson);
        }

        // Obtém uma conexão do pool de conexões.
        cx = await pool.getConnection();

        try {
            // Executa a stored procedure com o JSON de etapas como argumento.
            const cmdSql = `CALL etapa_alterarOrdem(?)`;
            await cx.query(cmdSql, [ordemEtapaJson]);

            // Se a execução foi bem-sucedida, retorna a lista de etapas.
            return ordemEtapa;
        } catch (err) {
            throw err;
        }

    } catch (error) {
        throw error;
    }
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

// Define e exporta uma função assíncrona chamada 'consultarPorId', que recebe um parâmetro 'id'.
export const consultarPorId = async (id) => {
    let cx;
    try {
        // Obtém uma conexão do pool de conexões.
        cx = await pool.getConnection();
        
        // Cria uma string de comando SQL para selecionar todos os dados da tabela 'etapa' onde o ID é igual ao 'id' fornecido.
        const cmdSql = 'SELECT * FROM etapa WHERE id = ?;';
        
        // Executa a consulta SQL com o 'id' fornecido como parâmetro.
        const [dados, meta_dados] = await cx.query(cmdSql, [id]);
        
        // Retorna os dados obtidos na consulta.
        return dados;
    } 
    catch (error) {
        // Lança qualquer erro que ocorra durante a execução das operações.
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

// Define e exporta uma função assíncrona chamada 'consultarPorProjeto', que recebe um parâmetro 'id_projeto'.
export const consultarPorProjeto = async (id_projeto) => {
    let cx;
    try {
        // Obtém uma conexão do pool de conexões.
        cx = await pool.getConnection();
        
        // Cria uma string de comando SQL para selecionar todos os dados da tabela 'etapa' onde o projeto é igual ao 'id_projeto' fornecido.
        const cmdSql = 'SELECT * FROM etapa WHERE etapa.projeto = ? ORDER BY etapa.ordem ASC;';
        
        // Executa a consulta SQL com o 'id_projeto' fornecido como parâmetro.
        const [dados, meta_dados] = await cx.query(cmdSql, [id_projeto]);
        
        // Retorna os dados obtidos na consulta.
        return dados;
    } 
    catch (error) {
        throw error;
    } 
    finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};

// Define e exporta uma função assíncrona chamada 'deletar', que remove uma etapa do banco de dados.
export const deletar = async (id) => {
    let cx;
    try {
        // Obtém uma conexão do pool de conexões.
        cx = await pool.getConnection();
        try {
            // Inicia uma transação.
            await cx.beginTransaction();

            // Define a consulta SQL para selecionar o projeto e a ordem da etapa com o id especificado.
            let cmdSql = 'SELECT projeto, ordem FROM etapa WHERE id = ?;';

            // Executa a consulta e armazena o resultado.
            let [result] = await cx.query(cmdSql, [id]);
            const projeto_id = result[0].projeto;
            const ordem = result[0].ordem;

            // Define a consulta SQL para deletar a etapa com o id especificado.
            cmdSql = 'DELETE FROM etapa WHERE id = ?;';
            const [execucaoDelete] = await cx.query(cmdSql, [id]);

            // Verifica se alguma linha foi afetada pela operação de exclusão.
            if (execucaoDelete.affectedRows > 0) {
                // Se uma linha foi deletada, atualiza a ordem das outras etapas do mesmo projeto.
                const cmdSql = `UPDATE etapa SET ordem = ordem-1 WHERE projeto = ? AND ordem > ?`;
                await cx.query(cmdSql, [projeto_id, ordem]);
            }

            // Confirma a transação.
            await cx.commit();

            // Retorna o resultado da operação de exclusão.
            return execucaoDelete;

        } catch (err) {
            // Em caso de erro, desfaz todas as alterações da transação.
            await cx.rollback();
            // Libera a conexão de volta para o pool.
            throw err;
        }
    } catch (error) {
        // Lança qualquer erro que ocorra durante a execução das operações.
        throw error;
    } finally {
        if (cx) cx.release(); // Libere a conexão após o uso
    }
};
