import { arrTypeUser } from '../../util/TypeUI';



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
