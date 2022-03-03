const Pool = require("pg").Pool;
const pool = new Pool({
    user:'jouafdvr', // default postgres
    host:'fanny.db.elephantsql.com',
    database:'jouafdvr', // `my_todos_db`
    password:'Sr_WuRfQqxeyvshh6oeGhNllXyu_oR90', //added during PostgreSQL and pgAdmin installation
    port:'5432' //default port
});

module.exports = pool;