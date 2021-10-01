/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 * @author Mongker on 22/04/2021
 * @email: levanmong.dola.99@gmail.com
 * @student-code: 68DCHT20091
 * @university: UTT (Đại học Công Nghệ Giao Thông Vận Tải)
 */
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
