// const moment = require('moment'); // require
// const mysqlTimestamp = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss').toString();
// var currentTimeInSeconds=Math.floor(Date.now()/1000); //unix timestamp in seconds
// var currentTimeInMilliseconds=Date.now(); // unix timestamp in milliseconds
module.exports = {
	getList: function (con, querySQL, callback) {
		const query =
			querySQL.length > 0
				? `SELECT * FROM user WHERE ` + querySQL
				: `SELECT * FROM user`;
		con.query(query, callback);
	},

	checkEmail: function (con, data, callback) {
		con.query(`SELECT * FROM user WHERE email = '${data.email}'`, callback);
	},
	checkPhone: function (con, data, callback) {
		con.query(`SELECT * FROM user WHERE phone = '${data.phone}'`, callback);
	},

	checkUidGoogle: (con, data, callback) => {
		con.query(
			`SELECT * FROM user WHERE uid_google = '${data.uid}'`,
			callback
		);
	},

	create: function (con, data, callback) {
		const query = `INSERT INTO user SET name = '${data.name}', 
                phone = '${data.phone}', 
                email = '${data.email}', 
                password = '${data.password}', 
                address = '',
                info = '{}', 
                role = 'user', 
                coin = '0',
                rank ='0',
                status_user = '1',
                position='Người dùng',
                list_product_open = '[]',
                avatar = ''
                `;
		con.query(query, callback);
	},
	update: function (con, id, querySQL, callback) {
		const query = `UPDATE user SET ${querySQL} WHERE id = ${id}`;

		console.log("query", query); 
		// con.query(`UPDATE category SET rootId = '${data.rootId}', icon = '${data.icon}', status = '${data.status}', name = '${data.name}', description = '${data.description}', sort_order = '${data.sort_order}' WHERE id = '${data.id}'`, callback);
		con.query(query, callback);
	},
};
