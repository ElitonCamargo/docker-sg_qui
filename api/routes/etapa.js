import express from 'express';
import * as etapa from '../controllers/etapa.js'

const router = express.Router();

router.post('/etapa', etapa.cadastrar);
router.get('/etapa/:id', etapa.consultarPorId);
router.get('/etapa/projeto_id/:id', etapa.consultarPorProjeto);
router.put('/etapa/:id', etapa.alterar);
router.put('/etapa/projeto/ordenar/', etapa.alterarOrdem);
router.delete('/etapa/:id', etapa.deletar);

export default router;