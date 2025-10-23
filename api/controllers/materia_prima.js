import * as MateriaPrima from '../models/MateriaPrima.js';
import * as View from '../view/index.js';

export const consultar = async (req, res)=>{
    try {
        let data;
        const {
            nome,
            formula,
            codigo,
            cas_number,
            nutriente,
            percentual
        } = req.query;
        
        if(nome){
            data = await MateriaPrima.consultar(nome);
        }
        else if(formula){
            data = await MateriaPrima.consultarPorFormula(formula);            
        }
        else if(codigo){
            data = await MateriaPrima.consultarPorCodigo(codigo);
        }
        else if(cas_number){
            data = await MateriaPrima.consultarPorCas_number(cas_number);
        }
        else if(nutriente && percentual){
            data = await MateriaPrima.consultarMP_precentual_nutriente(nutriente,percentual);
        }
        else{
            data = await MateriaPrima.consultar();
        }        
        View.result(res,'GET',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const consultarPorId = async (req, res)=>{
    try {
        const id = req.params.id;
        const data = await MateriaPrima.consultarPorId(id);
        View.result(res,'GET',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const consultarMP_precentual_nutriente = async (req, res)=>{
    try {
        const nutriente = req.params.nutriente
        const percentual = req.params.percentual;
        const data = await MateriaPrima.consultarMP_precentual_nutriente(nutriente,percentual);
        View.result(res,'GET',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const deletar = async (req, res)=>{
    try {
        const id = req.params.id;
        const data = await MateriaPrima.deletar(id);
        View.result(res,'DELETE',data);
    } catch (error) {
        View.erro(res, error);
    }
}

export const cadastrada = async (req, res)=>{
    try {
        const materia_prima = req.body; 
        const novoMateria_prima= await MateriaPrima.cadastrar(materia_prima);
        View.result(res, 'POST',novoMateria_prima);
    } catch (error) {
        View.erro(res,error);
    }
}

export const alterar = async (req, res)=>{
    try {
        let materia_prima = req.body;
        materia_prima.id = req.params.id;
        const materia_primaAlterado = await MateriaPrima.alterar(materia_prima);
        View.result(res, 'PUT',materia_primaAlterado);
    } catch (error) {
        View.erro(res,error);
    }
}

