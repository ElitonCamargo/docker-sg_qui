import * as Configuracao from '../models/Configuracao.js';
import * as View from '../view/index.js';


export const cadastrar = async (req, res)=>{
    try {
        const configuracao = req.body; 
        const result = await Configuracao.cadastrar(configuracao);
        View.result(res, 'POST',result);
    } catch (error) {
        View.erro(res,error);
    }
}

export const alterar = async (req, res)=>{
    try {
        let configuracao = req.body;
        configuracao.id = req.params.id;
        const result = await Configuracao.alterar(configuracao);
        View.result(res, 'PUT',result);
    } catch (error) {
        View.erro(res,error);
    }
}

export const consultarPorId = async (req, res)=>{
    try {
        const id = req.params.id;
        const result = await Configuracao.consultarPorId(id);
        View.result(res,'GET',result);
    } catch (error) {
        View.erro(res, error);
    }
}

export const consultar = async (req, res)=>{
    try {
        const key = req.query.key;
        let result;
        if(key){
            result = await Configuracao.consultarPorKey(key);
        }
        else{
            result = await Configuracao.consultar();
        }
        View.result(res,'GET',result);
    } catch (error) {
        View.erro(res, error);
    }
}

export const deletar = async (req, res)=>{
    try {
        let id = req.params.id;
        const result = await Configuracao.deletar(id);
        return View.result(res,'DELETE',result);
    } catch (error) {
        return View.erro(res, error);
    }
}