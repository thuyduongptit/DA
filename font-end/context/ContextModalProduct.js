/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 * @author Mongker on 05/05/2021
 * @email: monglv36@gmail.com
 * @student_code: 68DCHT20091
 * @university: UTT (Đại học Công Nghệ Giao Thông Vận Tải)
 */
import React, { createContext } from 'react';

const funcDefault = () => null;
const ContextModalProduct = createContext({
    typeModal: 'ADD',
    setTypeModal: funcDefault,
    visible: false,
    setVisible: funcDefault,
    imgFile: '',
    setImgFile: funcDefault,
    videoFile: '',
    setVideoFile: funcDefault,
    IdCategory: null,
    setIdCategory: funcDefault,
    dataEdit: {},
    setDataEdit: funcDefault,
    content: '',
    setContent: funcDefault,
    refVideoFile: {},
    refImgFile: {},
});
export default ContextModalProduct;
