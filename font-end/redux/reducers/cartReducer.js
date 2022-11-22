

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
