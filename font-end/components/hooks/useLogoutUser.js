import { arrTypeUser } from '../../util/TypeUI';

/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 01/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

import React from 'react';
import { useRouter } from 'next/router';

// Context
import ContextApp from 'context/ContextApp';

function UseLogoutUser() {
    const router = useRouter();
    const { setUser } = React.useContext(ContextApp);
    const handleClear = () => {
        router.push('/login');
        setUser(null);
        localStorage.clear();
    };

    return handleClear;
}
export default UseLogoutUser;
