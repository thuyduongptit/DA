
import typeAction from 'redux/actions/typeAction';
import createActionNoAppID from 'redux/actions/baseAction';

const getList = (data) => createActionNoAppID(typeAction.USER.GET_LIST_LOGIC, { data });
const post = (data) => createActionNoAppID(typeAction.USER.POST_LOGIC, { data });
const put = (data) => createActionNoAppID(typeAction.USER.PUT_LOGIC, { data });
const remove = (id) => createActionNoAppID(typeAction.USER.DEL_LOGIC, { id });

export { getList, post, remove, put };
