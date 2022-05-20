/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 04/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */
/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 01/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

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
