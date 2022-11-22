module.exports = {
    create: function (con, querySQL, callback) {
        con.query(`INSERT INTO cart SET ` + querySQL, callback);
    },

    update: function (con, id, querySQL, callback) {
        const query = `UPDATE cart SET ${querySQL} WHERE id = ${id}`;
        con.query(query, callback);
    },

    getList: function (con, querySQL, callback) {
        const query =
            querySQL.length > 0
                ? `SELECT * FROM cart WHERE ` + querySQL
                : `SELECT * FROM cart`;
        console.log('query', query); 
        con.query(query, callback);
    },

    delete: function (con, id, callback) {
        con.query(`DELETE FROM cart WHERE id = ${id}`, callback);
    },
};
