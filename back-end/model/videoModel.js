module.exports = {
    create: function (con, querySQL, callback) {
        con.query(`INSERT INTO video SET ` + querySQL, callback);
    },
    update: function (con, id, querySQL, callback) {
        const query = `UPDATE video SET ${querySQL} WHERE id = ${id}`;
        con.query(query, callback);
    },
    getList: function (con, querySQL, callback) {
        const query =
            querySQL.length > 0
                ? `SELECT * FROM video WHERE ` + querySQL
                : `SELECT * FROM video`;
        con.query(query, callback);
    },
    delete: function (con, id, callback) {
        con.query(`DELETE FROM video WHERE id = ${id}`, callback);
    },
};
