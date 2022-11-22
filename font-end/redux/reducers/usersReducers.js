

import typeAction from 'redux/actions/typeAction';
import { message } from 'antd';

function Users(users = [], action) {
    switch (action.type) {
        case typeAction.USER.GET_LIST:
            return action.payload.users;
        case typeAction.USER.POST:
            message.success('Thêm thành công');
            return action.payload.users;
        case typeAction.USER.PUT:
            message.success('Sửa thành công');
            return action.payload.users;
        case typeAction.USER.DEL:
            message.success('Xóa thành công');
            return action.payload.users;
        default:
            return users;
    }
}
export default Users;
