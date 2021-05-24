const Pool = require('pg').Pool;
const pool = new Pool({
    user: 'postgres',
    password: 'inju13032011gg',
    host: 'localhost',
    port: '5432',
    database: 'test_alseko'
});

module.exports = pool;