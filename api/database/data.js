import mysql from 'mysql2/promise';
import config_db from "../config/db.js";

const pool = mysql.createPool({
    host                : config_db.host,
    database            : config_db.database,
    user                : config_db.user,
    password            : config_db.password,
    waitForConnections  : config_db.waitForConn,   
    connectionLimit     : config_db.connLimit,        
    queueLimit          : config_db.queueLimit,             
    connectTimeout      : config_db.connTimeout       
});

export default pool;
