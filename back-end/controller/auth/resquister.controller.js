const md5 = require("md5");
const UserModel = require("../../model/userModel");

const createUser = async (req, res, next) => {
	try {
		const {
			password,
			phone = "",
			email = "",
			uid = "",
			displayName,
			name = "",
			photoURL,
			avatar = "",
			phoneNumber,
			address,
		} = req.body;
		// phone, email
		const _password = uid.length > 0 ? md5("123456") : md5(password);

		const data1 = {
			name: name || "Người dùng mới",
			phone: phone || "",
			email: email,
			address: address || "",
			info: "{}",
			position: "Học viên",
			role: "user", // Khởi tạo mặc định là user 
			coin: "0",
			password: password,
			status_user: "1",
		};
		const data2 = {
			phone: phoneNumber || phone,
			email: email,
			password: _password,
			name: displayName || name,
			avatar: photoURL || avatar,
			uid: uid,
			type: uid ? "google" : "",
		};
		const data = { ...data1, ...data2 };
		req.body.account = phone || email;

		if ((email && phone) || req.statusCode === 204) {
			UserModel.create(req.con, data, function (err) {
				if (err) return res.status(200).json({ message: err });
				next();
			});
		} else if (req.statusCode === 402) {
			next();
		} else return res.status(200).json({ message: req.statusCode });
	} catch (e) {
		console.log("e", e);
	}
};

module.exports = createUser;
