const express = require('express');
const ProductRouter = express.Router();

// container
const { CREATE, UPDATE, GET_LIST } = require('../controller/product.controller');

ProductRouter.route('/api/product').post(CREATE).get(GET_LIST).put(UPDATE);

module.exports = ProductRouter;
