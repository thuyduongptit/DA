/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 11/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

import typeAction from 'redux/actions/typeAction';

function Cart(cart = [], action) {
    switch (action.type) {
        case typeAction.CART.GET_LIST:
            return action.payload.data;
        case typeAction.CART.POST:
            return action.payload.data;
        case typeAction.CART.PUT:
            return action.payload.data;
        case typeAction.CART.DEL:
            return action.payload.data;
        default:
            return cart;
    }
}

export default Cart;
