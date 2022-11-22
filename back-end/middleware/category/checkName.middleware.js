
'use strict';
const CategoryModel = require('../../model/categoryModel');

const checkName = async (req, res, next) => {
    await CategoryModel.getByName(req.con, req.body.name, function (err, row) {
        if (err) return res.status(200).json({ message: err });
        if (row.length === 0) {
            req.statusCode = 204;
            next();
        } else if (row.length === 1) {
            req.statusCode = 402;
            req.category = row;
            next();
        } else return res.status(200).json({ message: 402 });
    });
};
module.exports = checkName;
