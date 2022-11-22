import { wrapper } from 'redux/store';
import React, { useEffect, useState } from 'react';
// import * as gtag from '../lib/gtag';
import '../styles/antd-custom.less';
import '../styles/index.css';
import '../styles/base.css';
import '../styles/header.css';
import '../styles/content.css';
import '../styles/reset.css';
import 'video-react/dist/video-react.css';

// import withFirebaseAuth from 'react-with-firebase-auth';
// import firebase from 'firebase/app';
// import 'firebase/auth';
// import firebaseConfig from '../config/firebaseConfig';

// if (!firebase.apps.length) {
//     firebase.initializeApp(firebaseConfig);
// } else {
//     firebase.app(); // if already initialized, use that one
// }
// context
import ContextApp from 'context/ContextApp';

// Util
import { arrTypeUser } from 'util/TypeUI';
import useProductBase from '../components/hooks/LogicData/useProductBase';
import useCategoryBase from '../components/hooks/LogicData/useCategoryBase';
import useUserBase from '../components/hooks/LogicData/useUserBase';

export function reportWebVitals(metric) {
    if (metric.label === 'custom') {
        console.log('metric:', metric); // TODO by MongLV: log ra xem hiệu năng của website
    }
}

// let firebaseAppAuth = firebase.auth();
// let providers = {
//     googleProvider: new firebase.auth.GoogleAuthProvider(),
// };

function App({ Component, pageProps }) {
    // const router = useRouter();
    const { getListProduct } = useProductBase();
    const { getListCategory } = useCategoryBase();
    const { getListUser } = useUserBase();

    // state
    const [user, setUser] = React.useState(null);
    const [keyTreeActive, setKeyTreeActive] = useState(null);
    const [textSearch, setTextSearch] = useState('');

    useEffect(() => {
        getListProduct({ status: 1 });
        getListCategory();
        getListUser();
    }, []);
    useEffect(() => {
        // Note: Hàm dùng để check xem đã tồn tại user chưa nếu chưa thì lấy dữ liệu từ localStorage lấp vào
        if (user) {
            arrTypeUser.map((item) => {
                localStorage.setItem(`${item}`, user[item]);
            });
        } else {
            const emailLocal = localStorage.getItem(`${arrTypeUser[3]}`);
            emailLocal &&
                setUser({
                    id: localStorage.getItem(`${arrTypeUser[0]}`),
                    name: localStorage.getItem(`${arrTypeUser[1]}`),
                    phone: localStorage.getItem(`${arrTypeUser[2]}`),
                    email: localStorage.getItem(`${arrTypeUser[3]}`),
                    address: localStorage.getItem(`${arrTypeUser[4]}`),
                    info: localStorage.getItem(`${arrTypeUser[5]}`),
                    position: localStorage.getItem(`${arrTypeUser[6]}`),
                    role: localStorage.getItem(`${arrTypeUser[7]}`),
                    coin: localStorage.getItem(`${arrTypeUser[8]}`),
                    password: localStorage.getItem(`${arrTypeUser[9]}`),
                    status_user: localStorage.getItem(`${arrTypeUser[10]}`),
                    create: localStorage.getItem(`${arrTypeUser[11]}`),
                    gender: Number(localStorage.getItem(`${arrTypeUser[12]}`)),
                    avatar: localStorage.getItem(`${arrTypeUser[14]}`),
                    list_product_open: localStorage.getItem(`${arrTypeUser[15]}`),
                    introduce: localStorage.getItem(`${arrTypeUser[16]}`),
                    categoryFollow: localStorage.getItem(`${arrTypeUser[17]}`),
                });
        }
    }, [user]);

    const valueContextApp = React.useMemo(
        () => ({
            user,
            myUser: user,
            setUser,
            keyTreeActive,
            setKeyTreeActive,
            textSearch,
            setTextSearch,
        }),
        [user, keyTreeActive, textSearch],
    );
    return (
        <ContextApp.Provider value={valueContextApp}>
            <Component {...pageProps} />
        </ContextApp.Provider>
    );
}

export default wrapper.withRedux(App);
