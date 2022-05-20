/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 11/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

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
