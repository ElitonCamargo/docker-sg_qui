import express from 'express';
import * as configuracao from '../controllers/configuracao.js';

const router = express.Router();
router.post('/configuracao',configuracao.cadastrar);
router.get('/configuracao',configuracao.consultar);
router.get('/configuracao/:id',configuracao.consultarPorId);
router.put('/configuracao/:id',configuracao.alterar);
router.delete('/configuracao/:id',configuracao.deletar);

export default router;
