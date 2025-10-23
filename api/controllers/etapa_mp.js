import * as Etapa_MP from '../models/Etapa_MP.js';
import * as View from '../view/index.js';

export const cadastrar = async (req, res) => {
    try {
        const etapa_mp = req.body;
        
        const novoEtapa_MP = await Etapa_MP.cadastrar(etapa_mp);
        
        return View.result(res, 'POST', novoEtapa_MP);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const alterar = async (req, res) => {
    try {
        let etapa_mp = req.body;
        
        etapa_mp.id = req.params.id;
        
        const etapa_mpAlterada = await Etapa_MP.alterar(etapa_mp);
        
        return View.result(res, 'PUT', etapa_mpAlterada);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const consultarPorId = async (req, res) => {
    try {
        let id = req.params.id;
        
        const data = await Etapa_MP.consultarPorId(id);
        
        return View.result(res, 'GET', data);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const consultarPorEtapa = async (req, res) => {
    try {
        let id_projeto = req.params.id;
        
        const data = await Etapa_MP.consultarPorEtapa(id_projeto);
        
        return View.result(res, 'GET', data);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const deletar = async (req, res) => {
    try {
        let id = req.params.id;
        
        const data = await Etapa_MP.deletar(id);
        
        return View.result(res, 'DELETE', data);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const alterarOrdem = async (req, res) => {
    try {
        const ordemetapa_mp = req.body;
        const ordemetapa_mpReordenadas = await Etapa_MP.alterarOrdem(ordemetapa_mp);        
        return View.result(res, 'PUT', ordemetapa_mpReordenadas,"Nenhuma alteração realizada");
    } catch (error) {
        return View.erro(res, error);
    }
}

