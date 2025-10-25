// *** Configuração do banco de dados ****
import dotenv from 'dotenv';
dotenv.config();

export default {
    host        : process.env.DB_HOST,
    database    : process.env.DB_NAME,
    port        : parseInt(process.env.DB_PORT, 10),
    user        : process.env.DB_USER,
    password    : process.env.DB_PASSWORD,
    waitForConn : (process.env.DB_WAITFORCONN === 'true'), 
    connLimit   : parseInt(process.env.DB_CONNLIMIT,10),   
    queueLimit  : parseInt(process.env.DB_QUEUELIMIT,10),  
    connTimeout : parseInt(process.env.DB_CONNTIMEOUT,10)  
};
