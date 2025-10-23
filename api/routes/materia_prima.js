import express from 'express';
import * as materia_prima from '../controllers/materia_prima.js'

const router = express.Router();

router.get('/materia_prima', materia_prima.consultar);
router.get('/materia_prima/:id', materia_prima.consultarPorId);
router.get('/materia_prima/compor_projeto/:nutriente/:percentual', materia_prima.consultarMP_precentual_nutriente);
router.delete('/materia_prima/:id', materia_prima.deletar);
router.post('/materia_prima', materia_prima.cadastrada);
router.put('/materia_prima/:id', materia_prima.alterar);

export default router;