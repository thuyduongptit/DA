

import { combineReducers } from 'redux';
import Category from 'redux/reducers/categoryReducers';
import Users from 'redux/reducers/usersReducers';
import Product from 'redux/reducers/productReducer';
import StudyProgram from 'redux/reducers/studyProgramReducer';

// util
import { typeStore } from 'util/TypeUI';
import Video from 'redux/reducers/videoReducers';
import Cart from 'redux/reducers/cartReducer';
import Transaction from 'redux/reducers/transactionReducer';

const store = {};
const listState = [
    {
        name: typeStore.PRODUCT,
        value: Product,
    },
    {
        name: typeStore.CATEGORY,
        value: Category,
    },
    {
        name: typeStore.USER,
        value: Users,
    },
    {
        name: typeStore.STUDY_PROGRAM,
        value: StudyProgram,
    },
    {
        name: typeStore.VIDEO,
        value: Video,
    },
    {
        name: typeStore.CART,
        value: Cart,
    },
    {
        name: typeStore.TRANSACTION,
        value: Transaction,
    },
];

listState.map((item) => (store[item.name] = item.value));
const rootReducer = combineReducers(store);
export { rootReducer };
