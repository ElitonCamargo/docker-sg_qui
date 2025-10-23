import express from 'express';
import multer from 'multer';
import path from 'path';
import fs from 'fs';

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads/');
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
    }
});

// Filtro de arquivo para aceitar apenas imagens
const fileFilter = (req, file, cb) => {
    const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
    if (!allowedTypes.includes(file.mimetype)) {
        const error = new Error('Tipo de arquivo inválido. Apenas imagens são permitidas.');
        error.code = 'LIMIT_FILE_TYPES';
        return cb(error, false);
    }
    cb(null, true);
};

const upload = multer({ 
    storage: storage,
    fileFilter: fileFilter
});

const router = express.Router();

router.post('/upload', upload.single('arquivo'), async (req, res) => {
    try {
        const logo = req.file ? req.file.filename : null;
        res.status(201).json({ logo });
    } catch (error) {
        if (error.code === 'LIMIT_FILE_TYPES') {
            res.status(422).json({ error: 'Tipo de arquivo inválido. Apenas imagens são permitidas.' });
        } else {
            console.error(error);
            res.status(500).json({ error: 'Erro interno do servidor' });
        }
    }
});

router.delete('/upload/:filename', async (req, res) => {
    try {
        const filename = req.params.filename;
        const filePath = path.join('uploads', filename);

        // Verificar se o arquivo existe
        if (fs.existsSync(filePath)) {
            fs.unlinkSync(filePath);
            res.status(200).json({ message: 'Arquivo deletado com sucesso.' });
        } else {
            res.status(404).json({ error: 'Arquivo não encontrado.' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Erro interno do servidor' });
    }
});

// Middleware de tratamento de erros para capturar erros do multer e outros
router.use((err, req, res, next) => {
    if (err instanceof multer.MulterError) {
        return res.status(400).json({ error: err.message });
    }
    if (err.code === 'LIMIT_FILE_TYPES') {
        return res.status(422).json({ error: 'Tipo de arquivo inválido. Apenas imagens são permitidas.' });
    }
    return res.status(500).json({ error: 'Erro interno do servidor' });
});

export default router;
