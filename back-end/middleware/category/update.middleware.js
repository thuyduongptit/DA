
'use strict';
const CategoryModel = require('../../model/categoryModel');

const update = async (req, res, next) => {
    await CategoryModel.update(req.con, req.body, function (err) {
        if (err) return res.status(404).json({ message: err });
        req.break = true;
        next();
    });
};
module.exports = update;
