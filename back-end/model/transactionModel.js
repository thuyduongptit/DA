
module.exports = {
    create: function (con, querySQL, callback) {
        con.query(`INSERT INTO transaction SET ` + querySQL, callback);
    },
    update: function (con, id, querySQL, callback) {
        const query = `UPDATE transaction SET ${querySQL} WHERE id = ${id}`;
        console.log('query', query); 
        con.query(query, callback);
    },
    getList: function (con, querySQL, callback) {
        const query =
            querySQL.length > 0
                ? `SELECT * FROM transaction WHERE ` + querySQL
                : `SELECT * FROM transaction`;
        con.query(query, callback);
    },
    delete: function (con, id, callback) {
        con.query(`DELETE FROM transaction WHERE id = ${id}`, callback);
    },
};
