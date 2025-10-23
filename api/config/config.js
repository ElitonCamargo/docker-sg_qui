// ****************** Configuração do banco de dados ************************** //
import dotenv from 'dotenv';
dotenv.config();

const developmentConfig = {
    host: "localhost",
    port: 3306,
    name: "sg_qui",
    dialect: "mysql",
    user: "root",
    password: ""
};

const productionConfig = {
    host: process.env.DB_HOST,
    port: parseInt(process.env.DB_PORT, 10),
    name: process.env.BD_NAME,
    dialect: process.env.BD_DIALECT,
    user: process.env.BD_USER,
    password: process.env.BD_PASS
};

export const db = process.env.NODE_ENV === 'production' ? productionConfig : developmentConfig;
