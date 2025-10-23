import express from 'express';
import * as etapa_mp from '../controllers/etapa_mp.js'

const router = express.Router();

router.post('/etapa_mp', etapa_mp.cadastrar);
router.get('/etapa_mp/:id', etapa_mp.consultarPorId);
router.get('/etapa_mp/etapa/:id', etapa_mp.consultarPorEtapa);
router.put('/etapa_mp/:id', etapa_mp.alterar);
router.put('/etapa_mp/ordenar/m_p/', etapa_mp.alterarOrdem);
router.delete('/etapa_mp/:id', etapa_mp.deletar);

export default router;