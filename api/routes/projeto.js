import express from 'express';
import * as projeto from '../controllers/projeto.js'

const router = express.Router();

router.get('/projeto', projeto.consultar);
router.get('/projeto/:id', projeto.consultarPorId);
router.get('/projeto/codigo/:codigo', projeto.consultarPorCodigo);
router.get('/projeto/detalhado/:id', projeto.consultaDetalhada);
router.get('/projeto/data/:inicio/:termino', projeto.consultarPorData);

router.post('/projeto', projeto.cadastrar);
router.post('/projeto/:id', projeto.duplicar);
router.put('/projeto/:id', projeto.alterar);
router.delete('/projeto/:id', projeto.deletar);

export default router;