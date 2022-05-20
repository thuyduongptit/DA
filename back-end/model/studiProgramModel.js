/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 05/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */
module.exports = {
    create: function (con, querySQL, callback) {
        const _query = `INSERT INTO study_program SET ` + querySQL;
        console.log('_query', _query); // MongLV log fix bug
        con.query(_query, callback);
    },
    update: function (con, id, querySQL, callback) {
        const query = `UPDATE study_program SET ${querySQL} WHERE id = ${id}`;
        con.query(query, callback);
    },
    getList: function (con, querySQL, callback) {
        const query =
            querySQL.length > 0
                ? `SELECT * FROM study_program WHERE ` + querySQL
                : `SELECT * FROM study_program`;
        con.query(query, callback);
    },
    getByName: function (con, name, callback) {
        con.query(`SELECT * FROM product WHERE name = '${name}'`, callback);
    },
};
