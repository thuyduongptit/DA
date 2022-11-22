
'use strict';

const UserModel = require('../model/userModel');

/**
 * checkLoginTypeGoogle: Kiểm tra xem thông tin đăng nhập qua google
 * - Kiểm tra xem tài khoản có bị khóa không
 * - Kiểm tra xem đã tồn tại uid_google trên hệ thống chưa
 * @param req
 * @param res
 * @param next
 * @returns {Promise<void>}
 */
const checkLoginTypeGoogle = async (req, res, next) => {
    try {
        await UserModel.checkUidGoogle(req.con, req.body, (err, rows) => {
            if (err) return res.status(404).json({ message: err });
            if (Array.isArray(rows) && rows.length === 1) {
                const dataUser = rows[0];
                if (Number(dataUser.status_user) === 0)
                    return res.status(200).json({ message: 'Tài khoản đã bị khóa' });
                if (typeof dataUser === 'object') {
                    let info = {};
                    try {
                        info = JSON.parse(dataUser.info);
                    } catch (e) {}
                    delete dataUser.info;
                    req.user = { ...dataUser, ...info };
                    req.statusCode = 402;
                } else {
                    req.statusCode = 403;
                }
            } else {
                req.body.uid && (req.statusCode = 204);
            }
            next();
        });
    } catch (e) {
        console.log('e', e);
    }
};

module.exports = checkLoginTypeGoogle;
