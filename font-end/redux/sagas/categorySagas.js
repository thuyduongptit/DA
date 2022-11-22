
import { message as messageAnt } from 'antd';
import typeAction from 'redux/actions/typeAction';
import { call, take, put, select } from 'redux-saga/effects';
import categoryAPI from 'redux/api/categoryAPI';

function* watcherGetCategory() {
    while (true) {
        yield take(typeAction.CATEGORY.GET_LOGIC);
        const { categories, message } = yield categoryAPI.getAll();
        if (message === 'OK') {
            yield put({
                type: typeAction.CATEGORY.GET,
                payload: { category: categories },
            });
        }
    }
}
function* watcherPostCategory() {
    while (true) {
        const dataTake = yield take(typeAction.CATEGORY.POST_LOGIC);
        const { data } = dataTake.payload;
        const { item, message } = yield categoryAPI.add(data);
        debugger; // Todo by MongLV
        if (message === 'OK' && item) {
            const { category } = yield select();
            category.push(item);
            yield put({
                type: typeAction.CATEGORY.POST,
                payload: { category: [...category] },
            });
        }
    }
}

function* watcherPutCategory() {
    while (true) {
        const dataTake = yield take(typeAction.CATEGORY.PUT_LOGIC);
        debugger; // MongLV
        const { data } = dataTake.payload;
        const { message } = yield categoryAPI.update(data);
        if (message === 'OK') {
            const { category } = yield select();
            const newCategory = category.map((item) => {
                if (item.id === data.id) {
                    item = data;
                }
                return item;
            });
            yield put({
                type: typeAction.CATEGORY.PUT,
                payload: { category: [...newCategory] },
            });
        }
    }
}

function* watcherDeleteCategory() {
    while (true) {
        const dataTake = yield take(typeAction.CATEGORY.DEL_LOGIC);
        debugger; // Todo by MongLV

        const { id } = dataTake.payload;
        const { message } = yield categoryAPI.delete(id);

        if (message === 'OK') {
            const { category } = yield select();
            const newState = category.filter((item) => item.id !== id);
            yield put({
                type: typeAction.CATEGORY.DEL,
                payload: { category: [...newState] },
            });
        } else {
            messageAnt.warn(message)
        }
    }
}
export { watcherGetCategory, watcherPostCategory, watcherDeleteCategory, watcherPutCategory };
