

const arrTypeUser = [
    'id',
    'name',
    'phone',
    'email',
    'address',
    'info',
    'position',
    'role',
    'coin',
    'password',
    'status_user',
    'create',
    'gender',
    'gender',
    'avatar',
    'list_product_open',
    'introduce',
    'categoryFollow',
];
const typeStore = {
    USER: 'users',
    CATEGORY: 'category',
    PRODUCT: 'product',
    STUDY_PROGRAM: 'studyprogram',
    VIDEO: 'video',
    CART: 'cart',
    TRANSACTION: 'transaction',
};
const url_api = {
    USER: '/user',
    CATEGORY: '/category',
    PRODUCT: '/product',
    STUDY_PROGRAM: '/studyprogram',
    VIDEO: '/video',
    CART: '/cart',
    TRANSACTION: '/transaction',
    OPEN: '/open',
};
const url_base = 'http://localhost:2021/api';
// const url_base = 'https://e90502fe5484.ngrok.io/api';
// const url_base = 'http://192.168.20.103:2020/api';
const url_base_img = `${url_base}/file/`;
export { arrTypeUser, typeStore, url_api, url_base_img, url_base };
