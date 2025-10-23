// Importa todos os métodos do módulo 'Etapa' da model Etapa.js e os associa ao objeto 'Etapa'.
import * as Etapa from '../models/Etapa.js';
// Importa todos os métodos do módulo 'View' da view index.js e os associa ao objeto 'View'.
import * as View from '../view/index.js';

// Define e exporta uma função assíncrona chamada 'cadastrar' para cadastrar uma nova etapa.
export const cadastrar = async (req, res) => {
    try {
        // Obtém o corpo da requisição, que deve conter os dados da nova etapa.
        const etapa = req.body;
        
        // Chama a função 'cadastrar' do módulo 'Etapa' com os dados da nova etapa e aguarda a conclusão.
        const novoEtapa = await Etapa.cadastrar(etapa);
        
        // Retorna a resposta com o resultado da operação usando a função 'result' do módulo 'View'.
        return View.result(res, 'POST', novoEtapa);
    } catch (error) {
        // Em caso de erro, retorna a resposta de erro usando a função 'erro' do módulo 'View'.
        return View.erro(res, error);
    }
}

// Define e exporta uma função assíncrona chamada 'consultarPorId' para consultar uma etapa por ID.
export const consultarPorId = async (req, res) => {
    try {
        // Obtém o ID dos parâmetros da requisição.
        let id = req.params.id;
        
        // Chama a função 'consultarPorId' do módulo 'Etapa' com o ID e aguarda a conclusão.
        const data = await Etapa.consultarPorId(id);
        
        // Retorna a resposta com o resultado da operação usando a função 'result' do módulo 'View'.
        return View.result(res, 'GET', data);
    } catch (error) {
        // Em caso de erro, retorna a resposta de erro usando a função 'erro' do módulo 'View'.
        return View.erro(res, error);
    }
}

// Define e exporta uma função assíncrona chamada 'consultarPorProjeto' para consultar etapas por ID do projeto.
export const consultarPorProjeto = async (req, res) => {
    try {
        // Obtém o ID do projeto dos parâmetros da requisição.
        let id_projeto = req.params.id;
        
        // Chama a função 'consultarPorProjeto' do módulo 'Etapa' com o ID do projeto e aguarda a conclusão.
        const data = await Etapa.consultarPorProjeto(id_projeto);
        
        // Retorna a resposta com o resultado da operação usando a função 'result' do módulo 'View'.
        return View.result(res, 'GET', data);
    } catch (error) {
        // Em caso de erro, retorna a resposta de erro usando a função 'erro' do módulo 'View'.
        return View.erro(res, error);
    }
}

// Define e exporta uma função assíncrona chamada 'deletar' para deletar uma etapa por ID.
export const deletar = async (req, res) => {
    try {
        // Obtém o ID dos parâmetros da requisição.
        let id = req.params.id;
        
        // Chama a função 'deletar' do módulo 'Etapa' com o ID e aguarda a conclusão.
        const data = await Etapa.deletar(id);
        
        // Retorna a resposta com o resultado da operação usando a função 'result' do módulo 'View'.
        return View.result(res, 'DELETE', data);
    } catch (error) {
        // Em caso de erro, retorna a resposta de erro usando a função 'erro' do módulo 'View'.
        return View.erro(res, error);
    }
}

// Define e exporta uma função assíncrona chamada 'alterar' para alterar uma etapa existente.
export const alterar = async (req, res) => {
    try {
        // Obtém os dados da etapa do corpo da requisição.
        let etapa = req.body;
        
        // Define o ID da etapa a ser alterada a partir dos parâmetros da requisição.
        etapa.id = req.params.id;
        
        // Chama a função 'alterar' do módulo 'Etapa' com os novos dados da etapa e aguarda a conclusão.
        const etapaAlterada = await Etapa.alterar(etapa);
        
        // Retorna a resposta com o resultado da operação usando a função 'result' do módulo 'View'.
        return View.result(res, 'PUT', etapaAlterada);
    } catch (error) {
        // Em caso de erro, retorna a resposta de erro usando a função 'erro' do módulo 'View'.
        return View.erro(res, error);
    }
}

// Define e exporta uma função assíncrona chamada 'alterarOrdem' para alterar a ordem das etapas de um projeto.
export const alterarOrdem = async (req, res) => {
    try {
        // Obtém um array com a nova ordem das etapas do projeto a partir do corpo da requisição.
        // Exemplo de dados recebidos: {"etapas":[{"id": 2, "ordem": 3}, {"id": 1, "ordem": 2}, {"id": 3, "ordem": 1}]}
        const ordemEtapa = req.body;

        // Chama a função 'alterarOrdem' do módulo 'Etapa' com os dados da nova ordem e aguarda a conclusão.
        const etapasReordenadas = await Etapa.alterarOrdem(ordemEtapa);
        
        // Retorna a resposta com o resultado da operação usando a função 'result' do módulo 'View'.
        return View.result(res, 'PUT', etapasReordenadas,"Nenhuma alteração realizada");
    } catch (error) {
        // Em caso de erro, retorna a resposta de erro usando a função 'erro' do módulo 'View'.
        return View.erro(res, error);
    }
}

