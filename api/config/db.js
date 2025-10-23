// *** Configuração do banco de dados ****
import dotenv from 'dotenv';
dotenv.config();

const developmentConfig = {
    host:      process.env.DEV_DB_HOST              ,
    port:      parseInt(process.env.DEV_DB_PORT, 10),
    user:      process.env.DEV_DB_USER              ,
    database:  process.env.DEV_DB_NAME              ,
    password:  process.env.DEV_DB_PASSWORD
};

const productionConfig = {
    host:      process.env.DB_HOST                  ,
    port:      parseInt(process.env.DB_PORT, 10)    ,
    user:      process.env.DB_USER                  ,
    database:  process.env.DB_NAME                  ,
    password:  process.env.DB_PASSWORD                     
};

const db_config = process.env.NODE_ENV === 'production' ? productionConfig : developmentConfig;


export default {
    ...db_config,
    waitForConnections: true,
    connectionLimit:    10,
    queueLimit:         50,
    connectTimeout:     5000
};