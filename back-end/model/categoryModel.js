module.exports = {
    create: function (con, data, callback) {
        con.query(
            `INSERT INTO category SET rootId = '${data.rootId}',
                icon = '${data.icon}',
                status = '${data.status}',
                name = '${data.name}', 
                description = '${data.description}', 
                sort_order = '${data.sort_order}'
                `,
            callback,
        );
    },
    update: function (con, data, callback) {
		console.log('data', data); // MongLV log fix bug
        con.query(`UPDATE category SET rootId = '${data.rootId}', icon = '${data.icon}', status = '${data.status}', name = '${data.name}', description = '${data.description}', sort_order = '${data.sort_order}' WHERE id = '${data.id}'`, callback);
    },
    getList: function (con, callback) {
        con.query('SELECT * FROM category', callback);
    },
    getByName: function (con, name, callback) {
        con.query(`SELECT * FROM category WHERE name = '${name}'`, callback);
    },
    delete: function (con, id, callback) {
        con.query(`DELETE FROM category WHERE id = ${id}`, callback);
    },
};
