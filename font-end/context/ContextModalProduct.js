/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 05/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
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
