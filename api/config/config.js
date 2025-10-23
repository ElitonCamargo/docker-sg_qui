// ****************** Configuração do banco de dados ************************** //
import dotenv from 'dotenv';
dotenv.config();

export const db = {
    host: process.env.DB_HOST,
    port: parseInt(process.env.DB_PORT, 10),
    name: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD
};
