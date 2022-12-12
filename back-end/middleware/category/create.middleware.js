
'use strict';
const CategoryModel = require('../../model/categoryModel');

const create = async (req, res, next) => {
    if (req.statusCode === 204 && req.dataJwtDecoded.role === 'admin') {
        const timestamp_create = Number(new Date().getTime());
        const data = {
            timestamp_create: timestamp_create,
            ...req.body,
        };
        await CategoryModel.create(req.con, data, function (err) {
            if (err) return res.status(200).json({ message: err });
            req.statusCode = 200;
            req.break = true;
            next();
        });
    } else if (req.dataJwtDecoded.role !== 'admin') {
        return res.status(200).json({ message: 505 });
    } else {
        next();
    }
};
module.exports = create;
