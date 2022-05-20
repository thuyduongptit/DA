const express = require('express');
const CartRouter = express.Router();

// container
const { CREATE, UPDATE, GET_LIST, DELETE } = require('../controller/cart.controller');

CartRouter.route('/api/cart').post(CREATE).get(GET_LIST).put(UPDATE);
CartRouter.route('/api/cart/:id').delete(DELETE);

module.exports = CartRouter;
