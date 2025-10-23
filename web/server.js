import express from 'express';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import dotenv from 'dotenv';
dotenv.config();

// Emular __dirname
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

// Middleware opcional para redirecionar HTTPS para HTTP
app.use((req, res, next) => {
    if (req.secure) {
        return res.redirect(301, `http://${req.headers.host}${req.url}`);
    }
    next();
});

// Servir arquivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Roteamento SPA
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Iniciar o servidor
const PORT = process.env.PORT || 8080; // Use a porta definida no .env ou 8080 por padrão
if (!process.env.PORT) {
    console.warn('Aviso: A variável de ambiente PORT não está definida. Usando a porta 8080 por padrão.');
}
app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
});
