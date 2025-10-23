import * as Nutriente from '../models/Nutriente.js';
import * as View from '../view/index.js';

export const consultar = async (req, res)=>{
    try {
        let nome = req.query.nome;
        nome = nome?nome:'';
        const data = await Nutriente.consultar(nome);
        View.result(res,'GET',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const consultarPorId = async (req, res)=>{    
    try {
        let id = req.params.id;
        const data = await Nutriente.consultarPorId(id);
        View.result(res,'GET',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const deletar = async (req, res)=>{
    try {
        let id = req.params.id;
        const data = await Nutriente.deletar(id);
        View.result(res,'DELETE',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const cadastrada = async (req, res)=>{
    try {
        const nutriente = req.body; 
        const novoNutriente = await Nutriente.cadastrar(nutriente);
        View.result(res, 'POST',novoNutriente);
    } catch (error) {
        View.erro(res,error);
    }
}

export const alterar = async (req, res)=>{
    try {
        let nutriente = req.body;
        nutriente.id = req.params.id;
        const nutrienteAlterado = await Nutriente.alterar(nutriente);
        View.result(res, 'PUT',nutrienteAlterado);
    } catch (error) {
        View.erro(res,error);
    }
}

