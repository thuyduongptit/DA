

import typeAction from 'redux/actions/typeAction';

function Transaction(transaction = [], action) {
    switch (action.type) {
        case typeAction.TRANSACTION.GET:
            return action.payload.data;
        case typeAction.TRANSACTION.POST:
            return action.payload.data;
        case typeAction.TRANSACTION.PUT:
            return action.payload.data;
        case typeAction.TRANSACTION.DEL:
            return action.payload.data;
        default:
            return transaction;
    }
}

export default Transaction;
