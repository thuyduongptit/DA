
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
