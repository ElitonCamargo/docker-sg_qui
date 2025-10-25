// Ordenar projetos visualizados ******************
import express from 'express';
import cors from 'cors';
import path from 'path';
import { fileURLToPath } from 'url';
import bodyParser from 'body-parser';
import autenticacao from './routes/autenticacao.js';
import * as middleware from './controllers/token.js';
import nutriente from './routes/nutriente.js';
import elemento from './routes/elemento.js';
import materia_prima from './routes/materia_prima.js';
import garantia from './routes/garantia.js';
import usuario from './routes/usuario.js';
import projeto from './routes/projeto.js';
import etapa from './routes/etapa.js';
import etapa_mp from './routes/etapa_mp.js';
import configuracao from './routes/configuracao.js';
import upload from './controllers/upload.js';

const app = express();

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

// Rotas de públicas
app.get('/',(req,res)=>{
    const rootDomain = req.protocol + '://' + req.get('host');
    res.status(200).json({     
        status_server: 'ok',
        dominio_raiz : rootDomain,
        atualização: '14/09/2024 - 18:42',
        rotas:[
            `${rootDomain}/usuario/login`,
            `${rootDomain}/usuario`,
            `${rootDomain}/elemento`,
            `${rootDomain}/materia_prima`,
            `${rootDomain}/nutriente`,
            `${rootDomain}/garantia`,
            `${rootDomain}/projeto`,
            `${rootDomain}/etepa`,
            `${rootDomain}/etepa_mp`,
            `${rootDomain}/configuracao`,
            `${rootDomain}/upload`
        ]
    });
});



// Rotas de autenticação
app.use('/', autenticacao);

// Middleware de autenticação JWT
app.use(middleware.middlewareAutenticacao);

// Servir arquivos estáticos da pasta uploads
// Obtenha o diretório atual usando import.meta.url
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
app.use('/arquivos', express.static(path.join(__dirname, 'uploads')));


// Rotas protegidas pelo middlewareAutenticacao
app.use('/', usuario);
app.use('/', elemento);
app.use('/', nutriente);
app.use('/', materia_prima);
app.use('/', garantia);
app.use('/', projeto);
app.use('/',etapa);
app.use('/',etapa_mp);
app.use('/',configuracao);
app.use('/',upload);

// Middleware para tratar rotas inválidas
app.use((req, res, next) => {
    let retorno = {
        success: false,
        quant: 0,
        data: [],
        erro: 'Rota inválida',
        status: 404
    }
    res.status(404).json(retorno);
});

// Middleware de tratamento de erros
app.use((err, req, res, next) => {
    console.error(err.stack);
    let retorno = {
        success: false,
        quant: 0,
        data: [],
        erro: 'Erro interno do servidor',
        status: 500
    }
    res.status(500).json(retorno);
});

const PORT = process.env.PORT || 3000; 
app.listen(PORT,()=>{
    console.log('Sistema inicializado: ', `Acesso: http://localhost:${PORT}`);
});
