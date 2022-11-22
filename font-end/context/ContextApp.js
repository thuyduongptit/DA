
import { createContext } from 'react';

const funcDefault = () => null;
const ContextApp = createContext({
    user: null,
    setUser: funcDefault,
    keyTreeActive: '',
    setKeyTreeActive: funcDefault,
    textSearch: '',
    setTextSearch: funcDefault,
});
export default ContextApp;
