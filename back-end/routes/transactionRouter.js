const express = require('express');
const TransactionRouter = express.Router();

// container
const {
    CREATE,
    UPDATE,
    GET_LIST,
    DELETE,
} = require('../controller/transaction.controller');

TransactionRouter.route('/api/transaction').post(CREATE).get(GET_LIST).put(UPDATE);
TransactionRouter.route('/api/transaction/:id').delete(DELETE);

module.exports = TransactionRouter;
