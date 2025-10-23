import * as Elemento from '../models/Elemento.js';
import * as View from '../view/index.js';

export const consultar = async (req, res)=>{
    try {
        let simbolo = req.query.simbolo;        
        let filtro = req.query.filtro;
        let estado = req.query.estado;
        let data;
        
        if(simbolo){
            data = await Elemento.consultarPorSimbolo(simbolo);
        }
        else if(filtro){
            data = await Elemento.consultar(filtro);
        }
        else if(estado){            
            data = await Elemento.consultarPorEstado(estado);
        }
        else{            
            data = await Elemento.consultar();
        }
        View.result(res,'GET',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const consultarPorId = async (req, res)=>{
    try {
        let id = req.params.id;
        let data = await Elemento.consultarPorId(id);
        View.result(res,'GET',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const deletar = async (req, res)=>{
    try {
        const id = req.params.id;
        const data = await Elemento.deletar(id);
        View.result(res,'DELETE',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const cadastrada = async (req, res)=>{
    try {
        const elemento = req.body; 
        const novoElemento = await Elemento.cadastrar(elemento);
        View.result(res, 'POST',novoElemento);
    } catch (error) {
        View.erro(res,error);
    }
}

export const alterar = async (req, res)=>{
    try { 
        let elemento = req.body;
        elemento.id = req.params.id;
        const elementoAlterado = await Elemento.alterar(elemento);
        View.result(res, 'PUT',elementoAlterado);
    } catch (error) {
        View.erro(res,error);
    }
}

