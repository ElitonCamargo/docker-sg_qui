import express from 'express';
import * as elemento from '../controllers/elemento.js'

const router = express.Router();

router.get('/elemento', elemento.consultar);
router.get('/elemento/:id', elemento.consultarPorId);
router.delete('/elemento/:id', elemento.deletar);
router.post('/elemento', elemento.cadastrada);
router.put('/elemento/:id', elemento.alterar);

export default router;