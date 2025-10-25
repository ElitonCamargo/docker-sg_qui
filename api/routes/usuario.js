import express from 'express';
import * as usuario from '../controllers/usuarioController.js';

const router = express.Router();

router.get('/usuario/logado',usuario.consultarLogado);
router.get('/usuario',usuario.consultar);
router.get('/usuario/:id',usuario.consultarPorId);
router.delete('/usuario/:id',usuario.deletar);
router.put('/usuario/:id',usuario.alterar);
router.post('/usuario',usuario.cadastrar);

export default router;
