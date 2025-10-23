import express from 'express';
import * as nutriente from '../controllers/nutriente.js'

const router = express.Router();

router.get('/nutriente', nutriente.consultar);
router.get('/nutriente/:id', nutriente.consultarPorId);
router.delete('/nutriente/:id', nutriente.deletar);
router.post('/nutriente', nutriente.cadastrada);
router.put('/nutriente/:id', nutriente.alterar);

export default router;