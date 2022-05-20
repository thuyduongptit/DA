const express = require('express');
const OpenProductRouter = express.Router();

// container
const { OPEN_PRODUCT } = require('../controller/open.product.controller');

OpenProductRouter.route('/api/open').get(OPEN_PRODUCT);

module.exports = OpenProductRouter;
