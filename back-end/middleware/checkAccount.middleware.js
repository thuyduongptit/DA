const validateEmail = require('../util/validateEmail');

/**
 * Điều hướng key account qua email hoặc phone
 * @param req
 * @param res
 * @param next
 * @returns {Promise<void>}
 */
const checkAccount = async (req, res, next) => {
    req.body.account && validateEmail(req.body.account)
        ? (req.body.email = req.body.account)
        : (req.body.phone = req.body.account);
    next();
};
module.exports = checkAccount;
