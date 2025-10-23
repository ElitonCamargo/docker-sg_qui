import express from 'express';
import * as garantia from '../controllers/garantia.js';

const router = express.Router();

router.get('/garantia/nutriente/:nutrienteId', garantia.consultarPorNutriente);
router.get('/garantia/materia_prima/:materia_primaId', garantia.consultarPorMateria_prima);
router.post('/garantia', garantia.cadastrar);
router.put('/garantia/:id', garantia.atualizar);
router.delete('/garantia/:id', garantia.deletar);

export default router;
