import * as Projeto from '../models/Projeto.js';
import * as View from '../view/index.js';

export const consultar = async (req, res)=>{
    try {
        let nome = req.query.nome;
        let status = req.query.status;
        let filtro_avancado = req.query.filtro_avancado;
        let data = [];
        if(!filtro_avancado){
            if(nome){
                data = await Projeto.consultar(nome);
            }
            else if(status){
                data = await Projeto.consultarPorStatus(status);
            }
            else{
                data = await Projeto.consultar('');
            }
        }
        else{
            data = await Projeto.consultarFiltroAvacado(filtro_avancado);
        }
        return View.result(res,'GET',data);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const consultarPorId = async (req, res)=>{    
    try {
        let id = req.params.id;
        const data = await Projeto.consultarPorId(id);
        return View.result(res,'GET',data);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const consultarPorCodigo = async (req, res)=>{    
    try {
        let codigo = req.params.codigo;
        const data = await Projeto.consultarPorCodigo(codigo);
        return View.result(res,'GET',data);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const duplicar = async (req, res)=>{    
    try {
        let id = req.params.id;
        const data = await Projeto.duplicar(id);
        return View.result(res,'GET',data,"Projeto base não encontrado");
    } catch (error) {
        return View.erro(res, error);
    }
}

export const consultarPorData = async (req, res)=>{    
    try {
        let inicio = req.params.inicio;
        let termino = req.params.termino;
        const data = await Projeto.consultarPorData(inicio,termino);
        return View.result(res,'GET',data);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const deletar = async (req, res)=>{
    try {
        let id = req.params.id;
        const data = await Projeto.deletar(id);
        return View.result(res,'DELETE',data);
    } catch (error) {
        return View.erro(res, error);
    }
}

export const cadastrar = async (req, res)=>{
    try {
        let projeto = req.body;
        const novoProjeto = await Projeto.cadastrar(projeto,req.loginId);
        return View.result(res, 'POST',novoProjeto);
    } catch (error) {
        return View.erro(res,error);
    }
}

export const alterar = async (req, res)=>{
    try {
        let projeto = req.body;
        projeto.id = req.params.id;
        const projetoAlterado = await Projeto.alterar(projeto,req.loginId);
        return View.result(res, 'PUT', projetoAlterado);
    } catch (error) {
        return View.erro(res,error);
    }
}

// *************** Consultas Entre vária entidades ***********************
export const consultaDetalhada = async (req, res)=>{    
    try {
        let id = req.params.id;               
        const data = await Projeto.consultaDetalhada(id);
        return View.result(res,'GET',data);
    } catch (error) {
        return View.erro(res, error);
    }
}

