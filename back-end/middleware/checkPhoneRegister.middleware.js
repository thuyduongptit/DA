const UserModel = require('../model/userModel');

/**
 * checkEmail: Kiểm tra xem phone có trong hệ thống chưa
 * @param req
 * @param res
 * @param next
 * @returns {Promise<void>}
 */

const checkPhoneRegister = async (req, res, next) => {
    await UserModel.checkPhone(req.con, req.body, (err, rows) => {
        if (err) return res.json({ message: err });
        if (rows.length > 0) {
            return res.json({ message: 402 });
        } else {
            req.statusCode = 204;
            next();
        }
    });
};

module.exports = checkPhoneRegister;
