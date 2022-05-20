/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 02/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */
/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 01/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

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
