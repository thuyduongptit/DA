

import typeAction from 'redux/actions/typeAction';

function Product(product = [], action) {
    switch (action.type) {
        case typeAction.PRODUCT.GET_LIST:
            return action.payload.data;
        case typeAction.PRODUCT.POST:
            return action.payload.data;
        case typeAction.PRODUCT.PUT:
            return action.payload.data;
        case typeAction.PRODUCT.DEL:
            return action.payload.data;
        default:
            return product;
    }
}

export default Product;
