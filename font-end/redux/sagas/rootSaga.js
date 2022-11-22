
import { all } from 'redux-saga/effects';
import { watcherGetCategory, watcherPostCategory, watcherDeleteCategory, watcherPutCategory } from 'redux/sagas/categorySagas';
import { watcherGetListUser } from './userSagas';
// watch saga
// saga
export default function* rootSaga() {
    yield all([watcherGetCategory(), watcherPostCategory(), watcherDeleteCategory(), watcherPutCategory(), watcherGetListUser()]);
}
