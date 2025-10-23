import * as Garantia from '../models/Garantia.js';
import * as View from '../view/index.js';

export const consultarPorNutriente = async (req, res) => {
    try {
        const nutrienteId = req.params.nutrienteId;
        const data = await Garantia.consultarPorNutriente(nutrienteId);
        View.result(res, 'GET', data);
    } catch (error) {
        View.erro(res, error);
    }
};

export const consultarPorMateria_prima = async (req, res) => {
    try {
        const materia_primaId = req.params.materia_primaId;
        const data = await Garantia.consultarPorMateria_prima(materia_primaId);
        View.result(res, 'GET', data);
    } catch (error) {
        View.erro(res, error);
    }
};

export const cadastrar = async (req, res) => {
    try {
        const garantia = req.body;
        const data = await Garantia.cadastrar(garantia);
        View.result(res, 'POST', data);
    } catch (error) {
        View.erro(res, error);
    }
};

export const atualizar = async (req, res) => {
    try {
        let garantia = req.body;
        garantia.id = req.params.id;
        const data = await Garantia.atualizar(garantia);
        View.result(res, 'PUT', data);
    } catch (error) {
        View.erro(res, error);
    }
};

export const deletar = async (req, res) => {
    try {
        const id = req.params.id;
        const data = await Garantia.deletar(id);
        View.result(res, 'DELETE', data);
    } catch (error) {
        View.erro(res, error);
    }
};
