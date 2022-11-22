

import typeAction from 'redux/actions/typeAction';
import { message } from 'antd';

function Category(category = [], action) {
    switch (action.type) {
        case typeAction.CATEGORY.GET:
            return action.payload.category;
        case typeAction.CATEGORY.POST:
            message.success('Thêm thành công');
            return action.payload.category;
        case typeAction.CATEGORY.PUT:
            message.success('Sửa thành công');
            return action.payload.category;
        case typeAction.CATEGORY.DEL:
            message.success('Xóa thành công');
            return action.payload.category;
        default:
            return category;
    }
}

export default Category;
