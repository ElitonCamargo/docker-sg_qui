import * as usuarioController from "../controllers/usuarioController.js";
import autenticar from "../middlewares/autenticacao.js";
import express from "express";

const router = express.Router();

router.post("/usuario",                         usuarioController.cadastrar);
router.post("/usuario/login",                   usuarioController.login);
router.get("/usuarios",             autenticar, usuarioController.consultar);
router.get("/usuario/:id",          autenticar, usuarioController.consultarPorId);
router.get("/usuario",              autenticar, usuarioController.consultarLogado); // Buscar usuário logado
router.get("/usuario/email/:email", autenticar, usuarioController.buscarPorEmail);
router.patch("/usuario/:id",        autenticar, usuarioController.alterar);
router.put("/usuario/:id",          autenticar, usuarioController.alterar);
router.delete("/usuario/:id",       autenticar, usuarioController.deletar);

export default router;
