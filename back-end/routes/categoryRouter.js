const express = require('express');
const CategoryRouter = express.Router();

// container
const { CREATE, UPDATE, GET_LIST, DELETE } = require('../controller/category.controller');

CategoryRouter.route('/api/category').post(CREATE).put(UPDATE).get(GET_LIST);
CategoryRouter.route('/api/category/:id').delete(DELETE);

module.exports = CategoryRouter;
