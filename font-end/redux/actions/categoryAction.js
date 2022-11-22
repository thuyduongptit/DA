

import typeAction from 'redux/actions/typeAction';
import createActionNoAppID from 'redux/actions/baseAction';

const getList = () => createActionNoAppID(typeAction.CATEGORY.GET_LOGIC);
const post = (data) => createActionNoAppID(typeAction.CATEGORY.POST_LOGIC, { data });
const put = (data) => createActionNoAppID(typeAction.CATEGORY.PUT_LOGIC, { data });
const remove = (id) => createActionNoAppID(typeAction.CATEGORY.DEL_LOGIC, { id });

export { getList, post, remove, put };
